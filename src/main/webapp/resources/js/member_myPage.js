// 마이페이지 대여 목록
function fnRentBookList(){
	$.ajax({
		url: '${contextPath}/member/rentBookList',
		type: 'get',
		dataType: 'json',
		success: function(result){
			$('#myPageRentBookList').empty();
			if(result.rentBookList != ''){
				$.each(result.rentBookList, function(i, rentBook){
					$('<tr>')
					.append($('<td>').html(rentBook.bookTitle))
					.append($('<td>').html(rentBook.rentDate))
					.append($('<td>').html(rentBook.rentExpirationDate))
					.appendTo('#myPageRentBookList');
				});
				
			} else {
				$('<tr>')
				.append($('<td colspan="3">대여중인 책이 없습니다.</td>'))
				.appendTo('#myPageRentBookList');
			}			
		}
	})
}

// 마이페이지 연체 목록
function fnoOerdueBookList() {
	$.ajax({
		url: '${contextPath}/member/overdueBookList',
		type: 'get',
		dataType: 'json',
		success: function(result){
			$('#myPageOverdueBookList').empty();			
			if(result.overdueBookList != ''){
				$.each(result.overdueBookList, function(i, overdueBook){
					$('<tr>')
					.append($('<td>').html(overdueBook.bookTitle))
					.append($('<td>').html(overdueBook.rentExpirationDate))
					.appendTo('#myPageOverdueBookList');
				});
			} else {
				$('<tr>')
				.append($('<td colspan="2">연체중인 책이 없습니다.</td>'))
				.appendTo('#myPageOverdueBookList');
			}
		}
	})
}

// 마이페이지 예약한 좌석
function fnSeatNo(){
	$.ajax({
		url: '${contextPath}/member/reservationSeatNo',
		type: 'get',
		dataType: 'json',
		success: function(result) {
			if(result.seat != null) {
				$('<tr>')
				.append($('<td>').html(result.seat.seatNo + '번'))
				.append($('<td>').html(result.seat.seatCode))
				.appendTo('#myPageReservationSeatNo');
			} else {
				$('<tr>')
				.append($('<td colspan="2">').html('예약된 좌석이 없습니다.'))
				.appendTo('#myPageReservationSeatNo');
			}
		}
		
	})
}