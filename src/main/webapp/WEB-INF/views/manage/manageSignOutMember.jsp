<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/manageSignOutMember.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../resources/css/manageSignOutMember.css">
</head>
<body>
	
	
	
	<div class="form-group">
    <select id="pageUnit" name="pageUnit" onchange="Change(1)">
        <option value="">:::선택:::</option>
        <option value="10">10명씩 보기</option>			
        <option value="20">20명씩 보기</option>
        <option value="30">30명씩 보기</option>
        <option value="40">40명씩 보기</option>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;
    페이지별검색수: ${value}        
	&nbsp;&nbsp;
	탈퇴회원수: ${totalRecord}명
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="전체 탈퇴 회원 조회" id="btnSearchAll">&nbsp;&nbsp;&nbsp;<input type="button" value="관리자 메인 페이지" id="btnManageMain">
	</div>
	
	<br>	
				
	<form id="f" action="/admin/removeCheckSignOutMember?value=${value}" method="post">
		<table border="1" class="table">
			<thead>
				<tr>
					<th width="1%" height="50%"><input type="checkbox" name="checkAll" class="blind checkAll" id="checkAll"></th>
					<th width="5%">번호</th>
					<th width="9%">이름</th>
					<th width="15%">전화번호</th>
					<th width="20%">이메일</th>
					<th width="30%">주소</th>
					<th width="">회원가입일</th>
					<th width="8%">회원삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members}" var="member" varStatus="vs">
					<tr>
						<td><input type="checkbox" name="check" class="blind checkOne" value="${member.memberNo}"></td>
						<td>${beginNo - vs.index}</td>
						<td><a href="/admin/detailSignOutMember?memberNo=${member.memberNo}&value=${value}">${member.memberName}</a></td>
						<td>${member.memberPhone}</td>
						<td>${member.memberEmail}</td>
						<td>${member.memberRoadAddress}</td>
						<td>${member.memberSignUp}</td>					
						<td><a href="/admin/removeSignOutMember?memberNo=${member.memberNo}&value=${value}" onclick="return confirm('정말 삭제하시겠습니까?')"><i class="fa-solid fa-circle-xmark"></i></a></td>					
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="tfoot">
					<td colspan="8" id="tfoot">
						${paging}
					</td>
				</tr>
			</tfoot>
		</table>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="return confirm('정말 삭제하시겠습니까?')">회원 선택 삭제</button>
	</form>
	
	<div id="search">
		<div id="search_inner">
			<form id="searchForm" method="get">
				<span id="selectSection">
					<select name="column" id="column">
						<option value="">:::선택:::</option>
						<option value="MEMBER_NAME">이름</option>
						<option value="MEMBER_PHONE">전화번호</option>
						<option value="MEMBER_ROAD_ADDRESS">주소</option>
						<option value="MEMBER_SIGN_UP">가입일자</option>
					</select>
				</span>
				<span id="equalArea">
					<input type="text" name="query" id="query" list="autoComplete">
					<datalist id="autoComplete"></datalist>
				</span>
				<span id="rangeArea">
					<input type="text" name="begin" id="begin">
					~
					<input type="text" name="end" id="end">
				</span>
				<span id="btnSearchSection">
					<input type="button" value="검색" id="btnSearch">
				</span>
			</form>
		</div>
	</div>
</body>
</html>







