<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/saveFaq.css">
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/saveFaq.js"></script>


</head>
<body>
	
	<div class="register">
        <h3>FAQ 게시글 추가</h3>
        <form id="f" action="/admin/saveFaq" method="post">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        제목
                    </li>
                    <li class="item">
                        <input type="text" name="title" id="title" placeholder="제목을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                   
                    <li class="item center">
                        내용
                    </li>
                    <li class="item">
                        <textarea rows="20" cols="50" name="content" id="content"></textarea>
                    </li>
                  	<li class="item">
                        
                    </li>
                </ul>
                
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit">작성완료</button>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                       	<br>
                        <input type="button" class="submit" value="관리자 메인 페이지 이동" id="btnList">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>
	
	
</body>
</html>