<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title> 로그인</title>
	
	
	<script src="<c:url value="/js/jquery/jquery-1.9.1.js"/>"></script>	
    <script src="<c:url value="/mestrap/js/bootstrap.min.js"/>"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/mestrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/mestrap/css/modern-business.css"/>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/mestrap/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">


	
<script type="text/javascript">
function actionLogin() {
    if (document.loginForm.userid.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.userpw.value =="") {
        alert("비밀번호를 입력하세요");
        return false;
    } else {
        document.loginForm.action="<c:url value='/uat/me_authentication'/>";
        document.loginForm.submit();
    }
}


function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("arcticSeaIceUser", form.id.value, expdate);
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("arcticSeaIceUser")) != "");
}

function fnInit() {
//    var message = document.loginForm.msg.value;
//    if (message != "") {
//        alert(message);
//    }
    getid(document.loginForm);
}
</script>
</head>
<body  onload="fnInit();">

<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    

<!-- 전체 레이어 시작 -->
   <!-- header-->
	<div id="meHeader">
	    <c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
	</div>
	
	
	
	<div class="container" style="padding:100px 0;"  >
            <div class="col-md-4 meCenter">
                    <h3><i class="fa fa-lock"></i> Log in</h3>
                    
                    <p>Enter your username and password to log on:
	                <c:if test="${not empty param.msg }">
						<h3 style="color:#F00000;">${SPRING_SECURITY_LAST_EXCEPTION.message }</h3>
					</c:if>
                    </p>
                <form:form name="loginForm" method="post">
                    <div class="form-group">
                  	    <label class="sr-only" for="userid">Username</label>
                   		<input type="text" id="userid" name="j_username" placeholder="Username..." class="form-username form-control">
                    </div>
                   	
                    <div class="form-group">
                   		<label class="sr-only" for="userpw">Password</label>
                   	 	<input type="password"  id="userpw" name="j_password" placeholder="Password..." class="form-password form-control"
                     		onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }">
                    </div>
                    
                    
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="checkId" onclick="javascript:saveid(this.form);" id="checkId"/>ID저장
                        </label>
                    </div>
                    <button id="loginBtn" class="btn btn-sm btn-primary btn-block" onclick="javascript:actionLogin()">Log in</button>
                </form:form>
                     
                    <!-- 
                      <form:form name="loginForm" method="post">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="userid">Username</label>
	                        	<input type="text" id="userid" name="j_username" placeholder="Username..." class="form-username form-control">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="userpw">Password</label>
	                        	<input type="password"  id="userpw" name="j_password" placeholder="Password..." class="form-password form-control"
	                        		onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }">
	                        </div>
	                        <button class="btn" onclick="javascript:actionLogin()">Log in!!</button>
	                        <input type="checkbox" name="checkId" onclick="javascript:saveid(this.form);" id="checkId" /><label for="checkId">ID저장</label>
	                    </form:form>
                     -->
          </div>
        </div>
	
	
	
	  <!-- login form 
        <div id="loginWrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h2>Login Form</h2>
                            <div class="description">
                            	<p>
	                            	demo.<a href="http://seaice.nimr.go.kr"><strong>seaice</strong></a>.go.kr
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Login to Demo.seaice.kma.go.kr</h3>
                            		<p>Enter your username and password to log on:
						                <c:if test="${not empty param.msg }">
											<h3 style="color:#F00000;">${SPRING_SECURITY_LAST_EXCEPTION.message }</h3>
										</c:if>
                            		</p>
                            		 
									
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form:form name="loginForm" method="post">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="userid">Username</label>
			                        	<input type="text" id="userid" name="j_username" placeholder="Username..." class="form-username form-control">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="userpw">Password</label>
			                        	<input type="password"  id="userpw" name="j_password" placeholder="Password..." class="form-password form-control"
			                        		onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }">
			                        </div>
			                        <button class="btn" onclick="javascript:actionLogin()">Log in!!</button>
			                        <input type="checkbox" name="checkId" onclick="javascript:saveid(this.form);" id="checkId" /><label for="checkId">ID저장</label>
			                    </form:form>
		                    </div>
                        </div>
                    </div>
                    
                </div>
        </div>
	
	-->
	
	
	
            
    <div id="meFooter">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>	 	
	
            
</body>
</html>
