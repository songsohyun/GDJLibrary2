	// 페이지 로드 이벤트
	$(function(){
	
		fnIsbnCheck();
		fnBookAdd();
		
		// 책 목록 페이지 이동
		$('#btnList').on('click', function(){
		location.href='/admin/listBook?value=${value}';
		})
	
	
	
	})
	
	
	// 함수
	
	// 2. 책추가
	function fnBookAdd(){
		$('#f').on('submit', function(event){
			if(isbnPass == false){
					alert('ISBN 형식을 확인해 주세요.');
					event.preventDefault();
					return false;
		    } else if($('#isbn').val() == '' || $('#title').val() == '' || $('#author').val() == '' || $('#publisher').val() == '' || $('#pubdate').val() == '' || $('#description').val() == '' || $('#image').val() == '' || $('#field').val() == ''){
				alert('내용을 모두 입력해주세요.');
				event.preventDefault();
				return false;
			}  
			return true;
		})
	}

	
	// 1. ISBN 정규식 & 중복체크
	let isbnPass = false;
	function fnIsbnCheck(){
		$('#isbn').on('keyup', function(){
			// 정규식 체크하기
			let regIsbn = /^[0-9-.=]{1,20}$/; 
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