package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.GBCVO;
import com.example.demo.vo.GBDVO;
import com.example.demo.vo.GBJVO;
import com.example.demo.vo.GBVO;

@Repository
public class GBDAO {
	public static int pageSize = 5;
	public static int totalRecord;
	public static int totalPage;
	public static int pageCnt = 3;
	
	public List<GBVO> listGB(HashMap map){
		totalRecord = DBManager.getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord/(double)pageSize);
		return DBManager.listGB(map);
	}
	
	public int joinNum(int gb_no) {
		return DBManager.joinNum(gb_no);
	}
	
	public int getNextNo() {
		return DBManager.getNextNo();
	}
	
	public int insertGB(GBVO g) {
        return DBManager.insertGB(g);
    }
	
	public int insertGBD(GBDVO g) {
        return DBManager.insertGBD(g);
    }
	
	public GBVO findByNO(int gb_no) {
        return DBManager.findByNo(gb_no);
    }
	
	public GBDVO detailGB(int gb_no) {
        return DBManager.detailGB(gb_no);
    }
	
	public List<GBCVO> listGBC(int gb_no){
		return DBManager.listGBC(gb_no);
	}
	
	public List<GBVO> searchGBByMain(String searchkeyword){
		return DBManager.searchGBByMain(searchkeyword);
	}
	
	public List<GBVO> listGBByMember(int member_no){
		return DBManager.listGBByMember(member_no);
	}
	
	public List<GBCVO> listGBCByMember(int member_no){
		return DBManager.listGBCByMember(member_no);
	}
	
	public int getNextJoinNo() {
		return DBManager.getNextJoinNo();
	}
	
	public int insertGBJ(GBJVO g) {
        return DBManager.insertGBJ(g);
    }
	
	public int getNextCommentNo() {
		return DBManager.getNextCommentNo();
	}
	
	public int insertGBC(GBCVO g) {
        return DBManager.insertGBC(g);
    }
	
	public int deleteGBD(int gb_no) {
        return DBManager.deleteGBD(gb_no);
    }
	
	public int deleteGB(int gb_no) {
        return DBManager.deleteGB(gb_no);
    }
	
	public int deleteGBC(int gb_comment_no) {
        return DBManager.deleteGBC(gb_comment_no);
    }
}
