package com.conv.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class MemberDAO {
// sign_in, sign_out, log_in, log_out
	
	public void sign_in() {
		//회원가입(중복검색, 정보등록), 정보를 받아 db에 저장
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	public void sign_out() {
		//회원탈퇴(정보삭제, 비밀번호 두번입력받기)
	}
	public void log_in() {
		//로그인(아이디, 비밀번호)
	}
	public void log_out() {
		//로그아웃
	}
}
