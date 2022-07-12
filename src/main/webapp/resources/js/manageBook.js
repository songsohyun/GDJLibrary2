// 페이지 로드 이벤트
$(function(){
	fnCheck();
	fnAreaChoice();
	fnSearchAll();
	fnSearch();
	fnAutoComplete();
	fnlistCountChange();
	fnMoveManageMain();
	fnInsert();
	fnInsertNaver();
})

// 함수

function fnInsert(){
	$('#btnInsert').on('click', function(){
		location.href='/admin/saveBookPage?value=' + ${value};
	})
}

function fnInsertNaver(){
	$('#btnInsertNaver').on('click', function(){
		location.href='/admin/saveNaverBookPage?value=' + ${value};
	})
}


function fnlistCountChange(){
	$('#pageUnit').change(function(){
		location.href="/admin/listBook?value=" + $("#pageUnit option:selected").val();
		
	})
}



function fnAutoComplete(){
	// keyup : 한 글자 입력이 끝난 뒤 동작
	$('#query').on('keyup', function(){
		$('#autoComplete').empty();
		$.ajax({  // DB에서 입력한 값으로 시작하는 값을 가져와서 보여 줌
			url: '/admin/autoCompleteBook',
			type: 'get',
			data: 'column=' + $('#column').val() + '&query=' + $('#query').val(),
			dataType: 'json',
			success: function(result){
				if(result.status == 200){
					$.each(result.list, function(i, item){
						$('<option>')
						.val(item[result.column])
						.appendTo('#autoComplete');
					})
				}
			}
		})
	})
}


function fnSearch(){
	
	var column = $('#column');
	var query = $('#query');
	var begin = $('#begin');
	var end = $('#end');
	
	$('#btnSearch').on('click', function(){
		
		
		var regBookIsbn = /^[0-9-.=]{1,16}$/;
		// 책ISBN고유번호 검색
		if( column.val() == 'BOOK_ISBN' && regBookIsbn.test(query.val()) == false) {
			alert('ISBN은 숫자 또는 특수문자(- . =) 1~16자 입니다.');
			query.focus();
			return;
		}
		
		// 책제목 검색
		var regBookTitle = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\s]+$/; // 한글 + 영어 + 숫자 + 공백 가능
		if( column.val() == 'BOOK_TITLE' && regBookTitle.test(query.val()) == false ) {
			alert('제목이 올바르지 않습니다.');
			return;
		}
		
		// 책작가 검색
		var regBookAuthor =  /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\s]+$/; // 한글 + 영어 + 숫자 + 공백 가능
		if( column.val() == 'BOOK_AUTHOR' && regBookAuthor.test(query.val()) == false ) {
			alert('작가 이름이 올바르지 않습니다.');
			return;
		}
		
		// 출판사 검색
		var regBookPublisher = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\s]+$/; // 한글 + 영어 + 숫자 + 공백 가능
		if( column.val() == 'BOOK_PUBLISHER' && regBookPublisher.test(query.val()) == false ) {
			alert('출판사 이름이 올바르지 않습니다.');
			return;
		}
		
		// 검색 실행
		// equalArea 작업은 column, query 파라미터 전송
		
		location.href="/admin/searchBook?column=" + column.val() + "&query=" + query.val() + "&value=" + ${value};
		
		
	})
	
}

function fnSearchAll(){
	$('#btnSearchAll').on('click', function(){
		location.href="/admin/listBook?value=${value}";
	})
}


function fnAreaChoice(){
	
	// 초기 : 모두 숨김
	$('#equalArea, #rangeArea').css('display', 'none');

	// 선택
	$('#column').on('change', function(){
		if( $(this).val() == '' ) {
			$('#equalArea, #rangeArea').css('display', 'none');
		} else if( $(this).val() == 'BOOK_ISBN' || $(this).val() == 'BOOK_TITLE' || $(this).val() == 'BOOK_AUTHOR' || $(this).val() == 'BOOK_PUBLISHER') {
			$('#equalArea').css('display', 'inline');
			$('#rangeArea').css('display', 'none');
			$('#selectSection').css('padding-left', '109px');
		}
	})
	
}

function fnCheck(){
	// 전체 선택
	$('#checkAll').on('click', function(){
	
		// 전체 선택이 checked    -> 개별 선택 모두 checked
		// 전체 선택이 un-checked -> 개별 선택 모두 un-checked
		
		// 체크 여부 확인 방법 2가지
		// 1) attr('checked'), attr('checked', 'checked')
		// 2) prop('checked'), prop('checked', true)
		
		// 체크 박스 체크 상태 변경
		$('.checkOne').prop('checked', $('#checkAll').prop('checked'));

	})
	
	// 개별 선택
	$('.checkOne').on('click', function(){
	
		let checkAll = true;                           // 전체 선택하는 거다.
		
		// 개별 선택이 하나라도 un-checked 상태이면, 전체 선택도 un-checked
		$.each($('.checkOne'), function(i, checkOne){
			if($(checkOne).is(':checked') == false){   // 개별 선택 하나라도 해제되어 있으면,
				$('#checkAll').prop('checked', false);
				$('.items').removeClass('check');
				checkAll = false;                      // 전체 선택이 아니다.
				return false;
			}
		})
		
		if(checkAll){
			$('#checkAll').prop('checked', true);
			$('.items').addClass('check');
		}
		
	})
	
	// 각 체크 박스는 클릭할때마다 check 클래스를 줬다 뺐었다 해야 함.
	$('.item, .items').on('click', function(){
		$(this).toggleClass('check');
	})
}

function fnMoveManageMain(){
	$('#btnManageMain').on('click', function(){
		location.href="/admin/moveManageMain";
	})
}