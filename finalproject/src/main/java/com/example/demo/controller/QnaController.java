package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.QnaDAO;
import com.example.demo.vo.QnaVO;

import lombok.Setter;

@Controller
@Setter
public class QnaController {
	@Autowired
	private QnaDAO dao;
	
	@RequestMapping(value = "/insertQna", method = RequestMethod.GET)
	public void insertForm() {
		
	}
	
	@RequestMapping(value = "/insertQna", method = RequestMethod.POST)
	public ModelAndView insertSubmit(QnaVO q) {
		ModelAndView mav = new ModelAndView("redirect:/listQna");
		int re = dao.insertQna(q);
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "문의사항등록에 실패하였습니다.");
		}
		return mav;
	}
	
	@RequestMapping("/listQna")
	public void listQna(HttpSession session,//정렬칼럼,검색칼럼,검색어를 상태유지하기 위하여 session변수를 매개변수로 정의합니다. 
			Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언합ㄴ디ㅏ.
			@RequestParam(value = "qna_process", defaultValue = "-1") int qna_process,   //진행상황을 받아오기 위한 변수
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
			){
		
		

		if(qna_process != 1 && qna_process!=0 ) {
			if(session.getAttribute("qna_process") != null ) {
				qna_process = (int)session.getAttribute("qna_process");
			}
		}
		
		
		  System.out.println("pageNUM:"+pageNUM);
		  System.out.println("qna_process:"+qna_process);
			//현재페이지에 보여줄 시작레코드와 마지막레코드의 위치를 계산한다.
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
		//Dao가 게시물 목록을 검색할 때 필요한 
		//정보(정렬칼럼명, 검색칼럼명, 검색어, 현재페이지에 보여줄 시작레코드,마지막레코드)
		//들을 map에 저장한다.
		HashMap mapQna= new HashMap();
		mapQna.put("qna_process", qna_process);
		mapQna.put("start", start);
		mapQna.put("end", end);
		
		//dao를 통해 검색한 결과를 model에 저장한다.
		//이대 findAll메소드에서 전체레코드수를 구하고 
		//그 값을 갖고 전체페이지수도 계산합니다.
		model.addAttribute("list", dao.listQna(mapQna));
		model.addAttribute("qna_process", qna_process);
		
		
		
		int totalPage = dao.totalPage;
		

		int pageCount = dao.pageCount;
		if(totalPage<dao.pageCount) {
			pageCount = totalPage;
		}
		int pageGroup = (int)Math.ceil(pageNUM/(double)pageCount);
		int last =pageGroup*pageCount;
		if(last>totalPage) {
			last = totalPage;
		}
		int first = last -(pageCount-1);
		int next = last +1;
		int prev = first-1;
		System.out.println("토탈:"+totalPage);
		System.out.println("first"+first);
		System.out.println("last:"+last);
		
		//dao에 계산된 전체페이지수를 model에 상태유지합니다.
		model.addAttribute("totalPage", totalPage);
		
		model.addAttribute("last",last);
		model.addAttribute("first",first);
		model.addAttribute("next",next);
		model.addAttribute("prev",prev);
		model.addAttribute("pageNUM",pageNUM);
		//만약에 진행상태를 선택하였다면 
		//선택한 진행상태를 세션에 저장하여 상태유지 합니다
		if(qna_process == 1 && qna_process==0) {
			session.setAttribute("qna_process", qna_process);
		}
	}
	@RequestMapping("/ansQna")
	public void ansQna(int qna_no,Model model) {
		model.addAttribute("q", dao.findByNoQna(qna_no));
	}
	
	@RequestMapping(value = "/updateQna", method = RequestMethod.GET)
	public void updateForm(int qna_no, Model model) {
		model.addAttribute("q", dao.findByNoQna(qna_no));
	}
	
	@RequestMapping(value = "/updateQna", method = RequestMethod.POST)
	public ModelAndView updateSubmit(QnaVO q, HttpServletRequest request) {
		int re =dao.updateQna(q);
		ModelAndView mav = new ModelAndView("redirect:/listQna");
		
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "공지수정에 실패하였습니다.");
		}
		
		return mav;
	}
}
