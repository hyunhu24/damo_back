package com.springboot.chatroom.config;


//WebSocket 설정 파일
//WebSocket과 STOMP 프로토콜을 사용하여 실시간 채팅을 구현하기 위한 설정 클래스

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;

/**
 * 🛠 역할:
 * - 클라이언트(Web)와 서버(Spring Boot) 간 WebSocket 통신을 설정
 * - STOMP 프로토콜을 기반으로 메시지를 주고받을 수 있도록 브로커 설정
 * - WebSocket 연결 시 JWT 토큰 검증(`StompHandler`)을 적용하여 인증 처리
 **/

@Configuration
@EnableWebSocketMessageBroker //Stomp 기반 웹 소켓 활성화
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    //WebSocket 연결 시 JWT 토큰을 검증하는 핸들러 (StompHandler에서 처리)
    private final StompHandler stompHandler;

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // 1) 네이티브 WebSocket 엔드포인트 (SockJS 미사용)
        //    SockJS는 /info 핸드셰이크 + 전송방식 협상(websocket 실패 시 xhr 폴백 ~5초)으로 입장이 느림.
        //    Railway는 wss 를 지원하므로 프론트가 네이티브 WebSocket(wss://.../ws-stomp)으로 바로 붙으면 즉시 연결됨.
        registry.addEndpoint("/ws-stomp")
                .setAllowedOriginPatterns("*");

        // 2) SockJS 엔드포인트 (네이티브 WS가 불가한 환경을 위한 폴백)
        registry.addEndpoint("/ws-stomp")
                .setAllowedOriginPatterns("*")
                .withSockJS();
    }

    //메세지 브로커는 메세지 전송을 중계
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        //스프링이 제공하는 인메모리 브로커 사용
        registry.enableSimpleBroker("/sub"); //  클라이언트가 구독할 경로 (메시지 받을 때 사용)
        registry.setApplicationDestinationPrefixes("/pub"); //  클라이언트가 메시지를 보낼 때 사용할 경로 (발행)
    }

    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.interceptors(stompHandler); // ✅ WebSocket 연결 시 JWT 인증 적용
    }
}
