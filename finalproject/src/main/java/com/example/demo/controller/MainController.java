package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
}
