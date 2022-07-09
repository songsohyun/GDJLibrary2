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
			initMap();
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
	
		// 2. 찾아오시는길
		
		function initMap() {
		
		var map = new naver.maps.Map('map', {
	        center: new naver.maps.LatLng(37.478095, 126.879192),
	        zoom: 17
	    });
		
	    var marker = new naver.maps.Marker({
	        map: map,
	        title: "GDJLibrary",
	        position: new naver.maps.LatLng(37.478095, 126.879192),
	        icon: {
	            content: '<img src="<c:url value="/resources/images/map-pin-g894a2ee8c_1920.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none;position: absolute; width: 25px; height: 40px; left: 0px; top: 0px;">',
	            size: new naver.maps.Size(1, 1),
	            anchor: new naver.maps.Point(16, 32)
	        }
	    });
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
        margin-top: 30px;
        margin-left: 90px;
		background-color: #efefb8;
        display: inline-flex;
	}

	#recomeBook{
		display: inline-flex;
	}
	
	#map{
		width:200px;
		height:200px;
		margin-left:100px;
        background-color: aqua;
	}
	
    #libraryInfo{
        
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
					<li>
					<li>
					<li>
					<li>
					<li>
				</ul>
			</div>
			
			<div class="hidden">
				<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
			</div>
			
			<div class="centerMenu">
				<h3>공지사항</h3>
				<ul>
					<li>
					<li>
					<li>
					<li>
					<li>
				</ul>
			</div>
			
				<div class="hidden">
				<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
			</div>
			
				<div class="centerMenu">
				<h3>공지사항</h3>
				<ul>
					<li>
					<li>
					<li>
					<li>
					<li>
				</ul>
			</div>
			<h3 class="recomText">추천도서</h3>
			<div id="recomeBook"></div>
			</div>
		</div>
	</div>
	
	<div id="divBottomText">
        
		<div id="libraryInfo" style="margin-left: 100px;">
		주소(우)(07988) 서울특별시 금천구 가산동 448 대륭테크노타운 3차 1109호 (가산동,GDJ도서관)&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-phone"></i> 02-2062-3900(TEL) &nbsp;&nbsp;&nbsp;<i class="fa-solid fa-fax"></i> 02-2062-3919(FAX)<br>
		Copyright © 2022 GDJ Library. All Rights Reserved.
		</div>
        <div id="map"></div>
	</div>
</body>
</html>