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
<script src="../resources/js/member_findId.js"></script>
<link rel="stylesheet" href="../resources/css/member_findId.css">
<script>
	$(function(){
		fnFindId();
		fnFindIdEmailCheck();
	})
	
	
</script>
<style>
	
</style>
</head>
<body>
	<div class="findId_wrap">
        <div class="findId">
            <h3>아이디 찾기</h3>
            <table>
                <tbody>
                    <tr>
                        <td><label for="memberName">이름</label></td>
                        <td><input type="text" name="memberName" id="memberName"></td>
                    </tr>
                    <tr>
                        <td><label for="memberEmail">가입한 이메일</label></td>
                        <td>
                            <input type="text" name="memberEmail" id="memberEmail">
                            
                        </td>
                        <td>
                            <input type="button" id="btnFindId" value="아이디찾기">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"><span id="emailMsg"></span></td>
                    </tr>
                </tbody>
            </table>
            
        </div>
        <div>
            <span id="findIdMsg"></span>
        </div>
        <div class="bottom_button_box">
            <a href="${contextPath}/member/loginPage">로그인</a>
           
            <a href="${contextPath}/member/findPwPage">비밀번호 찾기</a>
            
            <a href="${contextPath}/member/agreePage">회원가입</a>
        </div>
    </div>
	
</body>
</html>