
			var page = 1;  // 초기화
			function fnList(){
				$.ajax({
					url: '${contextPath}/book/list',
					type: 'GET',
					data: 'page=' + page,
					dataType: 'json',
					success: function(obj){
						fnPrintBookList(obj.books, obj.p);
						fnPrintPaging(obj.p);
					}
				})
			}
	

			function fnPrintBookList(books, p){
			$('#bookInfo').empty();
			$.each((books), function(i, book){
			var tr = '<tr>';
			tr += '<td>' + p.beginRecord++ + '</td>';
			tr += '<td><a href="${contextPath}/book/detail?bookNo=' + book.bookNo + '"><img src="' + book.bookImage + '"width=100px height=130px></td>';
			tr += '<td><a href="${contextPath}/book/detail?bookNo=' + book.bookNo + '">' + book.bookTitle + '</a></td>';
			tr += '<td>' + book.bookAuthor + '</td>';
			tr += '<td>' + book.bookType + '</td>';
			tr += '</tr>';
			$('#bookInfo').append(tr);
				})
			}
		

			function fnPagingLink(){
			$(document).on('click', '.enable_link', function(){
				page = $(this).data('page');
				fnList();
				})
			}
	

			function fnPrintPaging(p){
			
			$('#paging').empty();
			
			var paging = '';
			

			if(page <= p.pagePerBlock){
				paging += '<div class="disable_link">◀◀</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (p.beginPage - 1) + '">◀◀</div>';
			}
			

			if(page == 1){
				paging += '<div class="disable_link">◀</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (page - 1) + '">◀</div>';
			}
			

			for(let i = p.beginPage; i <= p.endPage; i++){
				if(i == page){
					paging += '<div class="disable_link now_page">' + i + '</div>';
				} else {
					paging += '<div class="enable_link" data-page="' + i + '">' + i + '</div>';
				}
			}
			

			if(page == p.totalPage){
				paging += '<div class="disable_link">▶</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (page + 1) + '">▶</div>';
			}
			

			if(p.endPage == p.totalPage){
				paging += '<div class="disable_link">▶▶</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (p.endPage + 1) + '">▶▶</div>';
			}
			
			$('#paging').append(paging);
			
			}
	
			
			var page = 1; 
			function fnSearch(){
			$('#btnSearch').on('click', function(){
				$.ajax({
					url: '${contextPath}/book/search',
					type: 'GET',
					data: 'page=' + page + '&column=' + $('#column').val() + '&query=' + $('#query').val(),
					dataType: 'json',
					success: function(obj){
						fnPrintBookList(obj.books, obj.p);
						fnPrintPaging(obj.p);
						}
					})
				})
			}
		
			function enterKey(){
				$.ajax({
					url: '${contextPath}/book/search',
					type: 'GET',
					data: 'page=' + page + '&column=' + $('#column').val() + '&query=' + $('#query').val(),
					dataType: 'json',
					success: function(obj){
						fnPrintBookList(obj.books, obj.p);
						fnPrintPaging(obj.p);
						}
					})
				}