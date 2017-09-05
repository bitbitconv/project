<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String id = (String)request.getAttribute("id");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원가입 화면</title>
 <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
   </style>

    <script type="text/javascript">
    
            <%--
        // 다 입력 했는지 확인하기
        function checkValue()
        {
            var form = document.userInfo;
        
            if(!form.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            if(form.idDuplication.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
            if(!form.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(form.password.value != form.passwordcheck.value ){
                alert("재입력한 비밀번호와 다릅니다.");
                return false;
            }    
            if(!form.passhint.value){
                alert("비밀번호를 재입력하세요.");
                return false;
            }
            if(!form.mail1.value){
                alert("메일 주소를 입력하세요.");
                return false;
            }
        }
        //중복체크
        function openDubCheck(){
        	window.name = "parentForm";
        	window.open("/conv/jsp/member/iddubcheck.jsp", "idCheck", "width=500, height=300, scrollbars=no")
        	
        }
        
        }
        
            --%>
        
        // 취소 버튼 클릭시 메인으로 이동
        function goFirstForm() {
            location.href="/conv/jsp/main/main.jsp";
        }    
        
   </script>
    
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<body>
<header class="w3-container w3-theme w3-padding" id="myHeader">
  
  <div class="w3-center">
  <h1 class="w3-xxxlarge w3-animate-bottom">회원가입</h1>
  </div>
  
</header>
	<form method="post" action="/conv/member/login" method="post">
	<div align="center" class="w3-display-middle">

        
        <form method="post" name= "userInfo" action="/conv/jsp/member/signin" >
            <table class="w3-center">
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="50" value="${userId}">${idDup}
                        <%--
                        <input type="button" value="중복확인" onclick="openDubCheck()">    
                        <input type="hidden" name="idDuplication" value="idUncheck" >
                         --%>
                    </td>
                </tr>
                        
            </table>
            <br>
            <input type="submit" value="중복체크"/>  
            <input type="button" value="취소" onclick="goFirstForm()" />
        </form>
</body>
</html>