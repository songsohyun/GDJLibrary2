<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/detailBook.js"></script>

<link rel="stylesheet" href="../resources/css/detailBook.css">
</head>
<body>
	
	<div id="wrap">
	    <div id="container">
	        <div class="inner">    
	            <h2>책 상세 보기</h2>
	            <form>        
	                <table width="100%" class="table01">
	                    <thead>
	                    	<tr class="a">
	                    		<td width="70px" class="a">이미지</td><td width="400px"><img alt="" src="${book.bookImage}" width="50px"></td>
	                    	</tr>
	                    	<tr class="a">
	                    		<td>책번호</td><td colspan="12">${book.bookNo}</td>
	                    	</tr>
	                    	<tr class="a">
	                    		<td>ISBN</td><td colspan="12">${book.bookIsbn}</td>
	                    	</tr>
	                    	<tr class="a">
	                    		<td>제목</td><td colspan="12">${book.bookTitle}</td>
	                    	</tr>
	                    	<tr class="a">
	                    		<td>작가</td><td colspan="12">${book.bookAuthor}</td>
	                    	</tr>
	                    	<tr class="a">
	                    		<td>출판사</td><td colspan="12">${book.bookPublisher}</td>
	                    	</tr>
	                    	<tr class="a">
	                    		<td>출판날짜</td><td colspan="16">${book.bookPubdateTime}</td>
	                    	</tr>
	                    	<tr>
	                    		<td class="a">설명</td><td colspan="16">${book.bookDescription}</td>
	                    	</tr>
	                    	
	                    	<tr class="a">
	                    		<td>분야</td><td colspan="12">${book.bookType}</td>
	                    	</tr>
	                  
	                    	
	                    </thead>
	                   
	                </table>        
	              
	            </form>
	            <div class="btn_right mt15">
		            <form id="f" action="/admin/saveDormantToMember?memberNo=${member.memberNo}" method="post">
						<input type="hidden" value="${member.memberNo}" name="memberNo">
						<input type="button" value="수정페이지" id="btnChangePage">
						<input type="button" value="책 목록" id="btnList">
			        </form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<h1>책 상세 보기</h1>
	
	번호 ${book.bookNo}<br>
	ISBN ${book.bookIsbn}<br>
	제목 ${book.bookTitle}<br>
	작가 ${book.bookAuthor}<br>
	출판사 ${book.bookPublisher}<br>
	출판날짜 ${book.bookPubdateTime}<br>
	설명 ${book.bookDescription}<br>
	이미지주소 ${book.bookImage}<br>
	분야 ${book.bookType}<br>
	
	<input type="button" value="수정페이지" id="btnChangePage">
	<input type="button" value="목록" id="btnList">
</body>
</html>