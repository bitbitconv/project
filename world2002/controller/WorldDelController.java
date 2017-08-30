package com.conv.world.controller;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import com.conv.world.dao.WorldDAO;
import com.conv.world.domain.World;

@WebServlet("/com/conv/world/controller/worlddelcontroller")

public class WorldDelController  extends GenericServlet {
	
	   
	   @Override
	   public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
	      
	      int no = Integer.parseInt(request.getParameter("no"));      
	      World vo= new World();
	      vo.setNo(no);
	      
	      WorldDAO dao = new WorldDAO();
	      dao.deleteWorld(no);
	      
	      System.out.println("no : " + no);
	   
	      
	      
	   }
	   
	   

	
}
