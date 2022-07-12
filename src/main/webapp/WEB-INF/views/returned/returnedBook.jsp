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
<script src="../resources/js/returned_returnedBook.js"></script>
<link rel="stylesheet" href="../resources/css/returned_returnedBook.css" />
<script>

	// 페이지 로드 
	$(function(){
		
		// 대여중인 책 
		fnRentBookList();	
		fnReturnedRentBook();
		fnCheckAllRent();
		fnCheckOneRent();
		
		// 연체중인 책
		fnOverdueBookList();	
		fnReturnedOverdueBook();
		fnCheckAllOverdue();
		fnCheckOneOverdue();
		
	});
	

</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>
	
	<div class="bookList_wrap">
		<form id="f1">
			<table>
				<caption class="title_wrap">대여중인 책 목록</caption>
				<thead>
					<tr>
						<td><input type="checkbox" id="checkAllRent"></td>
						<td>책</td>
						<td>제목</td>
						<td>대여일자</td>
						<td>대여만료일자</td>
					</tr>
				</thead>
				<tbody id="rentBookList"></tbody>
			</table><br>
			<div id="btnReturnedRent"></div>
		</form>
		
		
		<form id="f2">
			<table>
				<caption class="title_wrap">연체중인 책 목록</caption>
				<thead>
					<tr>
						<td><input type="checkbox" id="checkAllOverdue"></td>
						<td>책</td>
						<td>제목</td>
						<td>기존 대여만료일자</td>
					</tr>
				</thead>
				<tbody id="overdueBookList"></tbody>
			</table><br>
			<div id="btnReturnedOverdue"></div>
		</form>
	</div>
	
	
	
</body>
</html>