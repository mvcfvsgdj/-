package com.sh.chatting;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	// 연결된 WebSocket 세션을 저장할 맵
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// WebSocket 연결이 성공적으로 열린 경우 호출됩니다.
		log(session.getId() + "연결됨");

		// 연결된 세션을 users 맵에 추가
		users.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// WebSocket 연결이 닫힌 경우 호출됩니다.
		log(session.getId() + "연결 종료됨");

		// 연결이 닫힌 세션을 users 맵에서 제거
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "로 부터 메시지 수신: " + message.getPayload());

		// 현재 메시지를 보낸 세션의 ID
		String current = session.getId();

		for (WebSocketSession s : users.values()) {
			if (!s.getId().equals(current)) {
				// 메시지를 보낸 클라이언트를 제외하고 모든 클라이언트에게 메시지 전송
				s.sendMessage(message);
				log(s.getId() + "에 메시지 발송: " + message.getPayload());
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// WebSocket 전송 오류가 발생한 경우 호출됩니다.
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		// 간단한 로그를 출력하는 메서드
		System.out.println(new Date() + " : " + logmsg);
	}
}