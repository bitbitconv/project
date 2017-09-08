<%@page import="com.conv.free.domain.Free"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Free post = (Free)request.getAttribute("post");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/conv/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT CONVINI</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<div class="w3-container w3-blue w3-card-2">
    	<h2>&nbsp;나눔 게시글 수정</h2>
  	</div><br>
	<form class="w3-container" action="/conv/free/update">
		<div class="w3-section">
		상태 :
		<input class="w3-radio" type="radio"
			   name="state" value="나눔중"><label>나눔중</label>
		<input class="w3-radio" type="radio" 
			   name="state" value="나눔완료"><label>나눔완료</label><br>
		<p>제목<input class="w3-input w3-hover-light-grey" name="title"
					 value="${ post.getTitle() }" required></p>
		</div>
		<div class="w3-section">
		내용 : 
		<textarea class="w3-input" name="content" required><%= post.getContent() %></textarea>

		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		 
		<script type="text/javascript">
		 window.onload=function()
		 {
		  CKEDITOR.replace('content');
		 }
		</script>
		</div>
		<button class="w3-button w3-blue"
				style="width:20%" name="no" value="${ post.no }">게시글 수정</button>
		<a href="/conv/free/list">
			<button class="w3-button w3-blue w3-right"
					style="width:20%" name="no" value="${ post.no }">목록으로</button></a>
	</form>	
</body>
</html>
