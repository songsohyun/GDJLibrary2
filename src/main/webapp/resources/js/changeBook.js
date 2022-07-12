	// 페이지 로드 이벤트
	$(function(){
		fnBookChange();
		fnList();
		fnIsbnCheck();
	
		// 목록
		$('#btnList').on('click', function(){
			location.href='/admin/listBook?value=${value}';
		})
	
	})


	
	// 함수
	
	// 수정완료
	function fnBookChange(){
		$('#f').on('submit', function(event){
			
			if($('#isbn').val() == '${book.bookIsbn}' && $('#title').val() == '${book.bookTitle}' && $('#author').val() == '${book.bookAuthor}' && $('#publisher').val() == '${book.bookPublisher}' && $('#pubdate').val() == '${book.bookPubdateTime}' && $('#description').val() == '${book.bookDescription}' && $('#image').val() == '${book.bookImage}' && $('#field').val() == '${book.bookType}'){
				alert('변경된 내용이 없습니다.');
				event.preventDefault();
				return false;
			} else if(isbnPass == false){
				alert('형식에 맞지 않는 ISBN입니다.');
				event.preventDefault();
				return false;
			} else if($('#title').val() == '' || $('#author').val() == '' || $('#publisher').val() == '' || $('#pubdate').val() == '' || $('#description').val() == '' || $('#image').val() == '' || $('#field').val() == ''){
				alert('내용을 모두 입력해주세요.');
				event.preventDefault();
				return false;
			} 
			return true;
		})
	}
	
	
	// 1. ISBN 정규식
	
	let isbnPass = false;
	function fnIsbnCheck(){
		$('#isbn').on('keyup', function(){
			// 정규식 체크하기
			let regIsbn = /^[0-9--.=]{1,20}$/; 
			if(regIsbn.test($('#isbn').val())==false){
				$('#isbnMsg').text('ISBN은 숫자 또는 특수문자(- . =) 1~20자 입니다.').addClass('dont').removeClass('ok');
				isbnPass = false;
				return false;
			} else {
				isbnPass = true;
				$('#isbnMsg').text('멋진 ISBN입니다.').addClass('ok').removeClass('dont');
				return true;
			}
			
		})
	}
	
	
	
	
	
	
	// 목록
	function fnList(){
		$('#btnList').on('click', function(){
			location.href='/admin/listBook?value=${value}';
		})
	}