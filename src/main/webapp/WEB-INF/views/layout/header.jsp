<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .container {
   width: 1140px;
   margin: 0 auto;
	}
	.clearfix {
	   position: fixed;
	   top: 0;
	   left: 0;
	   right: 0;
	   background-color: #fffcf7;
	}
	
	.clearfix ul {
	   float: right;
	   margin-right: 50px;
	}
	
	.clearfix ul li {
	   float: left;
	   list-style: none;
	   margin-left: 20px;
	}
	
	.clearfix ul li a {
	   color: #14357a;
	   text-decoration: none;
	   line-height: 30px;
	   font-weight: bold;
	}
	
	.aeq {
	   color: #14357a;
	   text-decoration: none;
	   line-height: 30px;
	}
</style>
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
   
   
</body>
</html>