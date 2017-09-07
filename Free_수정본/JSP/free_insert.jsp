<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/conv/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type">
<title>BIT CONVINI</title>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<body>
	<div class="w3-container w3-blue w3-card-2">
    	<h2>&nbsp;나눔 게시글 등록</h2>
  	</div><br>
	<form action="${pageContext.request.contextPath}/free/insert"
		  enctype="multipart/form-data" method="post">
		<div class="w3-section">
		상태 :
		<input class="w3-radio" type="radio"
			   name="state" value="나눔중" checked><label>나눔중</label>
		<input class="w3-radio" type="radio"
			   name="state" value="나눔완료"><label>나눔완료</label><br><br>
		<p>제목<input class="w3-input w3-hover-light-grey" name="title"></p>
		</div>
		<div class="w3-section">
		내용 : 
		<textarea class="w3-input" name="content"></textarea>

		<script type="text/javascript" src="ckeditor/ckeditor.js" ></script>
		 
		<script type="text/javascript">
		 window.onload=function()
		 {
		  CKEDITOR.replace('content');
		 }
		</script>
		</div>
		사진 : <input type="file" name="image" />
		<a href="/conv/free/list">
			<button class="w3-button w3-blue w3-right" style="width:20%">목록으로</button></a>
		<button class="w3-button w3-blue w3-right" style="width:20%"
				onclick="document.getElementById('id01').style.display='block'">게시글 등록</button>
	</form>	
</body>
</html>