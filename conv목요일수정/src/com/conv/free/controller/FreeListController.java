package com.conv.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conv.free.dao.FreeDAO;
import com.conv.free.domain.Free;

@WebServlet("/free/list")
public class FreeListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response
							) throws ServletException, IOException {
		FreeDAO dao = new FreeDAO();
		List<Free> list = null;
		if (request.getParameter("no") == null) {
			list = dao.selectBoardPaging(1);
		}
		else {
			list = dao.selectBoardPaging(
					Integer.parseInt(request.getParameter("no")));
		}
		List<Free> all = dao.selectAllBoard();
		request.setAttribute("list", list);
		request.setAttribute("all", all);
		RequestDispatcher rd
					= request.getRequestDispatcher("/jsp/free/free_list.jsp");
		
		rd.forward(request, response);
	}
}
