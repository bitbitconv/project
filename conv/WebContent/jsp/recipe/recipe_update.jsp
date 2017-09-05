<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int no = (int)request.getAttribute("no");
    	String title= (String)request.getAttribute("title");
    	String content = (String)request.getAttribute("content");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<form action = "/conv/com/conv/recipe/controller/recipeupdatecontroller">

  <div class="form-group">
    <label for="title" > 글번호를 입력하세요.</label>
    <input type="text" name="no" class="form-control" id="title" value="<%= no %>">
  </div>
  <div class="form-group">
    <label for="title">글 제목을 변경</label>
    <input type="text"  name = "title" class="form-control" id="title" >
  </div>
  <div class="form-group">
    <label for="=content">글 내용을 변경</label>
    <input type="text"  name = "content" class="form-control" id="content">
  </div>
  <button type="submit" class="btn btn-default"> 등록 </button>   
  </div>
</form>
</body>
</html>