package com.example.demo.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.GBDAO;
import com.example.demo.dao.GoodsDAO;
import com.example.demo.dao.NoticeDAO;
import com.example.demo.dao.SGDAO;
import com.example.demo.vo.GBVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.SGVO;

import lombok.Setter;

@Controller
@Setter
public class SearchController {

	@Autowired
	private GoodsDAO dao;
	
	@Autowired
	private GBDAO dao2;
	
	@Autowired
	private SGDAO dao3;
	
	@Autowired
	private NoticeDAO dao4;
	
	//중고거래 검색
	@ResponseBody
	@RequestMapping("/searchGoodsByMain")
	public List<GoodsVO> searchGoodsByMain(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
            if(session.getAttribute("searchkeyword")!=null) {
            	searchkeyword = (String)session.getAttribute("searchkeyword");
            }
	     }
		 
		 //System.out.println("검색어:|"+searchkeyword+"|");
		 
		 if(searchkeyword != null) {
            session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao.searchGoodsByMain(searchkeyword);
	}
	
	//공동구매 검색
	@ResponseBody
	@RequestMapping("/searchGBByMain")
	public List<GBVO> searchGBByMain(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
            if(session.getAttribute("searchkeyword")!=null) {
            	searchkeyword = (String)session.getAttribute("searchkeyword");
            }
	     }
		 
		 if(searchkeyword != null) {
            session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao2.searchGBByMain(searchkeyword);
	}
	
	//소모임 검색
	@ResponseBody
	@RequestMapping("/searchSGByMain")
	public List<SGVO> searchSGByMain(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
            if(session.getAttribute("searchkeyword")!=null) {
            	searchkeyword = (String)session.getAttribute("searchkeyword");
            }
	     }	 
		 
		 if(searchkeyword != null) {
            session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao3.searchSGByMain(searchkeyword);
	}
	
	//공지사항 검색
	@ResponseBody
	@RequestMapping("/searchNoticeByMain")
	public List<NoticeVO> searchNoticeByMain(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
            if(session.getAttribute("searchkeyword")!=null) {
            	searchkeyword = (String)session.getAttribute("searchkeyword");
            }
	     }
		 
		 if(searchkeyword != null) {
            session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao4.searchNoticeByMain(searchkeyword);
	}
	
	//중고거래 검색결과 수
	@ResponseBody
	@RequestMapping("/cntSearchGoods")
	public int cntSearchGoods(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
	        if(session.getAttribute("searchkeyword")!=null) {
	        	searchkeyword = (String)session.getAttribute("searchkeyword");
	        }
	     }
		 
		 if(searchkeyword != null) {
	        session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao.searchGoodsByMain(searchkeyword).size();
	}
	
	//공동구매 검색결과 수
	@ResponseBody
	@RequestMapping("/cntSearchGB")
	public int cntSearchGB(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
	        if(session.getAttribute("searchkeyword")!=null) {
	        	searchkeyword = (String)session.getAttribute("searchkeyword");
	        }
	     }
		 
		 if(searchkeyword != null) {
	        session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao2.searchGBByMain(searchkeyword).size();
	}
	
	//소모임 검색결과 수
	@ResponseBody
	@RequestMapping("/cntSearchSG")
	public int cntSearchSG(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
	        if(session.getAttribute("searchkeyword")!=null) {
	        	searchkeyword = (String)session.getAttribute("searchkeyword");
	        }
	     }
		 
		 if(searchkeyword != null) {
	        session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao3.searchSGByMain(searchkeyword).size();
	}
	
	//공지사항 검색결과 수
	@ResponseBody
	@RequestMapping("/cntSearchNotice")
	public int cntSearchNotice(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
	        if(session.getAttribute("searchkeyword")!=null) {
	        	searchkeyword = (String)session.getAttribute("searchkeyword");
	        }
	     }
		 
		 if(searchkeyword != null) {
	        session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao4.searchNoticeByMain(searchkeyword).size();
	}
	
	//전체 검색결과 수
	@ResponseBody
	@RequestMapping("/cntTotal")
	public int cntTotal(HttpSession session,String searchkeyword) {
		 if(searchkeyword == null) {
	        if(session.getAttribute("searchkeyword")!=null) {
	        	searchkeyword = (String)session.getAttribute("searchkeyword");
	        }
	     }
		 
		 if(searchkeyword != null) {
	        session.setAttribute("searchkeyword", searchkeyword);
	     }
		 
		 return dao.searchGoodsByMain(searchkeyword).size() + dao2.searchGBByMain(searchkeyword).size()+dao3.searchSGByMain(searchkeyword).size()+dao4.searchNoticeByMain(searchkeyword).size();
	}
	
	@RequestMapping("/search")
	public void search(HttpSession session,String searchkeyword) {
		//searchkeyword = (String) request.getAttribute("searchkeyword");
		
		 if(searchkeyword == null) {
	        if(session.getAttribute("searchkeyword")!=null) {
	        	searchkeyword = (String)session.getAttribute("searchkeyword");
	        }
	     }
		 
		 if(searchkeyword != null) {
	        session.setAttribute("searchkeyword", searchkeyword);
	     }
	    
		 //model.addAttribute("searchkeyword", searchkeyword);
		 //ModelAndView mav = new ModelAndView();
		 //mav.addObject("searchkeyword", searchkeyword);
	}
	
	@RequestMapping("/test")
	public void testSearch(HttpSession session,String searchkeyword) {
		
		 if(searchkeyword == null) {
	        if(session.getAttribute("searchkeyword")!=null) {
	        	searchkeyword = (String)session.getAttribute("searchkeyword");
	        }
	     }
		 
		 if(searchkeyword != null) {
	        session.setAttribute("searchkeyword", searchkeyword);
	     }
	     //request.setAttribute("searchkeyword", searchkeyword);
		
		 //model.addAttribute("searchkeyword", searchkeyword);
		 //ModelAndView mav = new ModelAndView();
		 //mav.addObject("searchkeyword", searchkeyword);
	}
	
}
