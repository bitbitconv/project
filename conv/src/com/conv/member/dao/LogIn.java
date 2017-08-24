package com.conv.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import com.conv.member.domain.Member;
import com.conv.util.ConnectionPool;

public class LogIn {

	static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
         
        boolean test = login(sc.nextLine(), sc.nextLine());
        String result = null;
         

    }
 
    public static boolean login(String id, String password) {
        boolean b = false;
 
        Connection con = null;
        PreparedStatement pstmt = null;
        String getPass = null;
 
        try {
        	Member m = new Member();
            con = ConnectionPool.getConnection();
 
            StringBuffer sql = new StringBuffer();
            sql.append("select pass from t97_member where id=? ");
            
            pstmt = con.prepareStatement(sql.toString());
 
            pstmt.setString(1, id);
 
            ResultSet rs = pstmt.executeQuery();
 
            if (rs.next()) {
                // 패스워드를 읽어온다.
                // 데이터베이스에서 읽어온 문자열과 사용자가 입력한 비밀번호가 같을 경우에는
                // 참을 반환
                if (rs.getString("pass").equals(password)) {
                    b = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionPool.releaseConnection(con);
        }
        return b;
    }
}
