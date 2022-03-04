package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.GBDAO;
import com.example.demo.dao.GoodsDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.QnaDAO;
import com.example.demo.dao.RestDAO;
import com.example.demo.dao.SGDAO;
import com.example.demo.vo.GBCVO;
import com.example.demo.vo.GBVO;
import com.example.demo.vo.GoodsReviewVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.QnaVO;
import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.SGCVO;
import com.example.demo.vo.SGVO;

import lombok.Setter;

@Controller
@Setter
public class MypageController {
	
	@Autowired
	private GBDAO dao_gb;
	
	@Autowired
	private MemberDAO dao_member;
	
	@Autowired
	private SGDAO dao_sg;
	
	@Autowired
	private GoodsDAO dao_goods;
	
	@Autowired
	private RestDAO dao_rest;
	
	@Autowired
	private QnaDAO dao_qna;
	
	//마이페이지 회원정보
	@RequestMapping("/mypage")
	public void detailMember(int member_no,Model model) {
		model.addAttribute("m", dao_member.detailMember(member_no));
	}
	
	//마이페이지 작성글
	@RequestMapping("/memberWriting")
	public void memberWriting(int member_no,Model model) {
		model.addAttribute("m", dao_member.detailMember(member_no));
	}
	
	//마이페이지 상품
	@RequestMapping("/memberGoods")
	public void memberGoods(int member_no,Model model) {
		model.addAttribute("m", dao_member.detailMember(member_no));
	}
	
	//마이페이지 회원정보 수정
	@ResponseBody
	@RequestMapping(value="/updateMember")
	public String updateMember(MemberVO m) {
		dao_member.updateMember(m);
		return "OK";
	}
	
	//마이페이지 회원탈퇴
	@ResponseBody
	@RequestMapping(value="/deleteMember")
	public String deleteMember(int member_no) {
		dao_member.deleteMember(member_no);
		return "ok";
	}
	
	//마이페이지 작성글 공동구매
	@ResponseBody
	@RequestMapping("/listGBByMember")
	public List<GBVO> listGBByMember(int member_no) {
		return dao_gb.listGBByMember(member_no);
	}
	
	//마이페이지 작성글 소모임
	@ResponseBody
	@RequestMapping("/listSGByMember")
	public List<SGVO> listSGByMember(int member_no) {
		return dao_sg.listSGByMember(member_no);
	}
	
	//마이페이지 공동구매 작성글 수
	@ResponseBody
	@RequestMapping("/cntMemberGB")
	public int cntMemberGB(int member_no) {
		return dao_gb.listGBByMember(member_no).size();
	}
	
	//마이페이지 소모임 작성글 수
	@ResponseBody
	@RequestMapping("/cntMemberSG")
	public int cntMemberSG(int member_no) {
		return dao_sg.listSGByMember(member_no).size();
	}
	
	//마이페이지 작성글 전체 수
	@ResponseBody
	@RequestMapping("/cntMemberWriting")
	public int cntMemberWriting(int member_no) {
		return dao_gb.listGBByMember(member_no).size()+dao_sg.listSGByMember(member_no).size();
	}
	
	//마이페이지 공동구매 댓글
	@ResponseBody
	@RequestMapping("/listGBCByMember")
	public List<GBCVO> listGBCByMember(int member_no) {
		return dao_gb.listGBCByMember(member_no);
	}
	
	//마이페이지 소모임 댓글
	@ResponseBody
	@RequestMapping("/listSGCByMember")
	public List<SGCVO> listSGCByMember(int member_no) {
		return dao_sg.listSGCByMember(member_no);
	}
	
	//마이페이지 공동구매 댓글 수
	@ResponseBody
	@RequestMapping("/cntMemberGBC")
	public int cntMemberGBC(int member_no) {
		return dao_gb.listGBCByMember(member_no).size();
	}
	
	//마이페이지 소모임 댓글 수
	@ResponseBody
	@RequestMapping("/cntMemberSGC")
	public int cntMemberSGC(int member_no) {
		return dao_sg.listSGCByMember(member_no).size();
	}
	
	//마이페이지 댓글 전체 수
	@ResponseBody
	@RequestMapping("/cntMemberComment")
	public int cntMemberComment(int member_no) {
		return dao_gb.listGBCByMember(member_no).size()+dao_sg.listSGCByMember(member_no).size();
	}
	
	//마이페이지 상품 후기
	@ResponseBody
	@RequestMapping("/listGRByMember")
	public List<GoodsReviewVO> listGRByMember(int member_no) {
		return dao_goods.listGRByMember(member_no);
	}
	
	//마이페이지 맛집 후기
	@ResponseBody
	@RequestMapping("/listRRByMember")
	public List<RestReviewVO> listRRByMember(int member_no) {
		return dao_rest.listRRByMember(member_no);
	}
	
	//마이페이지 상품 후기 수
	@ResponseBody
	@RequestMapping("/cntMemberGR")
	public int cntMemberGR(int member_no) {
		return dao_goods.listGRByMember(member_no).size();
	}
	
	//마이페이지 맛집 후기 수
	@ResponseBody
	@RequestMapping("/cntMemberRR")
	public int cntMemberRR(int member_no) {
		return dao_rest.listRRByMember(member_no).size();
	}
	
	//마이페이지 후기 전체 수
	@ResponseBody
	@RequestMapping("/cntMemberReview")
	public int cntMemberReview(int member_no) {
		return dao_goods.listGRByMember(member_no).size()+dao_rest.listRRByMember(member_no).size();
	}
	
	//마이페이지 문의사항 목록
	@ResponseBody
	@RequestMapping("/listQnaByMember")
	public List<QnaVO> listQnaByMember(int member_no, Model model) {
		List<QnaVO> list = dao_qna.listQnaByMember(member_no);
		model.addAttribute("list", list);
		return dao_qna.listQnaByMember(member_no);
	}
	
	//마이페이지 문의사항 수
	@ResponseBody
	@RequestMapping("/cntQna")
	public int cntQna(int member_no) {
		return dao_qna.listQnaByMember(member_no).size();
	}
	
	//마이페이지 판매 상품
	@ResponseBody
	@RequestMapping("/saleGoodsByMember")
	public List<GoodsVO> saleGoodsByMember(int member_no) {
		return dao_goods.saleGoodsByMember(member_no);
	}
	
	//마이페이지 구매 상품
	@ResponseBody
	@RequestMapping("/purchaseGoodsByMember")
	public List<GoodsVO> purchaseGoodsByMember(int member_no) {
		return dao_goods.purchaseGoodsByMember(member_no);
	}
	
	//마이페이지 찜 상품
	@ResponseBody
	@RequestMapping("/favorByMember")
	public List<GoodsVO> favorByMember(int member_no) {
		return dao_goods.favorByMember(member_no);
	}
	
	//마이페이지 판매상품 수
	@ResponseBody
	@RequestMapping("/cntSale")
	public int cntSale(int member_no) {
		return dao_goods.saleGoodsByMember(member_no).size();
	}
	
	//마이페이지 구매상품 수
	@ResponseBody
	@RequestMapping("/cntPurchase")
	public int cntPurchase(int member_no) {
		return dao_goods.purchaseGoodsByMember(member_no).size();
	}
	
	//마이페이지 찜 수
	@ResponseBody
	@RequestMapping("/cntFavor")
	public int cntFavor(int member_no) {
		return dao_goods.favorByMember(member_no).size();
	}
	
	//마이페이지 문의사항 상세보기
	@ResponseBody
	@RequestMapping("/getQna")
	public QnaVO getQna(int qna_no) {
		return dao_qna.getQna(qna_no);
	}
}
