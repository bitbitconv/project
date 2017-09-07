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
<body>
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        <form method="post" name= "userInfo" action="/conv/jsp/member/signin2" >
            <table class="w3-center">
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input disabled="disabled" type="text" name="id" maxlength="50" value="${userId}">${idDup}
                        <%--
                        <input type="button" value="중복확인" onclick="openDubCheck()">    
                        <input type="hidden" name="idDuplication" value="idUncheck" >
                         --%>
                         
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="pass" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 재입력</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td id="title">비밀번호 힌트</td>
                    <td>
                        <input type="password" name="passhint" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="emailAddr" maxlength="50">
                        <%--
                        @
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>     
                        </select>
                         --%>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입" />  
            <input type="button" value="취소" onclick="goFirstForm()" />
        </form>
</body>
</html>