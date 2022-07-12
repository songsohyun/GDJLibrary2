	$(function(){
				
				// 모든 내용 입력확인
				$('#f').on('submit', function(event){
					if($('#title').val() == '' || $('#content').val() == ''){
					        alert('내용을 모두 입력해주세요.');
					        event.preventDefault();
							return false;
				    }
					return true;
				})
				
				// 관리자 메인 페이지 이동 
				$('#btnList').on('click', function(){
				location.href='/admin/moveManageMain';
				})
			
		})