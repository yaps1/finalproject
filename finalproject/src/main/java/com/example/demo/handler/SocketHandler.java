package com.example.demo.handler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
	public static String fileName="";
	public static File dir;

	//HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	List<HashMap<String, Object>> rls = new ArrayList<>();
	private static final String FILE_UPLOAD_PATH = "C:/test/websocket/";
	static int fileUploadIdx = 0;
	static String fileUploadSession = "";
	
	//TextMessage 발송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message){
		String msg = message.getPayload(); //JSON형태의 String메시지를 받음
		JSONObject obj = JsonToObjectParser(msg); //JSON데이터를 JSONObject로 파싱
		
		String rN = (String) obj.get("room_no"); //방의 번호를 받음.
		String msgType = (String) obj.get("type"); //메시지의 타입을 확인
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String room_no = (String) rls.get(i).get("room_no"); //세션리스트의 저장된 방번호를 가져와서
				if(room_no.equals(rN)) { //같은값의 방이 존재한다면
					temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져옴
					fileUploadIdx = i;
					fileUploadSession = (String) obj.get("sessionId");
					break;
				}
			}
			if(!msgType.equals("fileUpload")) { //메시지의 타입이 파일업로드가 아닐때만 전송
				//해당 방의 세션들만 찾아서 메시지를 발송
				for(String k : temp.keySet()) { 
					if(k.equals("room_no")) { //방번호일 경우에는 건너 뜀
						continue;
					}
					
					WebSocketSession wss = (WebSocketSession) temp.get(k);
					if(wss != null) {
						try {
							wss.sendMessage(new TextMessage(obj.toJSONString()));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	//바이너리 메시지 발송
	@Override
	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		ByteBuffer byteBuffer = message.getPayload();
		fileName =  System.currentTimeMillis()+".jpg";
		dir = new File(FILE_UPLOAD_PATH);
		//System.out.println(dir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File file = new File(FILE_UPLOAD_PATH, fileName);
	
		FileOutputStream out = null;
		FileChannel outChannel = null;
		try {
			byteBuffer.flip(); //byteBuffer를 읽기 위해 세팅
			out = new FileOutputStream(file, true); //생성을 위해 OutputStream을 열기
			outChannel = out.getChannel(); //채널을 열고
			byteBuffer.compact(); //파일을 복사
			outChannel.write(byteBuffer); //파일 작성
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {
					out.close();
				}
				if(outChannel != null) {
					outChannel.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		byteBuffer.position(0); //파일을 저장하면서 position값이 변경되었으므로 0으로 초기화
		//파일쓰기가 끝나면 이미지를 발송
		HashMap<String, Object> temp = rls.get(fileUploadIdx);
		for(String k : temp.keySet()) {
			if(k.equals("room_no")) {
				continue;
			}
			WebSocketSession wss = (WebSocketSession) temp.get(k);
			try {
				wss.sendMessage(new BinaryMessage(byteBuffer)); //초기화된 버퍼를 발송
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//소켓 연결
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		System.out.println(url);
		String room_no = url.split("/chating/")[1];
		int idx = rls.size(); //방 크기 확인
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String rN = (String) rls.get(i).get("room_no");
				if(rN.equals(room_no)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { //존재하는 방이라면 세션만 추가
			HashMap<String, Object> map = rls.get(idx);
			map.put(session.getId(), session);
		}else { //최초 생성하는 방이라면 방번호와 세션을 추가
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("room_no", room_no);
			map.put(session.getId(), session);
			rls.add(map);
		}
		
		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}

	//소켓 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지움
			for(int i=0; i<rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}

	private static JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
