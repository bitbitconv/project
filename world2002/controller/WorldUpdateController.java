package com.conv.world.controller;

import java.io.IOException;

import javax.jws.WebService;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import com.conv.world.dao.WorldDAO;
import com.conv.world.domain.World;

@WebServlet("/com/conv/world/controller/worldupdatecontroller")
public class WorldUpdateController extends GenericServlet{

   
   @Override
   public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
      
      int no=  Integer.parseInt(request.getParameter("no"));
      String title=  request.getParameter("title");
      String content=  request.getParameter("content");
      
      
      World vo= new World();
      vo.setNo(no);
      vo.setContent(content);
      vo.setTitle(title);
      
      WorldDAO dao = new WorldDAO();
      dao.updateWorld(vo);
      
      System.out.println("no : " + no);
      System.out.println("title : " + title);
      System.out.println("content : " + content);
   
      
      
   }
   
}