package com.conv.recipe.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conv.recipe.dao.RecipeDAO;
import com.conv.recipe.domain.Recipe;


@WebServlet("/com/conv/recipe/controller/recipeupdatecontroller")
public class RecipeUpdateController extends HttpServlet{

	@Override
	protected void service( HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		
		int no=  Integer.parseInt(request.getParameter("no"));			
		String title=  request.getParameter("title");
		String content=  request.getParameter("content");
	
		Recipe vo=  new Recipe();		
		
		request.setAttribute("no", vo.getNo());
		request.setAttribute("title", vo.getTitle());
		request.setAttribute("content", vo.getContent());

		System.out.println(vo.getNo());
		vo.setNo(no);
		vo.setContent(content);
		vo.setTitle(title);	
		
		RecipeDAO dao = new RecipeDAO();
		dao.updateRecipe(vo);
		
//		response.sendRedirect("/conv/com/conv/recipe/controller/recipelistcontroller");		
		
	
		RequestDispatcher rd = request.getRequestDispatcher("/com/conv/recipe/controller/recipelistcontroller");		
		rd.forward(request, response);

	}
	
}
