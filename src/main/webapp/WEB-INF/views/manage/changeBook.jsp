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
		fnIsbnCheck();
	})


	
	// 함수
	
	// 수정완료
	function fnBookChange(){
		$('#f').on('submit', function(event){
			
			if($('#isbn').val() == '${book.bookIsbn}' && $('#title').val() == '${book.bookTitle}' && $('#author').val() == '${book.bookAuthor}' && $('#publisher').val() == '${book.bookPublisher}' && $('#pubdate').val() == '${book.bookPubdateTime}' && $('#description').val() == '${book.bookDescription}' && $('#image').val() == '${book.bookImage}' && $('#field').val() == '${book.bookType}'){
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
	
	
	// 1. ISBN 정규식 & 중복체크
	let isbnOverlapPass = false;
	let isbnPass = false;
	function fnIsbnCheck(){
		$('#isbn').on('keyup', function(){
			// 정규식 체크하기
			let regIsbn = /^[0-9-.=]{1,16}$/; 
			if(regIsbn.test($('#isbn').val())==false){
				$('#isbnMsg').text('ISBN은 숫자 또는 특수문자(- . =) 1~17자 입니다.').addClass('dont').removeClass('ok');
				isbnPass = false;
				return;
			}
			// isbn 중복 체크
			$.ajax({
				url: '${contextPath}/admin/checkBookByIsbn',
				type: 'get',
				data: 'isbn=' + $('#isbn').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						$('#isbnMsg').text('멋진 Isbn이네요!').addClass('ok').removeClass('dont');
						isbnPass = true;
						isbnOverlapPass = true;
					} else {
						$('#isbnMsg').text('이미 사용중인 ISBN입니다.').addClass('dont').removeClass('ok');
						isbnPass = true;
						isbnOverlapPass = false;
					}
				},
				error: function(jqXHR){
					$('#isbnMsg').text(jqXHR.responseText).addClass('dont').removeClass('ok');
					isbnPass = true;
					isbnOverlapPass = false;
				}
			})
		})
	}
	
	
	
	
	
	
	// 목록
	function fnList(){
		$('#btnList').on('click', function(){
			location.href='${contextPath}/admin/listBook?value=${value}';
		})
	}
</script>
</head>
<body>
	<h1>책 수정 화면</h1>
	
	<form id="f" action="${contextPath}/admin/changeBook?value=${value}" method="post">
	
		책번호 ${book.bookNo}<br>
		<input type="text" name="isbn" id="isbn">
		<span id="isbnMsg"></span><br><br>
		<input type="hidden" name="bookNo" value="${book.bookNo}">
		제목 <input type="text" name="title" id="title" value="${book.bookTitle}"><br>
		작가 <input type="text" name="author" id="author" value="${book.bookAuthor}"><br>
		출판사 <input type="text" name="publisher" id="publisher" value="${book.bookPublisher}"><br>
		출판날짜 <input type="text" name="pubdate" id="pubdate" value="${book.bookPubdateTime}"><br>
		설명 <input type="text" name="description" id="description" value="${book.bookDescription}"><br>
		이미지주소 <input type="text" name="image" id="image" value="${book.bookImage}"><br>
		분야 <input type="text" name="field" id="field" value="${book.bookType}"><br>
		
		<button>수정완료</button>
		<input type="button" value="목록" id="btnList">
		
	</form>
</body>
</html>