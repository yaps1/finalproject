package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Security;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.NoticeDAO;
import com.example.demo.vo.NoticeVO;

import lombok.Setter;

@Controller
@Setter
public class NoticeController {
	@Autowired
	private NoticeDAO dao;
	
	@RequestMapping("/listNotice")
	public void listNotice(HttpSession session,//정렬칼럼,검색칼럼,검색어를 상태유지하기 위하여 session변수를 매개변수로 정의합니다. 
			Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언합ㄴ디ㅏ.
			String searchColumn, // 검색칼럼을 받아오기 위한 변수
			String keyword,   //검색어를 받아오기 위한 변수
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
			){
		
		
		//만약, 새로운 검색어가 없고
		//세션에 검색어가 저장되어 있다면
		//세션에 저장된 검색칼럼명과 검색어를 읽어온다.
		if( keyword == null ) {
			if(session.getAttribute("keyword") != null ) {
				searchColumn = (String)session.getAttribute("searchColumn");
				keyword = (String)session.getAttribute("keyword");
			}
		}
		
		
		  System.out.println("pageNUM:"+pageNUM);
		  System.out.println("검색칼럼:"+searchColumn);
		  System.out.println("검색어:|"+keyword+"|");
			//현재페이지에 보여줄 시작레코드와 마지막레코드의 위치를 계산한다.
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
		//Dao가 게시물 목록을 검색할 때 필요한 
		//정보(정렬칼럼명, 검색칼럼명, 검색어, 현재페이지에 보여줄 시작레코드,마지막레코드)
		//들을 map에 저장한다.
		HashMap map= new HashMap();
		map.put("searchColumn", searchColumn);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		//dao를 통해 검색한 결과를 model에 저장한다.
		//이대 findAll메소드에서 전체레코드수를 구하고 
		//그 값을 갖고 전체페이지수도 계산합니다.
		model.addAttribute("list", dao.listNotice(map));
		
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
		
		//만약에 검색하였다면 
		//검색한 칼럼이름과 검색어를 세션에 저장하여 상태유지 합니다
		if(keyword != null) {
			session.setAttribute("searchColumn", searchColumn);
			session.setAttribute("keyword", keyword);
		}
	}
	
	@RequestMapping("managerNotice")
	public void managerList(HttpSession session,//정렬칼럼,검색칼럼,검색어를 상태유지하기 위하여 session변수를 매개변수로 정의합니다. 
			Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언합ㄴ디ㅏ.
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
			){
		
		
		
		
		System.out.println("pageNUM:"+pageNUM);
		//현재페이지에 보여줄 시작레코드와 마지막레코드의 위치를 계산한다.
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
		//Dao가 게시물 목록을 검색할 때 필요한 
		//정보(정렬칼럼명, 검색칼럼명, 검색어, 현재페이지에 보여줄 시작레코드,마지막레코드)
		//들을 map에 저장한다.
		HashMap map= new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		//dao를 통해 검색한 결과를 model에 저장한다.
		//이대 findAll메소드에서 전체레코드수를 구하고 
		//그 값을 갖고 전체페이지수도 계산합니다.
		model.addAttribute("list", dao.listNotice(map));
		
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
		
	}
	
	@RequestMapping(value = {"/detailNotice", "/managerDetailNotice"})
	public void detail(int notice_no, Model model) {
		NoticeVO n = dao.findByNoNotice(notice_no);
		model.addAttribute("n", n);
		int max = dao.max;
		String fileName = n.getNotice_file();
		String img="";
		if(fileName !=null) {
			String check = fileName.substring(fileName.indexOf(".")+1);
			/* System.out.println(check); */
			if(check.equals("png")||check.equals("jpg")) {
				img = fileName;
			}
		}
		dao.hitNotice(notice_no);
		/* System.out.println(img); */
		model.addAttribute("img", img);
		model.addAttribute("max", max);
	}
	
	
	  @RequestMapping("/deleteNotice") 
	  public ModelAndView delete(HttpServletRequest request, @RequestParam List<Integer> checkedValue) {
		  
		  int[] notice_no = new int[checkedValue.size()];
			for(int i = 0; i<checkedValue.size(); i++) {
				notice_no[i] = checkedValue.get(i);
			}
			
		  ModelAndView mav = new ModelAndView("redirect:/managerNotice");
		  for(int i=0; i<notice_no.length;i++) {
				String oldFname = dao.findByNoNotice(notice_no[i]).getNotice_file();

				int re = dao.deleteNotice(notice_no[i]);
				
				if(re == 1) {
					if(oldFname!=null&&!oldFname.equals("")) {
						String path = request.getRealPath("upload");
						File file = new File(path + "/" + oldFname);
						file.delete();
					}
				}else { 
					mav.setViewName("error");
					mav.addObject("msg", "공지삭제에 실패하였습니다.");
				}	
		  }
		  return mav;
	  }
	 
	@RequestMapping(value = "/insertNotice", method = RequestMethod.GET)
	public void insertForm() {
	}
	
	@RequestMapping(value = "/insertNotice", method = RequestMethod.POST)
	public ModelAndView insertSubmit(HttpServletRequest request  , NoticeVO n) {
		String path = request.getRealPath("upload");
		System.out.println("path:"+path);
		MultipartFile uploadFile = n.getUploadFile();
		String fname = uploadFile.getOriginalFilename();
		n.setNotice_file("");
		
		if(fname!=null&&!fname.equals("")) {
			n.setNotice_file(fname);
			try {
				byte []data = uploadFile.getBytes();
				FileOutputStream fos =
						new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}

		int re = dao.insertNotice(n);
		ModelAndView mav = new ModelAndView("redirect:/managerNotice");
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "공지등록에 실패하였습니다.");
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/updateNotice", method = RequestMethod.GET)
	public void updateForm(int notice_no, Model model) {
		model.addAttribute("n", dao.findByNoNotice(notice_no));
	}
	
	@RequestMapping(value = "/updateNotice", method = RequestMethod.POST)
	public ModelAndView updateSubmit(NoticeVO n, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/managerNotice");
		String path = request.getRealPath("upload");
		String oldFname = n.getNotice_file();
		MultipartFile uploadFile = n.getUploadFile();
		String fname = uploadFile.getOriginalFilename();
		n.setNotice_file(oldFname);
		byte []data;
		try {
			data = uploadFile.getBytes();
			if(fname != null && !fname.equals("")) {
				n.setNotice_file(fname);
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		int re =dao.updateNotice(n);
		
		if(re == 1) {
			if(fname!=null&&!fname.equals("")) {
				File file = new File(path + "/" + oldFname);
				file.delete();
			}		
		}else {
			mav.setViewName("error");
			mav.addObject("msg", "공지수정에 실패하였습니다.");
		}
		
		return mav;
	}
}
