<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<form method="post"  action="/conv/com/conv/world/controller/worldinsertcontroller">
		 		<h2>게시물 작성</h2>
		 	
		 		게시글 제목 : 
		 		<input type="text" maxlength="16"  name="title">
		 		<br>
		 		카테고리 선택 :
		 		<input type="checkbox" id="ck1"> <label for="ck1"> 편의점 소개</label>
		 		<input type="checkbox" id="ck2" > <label for="ck2"> 음식 소개 </label>
		 	
		 	
		 		<br>
		 		세계 편의점 위치 :
		 		<input type="radio" name="gender" id="ra1"><label for="ra1">아시아</label>
		 		<input type="radio" name="gender"id="ra2"><label for="ra2">유럽</label>
		 		<input type="radio" name="gender"id="ra2"><label for="ra3">북아메리카</label>
		 		<input type="radio" name="gender"id="ra2"><label for="ra4">남아메리카</label>
		 		<input type="radio" name="gender"id="ra2"><label for="ra5">아프리카</label>
		 		<br>

		 		
		 		<br>
		 		게시글 내용 작성:
		 		<br>
		 		<textarea rows="10" cols="100" name="content">게시글 내용을 입력하세요~!</textarea>
		 		<br> 
		 		<button>등록</button>

		 </form>
		 
		 	<a href="../01_basic/world.html">>>back</a>
		 
</body>
</html>

