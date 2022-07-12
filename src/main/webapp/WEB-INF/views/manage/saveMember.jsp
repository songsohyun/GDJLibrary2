<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/saveMember.css">
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/saveMember.js"></script>

</head>
<body>
	 <div class="register">
        <h3>회원추가</h3>
        <form id="f" action="/admin/saveMember?value=${value}" method="post">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        아이디
                    </li>
                    <li class="item">
                        <input type="text" name="id" id="id" placeholder="아이디를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                   
                    <li class="item center">
                        비밀번호
                    </li>
                    <li class="item">
                        <span id="idMsg"></span>
                        <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요.">
                    </li>
                  	<li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                
                    <li class="item center">
                        
                        비밀번호 확인
                    </li>
                    <li class="item">
                        <span id="pwMsg"></span>
                        <input type="password" id="pwConfirm" name="pwConfirm" placeholder="비밀번호를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    
                    <li class="item center">
                         이름
                    </li>
                    <li class="item">
                        <span id="pwConfirmMsg"></span>
                        <input type="text" name="name" id="name" placeholder="이름을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        전화번호
                    </li>
                    <li class="item">
                       <input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요.">
                    </li>
                     <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    
                    <li class="item center">
                        이메일
                    </li>
                    <li class="item">
                        <span id="phoneMsg"></span>
                        <input type="text" name="email" id="email" placeholder="이메일을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        우편번호
                    </li>
                    <li class="item">
                        <span id="emailMsg"></span>
                        <input type="text" name="postcode" id="postcode" placeholder="우편번호를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                 <ul class="container">
                    <li class="item center">
                        도로명 주소
                    </li>
                    <li class="item">
                        <span id="emailMsg"></span>
                        <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명 주소를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                 <ul class="container">
                    <li class="item center">
                        상세주소
                    </li>
                    <li class="item">
                        <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit">추가하기</button>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                       	<br>
                        <input type="button" class="submit" value="회원 목록 페이지 이동" id="btnList">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>
  
</body>
</html>