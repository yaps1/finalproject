package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;
@Service
@Setter
public class MemberService implements UserDetailsService {
	@Autowired
	private MemberDAO dao;
	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		 //TODO Auto-generated method stub
		System.out.println("로그인할때 loadUserByUserName이 자동으로 동작합니다.");
		
		MemberVO m = dao.isMember(member_id);
		//만약에 존재하지 않는 아이디라면 예외를 발생시킴
		if(m==null) {
			throw new UsernameNotFoundException(member_id);
		}
		
		//db로 부터 읽어온 회원의 정보를 UserDetails객체로 생성하여 반환함
		UserDetails details = User.builder().username(member_id).password(m.getMember_pwd()).roles(m.getMember_role()).build();
		return details;
	}

}
