<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/changeMember.js"></script>

<link rel="stylesheet" href="../resources/css/changeMember.css">
</head>
<body>
	
	<div class="register">
        <h3>회원수정</h3>
        <form id="f" action="/admin/changeMember?value=${value}" method="post">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        회원번호
                    </li>
                    <li class="item">
                        ${member.memberNo}
                    </li>
                    <li class="item">
                        <input type="hidden" name="memberNo" value="${member.memberNo}">
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        아이디
                    </li>
                    <li class="item">
                        ${member.memberId}
                    </li>
                    <li class="item">
                        <input type="hidden" name="id" value="${member.memberId}">
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
                        <input type="text" name="name" id="name" value="${member.memberName}" placeholder="이름을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        전화번호
                    </li>
                    <li class="item">
                       <input type="text" name="phone" id="phone" value="${member.memberPhone}" placeholder="전화번호를 입력하세요.">
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
                        <input type="text" name="postcode" id="postcode" value="${member.memberPostcode}" placeholder="우편번호를 입력하세요.">
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
                        <input type="text" name="roadAddress" id="roadAddress" value="${member.memberRoadAddress}" placeholder="도로명 주소를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                 <ul class="container">
                    <li class="item center">
                        상세주소
                    </li>
                    <li class="item">
                        <input type="text" name="detailAddress" id="detailAddress" value="${member.memberDetailAddress}" placeholder="상세주소를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit">수정하기</button>
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