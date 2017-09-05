<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/conv/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<textarea name="content"></textarea>

		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		 
		<script type="text/javascript">
		 window.onload=function()
		 {
		  CKEDITOR.replace('content');
		 }
		</script>
		
		<button>등록</button>
	</form>	
</body>
</html>