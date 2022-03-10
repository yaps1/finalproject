package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.GoodsDetailVO;
import com.example.demo.vo.GoodsFavorVO;
import com.example.demo.vo.GoodsPurchaseVO;
import com.example.demo.vo.GoodsReviewVO;
import com.example.demo.vo.GoodsVO;

@Repository
public class GoodsDAO {
	
	public static int pageSIZE = 3; //굿즈 페이지에 나타날 게시글 수
	public static int totalRecord;
	public static int totalPage;
	public static int pageCount =5; //출력될 페이지수 
	public static int max;
	
	public static int pageSIZEReview=3; //판매자정보 리뷰에 나타날 게시글 수
	
	public List<GoodsVO> listAllGoods(HashMap map){
		List<GoodsVO> g = DBManager.getTotalRecordGoods(map);
		//System.out.println(n.size());
		totalRecord = g.size();
		max = DBManager.maxGoods();
		totalPage = (int)Math.ceil( totalRecord/ (double)pageSIZE);

		return DBManager.listAllGoods(map);
	}
	public GoodsDetailVO getGoodsImage(int goods_no) {
		return DBManager.getGoodsImage(goods_no);
	}
	public GoodsVO getGoodsInfo(int goods_no) {
		return DBManager.getGoodsInfo(goods_no);
	}
	public GoodsVO sellerMember(int goods_no) {
		return DBManager.sellerMember(goods_no);
	}
	public List<GoodsVO> sellerGoods(int goods_no) {
		return DBManager.sellerGoods(goods_no);
	}
	public List<GoodsVO> sellerGoodsSold(int goods_no) {
		return DBManager.sellerGoodsSold(goods_no);
	}
	public List<GoodsReviewVO> sellerReview(HashMap map) {
		List<GoodsReviewVO> gr=DBManager.totalRecordReview(map);
		totalRecord=gr.size();
		totalPage = (int)Math.ceil( totalRecord/ (double)pageSIZEReview);
		return DBManager.sellerReview(map);
	}
	public int getMember(int goods_no) {
		return DBManager.getMember(goods_no);
	}
	public int updateGoodsCondition(GoodsDetailVO gd) {
		return DBManager.updateGoodsCondition(gd);
	}
	public String favorGoods(GoodsFavorVO gf) {
		return DBManager.favorGoods(gf);
	}
	public int insertFavor(GoodsFavorVO gf) {
		return DBManager.insertFavor(gf);
	}
	public int deleteFavor(GoodsFavorVO gf) {
		return DBManager.deleteFavor(gf);
	}
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
	public int insertGoods(GoodsVO g) {
		return DBManager.insertGoods(g);
	}
	public int insertGoodsDetail(GoodsDetailVO gd) {
		return DBManager.insertGoodsDetail(gd);
	}
	public int reviewGoods(GoodsReviewVO gr) {
		return DBManager.reviewGoods(gr);
	}
	public int purchaseGoods(GoodsPurchaseVO gp) {
		return DBManager.purchaseGoods(gp);
	}
	public int updatePurchase(int goods_no) {
		return DBManager.updatePurchase(goods_no);
	}
	public int checkPurchase(GoodsPurchaseVO gp) {
		return DBManager.checkPurchase(gp);
	}
}


