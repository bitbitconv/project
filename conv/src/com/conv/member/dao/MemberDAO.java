package com.conv.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
//	public int log_in(Member member) {
//		Connection con = null;
//		PreparedStatement stmt = null;
//		
//		try {
//			con = ConnectionPool.getConnection();
//			StringBuffer sql = new StringBuffer();
//			
//			sql.append("select id, pass ");
//			sql.append("from t97_member ");
//			sql.append("where id = ? ");
//			sql.append("and pass = ? ");
//			
//			stmt = con.prepareStatement(sql.toString());
//			stmt.setString(1, member.getId());
//			stmt.setString(2, member.getPass());
//			
//			int cnt = stmt.executeUpdate();
//			if(cnt==1) System.out.println("로그인 완료");
//			return cnt;
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			JdbcUtil.close(stmt);
//			ConnectionPool.releaseConnection(con);
//		}
//		return 0;
//	}
//	static Scanner sc = new Scanner(System.in);
//    public static void main(String[] args) {
//         
//        boolean test = login(sc.nextLine(), sc.nextLine());
//        String result = null;
//         
//        if(test==true) result="성공";
//        if(test==false) result="실패";
//        System.out.println("로그인 결과 :"+result);
//    }
 
    public boolean login(Member member) {
        boolean b = false;
 
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        String getPass = null;
 
        try {
//	    Member m = new Member();
            con = ConnectionPool.getConnection();
 
            // 문장생성
            sql = "select password from member_test where id=?";
 
            // 문장연결, 열차준비
            pstmt = con.prepareStatement(sql);
 
            // 빈칸채워주기
            pstmt.setString(1, member.getId());
 
            // 실행
            rs = pstmt.executeQuery();
 
            if (rs.next()) {
                // 패스워드를 읽어온다.
                getPass = rs.getString("password");
 
                // 데이터베이스에서 읽어온 문자열과 사용자가 입력한 비밀번호가 같을 경우에는
                // 참을 반환
                if (getPass.equals(member.getPass())) {
                    System.out.println("받아온 비밀번호 : " + getPass);
                    b = true;
                    if(b==true) {
                    	System.out.println("로그인 성공");
                    }else {System.out.println("잘못 입력하셨습니다.");}
                }
            }
 
        } catch (Exception e) {
            
            e.printStackTrace();
 
        } finally {
 
            // 자원반납
            ConnectionPool.releaseConnection(con);
        }
 
        // 결과값 반납
        return b;
    }

	public void log_out() {
		//로그아웃
	}
	

}

