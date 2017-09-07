<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/conv/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BIT CONVINI</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="w3-container w3-blue w3-card-2">
    	<h2>&nbsp;나눔 게시글 등록</h2>
  	</div><br>
	<form class="w3-container" action="${pageContext.request.contextPath}/free/insert"
		  enctype="multipart/form-data" method="post">
		상태 :
		<input class="w3-radio" type="radio"
			   name="state" value="나눔중" checked><label>나눔중</label>
		<input class="w3-radio" type="radio"
			   name="state" value="나눔완료"><label>나눔완료</label><br><br>
		<p>제목<input class="w3-input w3-hover-light-grey" name="title"></p>
		(멤버테이블에 존재하는 아이디만 입력가능)<br>
		<p>작성자<input class="w3-input w3-hover-light-grey" name="writer"></p><br>
		내용 : 
		<textarea name="content"></textarea>

		<script type="text/javascript" src="ckeditor/ckeditor.js" ></script>
		 
		<script type="text/javascript">
		 window.onload=function()
		 {
		  CKEDITOR.replace('content');
		 }
		</script>
		사진 : <input type="file" name="image" />
		<a href="/conv/free/list">
			<button class="w3-button w3-blue w3-right" style="width:20%">목록으로</button></a>
		<button class="w3-button w3-blue w3-right" style="width:20%">게시글 등록</button>
	</form>	
</body>
</html>