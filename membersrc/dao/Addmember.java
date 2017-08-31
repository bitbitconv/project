package com.conv.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

import com.conv.member.domain.Member;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class Addmember {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
//		new MemberUI().service();
		MemberDAO dao = new MemberDAO();
		Member m = new Member();
//		System.out.print("아이디 : ");
//		m.setId(sc.nextLine());
		
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
			
			sql.append("commit ");
			stmt.executeUpdate();
			
			System.out.print("로그인하시겠습니까? Y/N");
			String a = sc.nextLine();
			
			if(a.equalsIgnoreCase("y")) {
				Addmember am = new Addmember();
				am.TryLogin();

			}else {
				System.out.println("종료합니다.");
				System.exit(0);}
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}


	}
	public void TryLogin(){
		Scanner sc = new Scanner(System.in);
		Member m = new Member();
		MemberDAO dao = new MemberDAO();
		
		System.out.println("로그인하세요.");
		System.out.print("아이디 : ");
		m.setId(sc.nextLine());
		System.out.print("비밀번호: ");
		m.setPass(sc.nextLine());
		
		boolean result = LogIn.login(m.getId(), m.getPass());
		String a = "로그인 실패";
        if(result==true) a=m.getId()+"님 환영합니다.";
        System.out.println(a);
	}


}
