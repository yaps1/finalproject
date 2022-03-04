package com.example.demo.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.MemberVO;
import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.RestVO;
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
		int re = session.selectOne("sg.getSGNo");
		session.close();
		return re;
	}
	
	//소모임 등록
	public static int insertSG(SGVO s) {
		SqlSession session = factory.openSession();
		int re = session.insert("sg.insertSG", s);
		session.commit();
		session.close();
		return re;
	}
	//소모임 전체 레코드 수
	public static int getTotalRecord() {
		SqlSession session = factory.openSession();
		int no = session.selectOne("sg.totalRecord");
		session.close();
		return no;
	}
	
	//소모임 리스트
	public static List<SGVO> listSG(HashMap map){
		SqlSession session = factory.openSession();
		List<SGVO> list = session.selectList("sg.listSG",map);
		session.close();
		return list;
	}
	
	//소모임 상세
	public static SGVO getSG(int sg_no) {
		SqlSession session = factory.openSession();
		SGVO s = session.selectOne("sg.getSG", sg_no);
		session.close();
		return s;
	}
	
	//소모임 수정
	public static int updateSG(SGVO s) {
		SqlSession session = factory.openSession();
		int re = session.update("sg.updateSG", s);
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
		int re = session.delete("sg.deleteSG", sg_no);
		session.commit();
		session.close();
		return re;
	}
	
	
	//소모임 댓글 번호
		public static int getSGCNo(){
			SqlSession session = factory.openSession();
			int re = session.selectOne("sgc.getSGCNo");
			session.close();
			return re;
	}
		
	//소모임 댓글 등록 ㅠ
	public static int insertSGC(SGCVO sc) {
		SqlSession session = factory.openSession();
		int re = session.insert("sgc.insertSGC", sc);
		session.commit();
		session.close();
		return re;
	}
	
	//소모임 댓글 리스트
	public static List<SGCVO> listSGC(int sg_no){
		SqlSession session = factory.openSession();
		List<SGCVO> list = session.selectList("sgc.listSGC", sg_no);
		session.close();
		return list;
	}
	
	//소모임 댓글 개수
	public static int countSGC(int sg_no) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("sgc.countSGC", sg_no);
		session.close();
		return re;
	}
	
	//소모임 댓글 수정
	public static int updateSGC(SGCVO sc) {
		SqlSession session = factory.openSession();
		int re = session.update("sgc.updateSGC", sc);
		session.commit();
		session.close();
		return re;
	}
	
	//소모임 댓글 삭제
	public static int deleteSGC(int sg_comment_no) {
		SqlSession session = factory.openSession();
		int re = session.delete("sgc.deleteSGC", sg_comment_no);
		session.commit();
		session.close();
		return re;
	}
	
	/*소모임 댓글번호로 댓글 찾기
	public static SGCVO findByNo(int sg_comment_no) {
		SqlSession session = factory.openSession();
		SGCVO sc = session.selectOne("sgc.findByNo", sg_comment_no);
		session.close();
		return sc;
	}*/
	/*update step 테스트
	public static void updateStep(int sg_ref, int sg_step) {
		HashMap map = new HashMap();
		map.put("sg_ref", sg_ref);
		map.put("sg_step", sg_step);
		
		SqlSession session = factory.openSession();
		session.update("sgc.updateStep", map);
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
		List<RestReviewVO> list = session.selectList("restReview.listRestReview", rest_no);
		session.close();
		return list;
	}

}
