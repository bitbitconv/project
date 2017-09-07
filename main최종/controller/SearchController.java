package com.conv.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conv.main.dao.MainDAO;
import com.conv.main.dao.SearchDAO;
import com.conv.member.dao.MemberDAO;
import com.conv.review.domain.Review;

@WebServlet("/main/search")
public class SearchController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		
		request.setCharacterEncoding("utf-8");
		SearchDAO dao = new SearchDAO();
		
		List<Review> reviewSearchList = dao.reviewSearch(keyword);

		HttpSession session = request.getSession();
		session.setAttribute("keyword", keyword);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		
		
	out.println("				<html>                                                      ");
	out.println("				<body>                                                      ");
	out.println("	<div class='w3-third'>                                                   ");
	out.println("	<div class='w3-card-2 w3-container' style='min-height: 460px'>           ");
	out.println("		<h3>                                                                 ");
	out.println("			<a href='/conv/review/list'>리뷰 게시판</a>                           ");
	out.println("		</h3>                                                                ");
	out.println("		<br>                                                                 ");
    out.println("                                                                            ");
	out.println("		<div class='w3-responsive w3-card-4'>                                ");
	out.println("			<table class='w3-table w3-striped w3-bordered'>                  ");
	out.println("				<thead>                                                      ");
	out.println("					<tr class='w3-theme'>                                    ");
	out.println("						<th>번호</th>                                          ");
	out.println("						<th>제목</th>                                          ");
	out.println("						<th>작성자</th>                                         ");
	out.println("						<th>조회수</th>                                         ");
	out.println("						<th>등록일</th>                                         ");
	out.println("					</tr>                                                    ");
	out.println("				</thead>                                                     ");
	out.println("				<tbody>                                                      ");
							List<Review> list = dao.reviewSearch(keyword);      
							for (Review review : list) {                        
								int no = review.getNo();                        
								String title = review.getTitle();               
								String writer = review.getWriter();             
								int hit = review.getHit();                      
								Date regDate = review.getRegDate();             
                                                                                
	out.println("					<tr class='w3-white'>                                    ");
	out.println("						<td><button class='w3-bar-item w3-button' name='no'  ");
	out.println("								value='"+no+"'>"+no+"</button></td>        ");
	out.println("						<td>"+title+"</td>                                  ");
	out.println("						<td>"+writer+"</td>                                 ");
	out.println("						<td>"+hit+"</td>                                    ");
	out.println("						<td>"+regDate+"</td>                                ");
	out.println("					</tr>                                                    ");
						}                                                 
	out.println("				</tbody>                                                     ");
	out.println("			</table>                                                         ");
	out.println("		</div>                                                               ");
	out.println("	</div>                                                                   ");
	out.println("</div>                                                                      ");
	out.println("	<div class='w3-third'>                                                   ");
	out.println("	<div class='w3-card-2 w3-container' style='min-height: 460px'>           ");
	out.println("		<h3>                                                                 ");
	out.println("			<a href='/conv/review/list'>리뷰 게시판</a>                           ");
	out.println("		</h3>                                                                ");
	out.println("		<br>                                                                 ");
	out.println("                                                                            ");
	out.println("		<div class='w3-responsive w3-card-4'>                                ");
	out.println("			<table class='w3-table w3-striped w3-bordered'>                  ");
	out.println("				<thead>                                                      ");
	out.println("					<tr class='w3-theme'>                                    ");
	out.println("						<th>번호</th>                                          ");
	out.println("						<th>제목</th>                                          ");
	out.println("						<th>작성자</th>                                         ");
	out.println("						<th>조회수</th>                                         ");
	out.println("						<th>등록일</th>                                         ");
	out.println("					</tr>                                                    ");
	out.println("				</thead>                                                     ");
	out.println("				<tbody>                                                      ");
	List<Review> list = dao.reviewSearch(keyword);      
	for (Review review : list) {                        
		int no = review.getNo();                        
		String title = review.getTitle();               
		String writer = review.getWriter();             
		int hit = review.getHit();                      
		Date regDate = review.getRegDate();             
		
		out.println("					<tr class='w3-white'>                                    ");
		out.println("						<td><button class='w3-bar-item w3-button' name='no'  ");
		out.println("								value='"+no+"'>"+no+"</button></td>        ");
		out.println("						<td>"+title+"</td>                                  ");
		out.println("						<td>"+writer+"</td>                                 ");
		out.println("						<td>"+hit+"</td>                                    ");
		out.println("						<td>"+regDate+"</td>                                ");
		out.println("					</tr>                                                    ");
	}                                                 
	out.println("				</tbody>                                                     ");
	out.println("			</table>                                                         ");
	out.println("		</div>                                                               ");
	out.println("	</div>                                                                   ");
	out.println("</div>                                                                      ");
	out.println("				</body>                                                      ");
	out.println("				</html>                                                      ");

	out.close();
	}

}

