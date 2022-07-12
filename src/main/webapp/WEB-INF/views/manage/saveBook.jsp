<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/saveBook.css">
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/saveBook.js"></script>

</head>
<body>

	
	<div class="register">
        <h3>책추가</h3>
        <form id="f" action="/admin/saveBook?value=${value}" method="post">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        ISBN
                    </li>
                    <li class="item">
                        <input type="text" name="isbn" id="isbn" placeholder="ISBN을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                   
                    <li class="item center">
                        제목
                    </li>
                    <li class="item">
                        <span id="isbnMsg"></span>
                        <input type="text" name="title" id="title" placeholder="제목을 입력하세요.">
                    </li>
                  	<li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                
                    <li class="item center">
                    	 작가  
                    </li>
                    <li class="item">
                        <input type="text" id="author" name="author" placeholder="작가를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    
                    <li class="item center">
                         출판사
                    </li>
                    <li class="item">
                        <span id="pwConfirmMsg"></span>
                        <input type="text" name="publisher" id="publisher" placeholder="출판사를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        출판날짜
                    </li>
                    <li class="item">
                       <input type="text" name="pubdate" id="pubdate" placeholder="출판날짜를 입력하세요.">
                    </li>
                     <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    
                    <li class="item center">
                        내용
                    </li>
                    <li class="item">
                        <textarea rows="16" cols="54" name="description" id="description" placeholder="내용을 입력하세요."></textarea>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        이미지 주소
                    </li>
                    <li class="item">
                        <span id="emailMsg"></span>
                        <input type="text" name="image" id="image" placeholder="이미지 주소를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                 <ul class="container">
                    <li class="item center">
                        분야
                    </li>
                    <li class="item">
                        <span id="emailMsg"></span>
                        <input type="text" name="field" id="field" placeholder="분야를 입력하세요.">
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
                        <input type="button" class="submit" value="도서 목록 페이지 이동" id="btnList">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>
  
	
	
</body>
</html>