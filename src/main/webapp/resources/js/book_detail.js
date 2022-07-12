		var page = 1;

		function fnList(){
			$.ajax({
				url: '${contextPath}/reply/list',
				type: 'GET',
				data: 'bookNo=${book.bookNo}' + '&page=' + page,
				dataType: 'json',
				success: function(obj){
					$('#replyCount').text(obj.replyCount);
					$('#replyRatingAverage').text(obj.replyRatingAverage);
					fnPrintReplyList(obj.replies, obj.p);
					fnPrintPaging(obj.p);
				}
			})
		}
		

		function fnPrintReplyList(replies, p){
			$('#reviewList').empty();
			$.each(replies, function(i, reply){
				var tr = '<tr>'
				var userRating = reply.bookRating
				var created = new Date(reply.bookReplyCreated).toISOString().substring(0,10);				
				tr += '<td>' + p.beginRecord++ + '</td>';
					switch(userRating){
					case 1 : tr += '<td class="userRating">★</td>'; break;
					case 2 : tr += '<td class="userRating">★★</td>'; break;
					case 3 : tr += '<td class="userRating">★★★</td>'; break;
					case 4 : tr += '<td class="userRating">★★★★</td>'; break;
					case 5 : tr += '<td class="userRating">★★★★★</td>'; break;
					}
				tr += '<td>' + reply.memberId + '</td>';
				tr += '<td>' + reply.bookReplyContent + '</td>';
				tr += '<td>' + created + '</td>';
				
				tr += '</tr>';
				$('#reviewList').append(tr);
				
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
		

		function fnSaveReply(){
			$('#btnReg').on('click', function(){
				$.ajax({
					url: '${contextPath}/reply/save',
					type: 'get',
					data: $('#contentReg').serialize(),
					dataType: 'json',
					success: function(obj){
							if(obj.res > 0){
								alert('감상평이 등록되었습니다.');
								fnList();
								fnInit();
						}else{
							alert('해당책의 대여한 기록이 없습니다.');
						}
					}
					
				})
			})
		}

			function fnInit(){
				$('#bookReplyContent').val('');
			}
		

			function fnRecomBook(){
			$.ajax({
				url: '${contextPath}/book/recomBook',
				type: 'get',
				dataType : 'json',
				success: function(obj){
					$.each(obj.recom, function(i, recom){
						var sp = '<span>';
						sp += '<ul class="recom1"><a href="${contextPath}/book/detail?bookNo=' + recom.bookNo + '"><img src="' + recom.bookImage + '" width=130px height=170px></a></ul>';
						sp += '<ul>' + recom.bookTitle + '</ul>';
						sp += '</span>'
						$('#recomeBook').append(sp);
					})
				}
				
			})
			
		}