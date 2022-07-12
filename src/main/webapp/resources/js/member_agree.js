/* 함수 */
function fnCheckAll(){
	$('#checkAll').on('click', function() {
		
		$('.checkOne').prop('checked', $('#checkAll').prop('checked'));

		if ($('#checkAll').is(':checked')) { 
			$('.item, .items').addClass('check');
		} else {
			$('.item, .items').removeClass('check');
		}
	})
}
	
function fnCheckOne() {
	$('.checkOne').on('click', function() {

		let checkAll = true; 

		$.each($('.checkOne'), function(i, checkOne) {
			if ($(checkOne).is(':checked') == false) { 
				$('#checkAll').prop('checked', false);
				$('.items').removeClass('check');
				checkAll = false; 
				return;
			}
		})
		if (checkAll) {
			$('#checkAll').prop('checked', true);
			$('.items').addClass('check');
		}

	})
}

function fnCheckToggle() {
	$('.item, .items').on('click', function() {
		$(this).toggleClass('check');
	})
}

function fnAgreeSubmit() {
	$('#f').on('submit', function(event) {
		if ($('#service').is(':checked') == false
				|| $('#privacy').is(':checked') == false) {
			alert('필수 약관에 모두 동의하세요.');
			event.preventDefault();
			return false;
		}
		return true;

	})
}