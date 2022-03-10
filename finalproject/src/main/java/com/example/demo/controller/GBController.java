package com.example.demo.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.GBDAO;
import com.example.demo.vo.GBCVO;
import com.example.demo.vo.GBDVO;
import com.example.demo.vo.GBJVO;
import com.example.demo.vo.GBVO;

import lombok.Setter;

@Controller
@Setter
public class GBController {
	
	@Autowired
	private GBDAO dao;
	
	//공동구매 목록
	@RequestMapping("/listGB")
	public void listGB(
			HttpSession session,        	//정렬컬럼,검색컬럼,검색어를 상태유지
            Model model,                 	//View 페이지에서 필요한 데이터를 유지
            String searchColumn,       		//검색컬럼
            String keyword,                 //검색어
            String orderColumn,         	//정렬컬럼
            Integer gb_category,
			@RequestParam(value="pageNum",defaultValue = "1") int pageNum   //페이지 번호
	) {
		
		//만약 새로운 정렬이 없고 세션에 정렬컬럼명이 저장되어 있다면 세션에 저장된 정렬컬럼명을 읽어옴
        if(orderColumn == null && session.getAttribute("orderColumn")!=null) {
            orderColumn = (String)session.getAttribute("orderColumn");
        }

        //만약 새로운 검색어가 없고 세션에 검색컬럼명과 검색어가 저장되어 있다면 세션에 저장된 검색컬럼명과 검색어를 읽어옴
        if(keyword == null) {
            if(session.getAttribute("keyword")!=null) {
                searchColumn = (String)session.getAttribute("searchColumn");
                keyword = (String)session.getAttribute("keyword");
            }
        }
        
        if(gb_category == null && session.getAttribute("gb_category")!=null) {
        	gb_category = (Integer)(session.getAttribute("gb_category"));
        }
         
//        System.out.println("정렬컬럼:"+orderColumn);
//        System.out.println("페이지번호:"+pageNum);
//        System.out.println("검색컬럼:"+searchColumn);
//        System.out.println("검색어:"+keyword);

        int start = (pageNum-1)*dao.pageSize + 1;
        int end = start + dao.pageSize - 1;
        
        
        HashMap map = new HashMap();
        map.put("orderColumn", orderColumn);
        map.put("searchColumn", searchColumn);
        map.put("keyword", keyword);
        map.put("start", start);
        map.put("end", end);
        map.put("gb_category", gb_category);

        List<GBVO> list = dao.listGB(map);
        model.addAttribute("list",dao.listGB(map));
        
        int totalPage = dao.totalPage;
        
        int pageCnt = dao.pageCnt;
        if(totalPage<pageCnt) {
        	pageCnt = totalPage;
        }
        int pageGroup = (int)Math.ceil(pageNum/(double)pageCnt);
        int lastPage = pageGroup*pageCnt;
        if(lastPage>totalPage) {
        	lastPage = totalPage;
        }
        int firstPage = lastPage - (pageCnt-1);
        int nextGroup = lastPage + 1;
        int preGroup= firstPage - 1;
        
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("lastPage",lastPage);
        model.addAttribute("firstPage",firstPage);
        model.addAttribute("nextGroup",nextGroup);
        model.addAttribute("preGroup",preGroup);
        
        //만약 정렬하였다면 정렬 칼럼이름을 세션에 저장하여 상태유지
        if(orderColumn != null) {
            session.setAttribute("orderColumn", orderColumn);
            gb_category = (Integer)(session.getAttribute("gb_category"));
        }

        //만약 검색하였다면 검색한 컬럼이름과 검색어를 세션에 저장하여 상태유지
        if(keyword != null) {
            session.setAttribute("searchColumn", searchColumn);
            session.setAttribute("keyword", keyword);
            gb_category = (Integer)(session.getAttribute("gb_category"));
        }
		
	}
	
	//공동구매 등록
	@RequestMapping(value="/insertGB",method = RequestMethod.GET)
    public void insertForm(Model model) {
		model.addAttribute("no",dao.getNextNo());
    }

	//공동구매 등록
    @RequestMapping(value="/insertGB",method = RequestMethod.POST)
    public ModelAndView insertSubmit(HttpServletRequest request,GBDVO gbd,GBVO gb) {
		String path = request.getRealPath("images");
        System.out.println("path:"+path);
        MultipartFile uploadFile = gbd.getUploadFile();
        MultipartFile uploadFile2 = gbd.getUploadFile2();
        MultipartFile uploadFile3 = gbd.getUploadFile3();
        //MultipartFile uploadFile4 = gbd.getUploadFile4();
        String gb_image1 = uploadFile.getOriginalFilename();
        String gb_image2 = uploadFile2.getOriginalFilename();
        String gb_image3 = uploadFile3.getOriginalFilename();
        //System.out.println(gb_image3);
        //String gb_image4 = uploadFile4.getOriginalFilename();
        gbd.setGb_image1(gb_image1);
        
        //gb_image2,3,4는 첨부파일 없어도 업로드 가능
        byte []data2 = null;
        byte []data3 = null;
        byte []data4 = null;
        try {
            byte []data = uploadFile.getBytes();
            FileOutputStream fos = new FileOutputStream(path+"/"+gb_image1);
            fos.write(data);
            fos.close();
            
            data2 = uploadFile2.getBytes();
            data3 = uploadFile3.getBytes();
            //data4 = uploadFile4.getBytes();
            
            if(gb_image2!= null&& !gb_image2.equals("")) {
            	gbd.setGb_image2(gb_image2);
            }else {
            	gbd.setGb_image2("");
            }
            
            if(gb_image3!= null&& !gb_image3.equals("")) {
            	gbd.setGb_image3(gb_image3);
            }else {
            	gbd.setGb_image3("");
            }
            
//            if(gb_image4!= null&& !gb_image4.equals("")) {
//            	gbd.setGb_image4(gb_image4);
//            }else {
//            	gbd.setGb_image4("");
//            }
           
        }catch (Exception e) {
            // TODO: handle exception
        }

        int re = dao.insertGB(gb);
        int re2 = dao.insertGBD(gbd);
        ModelAndView mav = new ModelAndView("redirect:/listGB");
        if(re != 1 || re2 != 1) {
            mav.setViewName("error");
            mav.addObject("msg","게시물등록에 실패");
        }
        
        if(re==1 && re2 ==1 ) {
            try {
                if(gb_image2!= null&& !gb_image2.equals("")) {
                    FileOutputStream fos2 = new FileOutputStream(path+"/"+gb_image2);
                    fos2.write(data2);
                    fos2.close();
                }
                if(gb_image3!= null&& !gb_image3.equals("")) {
                    FileOutputStream fos3 = new FileOutputStream(path+"/"+gb_image3);
                    fos3.write(data3);
                    fos3.close();
                }
//                if(gb_image4!= null&& !gb_image4.equals("")) {
//                    FileOutputStream fos4 = new FileOutputStream(path+"/"+gb_image4);
//                    fos4.write(data4);
//                    fos4.close();
//                }
            }catch (Exception e) {
                // TODO: handle exception
            }
        }else {
            mav.setViewName("error");
            mav.addObject("msg","게시물 등록 실패");
        }
        return mav;
    }
    
    //공동구매 상세
    @RequestMapping("/detailGB")
    public void detail(int gb_no,Model model) {
        model.addAttribute("g",dao.findByNO(gb_no));
        model.addAttribute("gbd",dao.detailGB(gb_no));
        model.addAttribute("joinNum", dao.joinNum(gb_no));
        model.addAttribute("gbj_no", dao.getNextJoinNo());
        //model.addAttribute("gb_comment_no", dao.getNextCommentNo());
    }
    
    //공동구매 댓글 목록
    @ResponseBody
    @RequestMapping("/listGBC")
    public List<GBCVO> listGBC(int gb_no) {
    	return dao.listGBC(gb_no);
    }
    
    //공동구매 참여
    @ResponseBody
    @RequestMapping(value="/insertGBJ",method = RequestMethod.POST)
    public String insertGBJ(GBJVO g) {
    	System.out.println("insertGBJ동작");
        dao.insertGBJ(g);
        return "ok";
    }
    
    //공동구매 댓글 입력
    @ResponseBody
    @RequestMapping(value="/insertGBC",method = RequestMethod.POST)
    public String insertGBC(GBCVO g) {
        dao.insertGBC(g);
        return "ok";
    }
    
    //공동구매 삭제
    @ResponseBody
    @RequestMapping(value="/deleteGB",method = RequestMethod.POST)
    public String deleteGB(int gb_no) {
        dao.deleteGBD(gb_no);
        dao.deleteGB(gb_no);
        return "ok";
    }
    
    //공동구매 댓글 삭제
    @ResponseBody
    @RequestMapping(value="/deleteGBC",method = RequestMethod.POST)
    public String deleteGBC(int gb_comment_no) {
        dao.deleteGBC(gb_comment_no);
        return "ok";
    }
}
