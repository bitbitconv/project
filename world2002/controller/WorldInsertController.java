package com.conv.world.controller;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import com.conv.world.dao.WorldDAO;
import com.conv.world.domain.World;


@WebServlet("/com/conv/world/controller/worldinsertcontroller")
public class WorldInsertController extends GenericServlet {

   @Override
   public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
      
//      String id=  request.getParameter("id");
      String title=  request.getParameter("title");
      String content=  request.getParameter("content");
//      String photo=  request.getParameter("photo");
      
      
      World vo= new World();
//      vo.setId(id);
      vo.setContent(content);
      vo.setTitle(title);
//      vo.setPhoto(photo);
      
      WorldDAO dao = new WorldDAO();
      dao.insertWorld(vo);
      
//      System.out.println("id : " + id);
      System.out.println("title : " + title);
      System.out.println("content : " + content);
//      System.out.println("photo : " + photo);
   
      
      
   }
}