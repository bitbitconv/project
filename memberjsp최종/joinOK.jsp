<%@page import="com.conv.member.dao.LogInDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	LogInDAO dao = new LogInDAO();
	if(dao.check(id)){
		out.println("<script>");
		out.println("alert('중복된 아이디입니다.')");
		out.println("location.href='signin.jsp'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('사용가능한 아이디입니다.')");
		out.println("</script>");
		
		
	}

%>
</body>
</html>