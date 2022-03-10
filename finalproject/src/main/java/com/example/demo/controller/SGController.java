package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.SGDAO;
import com.example.demo.vo.SGCVO;
import com.example.demo.vo.SGVO;

import lombok.Setter;

@Controller
@Setter
public class SGController {
	@Autowired
	private SGDAO dao;

	
	//소모임 등록 폼
	@RequestMapping(value = "/insertSG", method = RequestMethod.GET)
	public void insertSG() {}
	//소모임 등록 제출
	@RequestMapping(value = "/insertSG", method = RequestMethod.POST)
	public ModelAndView insertSG(SGVO s) {
		ModelAndView mav = new ModelAndView("redirect:/listSG");
		s.setSg_no(dao.getSGNo());		
		
		int re = dao.insertSG(s);
	
		if(re == 1) {
			System.out.println("소모임 등록 성공");
		}else {
			System.out.println("소모임 등록 실패");
			mav.setViewName("error");
			mav.addObject("msg", "소모임 등록 실패!");
		}
		return mav;
	}
	
	//소모임 리스트
	@RequestMapping(value = "/listSG",method = RequestMethod.GET)
	public void listSG(Model model,
			@RequestParam(value = "pageNum",defaultValue = "1") int pageNum) {
		int start = (pageNum-1)*dao.pageSize+1;
		int end = start+dao.pageSize-1;
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("list", dao.listSG(map));
		model.addAttribute("totalPage", dao.totalPage);
		
	}
	
	//소모임 상세 페이지
	@RequestMapping(value = "/getSG",method = RequestMethod.GET)
	public ModelAndView getSG(@RequestParam(value = "sg_no") int sg_no) {
		ModelAndView mav = new ModelAndView("getSG");
		 mav.addObject("s", dao.getSG(sg_no));		
		return mav;
	}
	
	//소모임 수정 폼
	@RequestMapping(value = "/updateSG",method = RequestMethod.GET)
	public void updateSG(Model model, @RequestParam("sg_no") int sg_no) {
		model.addAttribute("s", dao.getSG(sg_no));
	}
	
	//소모임 수정 제출
	@RequestMapping(value = "/updateSG",method = RequestMethod.POST)
	public ModelAndView updateSG(Model model, SGVO s,@RequestParam("sg_no") int sg_no) {
		model.addAttribute("s", dao.getSG(sg_no));
		//ModelAndView mav = new ModelAndView("redirect:/listSG");
		ModelAndView mav = new ModelAndView("redirect:/getSG?sg_no="+sg_no);
		int re = dao.updateSG(s);
		if(re == 1) {
			System.out.println("소모임 수정에 성공했습니다.");
		}else {
			System.out.println("소모임 수정에 실패했습니다.");
			mav.setViewName("error");
			mav.addObject("msg", "소모임 수정에 실패했습니다.");
		}
		return mav;
	}
	
	//소모임 삭제 ajax
	@RequestMapping(value = "deleteSG",method = RequestMethod.POST)
	@ResponseBody
	public int deleteSG(Model model, @RequestParam("sg_no")int sg_no) {
		model.addAttribute("s", dao.getSG(sg_no));
		//model.addAttribute("cnt", cdao.countSGC(sg_no));
		int re = dao.deleteSG(sg_no);
		if(re == 1) {
			System.out.println("소모임 삭제에 성공했습니다.");
		}else {
			System.out.println("소모임 삭제에 실패했습니다.");
		}
		return re;
	}
	
	//소모임 댓글 등록 ajax
	@RequestMapping(value = "/insertSGC", method = RequestMethod.POST)
	@ResponseBody
	public void insertSGC(SGCVO sc) {
		//일단 그냥 댓글이라고 봄
		int sg_comment_no = dao.getSGCNo();
		int sg_ref = sg_comment_no;
		int sg_step = 0;
		int sg_level = 0;
	
		int reply = sc.getSg_comment_no(); //답댓글번호
		System.out.println("부모댓글번호:"+reply);
		
		if(reply != 0) {
			SGCVO re = dao.findBySGCNO(reply);
			sg_ref = re.getSg_ref();
			sg_step = re.getSg_step();
			sg_level = re.getSg_level();
			dao.updateStep(sg_ref, sg_step);
			sg_level++;
			sg_step++;
			
		}
		sc.setSg_comment_no(sg_comment_no);
		sc.setSg_ref(sg_ref);
		sc.setSg_step(sg_step);
		sc.setSg_level(sg_level);
		
		int re = dao.insertSGC(sc);
		//int sg_no = sc.getSg_no();
		//String sg_comment = sc.getSg_comment();
		if(re == 1) {
			System.out.println("소모임 댓글 등록 성공");
			//System.out.println(sg_no);
			//System.out.println(sg_comment);
			
		}else {
			System.out.println("소모임 댓글 등록 실패");
		}
	}
	
	//소모임 댓글 리스트 ajax 
	@RequestMapping(value = "/listSGC",method = RequestMethod.GET)
	@ResponseBody
	public List<SGCVO> listOfSG(int sg_no) {
		return dao.listSGC(sg_no);
	}
	
	//소모임 댓글 개수 ajax >> 댓글이 1개 이상이면 삭제 금지
	@RequestMapping(value = "/countSGC",method = RequestMethod.GET)
	@ResponseBody
	public int countSGC(int sg_no) {
		return dao.countSGC(sg_no);
	}
	
	//소모임 댓글 수정 ajax
	@RequestMapping(value = "/updateSGC",method = RequestMethod.POST)
	@ResponseBody
	public int updateSGC(SGCVO sc) {
		int re = dao.updateSGC(sc);
		if(re == 1) {
			System.out.println("댓글 수정에 성공하였습니다.");
		}else {
			System.out.println("댓글 수정에 실패하였습니다.");
		}
		return re;
	}
	
	//소모임 댓글 삭제 ajax
	@RequestMapping(value = "deleteSGC",method = RequestMethod.POST)
	@ResponseBody
	public int deleteSGC(int sg_comment_no) {
		int re = dao.deleteSGC(sg_comment_no);
		if(re==1) {
			System.out.println("댓글 삭제에 성공하였습니다.");
		}else {
			System.out.println("댓글 삭제에 실패하였습니다.");
		}
		return re;		
	}
	
	
}
