	// 연체중인 책 전체 선택
	function fnCheckAllOverdue(){
		$('#checkAllOverdue').on('click', function(){
			// 체크 박스 체크 상태 변경
			$('.checkOneOverdue').prop('checked', $('#checkAllOverdue').prop('checked'));
		});
	}
	
	// 연체중인 책 개별 선택
	function fnCheckOneOverdue(){
		$(document).on('click', '.checkOneOverdue', function(){
			
			let checkAll = true;                           // 전체 선택하는 거다.
		
			// 개별 선택이 하나라도 un-checked 상태이면, 전체 선택도 un-checked
			$.each($('.checkOneOverdue'), function(i, checkOneOverdue){
				if($(checkOneOverdue).is(':checked') == false){   // 개별 선택 하나라도 해제되어 있으면, 
					$('#checkAllOverdue').prop('checked', false);
					checkAll = false; 
					return;
				}
			});
			
			if(checkAll){
				$('#checkAllOverdue').prop('checked', true);
			}
				
		});
	}
	
	
	
	// 연체 목록 나타내기 
	function fnOverdueBookList(){
		$.ajax({
			url: '${contextPath}/returned/overdueBookList',
			type: 'get',
			dataType: 'json',
			success: function(result){
				$('#overdueBookList').empty();
				$('#btnReturnedOverdue').empty();				
				if(result.overdueBookList != ''){
					$.each(result.overdueBookList, function(i, overdueBook){
						$('<tr>')
						.append($('<td>').html('<input type="checkbox" class="checkOneOverdue" name="overdueNo" value="' + overdueBook.overdueNo + '">'))
						// .append($('<td class="img_wrap">').html('<img src="' + overdueBook.bookImage + '" width="50">'))
						.append($('<td class="img_wrap">').html('<img src="' + overdueBook.bookImage + '" width="50">'))
						// .append($('<td>').text(overdueBook.bookTitle))
						.append($('<td>').html(overdueBook.bookTitle))
						.append($('<td>').text(overdueBook.rentExpirationDate))
						.appendTo('#overdueBookList');
					});
					$('#btnReturnedOverdue').html('<button>연체중인 책 반납</button>');
				} else {
					$('<tr>')
					.append($('<td colspan="4">연체중인 책이 없습니다.</td>'))
					.appendTo('#overdueBookList');
				}
			}
		});
	}
	
	
	// 연체중인 책 반납하기
	function fnReturnedOverdueBook(){
		$('#f2').on('submit', function(event){
			if($('.checkOneOverdue').is(':checked') == false){
				alert('반납할 책을 선택해주세요.');
				event.preventDefault();
				return;
			} else {
				if(confirm('선택하신 책을 반납할까요?')){
					fnAjaxReturnedOverdueBook($(this));
					event.preventDefault();
					// return;
				} else {
					event.preventDefault();
					return;
				}
			}
		});
	}
	
	// Ajax를 이용해서 연체중인 책 반납하기
	function fnAjaxReturnedOverdueBook(f){
		$.ajax({
			url: '${contextPath}/returned/ReturnedOverdueBook',
			type: 'get',
			data: f.serialize(),
			dataType: 'json',
			success: function(obj){
				if(obj.res){
					alert('책이 정상적으로 반납되었습니다.');
					$('#checkAllOverdue').prop('checked', false);
					fnOverdueBookList();
				} else {
					alert('책이 반납되지 않았습니다.');
					fnOverdueBookList();
				}
			}
		});
	}
	
	
	
	
	
	// 대여 목록 나타내기 
	function fnRentBookList(){
		$.ajax({
			url: '${contextPath}/returned/rentBookList',
			type: 'get',
			dataType: 'json',
			success: function(result){
				$('#rentBookList').empty();
				$('#btnReturnedRent').empty();	
				if(result.rentBookList != ''){
					$.each(result.rentBookList, function(i, rentBook){
						$('<tr>')
						// .append($('<td>').html('<input type="checkbox" class="checkOneRent" data-rent_no="' + rentBook.rentNo + '">'))
						.append($('<td>').html('<input type="checkbox" class="checkOneRent" name="rentNo" value="' + rentBook.rentNo + '">'))
						.append($('<td class="img_wrap">').html('<img src="' + rentBook.bookImage + '" width="50">'))
						// .append($('<td>').text(rentBook.bookTitle))
						.append($('<td>').html(rentBook.bookTitle))
						.append($('<td>').text(rentBook.rentDate))
						.append($('<td>').text(rentBook.rentExpirationDate))
						.appendTo('#rentBookList');
					});
					// $('#btnReturnedRent').html('<input type="button" value="반납하기" id="btnReturnedRentBook">');
					$('#btnReturnedRent').html('<button>대여중인 책 반납</button>');
				} else {
					$('<tr>')
					.append($('<td colspan="5">대여중인 책이 없습니다.</td>'))
					.appendTo('#rentBookList');
				}
			}
		});
	}
	
	
	// 대여중인 책 반납하기
	function fnReturnedRentBook(){
		$('#f1').on('submit', function(event){
			if($('.checkOneRent').is(':checked') == false){
				alert('반납할 책을 선택해주세요.');
				event.preventDefault();
				return;
			} else {
				if(confirm('선택하신 책을 반납할까요?')){
					fnAjaxReturnedRentBook($(this));
					event.preventDefault();
					// return;
				} else {
					event.preventDefault();
					return;
				}
			}
		});
	}
	
	// Ajax를 이용해서 대여중인 책 반납하기
	function fnAjaxReturnedRentBook(f){
		$.ajax({
			url: '${contextPath}/returned/ReturnedRentBook',
			type: 'get',
			data: f.serialize(),
			dataType: 'json',
			success: function(obj){
				if(obj.res){
					alert('책이 정상적으로 반납되었습니다.');
					$('#checkAllRent').prop('checked', false);
					fnRentBookList();
				} else {
					alert('책이 반납되지 않았습니다.');
					fnRentBookList();
				}
			}
		});
	}
	
	
	// 대여중인 책 전체 선택
	function fnCheckAllRent(){
		$('#checkAllRent').on('click', function(){
			// 체크 박스 체크 상태 변경
			$('.checkOneRent').prop('checked', $('#checkAllRent').prop('checked'));
		});
	}
	
	// 대여중인 책 개별 선택
	function fnCheckOneRent(){
		$(document).on('click', '.checkOneRent', function(){
			
			let checkAll = true;                           // 전체 선택하는 거다.
		
			// 개별 선택이 하나라도 un-checked 상태이면, 전체 선택도 un-checked
			$.each($('.checkOneRent'), function(i, checkOneRent){
				if($(checkOneRent).is(':checked') == false){   // 개별 선택 하나라도 해제되어 있으면, 
					$('#checkAllRent').prop('checked', false);
					checkAll = false; 
					return;
				}
			});
			
			if(checkAll){
				$('#checkAllRent').prop('checked', true);
			}
				
		});
	}