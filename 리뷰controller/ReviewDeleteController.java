package com.conv.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.conv.review.dao.ReviewDAO;
import com.conv.review.domain.Review;


@WebServlet("/review/delete")
public class ReviewDeleteController extends HttpServlet{

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		ReviewDAO dao = new ReviewDAO();
		dao.deleteBoard(no);
		
		System.out.println(no);
		
	}
	
}
