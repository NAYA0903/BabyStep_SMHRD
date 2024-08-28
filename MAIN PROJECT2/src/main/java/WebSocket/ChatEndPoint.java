package WebSocket;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/chat")
//이 클래스는 WebSocket 서버 엔드포인트로 사용됩니다. 
//클라이언트는 'ws://localhost:8080/your-app-context/chat' 경로를 통해 이 엔드포인트와 연결할 수 있습니다.
public class ChatEndPoint {

	// 접속된 클라이언트들의 WebSocket 세션을 관리하는 Set입니다.
	// Collections.synchronizedSet을 사용하여 스레드 안전한 Set을 생성합니다.
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());

	@OnOpen
	// 클라이언트가 WebSocket을 통해 연결을 열 때 호출됩니다.
	// 새로운 클라이언트 세션을 clients Set에 추가합니다.
	public void onOpen(Session session) {
		clients.add(session);
	}

	@OnClose
	// 클라이언트가 WebSocket 연결을 닫을 때 호출됩니다.
	// 클라이언트 세션을 clients Set에서 제거합니다.
	public void onClose(Session session) {
		clients.remove(session);
	}

	@OnMessage
	// 클라이언트로부터 메시지를 수신할 때 호출됩니다.
	// 이 메서드는 모든 연결된 클라이언트에게 수신한 메시지를 브로드캐스트(전송)합니다.
	public void onMessage(String message, Session session) throws IOException {
		// synchronized 블록 안에서 clients Set을 반복하여 각 클라이언트에게 메시지를 전송합니다.
		synchronized (clients) {
			for (Session client : clients) {
				// 메시지를 보낸 클라이언트를 제외한 모든 클라이언트에게 메시지를 보냅니다.
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
}

// 코드의 주요 기능
// 클라이언트 세션 관리 (clients Set):
// clients Set은 현재 연결된 모든 클라이언트의 세션을 저장하고 있습니다.
// Collections.synchronizedSet으로 감싸서 스레드 안전하게 만듭니다. 이는 다수의 클라이언트가 동시에 연결되거나 메시지를 보낼 때 발생할 수 있는 동시성 문제를 방지합니다.

// 연결 열기 (@OnOpen):
// 클라이언트가 WebSocket 연결을 열 때 onOpen 메서드가 호출됩니다.
// 이 메서드는 새로 연결된 클라이언트의 Session 객체를 clients Set에 추가합니다.

// 연결 닫기 (@OnClose):
// 클라이언트가 WebSocket 연결을 닫으면 onClose 메서드가 호출됩니다.
// 이 메서드는 닫힌 클라이언트의 세션을 clients Set에서 제거합니다.

// 메시지 수신 및 브로드캐스트 (@OnMessage):
// 클라이언트로부터 메시지를 수신하면 onMessage 메서드가 호출됩니다.
// 이 메서드는 메시지를 보낸 클라이언트를 제외한 모든 연결된 클라이언트에게 메시지를 전송합니다.
// client.getBasicRemote().sendText(message)를 사용해 텍스트 메시지를 각 클라이언트로 전송합니다.
