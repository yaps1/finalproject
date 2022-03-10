package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Controller
@Setter
public class KaKaoLoginOKController {

	@Autowired
	public MemberDAO dao;
	/*
	@RequestMapping("/insertKakao")
	public ModelAndView loginOK(MemberVO m, HttpSession session) {
		//예를들어 A@naver.com 으로 로그인한 카카오 id의 회원이 이미 DB에 저장이 되어 있다면
		//DB에 insert를 하지 말아야 함
		System.out.println("insertKakao 동작함");
		System.out.println(m);
		m.setMember_no(dao.getMemberNo());
		dao.insertMember(m);
		session.setAttribute("member", m.getMember_id());
		ModelAndView mav = new ModelAndView("loginOK");
		return mav;
	}*/
	@RequestMapping("/KakaoLoginOK")
	@ResponseBody
	public String loginOK(MemberVO m, HttpSession session) {
		System.out.println(m);
		if(dao.isMember(m.getMember_id())==null) {
			m.setMember_no(dao.getMemberNo());
			//m.setMember_pwd("kakao");
			
			String pwd = PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(m.getMember_id());
			m.setMember_pwd(pwd);
			m.setMember_name("kakao");
			m.setMember_tel("kakao");
			m.setMember_addr("kakao");
			m.setMember_loc("kakao");
			m.setMember_birth("1970/01/01");
			dao.insertKakaoMember(m);
			System.out.println("등록함");
			
		}
		session.setAttribute("username", m.getMember_id());
		session.setAttribute("password", m.getMember_id());
		System.out.println("카카오로그인함");
		
		return "OK";
	}
	


}
