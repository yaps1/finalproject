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
import com.example.demo.vo.GoodsPurchaseVO;
import com.example.demo.vo.GoodsReviewVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.QnaVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.RestVO;
import com.example.demo.vo.GBCVO;
import com.example.demo.vo.GBDVO;
import com.example.demo.vo.GBJVO;
import com.example.demo.vo.GBVO;
import com.example.demo.vo.MemberChartVO;
import com.example.demo.vo.MemberVO;
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
	//최현호
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
	public static int insertGoods(GoodsVO g) {
		SqlSession session = factory.openSession();
		int re = session.insert("goods.insertGoods",g);
		session.commit();
		session.close();
		return re;
	}
	public static int insertGoodsDetail(GoodsDetailVO gd) {
		SqlSession session = factory.openSession();
		int re = session.insert("goods.insertGoodsDetail",gd);
		session.commit();
		session.close();
		return re;
	}
	public static int reviewGoods(GoodsReviewVO gr) {
		SqlSession session = factory.openSession();
		int re = session.insert("goods.reviewGoods",gr);
		session.commit();
		session.close();
		return re;
	}
	public static int purchaseGoods(GoodsPurchaseVO gp) {
		SqlSession session = factory.openSession();
		int re = session.insert("goods.purchaseGoods",gp);
		session.commit();
		session.close();
		return re;
	}
	public static int updatePurchase(int goods_no) {
		SqlSession session = factory.openSession();
		int re = session.insert("goods.updatePurchase",goods_no);
		session.commit();
		session.close();
		return re;
	}
	public static List<MemberVO> findNick(String nick) {
		SqlSession session = factory.openSession();
		List<MemberVO> list = session.selectList("member.findNick",nick);
		session.close();
		return list;
	}
	public static int checkPurchase(GoodsPurchaseVO gp) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("goods.checkPurchase",gp);
		session.close();
		return re;
	}
	//김지현
	//회원 번호
	public static int getMemberNo(){
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.getMemberNo");
		session.close();
		return re;
	}
	//회원 가입
	public static int insertMember(MemberVO m) {
		SqlSession session = factory.openSession();
		int re = session.insert("member.insertMember", m);
		session.commit();
		session.close();
		return re;
	}
	//아이디 중복 체크
	public static int id_check(String member_id) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.id_check", member_id);
		session.close();
		return re;
	}
	
	//닉네임 중복 체크
	public static int nickname_check(String member_nickname) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.nickname_check", member_nickname);
		session.close();
		return re;
	}
	
	//로그인
	public static MemberVO isMember(String member_id) {
		SqlSession session = factory.openSession();
		MemberVO m = session.selectOne("member.isMember", member_id);
		session.close();
		return m;
	}
	
	//아이디 찾기
	public static String searchId(String member_name, String member_tel) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("member_name", member_name);
		map.put("member_tel", member_tel);
		String member_id = session.selectOne("member.searchId", map);
		session.close();
		return member_id;
	}
	
	//비밀번호 찾기
	public static int searchPwd(String member_id,String member_name,String member_tel) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("member_id", member_id);
		map.put("member_name", member_name);
		map.put("member_tel", member_tel);
		int re = session.selectOne("member.searchPwd", map);
		session.close();
		return re;
	}
	
	//비밀번호 재설정
	public static int updatePwd(String member_pwd,String member_id) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("member_pwd", member_pwd);
		map.put("member_id", member_id);
		int re = session.update("member.updatePwd", map);
		session.commit();
		session.close();
		return re;
	}
	
	//소모임 번호
	public static int getSGNo(){
		SqlSession session = factory.openSession();
		int re = session.selectOne("smallGroup.getSGNo");
		session.close();
		return re;
	}
	
	//소모임 등록
	public static int insertSG(SGVO s) {
		SqlSession session = factory.openSession();
		int re = session.insert("smallGroup.insertSG", s);
		session.commit();
		session.close();
		return re;
	}
	//소모임 전체 레코드 수
	public static int getTotalRecord() {
		SqlSession session = factory.openSession();
		int no = session.selectOne("smallGroup.totalRecord");
		session.close();
		return no;
	}
	
	//소모임 리스트
	public static List<SGVO> listSG(HashMap map){
		SqlSession session = factory.openSession();
		List<SGVO> list = session.selectList("smallGroup.listSG",map);
		session.close();
		return list;
	}
	
	//소모임 상세
	public static SGVO getSG(int sg_no) {
		SqlSession session = factory.openSession();
		SGVO s = session.selectOne("smallGroup.getSG", sg_no);
		session.close();
		return s;
	}
	
	//소모임 수정
	public static int updateSG(SGVO s) {
		SqlSession session = factory.openSession();
		int re = session.update("smallGroup.updateSG", s);
		session.commit();
		session.close();
		return re;
	}
	
	//소모임 삭제
	public static int deleteSG(int sg_no) {
		SqlSession session = factory.openSession();
		//HashMap map = new HashMap();
		//map.put("sg_no", sg_no);
		//map.put("member_no", member_no);
		//int re = session.delete("sg.deleteSG", map);
		int re = session.delete("smallGroup.deleteSG", sg_no);
		session.commit();
		session.close();
		return re;
	}
	
	
	//소모임 댓글 번호
		public static int getSGCNo(){
			SqlSession session = factory.openSession();
			int re = session.selectOne("smallGroup.getSGCNo");
			session.close();
			return re;
	}
		
	//소모임 댓글 등록 ㅠ
	public static int insertSGC(SGCVO sc) {
		SqlSession session = factory.openSession();
		int re = session.insert("smallGroup.insertSGC", sc);
		session.commit();
		session.close();
		return re;
	}
	
	//소모임 댓글 리스트
	public static List<SGCVO> listSGC(int sg_no){
		SqlSession session = factory.openSession();
		List<SGCVO> list = session.selectList("smallGroup.listSGC", sg_no);
		session.close();
		return list;
	}
	
	//소모임 댓글 개수
	public static int countSGC(int sg_no) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("smallGroup.countSGC", sg_no);
		session.close();
		return re;
	}
	
	//소모임 댓글 수정
	public static int updateSGC(SGCVO sc) {
		SqlSession session = factory.openSession();
		int re = session.update("smallGroup.updateSGC", sc);
		session.commit();
		session.close();
		return re;
	}
	
	//소모임 댓글 삭제
	public static int deleteSGC(int sg_comment_no) {
		SqlSession session = factory.openSession();
		int re = session.delete("smallGroup.deleteSGC", sg_comment_no);
		session.commit();
		session.close();
		return re;
	}
	
	/*소모임 댓글번호로 댓글 찾기
	public static SGCVO findByNo(int sg_comment_no) {
		SqlSession session = factory.openSession();
		SGCVO sc = session.selectOne("smallGroup.findByNo", sg_comment_no);
		session.close();
		return sc;
	}*/
	/*update step 테스트
	public static void updateStep(int sg_ref, int sg_step) {
		HashMap map = new HashMap();
		map.put("sg_ref", sg_ref);
		map.put("sg_step", sg_step);
		
		SqlSession session = factory.openSession();
		session.update("smallGroup.updateStep", map);
		session.commit();
		session.close();
	}*/

	//맛집 공유 리스트
	public static List<RestVO> getRestInfo(){
		SqlSession session = factory.openSession();
		List<RestVO> list = session.selectList("rest.getRestInfo");
		session.close();
		return list;
	}
	
	//맛집 댓글 리스트
	public static List<RestReviewVO> listRestReview(int rest_no){
		SqlSession session = factory.openSession();
		List<RestReviewVO> list = session.selectList("rest.listRestReview", rest_no);
		session.close();
		return list;
	}
	
	//윤서우
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
