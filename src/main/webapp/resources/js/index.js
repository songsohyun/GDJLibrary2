
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
		
	

		
		function initMap() {
		
		var map = new naver.maps.Map('map', {
	        center: new naver.maps.LatLng(37.478095, 126.879192),
	        zoom: 17
	    });
		
	    var marker = new naver.maps.Marker({
	        map: map,
	        title: "GDJLibrary",
	        position: new naver.maps.LatLng(37.478095, 126.879192),
	        icon: {
	            content: '<img src="<c:url value="/resources/images/map-pin-g894a2ee8c_1920.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none;position: absolute; width: 25px; height: 40px; left: 0px; top: 0px;">',
	            size: new naver.maps.Size(1, 1),
	            anchor: new naver.maps.Point(16, 32)
	        }
	    });
	}