<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/member_findPw.js"></script>
<link rel="stylesheet" href="../resources/css/member_findPw.css">
<script>
	$(function(){
		let authCodePass = false;
		fnIdEmailAuth();
		fnFindPw();
		
	})

</script>

</head>
<body>
	<div class="findPwPage_wrap">
       <div class="findPwPage">
           <h3>비밀번호 찾기</h3>
           <form id="f" action="${contextPath}/member/findPw" method="post">
               <table>
                   <tbody>
                       <tr>
                           <td><label for="memberId">아이디</label></td>
                           <td><input type="text" name="memberId" id="memberId"></td>
                       </tr>
                       <tr>
                           <td><label for="memberEmail">가입한 이메일</label></td>
                           <td>
                               <input type="text" name="memberEmail" id="memberEmail">
                               
                           </td>
                           
                           <td>
                               <input type="button" value="인증번호받기" id="btnGetAuthCode">
                           </td>
                       </tr>
                       <tr>
                           <td colspan="3">
                               <span id="emailMsg"></span>
                           </td>
                       </tr>
                       <tr>
                           <td><label for="authCode">이메일 인증</label></td>
                           <td><input type="text" name="authCode" id="authCode" placeholder="인증코드"></td>
                           <td><input type="button" value="인증하기" id="btnVerifyAuthCode"></td>
                       </tr>
                       
                   </tbody>
               </table>
               <button class="btn_findPwPage">비밀번호 변경으로 이동</button>
           </form>
       </div>
   </div>
			
	
</body>
</html>