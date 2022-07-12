	$(function(){
		// 수정페이지
		$('#btnChangePage').on('click', function(){
			location.href='/admin/changeBookPage?bookNo=${book.bookNo}&value=${value}';
		})
		
		// 목록
		$('#btnList').on('click', function(){
			location.href='/admin/listBook?value=${value}';
		})
		
		
		
	})
	
	