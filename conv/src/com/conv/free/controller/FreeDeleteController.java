package com.conv.free.controller;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import com.conv.free.dao.FreeDAO;
import com.conv.free.domain.Free;

@WebServlet("/free/delete")
public class FreeDeleteController extends GenericServlet {

	@Override
	public void service(ServletRequest request, ServletResponse response
							) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));

		FreeDAO dao = new FreeDAO();
		dao.deleteBoard(no);
	}
}
