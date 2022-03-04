package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.RestDAO;
import com.example.demo.dao.RestReviewDAO;
import com.example.demo.dao.SGCDAO;
import com.example.demo.dao.SGDAO;
import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.RestVO;

import lombok.Setter;

@Controller
@Setter
public class RestController {
	@Autowired
	private RestDAO dao;
	@Autowired
	private RestReviewDAO rdao;
	
	//맛집공유 게시판 이동
	@RequestMapping("/rest")
	public void rest() {}

	//맛집공유 가게정보 ajax
	@RequestMapping(value = "/getRestInfo",method = RequestMethod.GET)
	@ResponseBody
	public List<RestVO> getRestInfo(){
		return dao.getRestInfo();
	}

	//맛집공유 리뷰 ajax
	@RequestMapping(value = "/listRestReview",method = RequestMethod.GET)
	@ResponseBody
	public List<RestReviewVO> listRestReview(int rest_no){
		List<RestReviewVO> list= rdao.listRestReview(rest_no);
		return list;
	}


}
