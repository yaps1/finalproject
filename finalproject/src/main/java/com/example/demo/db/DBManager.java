package com.example.demo.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.GoodsDetailVO;
import com.example.demo.vo.GoodsFavorVO;
import com.example.demo.vo.GoodsReviewVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.QnaVO;

public class DBManager {
	public static SqlSessionFactory factory;
	static {
		try {
			Reader reader= Resources.getResourceAsReader("com/example/demo/db/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
	}
	//공지사항
	public static List<NoticeVO> getTotalRecordNotice(HashMap map) {
		SqlSession session = factory.openSession();
		List<NoticeVO> count = session.selectList("notice.totalRecord",map);
		session.close();
		return count;
	}
	
	public static List<NoticeVO> listNotice(HashMap map){
		SqlSession session = factory.openSession();
		List<NoticeVO> list = session.selectList("notice.findAll",map);
		session.close();
		return list;
	}
	public static NoticeVO findByNoNotice(int notice_no) {
		SqlSession session = factory.openSession();
		NoticeVO n = session.selectOne("notice.findByNo",notice_no);
		session.close();
		return n;
	}
	public static int maxNotice() {
		SqlSession session = factory.openSession();
		int max = session.selectOne("notice.max");
		session.close();
		return max;
	}
	public static int deleteNotice(int notice_no) {
		SqlSession session = factory.openSession();
		int re = session.delete("notice.delete", notice_no);
		session.commit();
		session.close();
		return re;
	}
	public static int insertNotice(NoticeVO n) {
		SqlSession session = factory.openSession();
		int re = session.insert("notice.insert",n);
		session.commit();
		session.close();
		return re;
	}
	public static int updateNotice(NoticeVO n) {
		SqlSession session = factory.openSession();
		int re = session.update("notice.update",n);
		session.commit();
		session.close();
		return re;
	}
	public static int hitNotice(int notice_no) {
		SqlSession session = factory.openSession();
		int re = session.update("notice.hit",notice_no);
		session.commit();
		session.close();
		return re;
	}
	
	
	//문의사항
	public static int insertQna(QnaVO q) {
		SqlSession session = factory.openSession();
		int re = session.insert("qna.insert",q);
		session.commit();
		session.close();
		return re;
	}
	
	public static List<QnaVO> getTotalRecordQna(HashMap mapQna) {
		SqlSession session = factory.openSession();
		List<QnaVO> count = session.selectList("qna.totalRecord",mapQna);
		session.close();
		return count;
	}
	
	public static List<QnaVO> listQna(HashMap mapQna){
		SqlSession session = factory.openSession();
		List<QnaVO> list = session.selectList("qna.listQna",mapQna);
		session.close();
		return list;
	}
	public static QnaVO findByNoQna(int qna_no) {
		SqlSession session = factory.openSession();
		QnaVO q = session.selectOne("qna.findByNoQna",qna_no);
		session.close();
		return q;
	}
	public static int updateQna(QnaVO q) {
		SqlSession session = factory.openSession();
		int re = session.update("qna.update",q);
		session.commit();
		session.close();
		return re;
	}
	//검색어
	public static List<String> listKeyword(){
		SqlSession session = factory.openSession();
		List<String> list = session.selectList("hotKeyword.keyword");
		session.close();
		return list;
	}
	
	//중고거래
	public static List<GoodsVO> getTotalRecordGoods(HashMap map) {
		SqlSession session = factory.openSession();
		List<GoodsVO> count = session.selectList("goods.totalRecord",map);
		session.close();
		return count;
	}
	public static List<GoodsVO> listAllGoods(HashMap map){
		SqlSession session = factory.openSession();
		List<GoodsVO> list = session.selectList("goods.listAllGoods",map);
		session.close();
		return list;
	}
	public static int maxGoods() {
		SqlSession session = factory.openSession();
		int max = session.selectOne("goods.max");
		session.close();
		return max;
	}
	public static GoodsDetailVO getGoodsImage(int goods_no) {
		SqlSession session = factory.openSession();
		GoodsDetailVO g = session.selectOne("goods.getGoodsImage", goods_no);
		session.close();
		return g;		
	}
	public static GoodsVO getGoodsInfo(int goods_no) {
		SqlSession session = factory.openSession();
		GoodsVO g = session.selectOne("goods.getGoodsInfo", goods_no);
		session.close();
		return g;		
	}
	public static GoodsVO sellerMember(int goods_no) {
		SqlSession session = factory.openSession();
		GoodsVO g = session.selectOne("goods.sellerMember", goods_no);
		session.close();
		return g;	
	}
	public static List<GoodsVO> sellerGoods(int goods_no) {
		SqlSession session = factory.openSession();
		List<GoodsVO> g = session.selectList("goods.sellerGoods", goods_no);
		session.close();
		return g;	
	}
	public static List<GoodsVO> sellerGoodsSold(int goods_no) {
		SqlSession session = factory.openSession();
		List<GoodsVO> g = session.selectList("goods.sellerGoodsSold", goods_no);
		session.close();
		return g;	
	}
	public static List<GoodsReviewVO> totalRecordReview(HashMap map) {
		SqlSession session = factory.openSession();
		List<GoodsReviewVO> list= session.selectList("goods.totalRecordReview", map);
		session.close();
		return list;	
	}
	public static List<GoodsReviewVO> sellerReview(HashMap map){
		SqlSession session = factory.openSession();
		List<GoodsReviewVO> list = session.selectList("goods.sellerReview",map);
		session.close();
		return list;
	}
	public static int getMember(int goods_no) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("goods.getMember", goods_no);
		session.close();
		return n;	
	}
	public static int updateGoodsCondition(GoodsDetailVO gd) {
		SqlSession session = factory.openSession();
		int re = session.update("goods.updateGoodsCondition",gd);
		session.commit();
		session.close();
		return re;
	}
	public static String favorGoods(GoodsFavorVO gf) {
		SqlSession session = factory.openSession();
		String check = session.selectOne("goods.favorGoods",gf);
		session.close();
		return check;
	}
	public static int insertFavor(GoodsFavorVO gf) {
		SqlSession session = factory.openSession();
		int re = session.insert("goods.insertFavor",gf);
		session.commit();
		session.close();
		return re;
	}
	public static int deleteFavor(GoodsFavorVO gf) {
		SqlSession session = factory.openSession();
		int re = session.delete("goods.deleteFavor", gf);
		session.commit();
		session.close();
		return re;
	}
}
