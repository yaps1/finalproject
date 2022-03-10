package com.example.demo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.ManagerDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberChartVO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Controller
@Setter
public class ManagerController {

	@Autowired
	private ManagerDAO dao;

	@RequestMapping("/chart")
    public void managerChart(Model model) {
		//판매자 레벨 차트
		List<MemberVO> list_member = dao.memberlevel();
		String result_member = "";
		for(MemberVO m:list_member) {
			if(result_member != "") {
				result_member += ",";
			}
			String member_id = m.getMember_id();
			double member_level = m.getMember_level();
			result_member += "['"+member_id+"', "+member_level+"]";
		}
		model.addAttribute("result_member", result_member);
		//System.out.println(result_member);
		
		//회원가입 차트
		List<MemberChartVO> list_member_join = dao.memberByMonth();
		String result_member_join = "";
		for(MemberChartVO m:list_member_join) {
			if(result_member_join != "") {
				result_member_join += ",";
			}
			String month = m.getMonth();
			int cnt = m.getCnt();
			result_member_join += "['"+month+"', "+cnt+"]";
		}
		model.addAttribute("result_member_join", result_member_join);
		//System.out.println(result_member_join);
		
		//판매 물품 카테고리 top3
		List<GoodsVO> list_goods = dao.goodsTop3();
		String result_goods ="";
		String goods_category="";
		for(GoodsVO g: list_goods) {
			if(result_goods !="") {
				result_goods += ",";
			}
			int category = g.getGoods_category();
			switch (category) {
			case 11:goods_category = "아우터";break;
			case 12:goods_category = "상의";break;
			case 13:goods_category = "하의";break;
			case 14:goods_category = "언더웨어/홈웨어";break;
			case 21:goods_category = "신발";break;
			case 22:goods_category = "가방";break;
			case 23:goods_category = "반려동물 물품";break;
			case 24:goods_category = "지갑";break;
			case 25:goods_category = "모자";break;
			case 26:goods_category = "악세사리";break;
			case 31:goods_category = "모바일";break;
			case 32:goods_category = "가전제품";break;
			case 33:goods_category = "PC/노트북";break;
			case 34:goods_category = "카메라";break;
			case 35:goods_category = "오디오/영상";break;
			case 41:goods_category = "가구";break;
			case 42:goods_category = "인테리어";break;
			case 51:goods_category = "게임";break;
			case 52:goods_category = "취미";break;
			case 61:goods_category = "스포츠";break;
			case 62:goods_category = "레저";break;
			case 71:goods_category = "헤어/바디";break;
			case 72:goods_category = "메이크업";break;
			case 81:goods_category = "도서";break;
			case 82:goods_category = "문구";break;
			case 83:goods_category = "티켓/기프티콘/상품권";break;
			case 91:goods_category = "차량";break;
			case 92:goods_category = "오토바이";break;
			}
			int cnt = g.getCnt();
			result_goods += "['"+goods_category+"', "+cnt+"]";
		}
		model.addAttribute("result_goods", result_goods);
    }
}
