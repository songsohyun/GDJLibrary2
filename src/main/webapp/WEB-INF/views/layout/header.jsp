<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/header.css">
</head>
<body>

   <!-- 로그인 이전에 보여줄 링크 -->
   <c:if test="${loginMember eq null}">
      <header class="clearfix">
           <div class="container">
               <ul>
                   <li><a href="${contextPath}/member/loginPage">로그인</a></li>
               <li><a href="${contextPath}/member/agreePage">회원가입</a></li>
               </ul>
           </div>
       </header>
   </c:if>
   <!-- 로그인 이후에 보여줄 링크 --> 
   <c:if test="${loginMember ne null}">
      
      <header class="clearfix">
           <div class="container">
               <ul>
                <li class="aeq">${loginMember.memberName}님</li>
                <li><a href="${contextPath}/member/logout">로그아웃</a></li>
               <li><a href="${contextPath}/member/myPage">마이페이지</a></li>
               </ul>
   
           </div>
          
    </header>
   </c:if>
   <section class="clearfix2">

   <div id="logo"><a href="${contextPath}/"><img width="150px" src="${contextPath}/resources/images/logo3.png" ></a></div>


    <div class="container2">
        <ul>
            <li><a href="${contextPath}/book/listPage">도서관리</a></li>
            <li><a href="${contextPath}/returned/returnedBookPage">반납하기</a></li>
            <li><a href="${contextPath}/notice/noticePage">공지사항</a></li>
            <li><a href="${contextPath}/qaa/qaaPage">질문과답변</a></li>
            <li><a href="${contextPath}/fnq/fnqPage">자주하는질문</a></li>
            <li><a href="${contextPath}/seat/seatAgreePage">열람실이용</a></li>
        </ul>
    </div>
   </section>
  
   
   
</body>
</html>