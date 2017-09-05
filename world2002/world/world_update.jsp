<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<form action="/conv/com/conv/world/controller/worldupdatecontroller">

		 		<h2>게시물 수정</h2>
		 	
		 		수정할 게시글 번호 찾기 : 
		 		<input type="text" maxlength="10"  name="no"><br>
		 		수정할 게시글 제목
		 		<input type="text" maxlength="16"  name="title"><br>
		 		수정할 게시글 내용
		 		<input type="text" maxlength="70"  name="content"><br>
		 		<br> 
		 		<button>등록</button>
		 </form>
		 	<a href="../01_basic/world.html">>>back</a>
		 
</body>
</html>
