package com.conv.member.dao;

import java.util.Scanner;

import com.conv.member.domain.Member;



// MemberUI자체가 현재 사용되지 않고 있습니다.
public class MemberUI {
	private Scanner sc = new Scanner(System.in);
	private MemberDAO dao = new MemberDAO();
	public void service() {
		Member m = new Member();
		System.out.print("아이디 : ");
		m.setId(sc.nextLine());
		System.out.print("비밀번호 : ");
		m.setPass(sc.nextLine());
		System.out.print("이메일 : ");
		m.setEmail(sc.nextLine());
		System.out.print("비밀번호 힌트 : ");
		m.setPasshint(sc.nextLine());
		dao.signIn(m);


	}
	public void dupCheck(int i) {
//		Connection con = null;
//		PreparedStatement stmt = null;
//
//		Member m = new Member();
//		
//		try {
//			con = ConnectionPool.getConnection();
//			StringBuffer sql = new StringBuffer();
//			sql.append("select id ");
//			sql.append("from t97_member ");
//			sql.append("where id = ? ");
//			
//			stmt = con.prepareStatement(sql.toString());
//			stmt.setString(1, m.getId());
//			int cnt = stmt.executeUpdate();
//			
			if(i==1) {
				System.out.println("사용하실 수 있는 아이디입니다.");
				System.out.println(i);
			}else{
				System.out.println("아이디가 중복되었습니다.");}
//			}catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				JdbcUtil.close(stmt);
//				ConnectionPool.releaseConnection(con);
//			}
//		return 0;
		}
		
	
	
	public void exitBoard() {
		System.exit(0);
	}
	
//	public void service() {
//		try {
//			BaseUI ui = null;
//			while (true) {
//				switch (choiceMenu()) {
//				case 1: ui = new ListUI(dao); break;
//				case 2: ui = new DetailUI(dao); break;
//				case 3: ui = new AddUI(dao); break;
//				case 4: ui = new ModUI(dao); break;
//				case 5: ui = new DelUI(dao); break;
//				case 0: ui = new ExitUI();
//				}
//				ui.service(); 
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

}
