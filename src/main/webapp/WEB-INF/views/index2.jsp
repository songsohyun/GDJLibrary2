<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="./resources/js/jquery-3.6.0.js"></script>
<script>
		// 페이지로드
		$(function(){
			fnRecomBook();
		})
		
		// 1. 추천책
		function fnRecomBook(){
		$.ajax({
			url: '${contextPath}/book/recomBook',
			type: 'get',
			dataType : 'json',
			success: function(obj){
				$.each(obj.recom, function(i, recom){
					var sp = '<span>';
					sp += '<ul class="recom1"><a href="${contextPath}/book/detail?bookNo=' + recom.bookNo + '"><img src="' + recom.bookImage + '" width=130px height=170px></a></ul>';
					sp += '<ul>' + recom.bookTitle + '</ul>';
					sp += '</span>'
					$('#recomeBook').append(sp);
				})
			}
			
		})
		
	}
		
		
</script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
   
   * {
      font-family: 'Noto Sans KR', sans-serif;
   }

	body {
		background-color: #fbfbf2;
	}
	
	#divImg {
		background: url("https://cdn.pixabay.com/photo/2016/03/26/22/21/books-1281581_1280.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		height: 100vh;
		margin-left: 100px;
		margin-right: 100px;
	}
	
	#divInnerImg {
		background-color: rgba( 255, 255, 255, 0.4 );
	}
	
	
	#divTop {
		background-color: 
	}
	
	#divButton {
		text-align: right;
	}
	
	#divBottomMenu {
		background-color: beige;
		text-align: center;
	}
	
	.divBottomMenu {
		display: inline-block;
		font-size: 20px;
		font-weight: 900;
		margin: 20px;
		text-decoration: none;
		color: 3d3b3b;
		padding-left: 20px;
		padding-right: 20px;
		
	}
	
	.divBottomMenu a{
		color: #4a4848;
		text-decoration: none;
	}
	
	.divBottomMenu a:hover {
		color: black;
		font-size: 21px;
	}
	
	.centerMenu {
		display: inline-block;
				font-size: 20px;
		font-weight: 600;
	
		
	}
	.hidden {
		display: none;
		display: inline-block;
		color: white;
	}
	#divBottomText {
		background-color: #efefb8;
	}

	#recomeBook{
		display: inline-flex;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="./layout/header.jsp"></jsp:include><br><br><br>
	<div id="divTop">

	
	
	</div>
	

	<div id="divImg">
		<div id="divInnerImg">
			<div style="text-align: center">
				<h1>GDJ도서관에 오신걸 환영합니다.</h1>
			
			<div class="centerMenu">
				<h3>공지사항</h3>
				<ul>
					<li>야야야야
					<li>야야야야
					<li>야야야야
					<li>야야야야
					<li>야야야야
				</ul>
			</div>
			
			<div class="hidden">
				<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
			</div>
			
			<div class="centerMenu">
				<h3>공지사항</h3>
				<ul>
					<li>야야야야
					<li>야야야야
					<li>야야야야
					<li>야야야야
					<li>야야야야
				</ul>
			</div>
			
				<div class="hidden">
				<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
			</div>
			
				<div class="centerMenu">
				<h3>공지사항</h3>
				<ul>
					<li>야야야야
					<li>야야야야
					<li>야야야야
					<li>야야야야
					<li>야야야야
				</ul>
			</div>
			<h3 class="recomText">추천도서</h3>
			<div id="recomeBook"></div>
			</div>
		</div>
	</div>
	<div id="divBottomMenu">
		<div class="divBottomMenu"><a href="${contextPath}/rent/rentBook?bookNo=1">대여하기</a></div>
		<div class="divBottomMenu"><a href="${contextPath}/returned/returnedBookPage">반납하기</a></div>
		<div class="divBottomMenu"><a href="${contextPath}/notice/noticePage">공지사항</a></div>
		<div class="divBottomMenu"><a href="${contextPath}/qaa/qaaPage">질문과답변</a></div>
		<div class="divBottomMenu"><a href="${contextPath}/member/map">찾아오시는 길</a></div>
		<c:if test="${loginMember.memberId eq \"admin\"}">
			<div class="divBottomMenu"><a href="${contextPath}/admin/manageMain">관리자페이지</a></div>
		</c:if>
	</div>
	<div id="divBottomText">
		<div style="margin-left: 100px;">
		주소(우)(07988) 서울 양천구 목동서로 113 (목동, 양천도서관)&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-phone"></i> 02-2062-3900(TEL) &nbsp;&nbsp;&nbsp;<i class="fa-solid fa-fax"></i> 02-2062-3919(FAX)<br>
		Copyright © 2019 Yangcheon Public Library. All Rights Reserved.
		</div>
	</div>
</body>
</html>