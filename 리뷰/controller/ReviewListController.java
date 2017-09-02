package com.conv.review.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conv.review.dao.ReviewDAO;
import com.conv.review.domain.Review;

@WebServlet("/review/list")
public class ReviewListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ReviewDAO dao = new ReviewDAO();
		List<Review> list = null;
		if(request.getParameter("no") == null) {
			
			list = dao.selectBoard(1);
		}
		else {
			list = dao.selectBoard(Integer.parseInt(request.getParameter("no")));
		}
		List<Review> all = dao.selectAllBoard();
				
		request.setAttribute("list", list);
		request.setAttribute("all", all);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/review/review_list.jsp");
		
		rd.forward(request, response);
		
	
	
	}
	
}
