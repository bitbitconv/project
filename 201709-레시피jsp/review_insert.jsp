<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String id= (String)request.getAttribute("id");
    	String title = (String)request.getAttribute("title");
    	String content = (String)request.getAttribute("content");
    %>
<!DOCTYPE html>
<html>
<title>bitbit콘비니</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<body>

<header class="w3-container w3-theme w3-padding" id="myHeader">
  <i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i> 
  
  <div class="w3-center">
  
  <h4>펴니점 꿀정보 사이트</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom"><a href="/conv/jsp/review/main.jsp">펴니펴니펴니점</a></h1>
    <div class="w3-padding-32">
      <button class="w3-btn w3-xlarge w3-white w3-hover-orange" onclick="document.getElementById('id01').style.display='block'" style="font-weight:900;">밥 뭐먹지</button>
    </div>
  </div>
</header>

	<h2>리뷰게시판</h2>
	<form action="/conv/conv/com/conv/recipe/controller/recipeinsertcontroller">
		제목 : 
		<input type="text" name="title" /><br>
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