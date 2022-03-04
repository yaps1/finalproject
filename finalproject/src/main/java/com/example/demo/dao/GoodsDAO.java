package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.GoodsReviewVO;
import com.example.demo.vo.GoodsVO;

@Repository
public class GoodsDAO {
	public List<GoodsVO> searchGoodsByMain(String searchkeyword){
		return DBManager.searchGoodsByMain(searchkeyword);
	}
	
	public List<GoodsReviewVO> listGRByMember(int member_no){
		return DBManager.listGRByMember(member_no);
	}
	
	public List<GoodsVO> saleGoodsByMember(int member_no){
		return DBManager.saleGoodsByMember(member_no);
	}
	
	public List<GoodsVO> purchaseGoodsByMember(int member_no){
		return DBManager.purchaseGoodsByMember(member_no);
	}
	
	public List<GoodsVO> favorByMember(int member_no){
		return DBManager.favorByMember(member_no);
	}
}
