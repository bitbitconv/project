package com.conv.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

import com.conv.member.domain.Member;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class Addmember {
	public static void main(String[] args) {
//		new MemberUI().service();
		Scanner sc = new Scanner(System.in);
		MemberDAO dao = new MemberDAO();
		Member m = new Member();
		System.out.print("아이디 : ");
		m.setId(sc.nextLine());
		
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select id ");
			sql.append("from t97_member ");
			sql.append("where id = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, m.getId());
			
			int cnt = stmt.executeUpdate();
			
			if(cnt==1) {System.out.println(m.getId()+"는 중복된 아이디입니다.");
						m.setId(null);
			}else {
			System.out.println("사용가능한 아이디입니다.");
			System.out.print("비밀번호 : ");
			m.setPass(sc.nextLine());
			System.out.print("이메일 : ");
			m.setEmail(sc.nextLine());
			System.out.print("비밀번호 힌트 : ");
			m.setPasshint(sc.nextLine());
			dao.signIn(m);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}

		
		
	}



}
