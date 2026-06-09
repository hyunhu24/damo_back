-- 카테고리 초기 데이터 (프론트 ID 1~13 매핑과 일치)
-- MySQL 영구 DB 환경: 기동 시마다 실행되므로 INSERT IGNORE로 멱등 처리 (이미 있으면 무시)
INSERT IGNORE INTO category (category_id, category_name) VALUES (1, '스포츠');
INSERT IGNORE INTO category (category_id, category_name) VALUES (2, '언어');
INSERT IGNORE INTO category (category_id, category_name) VALUES (3, '악기');
INSERT IGNORE INTO category (category_id, category_name) VALUES (4, '댄스');
INSERT IGNORE INTO category (category_id, category_name) VALUES (5, '반려동물');
INSERT IGNORE INTO category (category_id, category_name) VALUES (6, '사교');
INSERT IGNORE INTO category (category_id, category_name) VALUES (7, '요리/레시피');
INSERT IGNORE INTO category (category_id, category_name) VALUES (8, '게임/오락');
INSERT IGNORE INTO category (category_id, category_name) VALUES (9, '사진/영상');
INSERT IGNORE INTO category (category_id, category_name) VALUES (10, '독서');
INSERT IGNORE INTO category (category_id, category_name) VALUES (11, '노래');
INSERT IGNORE INTO category (category_id, category_name) VALUES (12, '자동차');
INSERT IGNORE INTO category (category_id, category_name) VALUES (13, '여행');

-- 카테고리별 채팅방 초기 데이터 (카테고리 1개당 채팅방 1개, OneToOne)
-- 채팅방 생성 로직이 별도로 없으므로 시드로 생성. INSERT IGNORE로 멱등 처리.
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (1, 1);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (2, 2);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (3, 3);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (4, 4);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (5, 5);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (6, 6);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (7, 7);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (8, 8);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (9, 9);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (10, 10);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (11, 11);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (12, 12);
INSERT IGNORE INTO chat_room (chat_room_id, category_id) VALUES (13, 13);

-- 카테고리별 서브카테고리 초기 데이터 (모임 생성 시 '필수' 선택 항목)
-- sub_category(sub_category_id, sub_category_name, category_id)
-- 1) 스포츠
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (1, '축구', 1);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (2, '야구', 1);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (3, '배드민턴', 1);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (4, '농구', 1);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (5, '볼링', 1);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (6, '당구', 1);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (7, '테니스', 1);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (8, '탁구', 1);
-- 2) 언어
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (9, '영어', 2);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (10, '중국어', 2);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (11, '일본어', 2);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (12, '스페인어', 2);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (13, '프랑스어', 2);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (14, '독일어', 2);
-- 3) 악기
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (15, '기타', 3);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (16, '피아노', 3);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (17, '드럼', 3);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (18, '바이올린', 3);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (19, '베이스', 3);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (20, '우쿨렐레', 3);
-- 4) 댄스
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (21, '방송댄스', 4);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (22, '발레', 4);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (23, '힙합댄스', 4);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (24, '라틴댄스', 4);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (25, '스트릿댄스', 4);
-- 5) 반려동물
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (26, '강아지', 5);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (27, '고양이', 5);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (28, '새', 5);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (29, '물고기', 5);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (30, '파충류', 5);
-- 6) 사교
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (31, '친목', 6);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (32, '정기모임', 6);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (33, '네트워킹', 6);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (34, '파티', 6);
-- 7) 요리/레시피
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (35, '한식', 7);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (36, '양식', 7);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (37, '중식', 7);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (38, '일식', 7);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (39, '베이킹', 7);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (40, '디저트', 7);
-- 8) 게임/오락
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (41, '보드게임', 8);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (42, 'PC게임', 8);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (43, '콘솔게임', 8);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (44, '모바일게임', 8);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (45, '방탈출', 8);
-- 9) 사진/영상
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (46, '인물사진', 9);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (47, '풍경사진', 9);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (48, '영상편집', 9);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (49, '필름카메라', 9);
-- 10) 독서
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (50, '소설', 10);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (51, '자기계발', 10);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (52, '인문학', 10);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (53, '시집', 10);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (54, '에세이', 10);
-- 11) 노래
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (55, '발라드', 11);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (56, '팝송', 11);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (57, '힙합/랩', 11);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (58, 'K-POP', 11);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (59, '트로트', 11);
-- 12) 자동차
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (60, '드라이브', 12);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (61, '자동차정비', 12);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (62, '튜닝', 12);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (63, '캠핑카', 12);
-- 13) 여행
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (64, '국내여행', 13);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (65, '해외여행', 13);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (66, '캠핑', 13);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (67, '백패킹', 13);
INSERT IGNORE INTO sub_category (sub_category_id, sub_category_name, category_id) VALUES (68, '맛집투어', 13);

-- 태그 초기 데이터 (모임 생성 시 '선택' 항목)
-- tag(tag_id, tag_name, tag_type). tag_type이 프론트 섹션 제목/색상 키이므로 한글로 통일.
-- tag_name은 전역 유일해야 함(TagRepository.findByTagName).
-- 연령대
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (1, '10대', '연령대');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (2, '20대', '연령대');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (3, '30대', '연령대');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (4, '40대', '연령대');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (5, '50대 이상', '연령대');
-- MBTI
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (6, 'INFP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (7, 'INFJ', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (8, 'INTP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (9, 'INTJ', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (10, 'ISFP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (11, 'ISFJ', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (12, 'ISTP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (13, 'ISTJ', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (14, 'ENFP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (15, 'ENFJ', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (16, 'ENTP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (17, 'ENTJ', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (18, 'ESFP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (19, 'ESFJ', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (20, 'ESTP', 'MBTI');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (21, 'ESTJ', 'MBTI');
-- 분위기
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (22, '화목한', '분위기');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (23, '발랄한', '분위기');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (24, '차분한', '분위기');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (25, '활발한', '분위기');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (26, '진지한', '분위기');
-- 장소
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (27, '실내', '장소');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (28, '야외', '장소');
INSERT IGNORE INTO `tag` (tag_id, tag_name, tag_type) VALUES (29, '온라인', '장소');

-- ============================================================
-- 기존 깨진 이미지 경로 보정
-- 과거 로컬 개발용 경로(C:/..., http://192.168..., /file-assets/noImage.png)나
-- NULL 로 저장된 프로필/그룹 이미지를 서빙 가능한 기본 이미지(/images/noImage.png)로 교체.
-- 정상 업로드 경로(/images/...)는 영향받지 않음. (매 기동 실행되어도 멱등)
-- ============================================================
UPDATE `member` SET image = '/images/noImage.png'
 WHERE image IS NULL
    OR image = ''
    OR image = '/file-assets/noImage.png'
    OR image LIKE 'C:/%'
    OR image LIKE 'http://192.168.%'
    OR image LIKE 'http://10.%'
    OR image LIKE 'http://172.%';

UPDATE `club` SET image = '/images/noImage.png'
 WHERE image = '/file-assets/noImage.png'
    OR image LIKE 'C:/%'
    OR image LIKE 'http://192.168.%'
    OR image LIKE 'http://10.%'
    OR image LIKE 'http://172.%';
