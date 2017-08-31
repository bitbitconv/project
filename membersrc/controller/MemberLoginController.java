package com.conv.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conv.member.dao.LogIn;
import com.conv.member.domain.Member;

@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet{
	Member member = new Member();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		member.setId(id);
		member.setPass(pass);
		boolean b = LogIn.login(id, pass);
		if(b) {	response.sendRedirect("/conv/jsp/main/main.jsp");
		}else {	response.sendRedirect("/conv/jsp/member/login.jsp");
		}
		
	}
//membercontroller
	
	
}