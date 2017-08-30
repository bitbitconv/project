package com.conv.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.conv.review.dao.ReviewDAO;
import com.conv.review.domain.Review;


@WebServlet("/review/update")
public class ReviewUpdateController extends HttpServlet{

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Review review = new Review();
		// 사용자 입력
		review.setNo(no);
		review.setTitle(title);
		review.setContent(content);
		
		ReviewDAO dao = new ReviewDAO();
		dao.updateBoard(review);
		
		System.out.println(no);
		System.out.println(title);
		System.out.println(content);
		
	}
	
}
