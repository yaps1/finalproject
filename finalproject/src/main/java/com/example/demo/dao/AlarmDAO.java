package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AlarmVO;
@Repository
public class AlarmDAO {

	//4989 공동구매 참여신청 알림
	public List<AlarmVO> alarmGBJ(int member_no){
		return DBManager.alarmGBJ(member_no);
	}
	//4989알림 공동구매 참여신청 수락
	public int updateGBJOk(int gbj_no) {
		return DBManager.updateGBJOk(gbj_no);
	}
	//4989알림 공동구매 참여신청 거절
	public int updateGBJNo(int gbj_no) {
		return DBManager.updateGBJNo(gbj_no);
	}
}
