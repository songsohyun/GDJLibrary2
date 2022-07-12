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
<script src="../resources/js/manageBook.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../resources/css/manageBook.css">	
</head>
<body>
	
	
	
	<div class="form-group">
    <select id="pageUnit" name="pageUnit">
        <option value="">:::선택:::</option>
        <option value="10">10권씩 보기</option>
        <option value="20">20권씩 보기</option>
        <option value="30">30권씩 보기</option>
        <option value="40">40권씩 보기</option>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;
    페이지별검색수: ${value}        
	&nbsp;&nbsp;
	책수: ${totalRecord}권
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="전체 책 조회" id="btnSearchAll">&nbsp;&nbsp;&nbsp;<input type="button" value="책 추가하기" id="btnInsert">&nbsp;&nbsp;&nbsp;<input type="button" value="네이버API 책 추가하기" id="btnInsertNaver">&nbsp;&nbsp;&nbsp;<input type="button" value="관리자 메인 페이지" id="btnManageMain">
	</div>
	
	<br>	
				
	<form id="f" action="/admin/removeCheckBook?value=${value}" method="post">
		<table border="1" class="table">
			<thead>
				<tr>
					<th width="1%" height="50%"><input type="checkbox" name="checkAll" class="blind checkAll" id="checkAll"></th>
					<th width="5%">번호</th>
					<th width="5%">이미지</th>
					<th width="10%">ISBN</th>
					<th width="17%">제목</th>
					<th width="17%">작가</th>
					<th width="10%">출판사</th>
					<th width="5%">출판날짜</th>
					<th width="6%">책삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book" varStatus="vs">
					
					<tr>
						<td><input type="checkbox" name="check" class="blind checkOne" value="${book.bookNo}"></td>
						<td>${beginNo - vs.index}</td>
						<td><img alt="" src="${book.bookImage}" width="50px"></td>
						<td><a href="/admin/detailBook?bookNo=${book.bookNo}&value=${value}">${book.bookIsbn}</a></td>
						<td>${book.bookTitle}</td>
						<td>${book.bookAuthor}</td>
						<td>${book.bookPublisher}</td>
						<td>${book.bookPubdateTime}</td>					
						<td><a href="/admin/removeBook?bookNo=${book.bookNo}&value=${value}" onclick="return confirm('정말 삭제하시겠습니까?')"><i class="fa-solid fa-circle-xmark"></i></a></td>					
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="tfoot">
					<td colspan="9" id="tfoot">
						<span style="text-decoration:none">${paging}</span>
					</td>
				</tr>
			</tfoot>
		</table>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="return confirm('정말 삭제하시겠습니까?')">책 선택 삭제</button>
	</form>
	
	<div id="search">
		<div id="search_inner">
			<form id="searchForm" method="get">
				<span id="selectSection">
					<select name="column" id="column">
						<option value="">:::선택:::</option>
						<option value="BOOK_ISBN">고유번호</option>
						<option value="BOOK_TITLE">제목</option>
						<option value="BOOK_AUTHOR">작가</option>
						<option value="BOOK_PUBLISHER">출판사</option>
					</select>
				</span>
				<span id="equalArea">
					<input type="text" name="query" id="query" list="autoComplete">
					<datalist id="autoComplete"></datalist>
				</span>
				<span id="rangeArea">
					<input type="text" name="begin" id="begin">
					~
					<input type="text" name="end" id="end">
				</span>
				<span id="btnSearchSection">
					<input type="button" value="검색" id="btnSearch">
				</span>
			</form>
		</div>
	</div>
</body>
</html>