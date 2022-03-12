package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.AlarmDAO;
import com.example.demo.vo.AlarmVO;


import lombok.Setter;

@Controller
@Setter
public class SaguPalguTalkController {
	@Autowired
	private AlarmDAO dao;
	
	@RequestMapping(value = "SaguPalguTalk", method = RequestMethod.GET)
	public void SaguPalguTalk() {}
	
	@RequestMapping(value = "saguPalguAlarm", method = RequestMethod.GET)
	@ResponseBody
	public List<AlarmVO> saguPalguAlarm(int member_no) {
		List<AlarmVO> list = dao.alarmGBJ(member_no);
		//System.out.println("로그인한 회원번호:"+member_no);
		return list;
	}
	
	//4989알림 공동구매 참여신청 수락
	@RequestMapping(value = "updateGBJOk",method = RequestMethod.POST)
	@ResponseBody
	public int updateGBJOk(int gbj_no) {
		int re = dao.updateGBJOk(gbj_no);
		if(re == 1) {
			System.out.println("공동구매 참여신청 수락 완료");
		}else {
			System.out.println("공동구매 참여신청 수락 실패");
		}
		return re;
	}

	//4989알림 공동구매 참여신청 거절
	@RequestMapping(value = "updateGBJNo",method = RequestMethod.POST)
	@ResponseBody
	public int updateGBJNo(int gbj_no) {
		int re = dao.updateGBJNo(gbj_no);
		if(re == 1) {
			System.out.println("공동구매 참여신청 거절 완료");
		}else {
			System.out.println("공동구매 참여신청 거절 실패");
		}
		return re;
	}

	

}
