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
<script src="../resources/js/book_detail.js"></script>
<link rel="stylesheet" href="../resources/css/book_detail.css">

<script>
		//별점	
		//별점 마킹 모듈 프로토타입으로 생성
		
		
		$(function(){
			fnList();
			fnSaveReply();
			fnRecomBook();
			fnPagingLink();

		})	
		
	
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
              <div class="bookInfo elm">제목 : ${book.bookTitle}</div>
              <div class="bookInfo elm">저자 : ${book.bookAuthor}</div>
              <div class="bookInfo elm">출판사 : ${book.bookPublisher}</div>
              <div class="bookInfo elm">분야 : ${book.bookType}</div>
              <div class="bookInfo elm">isbn : ${book.bookIsbn}</div>
              <span>
              <input type="button" id="btnRent" value="대여하기" onclick="location.href='${contextPath}/rent/rentBook?bookNo=${book.bookNo}'">
              <input type="button" id="btnSearchAll" value="목록가기" onclick="location.href='${contextPath}/book/listPage'"/>
              </span>
          </div>   
        </div>   
              
          <hr>   
          
          <div class="bookDescript">
          <h3>책소개</h3>
              ${book.bookDescription}
          </div>   
      
          <hr>
          
          
          <h3 class="recomText">추천도서</h3>
          <div id="recomeBook"></div>

          <hr>
          
          <div class="bookReviewSec">
              <h3>한줄 감상평</h3>
              <div id="attention">* 감상평은 책을 대여한 기록이 있는 분만 작성이 가능합니다. </div>
              <div id="attention">* 감상평 수정 및 삭제가 불가능하므로 신중히 작성 부탁드립니다.</div>
              <div class="bookReview">
                  <form id="contentReg">          
                      <div class="review_rating">
                          <div>별점을 선택해 주세요.</div>
                          <div class="ratingStar">
                              <fieldset>
                                     <input type="hidden" id="bookNo" name="bookNo" value="${book.bookNo}">
                                  <input type="radio" name="bookRating" value="5" id="rate1"><label
                                      for="rate1">★</label>
                                  <input type="radio" name="bookRating" value="4" id="rate2"><label
                                      for="rate2">★</label>
                                  <input type="radio" name="bookRating" value="3" id="rate3"><label
                                      for="rate3">★</label>
                                  <input type="radio" name="bookRating" value="2" id="rate4"><label
                                      for="rate4">★</label>
                                  <input type="radio" name="bookRating" value="1" id="rate5"><label
                                      for="rate5">★</label>
                              </fieldset>
                          </div>
                      </div>
                      <div id="replyContent">
                        <div class="replyContent_first">
                            <textarea rows="3" cols="100" id="bookReplyContent" name="bookReplyContent" placeholder="한글 기준 50자까지 작성가능"></textarea>
                        </div>
                        <div class="replyContent_second">
                            <input type="button" id="btnReg" value="등록하기">
                        </div>
                        
                            
                      </div>
                          
                            
                  </form>
              </div>
          </div>
          
          <hr>
          
          <h3 class="reviews">한줄 감상평</h3>
          
          <div id="replyInfo">
              <em>총 감상평 <span id="replyCount"></span>개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;평균평점 <span id="replyRatingAverage"></span>점</em>
         </div>
          
          <table class="replyList">
              <thead>

                  <tr>
                      <td>순번</td>
                      <td>평점</td>
                      <td>작성자</td>
                      <td>내용</td>
                      <td>작성일</td>
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