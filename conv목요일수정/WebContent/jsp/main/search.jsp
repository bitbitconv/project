<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>                                                                                  
<html>                                                                                           
<head>                                                                                           
<title>bitbit콘비니</title>                                                                         
<meta charset='UTF-8'>                                                                           
<meta name='viewport' content='width=device-width, initial-scale=1'>                             
<link rel='stylesheet' href='${pageContext.request.contextPath}/jsp/main/main.css'>              
<link rel='stylesheet' href='https://www.w3schools.com/w3css/4/w3.css'>                          
<link rel='stylesheet'                                                                           
	href='https://www.w3schools.com/lib/w3-theme-blue.css'>                                      
<link rel='stylesheet'                                                                           
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css'>   
	                                                                                             
<script                                                                                          
  src='https://code.jquery.com/jquery-3.2.1.min.js'                                              
  integrity='sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4='                                
  crossorigin='anonymous'></script>                                                              
</head>                                                                                          
<body>                                                                                           
                                                            
<div class='w3-third'>                                                   
<div class='w3-card-2 w3-container' style='min-height: 460px'>           
	<h3>                                                                 
		<a href='/conv/review/list'>리뷰 게시판</a>                           
	</h3>                                                                
	<br>                                                                 
	<div class='w3-responsive w3-card-4'>                                
		<table class='w3-table w3-striped w3-bordered'>                  
			<thead>                                                      
				<tr class='w3-theme'>                                    
					<th>번호</th>                                          
					<th>제목</th>                                          
					<th>작성자</th>                                         
					<th>조회수</th>                                         
					<th>등록일</th>                                         
				</tr>                                                    
			</thead>                                                     
			<tbody>         
			<c:forEach var="review" items="${reviewSearch}">
					<tr class='w3-white'>                                    
						<td><button class='w3-bar-item w3-button' name='no'  
								value='${review.no}'>${review.no}</button></td>        
						<td>${review.title}</td>                                  
						<td>${review.writer}</td>                                 
						<td>${review.hit}</td>                                    
						<td>${review.regDate}</td>                                
					</tr>                                                    
			</c:forEach>                                           
			</tbody>                                                     
			</table>                                                         
		</div>                                                               
	</div>                                                                   
</div>                                                                      

	<div class='w3-third'>                                                   
	<div class='w3-card-2 w3-container' style='min-height: 460px'>           
		<h3>                                                                 
			<a href='/conv/free/list'>나눔 게시판</a>                           
		</h3>                                                                
		<br>                                                                 
		<div class='w3-responsive w3-card-4'>                                
			<table class='w3-table w3-striped w3-bordered'>                  
				<thead>                                                      
					<tr class='w3-theme'>                                    
						<th>번호</th>                                          
						<th>제목</th>                                          
						<th>작성자</th>                                         
						<th>등록일</th>                                         
					</tr>                                                    
				</thead>                                                     
				<tbody>                                                      
			<c:forEach var="free" items="${freeSearch}">
					<tr class='w3-white'>                                    
						<td><button class='w3-bar-item w3-button' name='no'  
								value='${free.no}'>${free.no}</button></td>        
						<td>${free.title}</td>                                  
						<td>${free.writer}</td>                                 
						<td>${free.regDate}</td>                                
					</tr>                                                    
			</c:forEach>                                                  
				</tbody>                                                     
			</table>                                                         
		</div>                                                               
	</div>                                                                   
</div>                                                                      

	
	<div class='w3-third'>                                                   
	<div class='w3-card-2 w3-container' style='min-height: 460px'>           
		<h3>                                                                 
			<a href='/conv/com/conv/recipe/controller/recipelistcontroller'>혼밥 레시피</a>
		</h3>                                                                
		<br>                                                                 
		<div class='w3-responsive w3-card-4'>                                
			<table class='w3-table w3-striped w3-bordered'>                  
				<thead>                                                      
					<tr class='w3-theme'>                                    
						<th>번호</th>                                          
						<th>제목</th>                                          
					</tr>                                                    
				</thead>                                                     
				<tbody>                                                      
			<c:forEach var="recipe" items="${recipeSearch}">
					<tr class='w3-white'>                                    
						<td><button class='w3-bar-item w3-button' name='no'  
								value='${recipe.no}'>${recipe.no}</button></td>        
						<td>${recipe.title}</td>                                  
					</tr>                                                    
			</c:forEach>                                                  
				</tbody>                                                     
			</table>                                                         
		</div>                                                               
	</div>                                                                   
</div>                                                                      
	
	<div class='w3-third'>                                                   
	<div class='w3-card-2 w3-container' style='min-height: 460px'>           
		<h3>                                                                 
			<a href='/conv/com/conv/recipe/controller/recipelistcontroller'>세계의 편의점</a>
		</h3>                                                                
		<br>                                                                 
		<div class='w3-responsive w3-card-4'>                                
			<table class='w3-table w3-striped w3-bordered'>                  
				<thead>                                                      
					<tr class='w3-theme'>                                    
						<th>번호</th>                                          
						<th>제목</th>                                          
					</tr>                                                    
				</thead>                                                     
				<tbody>                                                      
			<c:forEach var="world" items="${worldSearch}">
					<tr class='w3-white'>                                    
						<td><button class='w3-bar-item w3-button' name='no'  
								value='${world.no}'>${world.no}</button></td>        
						<td>${world.title}</td>                                  
					</tr>                                                    
			</c:forEach>                            
				</tbody>                                                     
			</table>                                                         
		</div>                                                               
	</div>                                                                   
</div>                                 
</body>
</html>