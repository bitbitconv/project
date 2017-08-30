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
 
    public static boolean login(String id, String pass) {
        boolean b = false;
 
        Connection con = null;
        PreparedStatement pstmt = null;
 
        try {
        	Member m = new Member();
            con = ConnectionPool.getConnection();
 
            StringBuffer sql = new StringBuffer();
            sql.append("select pass from t97_member where id=? ");
            
            pstmt = con.prepareStatement(sql.toString());
 
            pstmt.setString(1, id);
 
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("pass").equals(pass)) {
                	System.out.println("로그인성공");}
                    b = true;
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionPool.releaseConnection(con);
        }
        return b;
    }
}
