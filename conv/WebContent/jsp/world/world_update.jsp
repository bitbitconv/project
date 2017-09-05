<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<form  action="/conv/com/conv/world/controller/worldupdatecontroller">
		 		<h2>게시물 수정</h2>
		 		
		 		수정할 게시글 제목
		 		<input type="text" maxlength="16"  name="title" > <br>
		 		<br>
		 		수정할 게시글 내용 : 
		 		<textarea rows="10" cols="100" name="content" ></textarea><br>
		 		<br> 
		 		<button name = "no" value ="${no}" }>수정</button>
		 </form>
</body>
</html>
