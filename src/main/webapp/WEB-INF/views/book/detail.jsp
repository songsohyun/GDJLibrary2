<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../resources/js/jquery-3.6.0.js"></script>

<style>

	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
   
   * {
      font-family: 'Noto Sans KR', sans-serif;
      color: #4e4c4c;
   }
	
        .all{
      
      margin: 150px 30px 50px 30px;
   }
   
   #paging {
      display: flex;
      justify-content: center;
   }
   #paging div {
      width: 32px;
      height: 20px;
      text-align: center;
   }
   .disable_link {
      color: lightgray;
   }
   .enable_link {
      cursor: pointer;
   }
   .now_page {
      border: 1px solid gray;
      color: limegreen;
      font-weight: 900;
      border: ;
   }
   
   .contentGroup .no1{
      display: inline-flex;
      color: red;
      flex-direction: column;
      
   }
   .contentGroup .no2{
      display: inline-flex;
      flex-direction: column;
   }
      #contentReg fieldset{
          display: inline-block;
          direction: rtl;
          border:0;
      }
      #contentReg input[type=radio]{
          display: none;
      }
      #contentReg label{
          font-size: 3em;
          color: transparent;
          text-shadow: 0 0 0 #3f81e9;
          font-size: 30px
      }
      #contentReg label:hover{
          text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
      }
      #contentReg label:hover ~ label{
          text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
      }
      #contentReg input[type=radio]:checked ~ label{
          text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
      }
      
      .userRating{
         font-size: 3em;
          color: transparent;
          text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
          font-size: 20px
      }
      
      #recomeBook{
         display: flex;
         text-align: center;
      }

      .detailBook{
         display: inline-flex;
      }
      
      .bookImg{
         margin: 50px 100px 50px 200px;
      }
      
      .bookInfo{
         display: block;
         margin: 40px 100px 50px 20px;
         font-size: 15px;
      }
      
      .bookInfo elm{
         margin-bottom: 5px;
      }

      
      #btnSearchAll{
         margin-left: 15px;
      }
      
      hr {
       border: none;
       border-top: 2px solid #E3E7EB;
       overflow: visible;
       text-align: center;
       margin: 24px 70px 17px 70px;
      }
   
      hr:after {
          content: "GDJ LIBRARY";
          position: relative;
          top: -12px;
          background: #F1F3F5; 
          padding: 0 10px;
          color: #868E96;
          font-size: 0.8em;
      }
      
      .bookDescript{
         margin: 40px 90px 0 90px;
      }
      
      .recomText{
         margin: 40px 90px 0 90px;
      }
      
      .recom{
         margin-right: 50px;
      }
      
      #recomeBook{
         justify-content: center;
      }
      
      .bookReviewSec{
         margin: 20px 180px;
      }
      
      .bookReview{
      	 display: inline-block;
         padding: 20px;
         background-color: #f2f2f2;
         text-align: center;
      }
      
      #attention{
         font-size: 12px;
         margin-bottom: 5px;
      }
      
      #btnReg{
         background-color: #196ab3;
           color: white;
           padding: 10px 10px 10px 10px;
           border: none;
           border-radius: 5px;
           letter-spacing: 2px;
           outline: none;
           align-self: center;
           cursor: pointer;
           font-weight: bold;
              width: 100px;
              height: 100%;
              margin-left: 10px;
      }
      
      .reviews{
         margin-left: 100px;
      }
      
      #replyInfo{
         margin: 10px 0 20px 250px;
         font-size: 20px;
      }
      
      .replyList{
         margin-left: auto;
         margin-right: auto;         
         text-align: center;
         width: 1000px;
      }
        #replyContent {
            display: flex;
        }
        #replyContent .replyContent_first{
            flex:1;

        }
        #replyContent .replyContent_second{
            flex:1;
            margin: 0 auto;

        }
        
        #btnRent, #btnSearchAll{
        	background-color: #eeede4;
		    color: black;
		    padding: 0.5em 1.5em;
		    border: none;
		    border-radius: 5px;
		    letter-spacing: 2px;
		    outline: none;
		    align-self: center;
		    cursor: pointer;
		    font-weight: bold;
        }
       
    </style>
<script>
		//??????	
		//?????? ?????? ?????? ????????????????????? ??????
		
		
		$(function(){
			fnList();
			fnSaveReply();
			fnRecomBook();
			fnPagingLink();

		})	
		
		
		var page = 1;
		// 1. ????????????
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
		
		// 1-1 ????????????
		function fnPrintReplyList(replies, p){
			$('#reviewList').empty();
			$.each(replies, function(i, reply){
				var tr = '<tr>'
				var userRating = reply.bookRating
				var created = new Date(reply.bookReplyCreated).toISOString().substring(0,10);				
				tr += '<td>' + p.beginRecord++ + '</td>';
					switch(userRating){
					case 1 : tr += '<td class="userRating">???</td>'; break;
					case 2 : tr += '<td class="userRating">??????</td>'; break;
					case 3 : tr += '<td class="userRating">?????????</td>'; break;
					case 4 : tr += '<td class="userRating">????????????</td>'; break;
					case 5 : tr += '<td class="userRating">???????????????</td>'; break;
					}
				tr += '<td>' + reply.memberId + '</td>';
				tr += '<td>' + reply.bookReplyContent + '</td>';
				tr += '<td>' + created + '</td>';
				
				tr += '</tr>';
				$('#reviewList').append(tr);
				
			})
		}
		
		// 1-2 ????????? ?????? ??????
			function fnPagingLink(){
			$(document).on('click', '.enable_link', function(){
				page = $(this).data('page');
				fnList();
			})
		}
		
		// 1-3 ????????????
			function fnPrintPaging(p){
			
			$('#paging').empty();
			
			var paging = '';
			
			// ?????? : ?????? ???????????? ??????
			if(page <= p.pagePerBlock){
				paging += '<div class="disable_link">??????</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (p.beginPage - 1) + '">??????</div>';
			}
			
			// ???  : ?????? ???????????? ??????
			if(page == 1){
				paging += '<div class="disable_link">???</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (page - 1) + '">???</div>';
			}
			
			// 1 2 3 4 5 : ????????? ??????
			for(let i = p.beginPage; i <= p.endPage; i++){
				if(i == page){
					paging += '<div class="disable_link now_page">' + i + '</div>';
				} else {
					paging += '<div class="enable_link" data-page="' + i + '">' + i + '</div>';
				}
			}
			
			// ???  : ?????? ???????????? ??????
			if(page == p.totalPage){
				paging += '<div class="disable_link">???</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (page + 1) + '">???</div>';
			}
			
			// ?????? : ?????? ???????????? ??????
			if(p.endPage == p.totalPage){
				paging += '<div class="disable_link">??????</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + (p.endPage + 1) + '">??????</div>';
			}
			
			$('#paging').append(paging);
			
		}
		
		// 2. ???????????????
		function fnSaveReply(){
			$('#btnReg').on('click', function(){
				$.ajax({
					url: '${contextPath}/reply/save',
					type: 'get',
					data: $('#contentReg').serialize(),
					dataType: 'json',
					success: function(obj){
							if(obj.res > 0){
								alert('???????????? ?????????????????????.');
								fnList();
								fnInit();
						}else{
							alert('???????????? ????????? ????????? ????????????.');
						}
					}
					
				})
			})
		}

			function fnInit(){
				$('#bookReplyContent').val('');
			}
		
		// 3. ?????????
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
		
	
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>
    <div class="all">
        <div class="detailBook">   
          <div class="bookImg">
              <span><img src="${book.bookImage}" width="300px" height="420px" ></span>
          </div>
          
          <div class="bookInfo">
              <div class="bookInfo elm">?????? : ${book.bookTitle}</div>
              <div class="bookInfo elm">?????? : ${book.bookAuthor}</div>
              <div class="bookInfo elm">????????? : ${book.bookPublisher}</div>
              <div class="bookInfo elm">?????? : ${book.bookType}</div>
              <div class="bookInfo elm">isbn : ${book.bookIsbn}</div>
              <span>
              <input type="button" id="btnRent" value="????????????" onclick="location.href='${contextPath}/rent/rentBook?bookNo=${book.bookNo}'">
              <input type="button" id="btnSearchAll" value="????????????" onclick="location.href='${contextPath}/book/listPage'"/>
              </span>
          </div>   
        </div>   
              
          <hr>   
          
          <div class="bookDescript">
          <h3>?????????</h3>
              ${book.bookDescription}
          </div>   
      
          <hr>
          
          
          <h3 class="recomText">????????????</h3>
          <div id="recomeBook"></div>

          <hr>
          
          <div class="bookReviewSec">
              <h3>?????? ?????????</h3>
              <div id="attention">* ???????????? ?????? ????????? ????????? ?????? ?????? ????????? ???????????????. </div>
              <div id="attention">* ????????? ?????? ??? ????????? ?????????????????? ????????? ?????? ??????????????????.</div>
              <div class="bookReview">
                  <form id="contentReg">          
                      <div class="review_rating">
                          <div>????????? ????????? ?????????.</div>
                          <div class="ratingStar">
                              <fieldset>
                                     <input type="hidden" id="bookNo" name="bookNo" value="${book.bookNo}">
                                  <input type="radio" name="bookRating" value="5" id="rate1"><label
                                      for="rate1">???</label>
                                  <input type="radio" name="bookRating" value="4" id="rate2"><label
                                      for="rate2">???</label>
                                  <input type="radio" name="bookRating" value="3" id="rate3"><label
                                      for="rate3">???</label>
                                  <input type="radio" name="bookRating" value="2" id="rate4"><label
                                      for="rate4">???</label>
                                  <input type="radio" name="bookRating" value="1" id="rate5"><label
                                      for="rate5">???</label>
                              </fieldset>
                          </div>
                      </div>
                      <div id="replyContent">
                        <div class="replyContent_first">
                            <textarea rows="3" cols="100" id="bookReplyContent" name="bookReplyContent" placeholder="?????? ?????? 50????????? ????????????"></textarea>
                        </div>
                        <div class="replyContent_second">
                            <input type="button" id="btnReg" value="????????????">
                        </div>
                        
                            
                      </div>
                          
                            
                  </form>
              </div>
          </div>
          
          <hr>
          
          <h3 class="reviews">?????? ?????????</h3>
          
          <div id="replyInfo">
              <em>??? ????????? <span id="replyCount"></span>??? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????? <span id="replyRatingAverage"></span>???</em>
         </div>
          
          <table class="replyList">
              <thead>

                  <tr>
                      <td>??????</td>
                      <td>??????</td>
                      <td>?????????</td>
                      <td>??????</td>
                      <td>?????????</td>
                  </tr>
              </thead>
              <tbody id="reviewList">

              </tbody>   
              <tfoot>
                  <tr>
                      <td colspan="5">
                          <div id="paging"></div>
                      </td>
                  </tr>
              </tfoot>
          </table>
      
      </div>
</body>
</html>