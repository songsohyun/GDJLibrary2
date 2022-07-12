
   $(document).ready(function(){
      fnSeatCheck();
      fnCheckOut();
      fnSeatConfirm();
      fnSeatRenew();
   })
   
   

   function fnSeatRenew(){
      $('#btnSeatRenew').on('click', function(){
         $.ajax({
            url: '${contextPath}/seat/seatRenew',
            type: 'GET',
            dataType: 'json',
            success: function(obj){
               location.href='${contextPath}/seat/seatPage';
               alert('갱신되었습니다.');
            },
            error: function(jqXHR){
               alert('실패했습니다.');
            }
         })
         
      })
   }
   
   
   

   function fnSeatConfirm(){
      $('#btnConfirm').on('click', function(){
         $.ajax({
            url: '${contextPath}/seat/seatConfirm',
            type: 'GET',
            data: $('#formConfirm').serialize(),
            dataType: 'json',
            success: function(obj){
               if(obj.res != null) {
                  alert(obj.res.memberName + '님의 좌석번호는 ' + obj.res.seatNo + '번 입니다.');
               } else {
                  alert('일치하는 좌석 정보가 없습니다.');
               }
            },
            error: function(jqxhr){
               alert('아이디를 입력하세요.');
            }
         })
      })
      
   }


   function fnCheckOut(){
         $('#btnCheckOut').on('click', function(){

               $.ajax({
                  url: '${contextPath}/seat/seatCheckOut',
                  type: 'GET',
                  data: $('#formCheckOut').serialize(),
                  dataType: 'json',
                  success: function(obj){
                     if(obj.res > 0) {
                        alert('퇴실 처리되었습니다.');
                        location.href='${contextPath}/seat/seatPage';
                     } else {
                        alert('회원 번호를 찾을 수 없습니다.');
                     }
                  },
                  error: function(jqxhr){
                     alert('회원 번호를 입력하세요.');
                  }
               })
            
         })
      
   }
   

   
   function fnSeatCheck(){
      $('.td').on('click', function(){
         $.ajax({
            url: '${contextPath}/seat/seatCheck',
            type: 'GET',
            data: 'seatNo=' + $(this).text(),
            dataType: 'json',
            success: function(obj){
               if(obj.status == 1){
                  alert('이미 이용중인 좌석이 있습니다.');
                  return;
               } else if(obj.status == 0){
                  if(obj.seats.seatStatus == 1) {
                     if(confirm(obj.seats.seatNo + '번 좌석을 사용하시겠습니까?')){
   
                        alert('예약되었습니다. 좌석코드는 ' + obj.code + '입니다. 출력된 번호표를 가져가세요.');
                        location.href='${contextPath}/seat/upSeatStatus?seatNo=' + obj.seats.seatNo;
                     }
                  } else if(obj.seats.seatStatus == 2){
                     alert('이미 이용중인 좌석입니다. 다른 좌석을 선택해주세요.');
                  }                  
               }

            }
            
         })
         
      })
   }