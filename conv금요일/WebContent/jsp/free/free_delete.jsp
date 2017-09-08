<%@page import="com.conv.free.domain.Free"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Free post = (Free)request.getAttribute("post");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CONVINI</title>
</head>
<body>
	<h2>&nbsp;나눔 게시글 삭제</h2>
	<form action="/conv/free/delete">
		삭제할 글번호(테스트용) : 
		<input type="text" name="no" /><br>
		<button>삭제</button>
	</form>	
</body>
</html>