package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.RestVO;

@Repository
public class RestDAO {
	
	//식당 번호
	public int getRestNO() {
		return DBManager.getRestNO();
	}
	
	//식당 추가
	public int insertRest(RestVO rest) {
		return DBManager.insertRest(rest);
	}
	
	//식당 정보
	public List<RestVO> getRestInfo(){
		return DBManager.getRestInfo();
	}
	
	//식당 리뷰 리스트
	public List<RestReviewVO> listRestReview(int rest_no){
		return DBManager.listRestReview(rest_no);
	}
	
	//식당 사진 리스트
	public List<RestReviewVO> listRestPic(int rest_no){
		return DBManager.listRestPic(rest_no);
	}
	
	//후기 번호
	public int getRestReviewNO() {
		return DBManager.getRestReviewNO();
	}
	
	//후기 추가
	public int insertRestReview(RestReviewVO r) {
		return DBManager.insertRestReview(r);
	}
	
	//별점 평균 구하기 위한 식당 후기 수
	public int getReviewCount(int rest_no) {
		return DBManager.getReviewCount(rest_no);
	}
	
	//별점 합 구하기
	public int getSumRestScore(int rest_no) {
		return DBManager.getSumRestScore(rest_no);
	}
	
	//평균별점 반영
	public Double updateRestAvgScore(Double rest_avg_score, int rest_no) {
		return DBManager.updateRestAvgScore(rest_avg_score, rest_no);
	}
	
	public List<RestReviewVO> listRRByMember(int member_no){
		return DBManager.listRRByMember(member_no);

	}
}
