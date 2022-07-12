$(function(){
		

		$('#checkAll').on('click', function(){
		
			// 전체 선택이 checked    -> 개별 선택 모두 checked
			// 전체 선택이 un-checked -> 개별 선택 모두 un-checked
			
			// 체크 여부 확인 방법 2가지
			// 1) attr('checked'), attr('checked', 'checked')
			// 2) prop('checked'), prop('checked', true)
			
			// 체크 박스 체크 상태 변경
			$('.checkOne').prop('checked', $('#checkAll').prop('checked'));
	
			// 배경 이미지(체크 이미지) 변경
			if($('#checkAll').is(':checked')){
				$('.item, .items').addClass('check');
			} else {
				$('.item, .items').removeClass('check');
			}
			
		})
		

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
		
		// 다음 버튼
		$('#f').on('submit', function(event){
			if($('#check1').is(':checked') == false || $('#check2').is(':checked') == false || $('#check3').is(':checked') == false){
				alert('모든 사항을 확인 후 열람실을 이용해주세요.');
				event.preventDefault();
				return false;
			}
			return true;
		})
		
	})
	
