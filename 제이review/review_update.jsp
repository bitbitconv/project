<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리뷰게시판</h2>
	<form action="/conv/review/update">
		수정할 글번호(테스트용) : 
		<input type="text" name="no" /><br>
		제목 : 
		<input type="text" name="title" /><br>
		내용 : 
		<input type="text" name="content" /><br>
		<button>수정</button>
	</form>	
</body>
</html>