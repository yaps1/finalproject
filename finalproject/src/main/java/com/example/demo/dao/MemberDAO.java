package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVO;

@Repository
public class MemberDAO {
	//회원 번호
	public int getMemberNo() {
		return DBManager.getMemberNo();
	}
	//회원 가입
	public int insertMember(MemberVO m) {
		return DBManager.insertMember(m);
	}
	//아이디 중복 체크
	public int id_check(String member_id) {
		return DBManager.id_check(member_id);
	}
	
	//닉네임 중복 체크
	public int nickname_check(String member_nickname) {
		return DBManager.nickname_check(member_nickname);
	}
	
	//로그인
	public MemberVO isMember(String member_id) {
		return DBManager.isMember(member_id);
	}
	
	//아이디 찾기
	public String searchId(String member_name,String member_tel) {
		return DBManager.searchId(member_name, member_tel);
	}
	
	//비밀번호 찾기
	public int searchPwd(String member_id,String member_name,String member_tel) {
		return DBManager.searchPwd(member_id, member_name, member_tel);
	}
	
	//비밀번호 재설정
	public int updatePwd(String member_pwd,String member_id) {
		return DBManager.updatePwd(member_pwd, member_id);
	}

	public MemberVO detailMember(int member_no) {
		return DBManager.detailMember(member_no);
	}
	
	public int updateMember(MemberVO m) {
		return DBManager.updateMember(m);
	}

	public int deleteMember(int member_no) {
		return DBManager.deleteMember(member_no);
		

	}
	//닉네임 찾기
	public  List<MemberVO> findNick(String nick){
		return DBManager.findNick(nick);
	}
}
