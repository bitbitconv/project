package com.conv.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.conv.review.dao.ReviewDAO;
import com.conv.review.domain.Review;


@WebServlet("/review/insert")
public class ReviewInsertController extends HttpServlet{

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 테스트용
		String writer = request.getParameter("writer");
		
		Review review = new Review();
		// 데이터 베이스 상에서 자동입력
		/*
		review.setNo(no);
		review.setHit(hit);
		review.setRegDate(regDate);
		*/
		
		// 사용자 id에 따라 자동입력
		review.setWriter(writer);
		// 사용자 입력
		review.setTitle(title);
		review.setContent(content);
		
		ReviewDAO dao = new ReviewDAO();
		dao.insertBoard(review);
		
		System.out.println(writer);
		System.out.println(title);
		System.out.println(content);
		
	}
	
}
