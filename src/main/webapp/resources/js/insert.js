
		function fnGetBookInfo(){
			
			$('#getBookInfo').on('submit',function(event){
				var regField = /^[0-9]{1,2}$/;
				var query = $('#query')
					if(regField.test($('#query').val()) == false){
						alert('분야코드에 맞는 숫자만 입력해주세요.');
						event.preventDefault();
						query.val('');
						return;
					}
					if(query.val() == 4 || query.val() == 5 || query.val() == 6 || query.val() == 11){
						$(this).submit();						
					}else{
						alert('분야코드를 확인해주세요');
						event.preventDefault();
						query.val('');
						return;
					}
			})
			
		}