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

import com.conv.free.domain.Free;
import com.conv.main.dao.MainDAO;
import com.conv.main.dao.SearchDAO;
import com.conv.member.dao.MemberDAO;
import com.conv.recipe.domain.Recipe;
import com.conv.review.domain.Review;
import com.conv.world.domain.World;

@WebServlet("/main/search")
public class SearchController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		
		request.setCharacterEncoding("utf-8");
		SearchDAO dao = new SearchDAO();
		

		HttpSession session = request.getSession();
		session.setAttribute("keyword", keyword);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		
		                                                                                                            
	out.println("	<!DOCTYPE html>                                                                                  ");
	out.println("	<html>                                                                                           ");
	out.println("	<head>                                                                                           ");
	out.println("	<title>bitbit콘비니</title>                                                                         ");
	out.println("	<meta charset='UTF-8'>                                                                           ");
	out.println("	<meta name='viewport' content='width=device-width, initial-scale=1'>                             ");
	out.println("	<link rel='stylesheet' href='${pageContext.request.contextPath}/jsp/main/main.css'>              ");
	out.println("	<link rel='stylesheet' href='https://www.w3schools.com/w3css/4/w3.css'>                          ");
	out.println("	<link rel='stylesheet'                                                                           ");
	out.println("		href='https://www.w3schools.com/lib/w3-theme-blue.css'>                                      ");
	out.println("	<link rel='stylesheet'                                                                           ");
	out.println("		href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css'>   ");
	out.println("		                                                                                             ");
	out.println("	<script                                                                                          ");
	out.println("	  src='https://code.jquery.com/jquery-3.2.1.min.js'                                              ");
	out.println("	  integrity='sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4='                                ");
	out.println("	  crossorigin='anonymous'></script>                                                              ");
	out.println("	</head>                                                                                          ");
	out.println("	<body>                                                                                           ");
                                                                                
	out.println("	<div class='w3-third'>                                                   ");
	out.println("	<div class='w3-card-2 w3-container' style='min-height: 460px'>           ");
	out.println("		<h3>                                                                 ");
	out.println("			<a href='/conv/review/list'>리뷰 게시판</a>                           ");
	out.println("		</h3>                                                                ");
	out.println("		<br>                                                                 ");
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
	List<Review> reviewSearch = dao.reviewSearch(keyword);      
	for (Review review : reviewSearch) {                        
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
	out.println("			<a href='/conv/free/list'>나눔 게시판</a>                           ");
	out.println("		</h3>                                                                ");
	out.println("		<br>                                                                 ");
	out.println("		<div class='w3-responsive w3-card-4'>                                ");
	out.println("			<table class='w3-table w3-striped w3-bordered'>                  ");
	out.println("				<thead>                                                      ");
	out.println("					<tr class='w3-theme'>                                    ");
	out.println("						<th>번호</th>                                          ");
	out.println("						<th>제목</th>                                          ");
	out.println("						<th>작성자</th>                                         ");
	out.println("						<th>등록일</th>                                         ");
	out.println("					</tr>                                                    ");
	out.println("				</thead>                                                     ");
	out.println("				<tbody>                                                      ");
	List<Free> freeSearch = dao.freeSearch(keyword);      
	for (Free free : freeSearch) {                        
		int no = free.getNo();                        
		String title = free.getTitle();               
		String writer = free.getWriter();             
		Date regDate = free.getRegDate();             
		out.println("					<tr class='w3-white'>                                    ");
		out.println("						<td><button class='w3-bar-item w3-button' name='no'  ");
		out.println("								value='"+no+"'>"+no+"</button></td>        ");
		out.println("						<td>"+title+"</td>                                  ");
		out.println("						<td>"+writer+"</td>                                 ");
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
	out.println("			<a href='/conv/com/conv/recipe/controller/recipelistcontroller'>혼밥 레시피</a>");
	out.println("		</h3>                                                                ");
	out.println("		<br>                                                                 ");
	out.println("		<div class='w3-responsive w3-card-4'>                                ");
	out.println("			<table class='w3-table w3-striped w3-bordered'>                  ");
	out.println("				<thead>                                                      ");
	out.println("					<tr class='w3-theme'>                                    ");
	out.println("						<th>번호</th>                                          ");
	out.println("						<th>제목</th>                                          ");
	out.println("					</tr>                                                    ");
	out.println("				</thead>                                                     ");
	out.println("				<tbody>                                                      ");
	List<Recipe> recipeSearch = dao.recipeSearch(keyword);      
	for (Recipe recipe : recipeSearch) {                        
		int no = recipe.getNo();                        
		String title = recipe.getTitle();               
		out.println("					<tr class='w3-white'>                                    ");
		out.println("						<td><button class='w3-bar-item w3-button' name='no'  ");
		out.println("								value='"+no+"'>"+no+"</button></td>        ");
		out.println("						<td>"+title+"</td>                                  ");
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
	out.println("			<a href='/conv/com/conv/recipe/controller/recipelistcontroller'>세계의 편의점</a>");
	out.println("		</h3>                                                                ");
	out.println("		<br>                                                                 ");
	out.println("		<div class='w3-responsive w3-card-4'>                                ");
	out.println("			<table class='w3-table w3-striped w3-bordered'>                  ");
	out.println("				<thead>                                                      ");
	out.println("					<tr class='w3-theme'>                                    ");
	out.println("						<th>번호</th>                                          ");
	out.println("						<th>제목</th>                                          ");
	out.println("					</tr>                                                    ");
	out.println("				</thead>                                                     ");
	out.println("				<tbody>                                                      ");
	List<World> worldSearch = dao.worldSearch(keyword);      
	for (World world : worldSearch) {                        
		int no = world.getNo();                        
		String title = world.getTitle();               
		out.println("					<tr class='w3-white'>                                    ");
		out.println("						<td><button class='w3-bar-item w3-button' name='no'  ");
		out.println("								value='"+no+"'>"+no+"</button></td>        ");
		out.println("						<td>"+title+"</td>                                  ");
		out.println("					</tr>                                                    ");
	}                                                 
	out.println("				</tbody>                                                     ");
	out.println("			</table>                                                         ");
	out.println("		</div>                                                               ");
	out.println("	</div>                                                                   ");
	out.println("</div>                                                                      ");

	out.close();
	}

}

