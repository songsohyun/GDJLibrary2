<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
<script src="../resources/js/member_login.js"></script>
<link rel="stylesheet" href="../resources/css/member_login.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- jquery cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js" integrity="sha512-aUhL2xOCrpLEuGD5f6tgHbLYEXRpYZ8G5yD+WlFrXrPy2IrWBlu6bih5C9H6qGsgqnU6mgx6KtU8TreHpASprw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  
<script>
	$(function(){
		fnLogin();
		fnRememberId();
		
	})


</script>

</head>
<body>
	
	<div class="join_cont">
        <form id='f' action="${contextPath}/member/login" method="post" >
            <a href="${contextPath}/"><h2 class="tit_bi">로고사진넣기</h2></a>
            <input type="hidden" name="url" value="${url}">
            <label for="memberid" class="login_ipt_box">
                
                <input type="text" id="memberId" name="memberId" placeholder="아이디">
            </label>
            <label for="memberPw" class="login_ipt_box">
                
                <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호">
            </label>
    
            <button class="btn_login">로그인</button>
            <div class="chk_choice">
                <label for="rememberId" class="uio_check_box">
                    <input type="checkbox" id="rememberId" >
                    
                    로그인 상태 유지
                </label>
    
                <label for="keepLogin" class="uio_check_box">
                    <input type="checkbox" name="keepLogin" value="keep" id="keepLogin">
                    
                    자동로그인
                </label>
            </div>
            <div class="social_line">
                <span>간편하게 시작하기</span>
            </div>
            <div class="btn_sns_login">
                <ul>
                    <li><a href="${apiURL}" class="ico_naver"><img src="../resources/images/btnW_아이콘원형.png"/></a></li>
                </ul>
            </div>
            <div class="bottom_button_box">
                <a href="${contextPath}/member/findIdPage">아이디 찾기</a>
               
                <a href="${contextPath}/member/findPwPage">비밀번호 찾기</a>
                
                <a href="${contextPath}/member/agreePage">회원가입</a>
            </div>
        </form>
    </div>


	

</body>

</html>
