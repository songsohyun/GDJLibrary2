<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=r9az651hqi"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="./resources/js/jquery-3.6.0.js"></script>
<script src="./resources/js/index.js"></script>
<link rel="stylesheet" href="./resources/css/index.css">
<script>
		// 페이지로드
		$(function(){
			fnRecomBook();
			initMap();
		})
		
		
</script>

</head>
<body>
	<jsp:include page="./layout/header.jsp"></jsp:include><br><br><br>
	<div id="divTop">

	
	
	</div>
	

	<div id="divImg">
		<div id="divInnerImg">
			<div style="text-align: center">
				<h1>GDJ도서관에 오신걸 환영합니다.</h1>
			
		<form id="f" action="${contextPath}/book/search">
			<div class="endSearch">
				자료검색 &nbsp; 
				<select name="column" id="column">
					<option value="">:::선택:::</option>
					<option value="BOOK_TITLE">:::제목:::</option>
					<option value="BOOK_AUTHOR">:::저자:::</option>
					<option value="BOOK_TYPE">:::분야:::</option>
				</select>
				<input type="text" id="query" name="query" onkeypress="if(event.keyCode == 13){enterKey()}" placeholder="검색어를 입력하세요"/>
				<input type="text" style="display: none;" />
				<!-- <input type="button" id="btnSearch" value="검색" /> -->
				<button>검색</button>
				<input type="button" id="btnSearchAll" value="전체조회" onclick="location.href='${contextPath}/book/listPage'"></input>
			</div>
		</form>
	
			
			<h3 class="recomText">추천도서</h3>
			<div id="recomeBook"></div>
			</div>
		</div>
	</div>
	
	<div id="divBottomText">
        <c:if test="${loginMember.memberId eq \"admin\"}">
			<div class="divBottomMenu"><a href="${contextPath}/admin/manageMain">관리자페이지</a></div>
		</c:if>
		<div id="libraryInfo" style="margin-left: 100px;">
		주소(우)(07988) 서울특별시 금천구 가산동 448 대륭테크노타운 3차 1109호 (가산동,GDJ도서관)<br>
		<i class="fa-solid fa-phone"></i> 02-2062-3900(TEL) &nbsp;&nbsp;&nbsp;<i class="fa-solid fa-fax"></i> 02-2062-3919(FAX)<br>
		Copyright © 2022 GDJ Library. All Rights Reserved.
		</div>
        <div id="map"></div>
	</div>
</body>
</html>