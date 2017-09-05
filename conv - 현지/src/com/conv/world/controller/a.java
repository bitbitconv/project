package com.conv.world.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conv.world.dao.WorldDAO;
import com.conv.world.domain.World;

@WebServlet("/com/conv/world/controller/a")
public class a extends HttpServlet{

   @Override
   public void service(
		HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   		String num = request.getParameter("no");
	   	    int no = Integer.parseInt(num);
	     
	         WorldDAO dao = new WorldDAO();
	 
	      World vo= dao.selectByNo(no) ;
	      vo.setNo(no);
	      request.setAttribute("no", vo.getNo());

	      dao.selectByNo(no);
	      request.setAttribute("no",no);
//	      request.setAttribute("title", title);
//	      request.setAttribute("content", content);
	      
	      RequestDispatcher rd = request.getRequestDispatcher( "/jsp/world/world_update.jsp");
				rd.forward(request, response);
	      
      
   }
   
}