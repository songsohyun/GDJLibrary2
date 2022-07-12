/* 함수 */
// 3. 수정
function fnModify(){
	$('#f').on('submit', function(event){
		if($('#memberName').val() == ''){
			alert('이름을 확인해주세요.');
			event.preventDefault();
			return false;
		} 
		else if(addressPass == false || $('#memberDetailAddress').val() == ''){
			alert('주소를 확인해주세요.');
			event.preventDefault();
			return false;
		}
		else if(PhonePass == false){
			alert('휴대전화를 확인해주세요.');
			event.preventDefault();
			return false;
		}
		
		return true;
	})
}

// 2. 휴대전화 확인

function fnPhoneCheck(){
	$('#memberPhone').on('keyup', function(){
		let regPhone = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
		if(regPhone.test($('#memberPhone').val()) == false) {
			$('#phoneMsg').text('휴대전화 형식 예) 010-1234-5678');
			PhonePass = false;
		} else {
			$('#phoneMsg').text('');
			PhonePass = true;
		}
	})
}

// 1. 주소 api

function fnPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            
            var roadAddr = data.roadAddress; 

            $('#memberPostcode').val(data.zonecode).prop('readonly', true);
            $('#memberRoadAddress').val(roadAddr).prop('readonly', true);
            $('#memberDetailAddress').val('');
            if($('#memberPostcode').val() != '' && $('#memberRoadAddress').val() != ''){
            	addressPass = true;
            } else {
            	addressPass = false;
            }
        }
    }).open();
}

//취소하기
function fnCancel(){
	location.href='${contextPath}/member/myPage';
}

function fnMemberDelete() {
	$('#f2').on('submit', function(event){
		if(confirm('탈퇴하시겠습니까?')) {
			return true;
		}else {
			event.preventDefault();
			return false;
		}
	})
}