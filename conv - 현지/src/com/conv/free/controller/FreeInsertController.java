package com.conv.free.controller;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import com.conv.free.dao.FreeDAO;
import com.conv.free.domain.Free;

@WebServlet("/free/insert")
public class FreeInsertController extends GenericServlet {

	@Override
	public void service(ServletRequest request, ServletResponse response
							) throws ServletException, IOException {
		String state = request.getParameter("state");
		if(state == "1") state="나눔중";
		else state="나눔완료";
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
	}
}
