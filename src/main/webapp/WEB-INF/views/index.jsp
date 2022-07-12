<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
</head>
<body>

	<jsp:include page="./layout/header.jsp"></jsp:include><br><br><br>
	
	
	<!-- 김정민 -->
	<a href="${contextPath}/book/listPage">도서관리</a><br>
	
	<!-- 이형식 -->
	<a href="${contextPath}/seat/seatAgreePage">열람실이용</a>
	
	<!-- 강병수 -->
	<a href="${contextPath}/admin/manageMain">관리자페이지</a>
	

	<!-- 송소현 -->
	<a href="${contextPath}/rent/rentBook?bookNo=1">대여하기 기능</a>
	<a href="${contextPath}/returned/returnedBookPage">반납페이지로 이동하기</a>
	<a href="${contextPath}/fnq/fnqPage">자주하는질문 게시판으로 이동하기</a>
	<a href="${contextPath}/qaa/qaaPage">질문과 답변 게시판으로 이동하기</a>
	<a href="${contextPath}/notice/noticePage">공지사항 게시판으로 이동하기</a>
	
	<!-- 배성연 -->
	<a href="${contextPath}/member/map">찾아오시는 길</a>

</body>
</html>