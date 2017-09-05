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
	<h2>혼밥 레시피.</h2>
	
		<form action = "${pageContext.request.contextPath}/com/conv/recipe/controller/recipeinsertcontroller" method ="post"
		enctype ="multipart/form-data">
	
		제목 : 
		<input type="text" name="title" /><br>
		작성자 : 
		<input type="text" name="id" /><br>
		내용 : 
		<textarea name="content"></textarea>
		
		사진:
		<input type ="file" name ="photo" />
		
		<button>등록</button>
	</form>	

</body>
</html>