package com.example.demo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.example.demo.dao.RestDAO;

import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.RestVO;

import lombok.Setter;

@Controller
@Setter
public class RestController {
	@Autowired
	private RestDAO dao;
	
	//맛집추가 게시판 이동
	@RequestMapping(value = "/insertRest", method = RequestMethod.GET)
	public void insertRest() {}

	//맛집추가 게시판 
	@RequestMapping(value = "/insertRest", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertRest(RestVO rest) {
		ModelAndView mav = new ModelAndView("/rest");
		rest.setRest_no(dao.getRestNO());
		int re = dao.insertRest(rest);
		if(re == 1) {
			System.out.println("맛집 공유 성공!");
		}else {
			mav.setViewName("error");
			mav.addObject("msg", "맛집 공유 실패..ㅠ");
			System.out.println("맛집 공유 실패 ㅠㅠ");
		}
		return mav;
	}

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
		List<RestReviewVO> list= dao.listRestReview(rest_no);
		return list;
	}
	
	//맛집공유 가게 사진 ajax
	@RequestMapping(value = "/listRestPic", method = RequestMethod.GET)
	@ResponseBody
	public List<RestReviewVO> listRestPic(int rest_no){
		return dao.listRestPic(rest_no);
	}

	//맛집 후기 작성 ajax
	@RequestMapping(value = "/insertRestReview",method = RequestMethod.POST)
	@ResponseBody
	public int insertRestReview(@RequestParam int rest_no, @RequestParam int rest_score, HttpServletRequest request,RestReviewVO r) {
		int rest_reveiw_no = dao.getRestReviewNO();
		System.out.println("리뷰번호:"+rest_reveiw_no);
		
		r.setRest_review_no(rest_reveiw_no);
		String path = request.getRealPath("images");
		System.out.println("path:"+path);
		
		r.setRest_image("");
		MultipartFile uploadFile = r.getUploadFile();
		String rest_image = uploadFile.getOriginalFilename();
		if(rest_image != null && !rest_image.equals("")) {
			r.setRest_image(rest_image);
		}
		
		int re = dao.insertRestReview(r);
		int score = r.getRest_score();
		System.out.println("별점:"+score);
		
		if(re == 1) {
			try {
				byte []data = uploadFile.getBytes();
				if(rest_image != null && !rest_image.equals("")) {
					FileOutputStream fos = new FileOutputStream(path+"/"+rest_image);
					fos.write(data);
					fos.close();
				}
				//별점 평균 반영하기 위한 메소드
				getRestAvgScore(rest_no, rest_score);
				
			}catch (Exception e) {}
		}else {
			System.out.println("후기등록에 실패하였습니다");
		}
		return re;
	}
	
	//별점 평균 구하기
	//@RequestMapping(value = "getRestAvgScore",method = RequestMethod.GET)
	public void getRestAvgScore(int rest_no, int rest_score) {
		//식당 별점의 총합
		int score = dao.getSumRestScore(rest_no);
		System.out.println("점수의 합:"+score);
		
		//총 리뷰 수
		int review_count = dao.getReviewCount(rest_no);
		System.out.println(review_count);
		
		//식당 별점 구함
		Double rest_avg_score = 0.0;
		rest_avg_score = (double)(score)/review_count;
		System.out.println("점수"+rest_avg_score);
		
		//식당 별점 평균 반영
		dao.updateRestAvgScore(rest_avg_score, rest_no);
	}
	
	
	
}
