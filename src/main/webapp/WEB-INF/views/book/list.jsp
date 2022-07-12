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
<script src="../resources/js/book_list.js"></script>
<link rel="stylesheet" href="../resources/css/book_list.css">

<script>
			// 페이지로드 이벤트
			$(function(){
				fnList();
				fnPagingLink();
				fnSearch();
			})
	
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>
		<div id="insertApi">
		<a href="${contextPath}/book/insertBook">책추가하기</a>
		</div>
		<div class="all">
		
		<form id="f">
			<div class="firstSearch">
				자료검색 &nbsp; 
				<select name="column" id="column">
					<option value="">:::선택:::</option>
					<option value="BOOK_TITLE">:::제목:::</option>
					<option value="BOOK_AUTHOR">:::저자:::</option>
					<option value="BOOK_TYPE">:::분야:::</option>
				</select>
				<input type="text" id="query" name="query" onkeypress="if(event.keyCode == 13){enterKey()}" placeholder="검색어를 입력하세요"/>
				<input type="text" style="display: none;" />
				<input type="button" id="btnSearch" value="검색" />
				<input type="button" id="btnSearchAll" value="전체조회" onclick="location.href='${contextPath}/book/listPage'"></input>
			</div>
		</form>
		
		<table class="listTable" >
		
		<thead class="listTable head">
			<tr>
				<td>순서</td>
				<td>도서이미지</td>
				<td>책제목</td>
				<td>저자</td>
				<td>분야</td>
			</tr>
		</thead>
		<tbody id="bookInfo" class="listTable body">
			
		</tbody>
		<tfoot class="listTable foot">
			<tr>
				<td colspan="5">
					<div id="paging"></div>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<form id="f">
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
				<input type="button" id="btnSearch" value="검색" />
				<input type="button" id="btnSearchAll" value="전체조회" onclick="location.href='${contextPath}/book/listPage'"></input>
			</div>
		</form>
	
	</div>

	

</body>
</html>