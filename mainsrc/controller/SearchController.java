package com.conv.main.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conv.main.dao.MainDAO;

@WebServlet("/main/search")
public class SearchController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		MainDAO dao = new MainDAO();
		String reviewSearch = dao.reviewSearch(keyword);
		System.out.println(reviewSearch);
response.setContentType("text/html; charset=utf-8"); 
		
		PrintWriter out = response.getWriter();
	out.println("<html>");               
	out.println("<head>");               
	
	out.println("	<style>                       ");
	out.println("	table, th, td {               ");
	out.println("		border : 1px solid #444;"
			+ " height : 40px   ");
	out.println("	}                             ");
	out.println("	table{                        ");
	out.println("	border-collapse: collapse;");
	out.println("	width : 30%; height : 40px ");
	out.println("	}                             ");
	out.println("</style>                          ");
	out.println("</head>");               
		out.println("<body>");
		out.println("	<table>");
		out.println("	<tr>");
		out.println("		<td>리뷰게시판 검색결과 (글번호) : </td>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<td>"+reviewSearch+"</td>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<td colspan='2'>");
		out.println("			<a href='/conv/jsp/main/main.jsp'>뒤로가기</a>");
		out.println("		</td>");
		out.println("	</tr>");
		out.println("	</table>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();

	}

}
