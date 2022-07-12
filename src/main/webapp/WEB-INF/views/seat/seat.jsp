<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../resources/css/seat_seat.css">

<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/seat_seat.js"></script>

</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>

   <div class="divBody">
   <br>
      <h1>좌석을 선택하세요</h1>
      <br>
      <div class="divSeatTableSmall">
          <table>
             <caption>열람실</caption>
             
             <thead>
                <tr>
                   <td colspan="11" class="door"><i class="fa-solid fa-door-closed door"></i></td>
                </tr>
             </thead>
             <tbody class="tbody">
                
                   <tr >
                      <td class="hdoor"><div class="doorText" style="font-weight:700">출입문</div></td>
                      <td colspan="5"></td>
                      <c:forEach begin="0" end="4" items="${seats}" var="seat">
                      
                            
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                         <td colspan="6"></td>
                      <c:forEach begin="5" end="9" items="${seats}" var="seat">
                      
                            
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="10" end="14" items="${seats}" var="seat">
                      
                      
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <c:forEach begin="15" end="19" items="${seats}" var="seat">
                      
                      
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   
                   <tr>
                      <c:forEach begin="20" end="24" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="25" end="29" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="30" end="34" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="35" end="39" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="40" end="44" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="45" end="49" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <td colspan="11">&nbsp;</td>
                   </tr>
                   <tr>
                      <td colspan="11">&nbsp;</td>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="50" end="54" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="55" end="59" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="60" end="64" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="65" end="69" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="70" end="74" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="75" end="79" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="80" end="84" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="85" end="89" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   
                   <tr>
                      <c:forEach begin="90" end="94" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                      <td></td>
                      <c:forEach begin="95" end="99" items="${seats}" var="seat">
                         <c:if test="${seat.seatStatus == 1}">
                            <td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                         <c:if test="${seat.seatStatus == 2}">
                            <td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
                         </c:if>
                      </c:forEach>
                   </tr>
                   <tr>
                      <td colspan="11" class="back">back</td>
                   </tr>
                   <tr>
                      <td colspan="11">&nbsp;</td>
                   </tr>
                   
             </tbody>
             <tfoot>
                <tr>
                   <td colspan="11">   
                      <div class="divButton">
                        퇴실하기
                        <form id="formCheckOut" class="divForm">
                           <input type="text" name="seatCode" placeholder="좌석코드를 입력하세요.">
                           <input type="button" id="btnCheckOut" class="formBtn">
                           <label for="btnCheckOut">&nbsp;<i class="fa-solid fa-magnifying-glass bt"></i>&nbsp;</label>
                        </form>
                        
                        <br>
                        
                        좌석확인
                        <form id="formConfirm" class="divForm">
                           <input type="text" name="memberId" id="id2" placeholder="아이디를 입력하세요.">
                           <input type="button" value="검색" id="btnConfirm" class="formBtn">
                           <label for="btnConfirm">&nbsp;<i class="fa-solid fa-magnifying-glass bt"></i>&nbsp;</label>
                        </form>
                        
                        <br>
                        
                        좌석갱신
                        <input type="button" value="좌석 갱신" id="btnSeatRenew" class="formBtn">
                        <label for="btnSeatRenew">&nbsp;<i class="fa-solid fa-computer-mouse bt"></i>&nbsp;</label>
                     </div>
                  </td>
                </tr>
             </tfoot>
          </table>
       </div>

   
   </div>
</body>
</html>