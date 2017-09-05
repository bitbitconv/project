package com.conv.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.conv.free.dao.FreeDAO;
import com.conv.free.domain.Free;

@WebServlet("/free/insert")
public class FreeInsertController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response
							) throws ServletException, IOException {
		String state = request.getParameter("state");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Free free = new Free();
		free.setState(state);
		free.setWriter(writer);
		free.setTitle(title);
		free.setContent(content);
		
		FreeDAO dao = new FreeDAO();
		dao.insertBoard(free);
		
		response.sendRedirect("/conv/free/list");
	}
}
