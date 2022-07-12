<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/adminHeader.css">
</head>
<body>

   <!-- 로그인 이전에 보여줄 링크 -->
   <c:if test="${loginMember eq null}">
      <header class="clearfix">
           <div class="container">
               <ul>
                   <li><a href="/member/loginPage">로그인</a></li>
               <li><a href="/member/agreePage">회원가입</a></li>
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
                <li><a href="/member/logout">로그아웃</a></li>
               <li><a href="/member/myPage">마이페이지</a></li>
               </ul>
           </div>
          
    </header>
   </c:if>
   <section class="clearfix2">
    	
	    <div class="container2">
	        <ul>
	            <li><a href="/admin/listMember?value=5">활동회원관리</a></li>
	            <li><a href="/admin/listDormantMember?value=5">휴면회원관리</a></li>
	            <li><a href="/admin/listSignOutMember?value=5">탈퇴회원관리</a></li>
	            <li><a href="/admin/listBook?value=5">도서관리</a></li>
	            <li><a href="/fnq/fnqWrite">FAQ 글쓰기</a></li>
	            <li><a href="/">메인홈페이지이동</a></li>
	        </ul>
	    </div>
   </section>
   
   
</body>
</html>