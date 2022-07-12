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
<script src="../resources/js/member_myPage.js"></script>
<link rel="stylesheet" href="../resources/css/member_myPage.css">
<script>

	$(function(){
		fnRentBookList();
		fnoOerdueBookList();
		fnSeatNo();
	})
	
</script>

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<h2>마이페이지</h2>
	
	<div class="myPage_wrap">
        <h3>MY PAGE</h3>
        <div class="myPageTop">
            <a href="${contextPath}/member/modifyConfirm">회원정보 수정</a>
            <a href="${contextPath}/member/pwModifyConfirm">비밀번호 변경</a>
        </div>
	

        <div class="myPageList">
            <table>
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
        
        <div class="myPageList">
            <table>
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
        <input class="btnReturn" type="button" value="반납하기" onclick="location.href='${contextPath}/returned/returnedBookPage'">
        <div class="myPageList">
            <table>
                <caption>예약한 좌석</caption>
                <thead>
                    <tr>
                        <td>예약좌석 번호</td>
                        <td>좌석코드</td>
                    </tr>
                </thead>
                <tbody id="myPageReservationSeatNo"></tbody>
            </table>
        </div>

    </div>
</body>
</html>