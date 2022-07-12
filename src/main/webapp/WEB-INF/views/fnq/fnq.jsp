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
<script src="../resources/js/fnq_fnq.js"></script>
<link rel="stylesheet" href="../resources/css/fnq_fnq.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>

	$(function(){
	
		fnPagingLink();
		fnList();
		fnPrintFnqList();
		fnToggleHidden();
		fnWrite();
		fnSearch();
		fnEnterSearch();
	});
	
</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>

	<div id="fnq_wrap">
		<div class="top_title_wrap">
			<h2>자주하는질문</h2>
			<c:if test="${loginMember.memberId eq 'admin'}">
				<input type="button" value="글쓰기" id="btnWrite" class="btn_style btn_write">			
			</c:if>
		</div>
		
		<div class="content_top_wrap" id="fnqList"></div>
		<div class="content_bottom_wrap" id="paging"></div>
		<div id="fnq_search">

			<select name="column" id="column" class="search_column">
				<option value="FNQ_TITLE">제목</option>
				<option value="FNQ_CONTENT">내용</option>
			</select>			
			<input type="text" name="query" id="query" class="search_query" size="30" placeholder="검색어를 입력해주세요">&nbsp;&nbsp;
			<input type="button" id="btnSearch">
			<label for="btnSearch" class="icon_wrap"><i class="fa-solid fa-magnifying-glass" style="color: white"></i></label>
		</div>
	</div>

</body>
</html>