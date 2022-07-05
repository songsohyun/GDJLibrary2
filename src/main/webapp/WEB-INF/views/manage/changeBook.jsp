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
<script type="text/javascript">
	
	// 페이지 로드 이벤트
	$(function(){
		fnBookChange();
		fnList();
	})


	
	// 함수
	
	// 수정완료
	function fnBookChange(){
		$('#f').on('submit', function(event){
			
			if($('#title').val() == '${book.bookTitle}' && $('#author').val() == '${book.bookAuthor}' && $('#publisher').val() == '${book.bookPublisher}' && $('#pubdate').val() == '${book.bookPubdate}' && $('#description').val() == '${book.bookDescription}' && $('#image').val() == '${book.bookImage}' && $('#field').val() == '${book.bookField}'){
				alert('변경된 내용이 없습니다.');
				event.preventDefault();
				return false;
			} else if($('#title').val() == '' || $('#author').val() == '' || $('#publisher').val() == '' || $('#pubdate').val() == '' || $('#description').val() == '' || $('#image').val() == '' || $('#field').val() == ''){
				alert('내용을 모두 입력해주세요.');
				event.preventDefault();
				return false;
			} else if(isbnPass == false){
				alert('형식에 맞지 않는 ISBN입니다.');
				event.preventDefault();
				return false;
			} else if(isbnOverlapPass == false){
				alert('이미 등록된 ISBN입니다.');
				event.preventDefault();
				return false;
			}
			return true;
		})
	}
	
	
	
	// 목록
	function fnList(){
		$('#btnList').on('click', function(){
			location.href='${contextPath}/admin/listMember?value=${value}';
		})
	}
</script>
</head>
<body>
	<h1>책 수정 화면</h1>
	
	<form id="f" action="${contextPath}/admin/changeBook?value=${value}" method="post">
	
		책번호 ${book.bookNo}<br>
		ISBN ${book.bookIsbn}<br>
		<input type="hidden" name="bookNo" value="${book.bookNo}">
		<input type="hidden" name="isbn" value="${book.bookIsbn}">
		제목 <input type="text" name="title" id="title" value="${book.bookTitle}"><br>
		작가 <input type="text" name="author" id="author" value="${book.bookAuthor}"><br>
		출판사 <input type="text" name="publisher" id="publisher" value="${book.bookPublisher}"><br>
		출판날짜 <input type="text" name="pubdate" id="pubdate" value="${book.bookPubdate}"><br>
		설명 <input type="text" name="description" id="description" value="${book.bookDescription}"><br>
		이미지주소 <input type="text" name="image" id="image" value="${book.bookImage}"><br>
		분야 <input type="text" name="field" id="field" value="${book.bookField}"><br>
		
		<button>수정완료</button>
		<input type="button" value="목록" id="btnList">
		
	</form>
</body>
</html>