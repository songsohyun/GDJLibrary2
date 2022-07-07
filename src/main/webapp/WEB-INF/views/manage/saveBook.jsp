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
	.ok {
		color: limegreen;
	}
	.dont {
		color: crimson;
	}
	
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
    }
	ul, li {
	  list-style: none;
	}
	a {
	  text-decoration: none;
	  color: inherit;
	}        
	.register{
	            width: 550px;
	            margin: 200px auto 0;
	            padding: 15px 20px;
            background: white;
            color: #2b2e4a;
            font-size: 14px;
            text-align: left;
            box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    }
    .register h3{
        font-size: 20px;
        margin-bottom: 20px;
        text-align: center;
    }
    .register input{
        width: 100%;
        height: 40px;
        outline: none;
        padding: 10px;
        border: 1px solid #707070;
        transition: 0.3s;
    }
    .register input:valid, .register input:focus{
        border: 1px solid #2b2e4a;
    }
    .register .center{
        display: flex;
        align-items: center;
    }
    .register .flex{
        display: flex;
        flex-direction: column;
    }
    .register .flex .container{
        display: grid;
        grid-template-columns: 1fr 3fr 1fr;
        margin-bottom: 10px;
    }
    .register .flex .container .item:first-child{
       margin-right: 10px;
    }
    .register .flex .container .item .idcheck{
        height: 100%;
        margin-left: 10px;
        padding: 5px 15px;
        background: #2b2e4a;
        border: 1px solid #2b2e4a;
        color: white;
        font-size: 12px;
        transition: 0.3s;
    }
    .register .flex .container .item .idcheck:hover{
        background: white;
        color: #2b2e4a;
    }
    .register .flex .container .item select{
        height: 40px;
        padding: 10px;
        border: 1px solid #2b2e4a;
    }
    .register .submit{
        width: 100%;
        height: 40px;
        color: white;
        border: none;
        border: 1px solid #2b2e4a;
        background: #2b2e4a;
        transition: 0.3s;
    }
    .register .flex .container:last-child{
        margin: 0;
    }
    .register .submit:hover{
        width: 100%;
        height: 40px;
        border: none;
        border: 1px solid #2b2e4a;
        color: #2b2e4a;
        background: white;
    }
	
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	
	// 페이지 로드 이벤트
	$(function(){
	
		fnIsbnCheck();
		fnBookAdd();
	})
	
	
	// 함수
	
	// 2. 책추가
	function fnBookAdd(){
		$('#f').on('submit', function(event){
			if($('#isbn').val() == '' || $('#title').val() == '' || $('#author').val() == '' || $('#publisher').val() == '' || $('#pubdate').val() == '' || $('#description').val() == '' || $('#image').val() == '' || $('#field').val() == ''){
				alert('내용을 모두 입력해주세요.');
				event.preventDefault();
				return false;
			} else if(isbnOverlapPass == false){
				alert('이미 등록된 ISBN입니다.');
				event.preventDefault();
				return false;
			} 
			return true;
		})
	}

	
	// 1. ISBN 정규식 & 중복체크
	let isbnOverlapPass = false;
	function fnIsbnCheck(){
		$('#isbn').on('keyup', function(){
			// 정규식 체크하기
			let regIsbn = /^[0-9-.=]{1,16}$/;  
			if(regIsbn.test($('#isbn').val())==false){
				$('#isbnMsg').text('ISBN은 숫자 또는 특수문자(- . =) 1~16자 입니다.').addClass('dont').removeClass('ok');
				isbnPass = false;
				return;
			}
			
			// isbn 중복 체크
			$.ajax({
				url: '${contextPath}/admin/checkBookByIsbn',
				type: 'get',
				data: 'isbn=' + $('#isbn').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						$('#isbnMsg').text('멋진 Isbn이네요!').addClass('ok').removeClass('dont');
						isbnOverlapPass = true;
					} else {
						$('#isbnMsg').text('이미 사용중인 ISBN입니다.').addClass('dont').removeClass('ok');
						isbnOverlapPass = false;
					}
				},
				error: function(jqXHR){
					$('#isbnMsg').text(jqXHR.responseText).addClass('dont').removeClass('ok');
					isbnPass = true;
					isbnOverlapPass = false;
				}
			})
		})
	}
	
	
</script>
</head>
<body>
	
	<div class="register">
        <h3>책추가</h3>
        <form id="f" action="${contextPath}/admin/saveBook?value=${value}" method="post">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        ISBN
                    </li>
                    <li class="item">
                        <input type="text" name="isbn" id="isbn" placeholder="ISBN을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                   
                    <li class="item center">
                        제목
                    </li>
                    <li class="item">
                        <span id="idMsg"></span>
                        <input type="text" name="title" id="title" placeholder="제목을 입력하세요.">
                    </li>
                  	<li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                
                    <li class="item center">
                    	    
                    </li>
                    <li class="item">
                        <span id="pwMsg"></span>
                        <input type="password" id="pwConfirm" name="pwConfirm" placeholder="비밀번호를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    
                    <li class="item center">
                         이름
                    </li>
                    <li class="item">
                        <span id="pwConfirmMsg"></span>
                        <input type="text" name="name" id="name" placeholder="이름을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        전화번호
                    </li>
                    <li class="item">
                       <input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요.">
                    </li>
                     <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    
                    <li class="item center">
                        이메일
                    </li>
                    <li class="item">
                        <span id="phoneMsg"></span>
                        <input type="text" name="email" id="email" placeholder="이메일을 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        우편번호
                    </li>
                    <li class="item">
                        <span id="emailMsg"></span>
                        <input type="text" name="postcode" id="postcode" placeholder="우편번호를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                 <ul class="container">
                    <li class="item center">
                        도로명 주소
                    </li>
                    <li class="item">
                        <span id="emailMsg"></span>
                        <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명 주소를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                 <ul class="container">
                    <li class="item center">
                        상세주소
                    </li>
                    <li class="item">
                        <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소를 입력하세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit">추가하기</button>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>
	
	<h1>책추가화면</h1>
	
	<form id="f" action="${contextPath}/admin/saveBook?value=${value}" method="post">
		<label for="isbn">
			ISBN<br>
			<input type="text" name="isbn" id="isbn"><br>
			<span id="isbnMsg"></span>
		</label><br><br>
		<input type="text" name="title" id="title" placeholder="제목"><br>
		<input type="text" name="author" id="author" placeholder="작가"><br>
		<input type="text" name="publisher" id="publisher" placeholder="출판사"><br>
		<input type="text" name="pubdate" id="pubdate" placeholder="출판날짜"><br>
		<input type="text" name="description" id="description" placeholder="설명"><br>
		<input type="text" name="image" id="image" placeholder="이미지주소"><br>
		<input type="text" name="field" id="field" placeholder="분야"><br>
		<button>작성완료</button>
	</form>
	
</body>
</html>