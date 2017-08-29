package com.conv.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.temporal.JulianFields;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.conv.member.domain.Member;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

public class MemberDAO {

	public void signIn(Member member) {
		/*
		 * driver(jar) Web-inf>lib에 넣어서 잡아주기
		 * db접근 util(jdbc, connectionpool)잡아주기
		 * 
		 * 
		 * servlet service에
		 * Member member = new Member();
		 * member.setId(id);
		 * ...
		 * MemberDAO dao = new MemberDAO();
		 * dao.insertMember(member);
		 */
		
		
		//가입정보를 받아 DB에 저장
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

		public void Addmember() {
			// 아이디 중복체크 후 중복되지 않았으면 signIn으로 가입정보 반환
			// 가입 완료 후 로그인 원할 시 TryLogin호출하고 아니면 종료
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
					
					stmt.executeUpdate();
					
					System.out.print("로그인하시겠습니까? Y/N");
					String a = sc.nextLine();
					
					if(a.equalsIgnoreCase("y")) {
						LogInDAO lidao = new LogInDAO();
						lidao.TryLogin();

					}else {
						System.out.println("종료합니다.");
						System.exit(0);}
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					JdbcUtil.close(stmt);
					sc.close();
					ConnectionPool.releaseConnection(con);
				}


			}
	public void sign_out() {
		//회원탈퇴(정보삭제, 비밀번호 두번입력받기)
	}

	public void log_out() {
		//로그아웃
	}
	

}

