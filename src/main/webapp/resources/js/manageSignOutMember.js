	// 페이지 로드 이벤트
	$(function(){
		fnCheck();
		fnAreaChoice();
		fnSearchAll();
		fnSearch();
		fnAutoComplete();
		fnlistCountChange();
		fnMoveManageMain();
	
	})
	
	
	
		

	
	
	function fnlistCountChange(){
		$('#pageUnit').change(function(){
			location.href="/admin/listSignOutMember?value=" + $("#pageUnit option:selected").val();
			switch($("#pageUnit option:selected").val()){
			case '30':
				$('#pageUnit').val('30').prop("selected",true);
			}
		})
	}
	
	
	
	function fnAutoComplete(){
		// keyup : 한 글자 입력이 끝난 뒤 동작
		$('#query').on('keyup', function(){
			$('#autoComplete').empty();
			$.ajax({  // DB에서 입력한 값으로 시작하는 값을 가져와서 보여 줌
				url: '/admin/autoCompleteSignOutMember',
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
			
			// 사원이름 검색
			var regMemberName = /^[가-힣]+$/;  // 한글만가능.
			if( column.val() == 'MEMBER_NAME' && regMemberName.test(query.val()) == false) {
				alert('회원이름이 올바르지 않습니다.');
				query.focus();
				return;
			}
			
			// 전화번호 검색
			var regMemberPhone = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;      // 010-1234-5678
			if( column.val() == 'MEMBER_PHONE' && regMemberPhone.test(query.val()) == false ) {
				alert('휴대전화 형식 예) 010-1234-5678');
				return;
			}
			
			// 주소 검색
			var regMemberRoadAddress = /^[가-힣\s]+$/;      // (한글 + 띄어쓰기)가능.
			if( column.val() == 'MEMBER_ROAD_ADDRESS' && regMemberRoadAddress.test(query.val()) == false ) {
				alert('주소가 올바르지 않습니다.');
				return;
			}
			
			// 가입일자 검색
			var regMemberSingUp = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;  // 2022-05-25
			if( column.val() == 'MEMBER_SIGN_UP' && (!regMemberSingUp.test(begin.val()) || !regMemberSingUp.test(end.val())) ){
				alert('가입일자 형식 예) 2022-05-25');
				return;
			}
			
			// 검색 실행
			// equalArea 작업은 column, query 파라미터 전송
			// rangeArea 작업은 column, begin, end 파라미터 전송
			if( column.val() == 'MEMBER_NAME' || column.val() == 'MEMBER_PHONE' || column.val() == 'MEMBER_ROAD_ADDRESS') {
				location.href="/admin/searchSignOutMember?column=" + column.val() + "&query=" + query.val() + "&value=" + ${value};
			} else {
				location.href="/admin/searchSignOutMember?column=" + column.val() + "&begin=" + begin.val() + "&end=" + end.val() + "&value=" + ${value};
			}
			
		})
		
	}
	
	function fnSearchAll(){
		$('#btnSearchAll').on('click', function(){
			location.href="/admin/listSignOutMember?value=${value}";
		})
	}
	
	
	function fnAreaChoice(){
		
		// 초기 : 모두 숨김
		$('#equalArea, #rangeArea').css('display', 'none');
	
		// 선택
		$('#column').on('change', function(){
			if( $(this).val() == '' ) {
				$('#equalArea, #rangeArea').css('display', 'none');
			} else if( $(this).val() == 'MEMBER_NAME' || $(this).val() == 'MEMBER_PHONE' || $(this).val() == 'MEMBER_ROAD_ADDRESS' ) {
				$('#btnSearchSection').css('padding-right', '-74px');
				$('#equalArea').css('display', 'inline');
				$('#rangeArea').css('display', 'none');
				$('#selectSection').css('padding-left', '122px');
			} else {
				$('#selectSection').css('padding-left', '-122px');
				$('#equalArea').css('display', 'none');
				$('#rangeArea').css('display', 'inline');
				$('#btnSearchSection').css('padding-right', '74px');
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