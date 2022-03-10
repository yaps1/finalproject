package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.HotKeyWordDAO;

@Controller
public class MainController {
	@Autowired
	private HotKeyWordDAO dao;
	
	@RequestMapping("/main")
	public void keyWordTop10() {
		
	}
	@RequestMapping("/hotKeyword")
	@ResponseBody
	public List<String> listKeyword(){
		return dao.listKeyword();
	}
	
	@RequestMapping("session")
	public ModelAndView session(HttpSession session,int delete) {
		ModelAndView mav =null;
		session.removeAttribute("keyword");
		session.removeAttribute("goods_category");
		session.removeAttribute("orderColumn");
		session.removeAttribute("addr");
		if(delete==1) {
			mav = new ModelAndView("redirect:/goods");
		}else if(delete ==2) {
			mav = new ModelAndView("redirect:/listGB");
		}else if(delete==3) {
			mav = new ModelAndView("redirect:/listNotice");
		}else if(delete==4) {
			mav = new ModelAndView("redirect:/listQna");
		}
		return mav;
	}
}
