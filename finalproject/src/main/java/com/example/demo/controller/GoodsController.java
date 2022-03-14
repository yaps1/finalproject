package com.example.demo.controller;

import java.io.FileOutputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.GoodsDAO;
import com.example.demo.vo.GoodsDetailVO;
import com.example.demo.vo.GoodsFavorVO;
import com.example.demo.vo.GoodsPurchaseVO;
import com.example.demo.vo.GoodsReviewVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;

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
			String addr,// 지역거래
			@RequestParam(value = "pageNUM", defaultValue = "1")  int pageNUM//페이지 번호를 받아오기 위한 변수
			) {

		if(orderColumn == null && session.getAttribute("orderColumn")!=null) {
			orderColumn = (String)session.getAttribute("orderColumn");
		}
		if(addr== null && session.getAttribute("addr")!=null) {
			addr = (String)session.getAttribute("addr");
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
		
		if(addr==null || addr.equals("0")) {
			addr=null;
			session.removeAttribute("addr");
		}
		
		int member_no=0;
		if(session.getAttribute("m")!=null) {
			MemberVO m= (MemberVO)session.getAttribute("m");
			member_no = m.getMember_no();
			
		}
		if(member_no==0) {
			session.removeAttribute("member_no");
		}else if(member_no!=0) {
			session.setAttribute("member_no", member_no);
			GoodsVO  g= new GoodsVO();
			g.setMember_no(member_no);
		}

		System.out.println("정렬칼럼:"+orderColumn);
		System.out.println("pageNUM:"+pageNUM);
		System.out.println("검색어:|"+keywordGoods+"|");
		System.out.println("카테고리:|"+goods_category+"|");
		System.out.println("addr:|"+addr+"|");
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
		map.put("addr", addr);
		map.put("member_no", member_no);
		//dao를 통해 검색한 결과를 model에 저장한다.
		//이대 findAll메소드에서 전체레코드수를 구하고 
		//그 값을 갖고 전체페이지수도 계산합니다.
		List<GoodsVO> list = dao.listAllGoods(map);
		model.addAttribute("list", list);
		model.addAttribute("member_no", member_no);
		model.addAttribute("addr", addr);
		
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
		if(addr!=null) {
			session.setAttribute("addr", addr);
		}

	}
	
	@RequestMapping("/detailGoods")
	public void detailGoods(int goods_no, Model model,HttpSession session) {
		GoodsDetailVO gd = dao.getGoodsImage(goods_no);
		model.addAttribute("gd", gd);
		session.setAttribute("g", dao.getGoodsInfo(goods_no));
		session.setAttribute("goods_no",goods_no);
		int check=0;
		int checkPurchase=0;
		GoodsFavorVO gf = new GoodsFavorVO();
		GoodsPurchaseVO gp = new GoodsPurchaseVO();
		if(session.getAttribute("m")!=null) {
			MemberVO m = (MemberVO)session.getAttribute("m");

			if(!(m.getMember_no()+"").equals("")) {
				gf.setGoods_no(goods_no);
				gf.setMember_no(m.getMember_no());
				String num = dao.favorGoods(gf);
				if(num==null) {
					check=0;
				}else {
					check=1;
				}
				
				gp.setGoods_no(goods_no);
				gp.setMember_no(m.getMember_no());
				checkPurchase = dao.checkPurchase(gp);
			}
		}
		
		
		String goods_image1=gd.getGoods_image1();
		String goods_image2=gd.getGoods_image2();
		String goods_image3=gd.getGoods_image3();
		String goods_image4=gd.getGoods_image4();
		//System.out.println(gd.getGoods_image1());

		model.addAttribute("check", check);
		model.addAttribute("checkPurchase", checkPurchase);
		model.addAttribute("goods_image1", goods_image1);
		model.addAttribute("goods_image2", goods_image2);
		model.addAttribute("goods_image3", goods_image3);
		model.addAttribute("goods_image4", goods_image4);
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
		
		
		
		
		int totalPageReview = dao.totalPage;

		int pageCountReview = dao.pageCount;
		if(totalPageReview<dao.pageCount) {
			pageCountReview = totalPageReview;
		}
		int pageGroup = (int)Math.ceil(pageNUM/(double)pageCountReview);
		int lastReview =pageGroup*pageCountReview;
		if(lastReview>totalPageReview) {
			lastReview = totalPageReview;
		}
		int firstReview = lastReview -(pageCountReview-1);
		int nextReview = lastReview +1;
		int prevReview = firstReview-1;
		System.out.println("토탈:"+totalPageReview);
		System.out.println("first"+firstReview);
		System.out.println("last:"+lastReview);
		
		//dao에 계산된 전체페이지수를 model에 상태유지합니다.
		model.addAttribute("totalPageReview", totalPageReview);
		
		model.addAttribute("lastReview",lastReview);
		model.addAttribute("firstReview",firstReview);
		model.addAttribute("nextReview",nextReview);
		model.addAttribute("prevReview",prevReview);
		model.addAttribute("pageNUM",pageNUM);
		

		
		model.addAttribute("sm", dao.sellerMember(goods_no));
		model.addAttribute("sg", sg);
		model.addAttribute("sgs", sgs);
		model.addAttribute("sr", dao.sellerReview(map));
		model.addAttribute("goods",goods);
		model.addAttribute("goodsSold",goodsSold);
		model.addAttribute("goods_no",goods_no);
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
	public ModelAndView favorGoods(int goods_no, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/detailGoods?goods_no="+goods_no);
		
		GoodsFavorVO gf = new GoodsFavorVO();
		gf.setGoods_no(goods_no);
		if(session.getAttribute("m")!=null) {
			MemberVO m = (MemberVO) session.getAttribute("m");
			gf.setMember_no(m.getMember_no());
	
			String num = dao.favorGoods(gf);
			if(num==null) {
				dao.insertFavor(gf);
			}else {
				dao.deleteFavor(gf);
			}
		}

		return mav;
	}
	@RequestMapping(value="/insertGoods", method = RequestMethod.GET)
	public void insertGoodsForm() {
		
	}
	@RequestMapping(value="/insertGoods", method = RequestMethod.POST)
	public ModelAndView insertGoodsSubmit(HttpServletRequest request,GoodsVO g, GoodsDetailVO gd) {
		ModelAndView mav = new ModelAndView("redirect:/goods");
		String path = request.getRealPath("images");
		System.out.println("path:"+path);
		gd.setGoods_image1("");
		gd.setGoods_image2("");
		gd.setGoods_image3("");
		gd.setGoods_image4("");

		MultipartFile []uploadFile = gd.getUploadFile();
		String fname[] = new String[4];
		for(int i =0; i<uploadFile.length;i++) {
			fname[i]=uploadFile[i].getOriginalFilename();
		}
		if(fname[0]!=null&&!fname[0].equals("")) {
			gd.setGoods_image1(fname[0]);
		}
		if(fname[1]!=null&&!fname[1].equals("")) {
			gd.setGoods_image2(fname[1]);
		}
		if(fname[2]!=null&&!fname[2].equals("")) {
			gd.setGoods_image3(fname[2]);
		}
		if(fname[3]!=null&&!fname[3].equals("")) {
			gd.setGoods_image4(fname[3]);
		}
		/*
		 * for(int i=0; i<fname.length;i++) { System.out.println(fname[i]); }
		 */
		int re1 = dao.insertGoods(g);
		int re2 = dao.insertGoodsDetail(gd);
		if(re1 != 1||re2!=1) {
			mav.setViewName("error");
			mav.addObject("msg", "상품등록에 실패하였습니다.");
		}else {
			try {
				for(int i=0; i<fname.length;i++) {
					if(fname[i] != null && !fname[i].equals("")) {
						byte[] data = uploadFile[i].getBytes();
						FileOutputStream fos = new FileOutputStream(path + "/"+fname[i]);
						fos.write(data);
						fos.close();
					}
				}
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println("예외발생 : "+e.getMessage());
			}	
		}
		return mav;
	}
	
	@RequestMapping(value="/reviewGoods", method = RequestMethod.GET)
	public void reviewGoodsForm(int goods_no,Model model) {
		model.addAttribute("goods_no", goods_no);
	}
	@RequestMapping(value="/reviewGoods", method = RequestMethod.POST)
	public ModelAndView reviewGoodsSubmit(GoodsReviewVO gr,HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/goods");
		MemberVO m=(MemberVO)session.getAttribute("m");
		gr.setMember_no(m.getMember_no());
		int re = dao.reviewGoods(gr);
		if(re!=1) {
			mav.setViewName("error");
			mav.addObject("msg", "리뷰등록에 실패하였습니다.");
		}
		return mav;
	}
	@RequestMapping("/purchaseGoods")
	public String purchaseGoods(GoodsPurchaseVO gp) {

		int goods_no = gp.getGoods_no();
		dao.updatePurchase(goods_no);
		return dao.purchaseGoods(gp)+"";
	}
	@RequestMapping("purchaseGoodsNick")
	public void purchaseGoodsNick(int goods_no,int member_no) {
		GoodsPurchaseVO gp = new GoodsPurchaseVO();
		gp.setGoods_no(goods_no);
		gp.setMember_no(member_no);
		dao.updatePurchase(goods_no);
		dao.purchaseGoods(gp);
		
	}
}
