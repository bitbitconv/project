package com.conv.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conv.member.dao.MemberDAO;
import com.conv.member.domain.Member;

@WebServlet("/jsp/member/signin")
public class MemberSigninController extends HttpServlet{
	Member member = new Member();
	MemberDAO dao = new MemberDAO();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = member.getId();
//		
//		request.setAttribute("id", id);
//		
//		RequestDispatcher rd = request.getRequestDispatcher("/jsp/member/signin.jsp");
//		rd.forward(request, response);
		
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setPasshint(request.getParameter("passhint"));
		member.setEmail(request.getParameter("emailAddr"));
		dao.signIn(member);
		System.out.println("service called"); 
		response.sendRedirect("/conv/jsp/member/login.jsp");
	}
//membercontroller
	
	
}