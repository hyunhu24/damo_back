package com.springboot.file.Service;

import com.springboot.exception.StorageException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;

@Slf4j
public class FileSystemStorageService implements StorageService{
    private final Path rootLocation;
    private static final String[] ALLOWED_TYPES = {"jpg", "jpeg", "png", "gif"};

    // 정적 리소스 핸들러(/images/**)와 매칭되는 URL 프리픽스.
    // 저장 결과 경로를 "/images/..." 로 반환해야 프론트가 `${API_BASE_URL}${image}` 로 접근 가능.
    private static final String URL_PREFIX = "/images/";

    public FileSystemStorageService(@Value("${file.upload-dir}") String uploadDir) {
        // 운영(리눅스 컨테이너)에서는 설정된 절대경로를 그대로 루트로 사용한다.
        // user.dir 을 앞에 붙이면 정적 서빙 위치와 어긋나 업로드 이미지가 노출되지 않음.
        this.rootLocation = Paths.get(uploadDir).toAbsolutePath().normalize();
    }

    @Override
    public String store(MultipartFile file, String fileNameWithoutExt) {
        try {
            if (file.isEmpty()) {
                throw new StorageException("Failed to store empty file");
            }
            // 확장자 확인 검증
            String originalFileName = file.getOriginalFilename();
            String extension = getFileExtension(originalFileName);

            if(!isAllowedExtension(extension)){
                throw new StorageException("File type not allowed: " + extension);
            }

            String fullRelativePath = fileNameWithoutExt + "." + extension;
            Path destinationFile = this.rootLocation.resolve(fullRelativePath)
                    .normalize().toAbsolutePath();
//            Path destinationFile = this.rootLocation.resolve(
//                    Paths.get(newFileName)).normalize().toAbsolutePath();

            //equals는 서로 다르다고 판단하므로 startWith() 사용
            if (!destinationFile.startsWith(this.rootLocation.toAbsolutePath())) {
                throw new StorageException("Cannot upload file outside current directory");
            }
            Files.createDirectories(destinationFile.getParent());
            try (InputStream inputStream = file.getInputStream()) {
                log.info("# store image: {}", fullRelativePath);
                Files.copy(inputStream, destinationFile, StandardCopyOption.REPLACE_EXISTING);
            }

            // DB/프론트가 사용할 서빙 가능한 URL 경로 반환 (예: /images/groups/1/profile.jpg)
            return URL_PREFIX + fullRelativePath;
        } catch (IOException e) {
            throw new StorageException("Failed to upload file.", e);
        }
    }

    private String getFileExtension(String fileName){
        int lastDot = fileName.lastIndexOf(".");
        if (lastDot == -1) return "";
        return fileName.substring(lastDot + 1).toLowerCase();
    }

    private boolean isAllowedExtension(String extension) {
        return Arrays.stream(ALLOWED_TYPES)
                .anyMatch(ext -> ext.equalsIgnoreCase(extension));
    }

    @Override
    public void delete(String relativePath) {
        try {
            // store() 가 "/images/..." 형태를 반환하므로 삭제 시 프리픽스를 제거하고 실제 파일 경로로 변환.
            if (relativePath != null && relativePath.startsWith(URL_PREFIX)) {
                relativePath = relativePath.substring(URL_PREFIX.length());
            }
            Path filePath = this.rootLocation.resolve(relativePath).normalize().toAbsolutePath();

            // 보안 체크 -> 루트 디렉토리 내에 있는지 확인한다.
            if (!filePath.startsWith(this.rootLocation.toAbsolutePath())) {
                throw new StorageException("Cannot delete file outside current directory");
            }

            Files.deleteIfExists(filePath);
        } catch (IOException e) {
            throw new StorageException("Failed to delete file", e);
        }
    }
}