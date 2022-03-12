package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ChatDAO;
import com.example.demo.handler.SocketHandler;
import com.example.demo.vo.ChatMessageVO;
import com.example.demo.vo.ChatRoomVO;
import com.example.demo.vo.GBCVO;
import com.example.demo.vo.Room;

import lombok.Setter;

@Controller
@Setter
public class ChatController {

	@Autowired
	private ChatDAO dao;
	
	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	
	//채팅방 목록
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
	
	//채팅방 생성
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	//채팅방 정보
	@RequestMapping("/getRoom")
	public @ResponseBody List<ChatRoomVO> getRoom(@RequestParam HashMap<Object, Object> params,int member_no){
		//System.out.println(dao.listChatRoomByMember(member_no));
		return dao.listChatRoomByMember(member_no);
	}
	
	
	//채팅방 이동
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params,int member_no) {
		ModelAndView mv = new ModelAndView();
		int room_no = Integer.parseInt((String) params.get("room_no"));
		
		//List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==room_no).collect(Collectors.toList());
		List<ChatRoomVO> new_list = dao.listChatRoomByMember(member_no).stream().filter(o->o.getRoom_no()==room_no).collect(Collectors.toList());
 		if(new_list != null && new_list.size() > 0) {
			mv.addObject("room_name", params.get("room_name"));
			mv.addObject("room_no", params.get("room_no"));
			mv.setViewName("chat");
		}else {
			mv.setViewName("room");
		}
		return mv;
	}
	
	//채팅 등록
	@ResponseBody
	@RequestMapping(value="/insertChatMessage",method = RequestMethod.POST)
    public String insertChatMessage(ChatMessageVO c) {
        dao.insertChatMessage(c);
        return "ok";
    }
	
	//채팅 이미지등록
	@ResponseBody
	@RequestMapping(value="/insertChatImage",method = RequestMethod.POST)
    public String insertChatImage(ChatMessageVO c) {
		String chat_image = SocketHandler.fileName;
		//System.out.println(chat_image);
        c.setChat_image(chat_image);
        dao.insertChatImage(c);
        return "ok";
    }
	
	//채팅 메시지 목록
	@ResponseBody
	@RequestMapping(value = "/listChatMessage")
	public List<ChatMessageVO> listChatMessage(int room_no,Model model) {
		//model.addAttribute("list", dao.listChatMessage(room_no));
		return dao.listChatMessage(room_no);
		
	}
	
}
