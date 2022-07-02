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
<script>

	$(function(){
		fnRentBookList();
		fnoOerdueBookList();
		fnSeatNo();
	})
	
	// 마이페이지 대여 목록
	function fnRentBookList(){
		$.ajax({
			url: '${contextPath}/member/rentBookList',
			type: 'get',
			dataType: 'json',
			success: function(result){
				$('#myPageRentBookList').empty();
				if(result.rentBookList != ''){
					$.each(result.rentBookList, function(i, rentBook){
						$('<tr>')
						.append($('<td>').text(rentBook.bookTitle))
						.append($('<td>').text(rentBook.rentDate))
						.append($('<td>').text(rentBook.rentExpirationDate))
						.appendTo('#myPageRentBookList');
					});
					
				} else {
					$('<tr>')
					.append($('<td colspan="3">대여중인 책이 없습니다.</td>'))
					.appendTo('#myPageRentBookList');
				}			
			}
		})
	}
	
	// 마이페이지 연체 목록
	function fnoOerdueBookList() {
		$.ajax({
			url: '${contextPath}/member/overdueBookList',
			type: 'get',
			dataType: 'json',
			success: function(result){
				$('#myPageOverdueBookList').empty();			
				if(result.overdueBookList != ''){
					$.each(result.overdueBookList, function(i, overdueBook){
						$('<tr>')
						.append($('<td>').text(overdueBook.bookTitle))
						.append($('<td>').text(overdueBook.rentExpirationDate))
						.appendTo('#myPageOverdueBookList');
					});
				} else {
					$('<tr>')
					.append($('<td colspan="2">연체중인 책이 없습니다.</td>'))
					.appendTo('#myPageOverdueBookList');
				}
			}
		})
	}
	
	// 마이페이지 예약한 좌석
	function fnSeatNo(){
		$.ajax({
			url: '${contextPath}/member/reservationSeatNo',
			type: 'get',
			dataType: 'json',
			success: function(result) {
				if(result.seat != null) {
					$('<tr>')
					.append('<td>').text(result.seat.seatNo + '번 좌석이 예약되어 있습니다.')
					.appendTo('#myPageReservationSeatNo');
				} else {
					$('<tr>')
					.append('<td>').text('예약된 좌석이 없습니다.')
					.appendTo('#myPageReservationSeatNo');
				}
			}
			
		})
	}
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<h2>마이페이지</h2>
	
	
	<a href="${contextPath}/member/modifyPage?memberId=${loginMember.memberId}">정보 수정</a>
	<a href="${contextPath}/member/pwModifyConfirm">비밀번호 변경</a>
	<a href="${contextPath}/member/deleteConfirm">회원탈퇴</a>

	<div>
		<table border="1">
			<caption>대여 목록</caption>
			<thead>
				<tr>
					<td>책 제목</td>
					<td>대여일자</td>
					<td>대여만료일자</td>
				</tr>
			</thead>
			<tbody id="myPageRentBookList"></tbody>
		</table>
	</div>
	<br>
	<div>
		<table border="1">
			<caption>연체 목록</caption>
			<thead>
				<tr>
					<td>책 제목</td>
					<td>대여만료일자</td>
				</tr>
			</thead>
			<tbody id="myPageOverdueBookList"></tbody>
		</table>
	</div>
	<br>
	<div>
		<table border="1">
			<caption>예약한 좌석</caption>
			<thead>
				<tr>
					<td>예약좌석 번호</td>
				</tr>
			</thead>
			<tbody id="myPageReservationSeatNo"></tbody>
		</table>
	</div>
</body>
</html>