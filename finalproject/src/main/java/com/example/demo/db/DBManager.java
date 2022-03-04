package com.example.demo.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.GBCVO;
import com.example.demo.vo.GBDVO;
import com.example.demo.vo.GBJVO;
import com.example.demo.vo.GBVO;
import com.example.demo.vo.GoodsReviewVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberChartVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.QnaVO;
import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.SGCVO;
import com.example.demo.vo.SGVO;

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
	
	//공동구매 전체 레코드 수
	public static int getTotalRecord(HashMap map) {
		SqlSession session = factory.openSession();
		int no = session.selectOne("groupBuying.totalRecord",map);
		session.close();
		return no;
	}
	
	//공동구매 목록
	public static List<GBVO> listGB(HashMap map){
        SqlSession session = factory.openSession();
        List<GBVO> list = session.selectList("groupBuying.listGB",map);
        session.close();
        return list;
	}
	
	//공동구매 게시글 참여 인원 수
	public static int joinNum(int gb_no) {
		SqlSession session = factory.openSession();
		int no = session.selectOne("groupBuying.joinNum",gb_no);
		session.close();
		return no;
	}
	
	//공동구매 게시글 다음 번호
	public static int getNextNo() {
		SqlSession session = factory.openSession();
        int no = session.selectOne("groupBuying.getNextNo");
        session.close();
        return no;
	}
	
	//공동구매 등록
	public static int insertGB(GBVO g) {
        SqlSession session = factory.openSession();
        int re = session.insert("groupBuying.insertGB",g);
        session.commit();
        session.close();
        return re;
	}
	
	//공동구매 등록
	public static int insertGBD(GBDVO g) {
        SqlSession session = factory.openSession();
        int re = session.insert("groupBuying.insertGBD",g);
        session.commit();
        session.close();
        return re;
	}
	
	//공동구매 상세정보
	public static GBVO findByNo(int gb_no) {
        SqlSession session = factory.openSession();
        GBVO g = session.selectOne("groupBuying.findByNo",gb_no);
        session.close();
        return g;
    }
	
	//공동구매 상세정보2
	public static GBDVO detailGB(int gb_no) {
        SqlSession session = factory.openSession();
        GBDVO g = session.selectOne("groupBuying.detailGB",gb_no);
        session.close();
        return g;
    }
	
	//공동구매 댓글 목록
	public static List<GBCVO> listGBC(int gb_no){
        SqlSession session = factory.openSession();
        List<GBCVO> list = session.selectList("groupBuying.listGBC",gb_no);
        session.close();
        return list;
	}
	
	//통합검색 - 중고거래
	public static List<GoodsVO> searchGoodsByMain(String searchkeyword){
        SqlSession session = factory.openSession();
        List<GoodsVO> list = session.selectList("goods.searchGoodsByMain",searchkeyword);
        session.close();
        return list;
	}
	
	//통합검색 - 공동구매
	public static List<GBVO> searchGBByMain(String searchkeyword){
        SqlSession session = factory.openSession();
        List<GBVO> list = session.selectList("groupBuying.searchGBByMain",searchkeyword);
        session.close();
        return list;
	}
	
	//통합검색 - 소모임
	public static List<SGVO> searchSGByMain(String searchkeyword){
        SqlSession session = factory.openSession();
        List<SGVO> list = session.selectList("smallGroup.searchSGByMain",searchkeyword);
        session.close();
        return list;
	}
	
	//통합검색 - 공지사항
	public static List<NoticeVO> searchNoticeByMain(String searchkeyword){
        SqlSession session = factory.openSession();
        List<NoticeVO> list = session.selectList("notice.searchNoticeByMain",searchkeyword);
        session.close();
        return list;
	}
	
	//마이페이지 회원 상세정보
	public static MemberVO detailMember(int member_no){
        SqlSession session = factory.openSession();
        MemberVO m = session.selectOne("member.detailMember",member_no);
        session.close();
        return m;
	}
	
	//마이페이지 회원정보 수정 
	public static int updateMember(MemberVO m){
		SqlSession session = factory.openSession();
        int re = session.update("member.updateMember",m);
        session.commit();
        session.close();
        return re;
	}
	
	//회원탈퇴,삭제
	public static int deleteMember(int member_no){
		SqlSession session = factory.openSession();
        int re = session.delete("member.deleteMember",member_no);
        session.commit();
        session.close();
        return re;
	}
	
	//마이페이지 공동구매 작성글
	public static List<GBVO> listGBByMember(int member_no){
        SqlSession session = factory.openSession();
        List<GBVO> list = session.selectList("groupBuying.listGBByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 소모임 작성글
	public static List<SGVO> listSGByMember(int member_no){
        SqlSession session = factory.openSession();
        List<SGVO> list = session.selectList("smallGroup.listSGByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 공동구매 댓글
	public static List<GBCVO> listGBCByMember(int member_no){
        SqlSession session = factory.openSession();
        List<GBCVO> list = session.selectList("groupBuying.listGBCByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 소모임 댓글
	public static List<SGCVO> listSGCByMember(int member_no){
        SqlSession session = factory.openSession();
        List<SGCVO> list = session.selectList("smallGroup.listSGCByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 중고거래 후기
	public static List<GoodsReviewVO> listGRByMember(int member_no){
        SqlSession session = factory.openSession();
        List<GoodsReviewVO> list = session.selectList("goods.listGRByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 맛집 후기
	public static List<RestReviewVO> listRRByMember(int member_no){
        SqlSession session = factory.openSession();
        List<RestReviewVO> list = session.selectList("rest.listRRByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 문의사항 목록
	public static List<QnaVO> listQnaByMember(int member_no){
        SqlSession session = factory.openSession();
        List<QnaVO> list = session.selectList("qna.listQnaByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 판매상품 목록
	public static List<GoodsVO> saleGoodsByMember(int member_no){
        SqlSession session = factory.openSession();
        List<GoodsVO> list = session.selectList("goods.saleGoodsByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 구매상품 목록
	public static List<GoodsVO> purchaseGoodsByMember(int member_no){
        SqlSession session = factory.openSession();
        List<GoodsVO> list = session.selectList("goods.purchaseGoodsByMember",member_no);
        session.close();
        return list;
	}
	
	//마이페이지 찜한 상품 목록
	public static List<GoodsVO> favorByMember(int member_no){
        SqlSession session = factory.openSession();
        List<GoodsVO> list = session.selectList("goods.favorByMember",member_no);
        session.close();
        return list;
	}
	
	//문의사항 답변 확인
	public static QnaVO getQna(int qna_no){
        SqlSession session = factory.openSession();
        QnaVO q = session.selectOne("qna.getQna",qna_no);
        session.close();
        return q;
	}
	
	//관리자 회원 차트
	public static List<MemberChartVO> memberByMonth(){
        SqlSession session = factory.openSession();
        List<MemberChartVO> list = session.selectList("manager.memberByMonth");
        session.close();
        return list;
	}
	
	//관리자 판매자 차트
	public static List<MemberVO> memberlevel(){
		SqlSession session = factory.openSession();
        List<MemberVO> list = session.selectList("manager.memberlevel");
        session.close();
        return list;
	}
	
	//공동구매 참여 다음 번호
	public static int getNextJoinNo() {
		SqlSession session = factory.openSession();
        int no = session.selectOne("groupBuying.getNextJoinNo");
        session.close();
        return no;
	}
	
	//공동구매 참여 신청
	public static int insertGBJ(GBJVO g) {
		System.out.println("insert할 객체"+g);
        SqlSession session = factory.openSession();
        int re = session.insert("groupBuying.insertGBJ",g);
        session.commit();
        session.close();
        return re;
	}
	
	//공동구매 댓글 다음 번호
	public static int getNextCommentNo() {
		SqlSession session = factory.openSession();
        int no = session.selectOne("groupBuying.getNextCommentNo");
        session.close();
        return no;
	}
	
	//공동구매 댓글 등록
	public static int insertGBC(GBCVO g) {
        SqlSession session = factory.openSession();
        int re = session.insert("groupBuying.insertGBC",g);
        session.commit();
        session.close();
        return re;
	}
}
