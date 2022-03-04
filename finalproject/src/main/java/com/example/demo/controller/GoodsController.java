package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.GoodsDAO;
import com.example.demo.vo.GoodsDetailVO;
import com.example.demo.vo.GoodsFavorVO;
import com.example.demo.vo.GoodsVO;

@Controller
public class GoodsController {
	
	@Autowired
	public GoodsDAO dao;
	
	@RequestMapping("/goods")
	public void listAllGoods(HttpSession session,//정렬칼럼,검색칼럼,검색어를 상태유지하기 위하여 session변수를 매개변수로 정의합니다. 
			Model model,//View페이지에서 필요한 데이터를 유지하기 위하여 Model을 선언합ㄴ디ㅏ.
			String keywordGoods,   //검색어를 받아오기 위한 변수
			String goods_category, //카테고리를 받아오기 위한변수
			String orderColumn,//정렬칼럼을 받아 오기 위한 변수
			String member_no,//동네정보 불러오기 위한 변수
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
			) {

		if(orderColumn == null && session.getAttribute("orderColumn")!=null) {
			orderColumn = (String)session.getAttribute("orderColumn");
		}
		if(member_no == null && session.getAttribute("member_no")!=null) {
			member_no = (String)session.getAttribute("member_no");
			if(member_no.equals("0")) {
				 session.removeAttribute("member_no");
			}
		}

		if(goods_category!=null) {
			session.removeAttribute("keywordGoods");
		}
		if( keywordGoods == null ) {
			if(session.getAttribute("keywordGoods") != null ) {
				keywordGoods = (String)session.getAttribute("keywordGoods");
			}
		}

		if(goods_category==null) {
			if(session.getAttribute("goods_category")!=null) {
				goods_category = (String)session.getAttribute("goods_category");
			}
		}
		
		System.out.println("정렬칼럼:"+orderColumn);
		System.out.println("pageNUM:"+pageNUM);
		System.out.println("검색어:|"+keywordGoods+"|");
		System.out.println("카테고리:|"+goods_category+"|");
		System.out.println("member_no:|"+member_no+"|");
			//현재페이지에 보여줄 시작레코드와 마지막레코드의 위치를 계산한다.
		int start = (pageNUM-1)* dao.pageSIZE + 1;
		int end = start + dao.pageSIZE - 1;
		//Dao가 게시물 목록을 검색할 때 필요한 
		//정보(정렬칼럼명, 검색칼럼명, 검색어, 현재페이지에 보여줄 시작레코드,마지막레코드)
		//들을 map에 저장한다.
		HashMap map= new HashMap();
		map.put("orderColumn", orderColumn);
		map.put("keywordGoods", keywordGoods);
		map.put("start", start);
		map.put("end", end);
		map.put("goods_category", goods_category);
		map.put("member_no", member_no);
		
		//dao를 통해 검색한 결과를 model에 저장한다.
		//이대 findAll메소드에서 전체레코드수를 구하고 
		//그 값을 갖고 전체페이지수도 계산합니다.
		model.addAttribute("list", dao.listAllGoods(map));
		model.addAttribute("member_no", member_no);
		
		
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
		if(keywordGoods != null) {
			session.setAttribute("keywordGoods", keywordGoods);
		}
		if(goods_category!=null) {
			session.setAttribute("goods_category", goods_category);
		}
		if(orderColumn != null) {
			session.setAttribute("orderColumn", orderColumn);
		}
		if(member_no != null) {
			session.setAttribute("member_no", member_no);
		}
	}
	
	@RequestMapping("/detailGoods")
	public void detailGoods(int goods_no, Model model,HttpSession session) {
		GoodsDetailVO gd = dao.getGoodsImage(goods_no);
		model.addAttribute("gd", gd);
		model.addAttribute("g", dao.getGoodsInfo(goods_no));
		session.setAttribute("goods_no",goods_no);
		
		GoodsFavorVO gf = new GoodsFavorVO();
		gf.setGoods_no(goods_no);
		gf.setMember_no(4);
		
		String num = dao.favorGoods(gf);
		int check=0;
		
		if(num==null) {
			check=0;
		}else {
			check=1;
		}
		model.addAttribute("check", check);
	}
	@RequestMapping("/seller")
	public void seller(int goods_no, Model model,
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
			) {

		
		List<GoodsVO> sg = dao.sellerGoods(goods_no);
		int goods = sg.size();
		List<GoodsVO> sgs = dao.sellerGoodsSold(goods_no);
		int goodsSold = sgs.size();
		//System.out.println(goods+"+"+goodsSold);
		
		int start = (pageNUM-1)* dao.pageSIZEReview + 1;
		int end = start + dao.pageSIZEReview - 1;
		//Dao가 게시물 목록을 검색할 때 필요한 
		//정보(정렬칼럼명, 검색칼럼명, 검색어, 현재페이지에 보여줄 시작레코드,마지막레코드)
		//들을 map에 저장한다.
		int member_no = dao.getMember(goods_no);
		HashMap map= new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("member_no", member_no);
		
		
		
		
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
		

		
		model.addAttribute("sm", dao.sellerMember(goods_no));
		model.addAttribute("sg", sg);
		model.addAttribute("sgs", sgs);
		model.addAttribute("sr", dao.sellerReview(map));
		model.addAttribute("goods",goods);
		model.addAttribute("goodsSold",goodsSold);
	}


	@RequestMapping("/updateGoodsCondition")
	  public ModelAndView updateGoodsConditionSubmit(int goods_no,int goods_condition) { 
		  GoodsDetailVO gd =new GoodsDetailVO(); 
		  System.out.println(goods_no);
		  System.out.println(goods_condition);
		  gd.setGoods_no(goods_no);
		  gd.setGoods_condition(goods_condition); 
		  dao.updateGoodsCondition(gd); 
		  ModelAndView mav = new ModelAndView("redirect:/detailGoods?goods_no="+goods_no);
		  return mav; 
	}
	@RequestMapping("/favorGoods")
	public ModelAndView favorGoods(int goods_no,int member_no) {
		ModelAndView mav = new ModelAndView("redirect:/detailGoods?goods_no="+goods_no);
		
		GoodsFavorVO gf = new GoodsFavorVO();
		gf.setGoods_no(goods_no);
		gf.setMember_no(member_no);

		String num = dao.favorGoods(gf);
		if(num==null) {
			dao.insertFavor(gf);
		}else {
			dao.deleteFavor(gf);
		}

		return mav;
	}
	
}
