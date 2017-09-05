package com.conv.free.controller;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import com.conv.free.dao.FreeDAO;
import com.conv.free.domain.Free;

@WebServlet("/free/update")
public class FreeUpdateController extends GenericServlet {

	@Override
	public void service(ServletRequest request, ServletResponse response
							) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		String state = request.getParameter("state");
		if (state == "1") state="나눔중";
		else state="나눔완료";
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Free free = new Free();
		free.setNo(no);
		free.setState(state);
		free.setTitle(title);
		free.setContent(content);
		
		FreeDAO dao = new FreeDAO();
		dao.updateBoard(free);
	}
}
