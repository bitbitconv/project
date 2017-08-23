package com.conv.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.conv.member.domain.Member;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class MemberDAO {
// sign_in, sign_out, log_in, log_out
//	MemberUI ui = new MemberUI();
	public void signIn(Member member) {
		//회원가입(중복검색, 정보등록), 정보를 받아 db에 저장
		List<Member> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("insert into t97_member(id, pass, email, passhint) ");
			sql.append("values(?, ?, ?, ?) ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, member.getId());
			stmt.setString(2, member.getPass());
			stmt.setString(3, member.getEmail());
			stmt.setString(4, member.getPasshint());
			
			list.add(member);
			int cnt = stmt.executeUpdate();
			if (cnt==1) System.out.println("회원가입 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	//현재 사용되지 않고 있습니다. Addmember에서 중복체크됩니다.
	public int dubCheck(Member member) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select id ");
			sql.append("from t97_member ");
			sql.append("where id = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, member.getId());
			
			int cnt = stmt.executeUpdate();
			
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return 0;
	}
	public void sign_out() {
		//회원탈퇴(정보삭제, 비밀번호 두번입력받기)
	}
	public int log_in(Member member) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select id, pass ");
			sql.append("from t97_member ");
			sql.append("where id = ? ");
			sql.append("and pass = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, member.getId());
			stmt.setString(2, member.getPass());
			
			int cnt = stmt.executeUpdate();
			if(cnt==1) System.out.println("로그인 완료");
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return 0;
	}
	public void log_out() {
		//로그아웃
	}
	

}

