package com.example.demo.controller;

import java.io.Console;
import java.util.Date;
import java.util.Random;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

import kr.co.youiwe.webservice.BitSms;
import lombok.Setter;

@Controller
@Setter
public class MemberController {
	@Autowired
	private MemberDAO dao;
	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//회원가입 폼
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void insert_form() {}
	
	//회원가입 제출
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public void insert_form(HttpServletRequest request,MemberVO m) {
		m.setMember_no(dao.getMemberNo());
		m.setMember_pwd(passwordEncoder.encode(m.getMember_pwd()));
		m.setMember_birth(request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day"));
		m.setMember_tel(request.getParameter("member_tel1")+request.getParameter("member_tel2")+request.getParameter("member_tel3"));
		int re = dao.insertMember(m);
		if(re == 1) {
			System.out.println("회원가입성공");
			
		}else {
		System.out.println("회원가입실패");
		}
	}
	
	//아이디 중복 체크
	@RequestMapping(value = "/id_check",method = RequestMethod.GET)
	@ResponseBody
	public int id_check(String member_id) {
		int re = dao.id_check(member_id);
		//String result = "";
		if(re != 0) {
			System.out.println("중복아이디가 존재함");
			//result = member_id+"는 이미 존재하는 아이디 입니다.";
		}else {
			System.out.println("아이디 사용가능");
			//result = "사용가능한 아이디 입니다.";
		}
		return re;
	}
	
	//닉네임 중복 체크 ajax
	@RequestMapping(value = "/nickname_check",method = RequestMethod.GET)
	@ResponseBody
	public int nickname_check(String member_nickname) {
		int re = dao.nickname_check(member_nickname);
		if(re != 0) {
			System.out.println("닉네임 중복");
		}else {
			System.out.println("닉네임 사용가능");
		}
		return re;
	}
	
	//핸드폰 본인인증 ajax
	@RequestMapping("/sendNumber")
	@ResponseBody
	public String sendNumber(String member_tel) {
		String code="";
		Random r = new Random();
		code = r.nextInt(88888888)+11111111+"";
		String msg = "[TEST]인증번호:"+code;
		
		BitSms sms = new BitSms();
		sms.sendMsg("01025598279", member_tel, msg);
		System.out.println("member_tel:"+member_tel);
		System.out.println("code"+code);
		return code;
	}
	
	
	//로그인 폼
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public void login() {}
	
	//로그인 성공
	@RequestMapping("/loginOK") 
	public void loginOK(HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal(); 
		String member_id = user.getUsername();
	
		MemberVO m = dao.isMember(member_id);
		session.setAttribute("m", m);
	}
	
	//아이디 찾기 폼
	@RequestMapping(value = "/searchId", method = RequestMethod.GET)
	public void searchId() {}

	//아이디 찾기 제출
	@RequestMapping(value = "/searchId", method = RequestMethod.POST)
	public ModelAndView searchId(String member_name,String member_tel) {
		ModelAndView mav = new ModelAndView("/searchIdOK");

		String member_id = dao.searchId(member_name, member_tel);

		if(member_id != null) {
			System.out.println("아이디를 찾았습니다.");
			System.out.println("member_id: "+member_id);
			mav.addObject("member_id", member_id);
		}else {
			System.out.println(member_id);
			mav.setViewName("error");
			mav.addObject("msg", "아이디 찾기 실패!");
		}
		return mav;
	}
	
	//비밀번호 찾기 폼
	@RequestMapping(value = "/searchPwd",method = RequestMethod.GET)
	public void searchPwd() {
		System.out.println("get방식입니다");
	}
	
	
	//비밀번호 찾기 제출
	@RequestMapping(value = "/searchPwd",method = RequestMethod.POST)
	public ModelAndView searchPwd(String member_id,String member_name,String member_tel) {
		String code = "-1";
		System.out.println("post방식입니다");
		
		ModelAndView mav = new ModelAndView("/searchPwdOK");
		
		int re = dao.searchPwd(member_id, member_name, member_tel);
		System.out.println("re:"+re);
		
		if(re != 0) {
			System.out.println("입력값과 일치하는 회원이 있습니다.");
			code = EmailCheck(member_id);
		}else {
			System.out.println("일치하는 회원이 없습니다");
			mav.setViewName("error");
			mav.addObject("msg", "존재하는 회원이 없습니다.");

		}
		mav.addObject("code", code);
		mav.addObject("member_id", member_id); //테스트
		return mav;	
	}
	
	//인증코드 발송 메일
	public String EmailCheck(String member_id) {
		System.out.println("to:"+member_id);
		
		String code="";
		Random r = new Random();
		code = r.nextInt(88888888)+11111111+"";
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject("4989 인증코드 발송");
		String str = "4989 인증코드는 다음과 같습니다.\n"; 
		str += "               "+code+"             "+"\n";
		str += "4989에서 인증코드를 입력해주세요!\n";
		mailMessage.setText(str);
		mailMessage.setFrom("wlguswlgusg@gmail.com");
		mailMessage.setTo("wlguswlgusg@naver.com"); //test후 member_id로 바꿈
		try {
			javaMailSender.send(mailMessage);
			System.out.println("code:"+code);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외발생:"+e.getMessage());
		}
		System.out.println("code:"+code);
		return code;
	}
	
	//이메일 인증 코드와 비교?????
	@RequestMapping(value = "/searchPwdOK",method = RequestMethod.POST)
	public ModelAndView searchPwdOK(String member_id) {
		ModelAndView mav = new ModelAndView("/updatePwd");
		mav.addObject("member_id", member_id);
		return mav;
	}
	
	@RequestMapping(value = "/updatePwd",method = RequestMethod.GET)
	public void updatePwd() {}
	
	//비밀번호 재설정
	@RequestMapping(value = "/updatePwd",method = RequestMethod.POST)
	public ModelAndView updatePwd(String member_id,String member_pwd,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/login");
		//String member_pwd_check = request.getParameter("member_pwd_check");
		
		MemberVO m = new MemberVO();
		String Pwd = m.getMember_pwd();
		String seqPwd = passwordEncoder.encode(member_pwd);
		//m.setMember_pwd(seqPwd);
		
		int re = dao.updatePwd(seqPwd, member_id);
	
		if(re == 1) {
			System.out.println("비밀번호 재설정에 성공하였습니다");
			System.out.println("암호화전 비밀번호:"+member_pwd);

		}else {
			System.out.println("비밀번호 재설정에 실패하였습니다");
			mav.setViewName("error");
			mav.addObject("msg", "비밀번호 재설정에 실패하였습니다");
		}
		return mav;
	}
}