	$(function(){
		
		
		// 목록
		$('#btnList').on('click', function(){
			location.href='/admin/listDormantMember?value=${value}';
		})
		
		// 활동회원전환
		$('#f').on('submit', function(){
			if(confirm('정말 활동회원으로 전환시키겠습니까?')) {
				location.href="/admin/saveDormantToMember?memberNo=${member.memberNo}&value=${value}";				
				return true;
			} else {
				return false;
			}
		})
		
		
	})
	