package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.NoticeVO;

@Repository
public class NoticeDAO {
	public List<NoticeVO> searchNoticeByMain(String searchkeyword){
		return DBManager.searchNoticeByMain(searchkeyword);
	}
}
