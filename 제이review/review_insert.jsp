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
	<form action="/conv/review/insert">
		제목 : 
		<input type="text" name="title" /><br>
		(작성자는 테스트용입니다. 멤버테이블에 존재하는 아이디만 입력가능)<br>
		작성자 : 
		<input type="text" name="writer" /><br>
		내용 : 
		<input type="text" name="content" /><br>
		<button>등록</button>
	</form>	
</body>
</html>