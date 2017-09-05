package com.conv.member.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conv.member.dao.MemberDAO;
import com.conv.member.domain.Member;
import com.conv.util.ConnectionPool;
import com.conv.util.JdbcUtil;

@WebServlet("/jsp/member/signin2")
public class MemberSigninController2 extends HttpServlet{
	Member member = new Member();
	MemberDAO dao = new MemberDAO();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setPasshint(request.getParameter("passhint"));
		member.setEmail(request.getParameter("emailAddr"));
		dao.signIn(member);
		
		Member m = new Member();
		HttpSession session = request.getSession();
			System.out.println("signined");
			
				session.setAttribute("welcome", member.getId()+"님 가입을 환영합니다. 로그인해주세요.");
				response.sendRedirect("/conv/main");
		}

	}
//membercontroller
	
	
