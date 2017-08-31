<%@page import="com.conv.review.domain.Review"%>
<%@page import="com.conv.main.dao.MainDAO"%>
<%@page import="com.conv.util.ConnectionPool"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.conv.recipe.domain.Recipe"%>
<%@page import="java.util.List"%>
<% 	
	MainDAO dao = new MainDAO();
	pageContext.setAttribute("dao", dao);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/conv/jsp/member/login.jsp">
<a href="/conv/jsp/member/login.jsp">로그인</a>
<a href="/conv/jsp/member/signin.jsp">회원가입</a>
검색(구현안됨)<input type="text"><button type="button" value="검색">검색</button>
	<table>
		<tr>
			<th>
				<a href="/conv/jsp/recipe/list.jsp">혼밥레시피</a>
			</th>
			<th>
				<a href="/conv/jsp/review/list.jsp">리뷰게시판</a>
			</th>
			<th>
				<a href="/conv/jsp/free/list.jsp">나눔게시판</a>
			</th>
			<th>
				<a href="/conv/jsp/world/list.jsp">세계의 편의점</a>
			</th>
			<th>
				<a href="/conv/jsp/pb/list.jsp">PB상품</a>
			</th>
			<th>
				<a href="/conv/jsp/sale/list.jsp">할인상품</a>
			</th>
		</tr>
		
		<tr>
		<td>
	혼밥레시피 : ${dao.mainRecipe() }<br>
	리뷰게시판 : ${dao.mainReview() }<br>
	나눔게시판 : ${dao.mainFree() }<br>
	PB상품 : ${dao.mainPB() }<br>
	할인상품 : ${dao.mainSale() }<br>
	세계의 편의점 : ${dao.mainWorld() }<br>
		
		</td>
		</tr>
		
	</table>

</form>
</body>
</html>