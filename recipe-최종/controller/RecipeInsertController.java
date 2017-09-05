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


@WebServlet("/com/conv/recipe/controller/recipeinsertcontroller")
public class RecipeInsertController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=  request.getParameter("id");
		String title=  request.getParameter("title");
		String content=  request.getParameter("content");
//		String photo=  request.getParameter("photo");
		
		request.setAttribute("id", id);
		request.setAttribute("title", title);
		request.setAttribute("content", content);
//		request.setAttribute("photo", photo);
		
		Recipe vo= new Recipe();
		vo.setId(id);
		vo.setTitle(title);
		vo.setContent(content);
//		vo.setPhoto(photo
		
		RecipeDAO dao = new RecipeDAO();		
		dao.insertRecipe(vo);
		
		
		response.sendRedirect("/conv/com/conv/recipe/controller/recipelistcontroller");	
		
	}

}
