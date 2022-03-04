package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/KakaoLoginOK/{email}")
	public ModelAndView loginOK(@PathVariable String email, Model model, HttpSession session) {
	
		session.setAttribute("member", email);
		ModelAndView mav = new ModelAndView("redirect:/loginOK");
		return mav;
	}


}
