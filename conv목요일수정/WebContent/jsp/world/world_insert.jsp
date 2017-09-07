<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<form action="${pageContext.request.contextPath}/com/conv/world/controller/worldinsertcontroller "  method="post" enctype="multipart/form-data">
			
		 		<h2>게시물 작성</h2>
		 	
		 		게시글 제목 : 
		 		<input type="text" maxlength="16"  name="title">
		 		<br>
		
		 		게시글 내용 작성:
		 		<textarea rows="10" cols="100" name="content"></textarea>		<br> 
		 		
		 		
		 		사진 등록: <input type="file"  name="photo"/><br>
		 
		 		
		 		<button>등록</button>
	
		 	
		 </form>
		 
</body>
</html>

