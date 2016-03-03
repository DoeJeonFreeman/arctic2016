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
   
<title>북극해빙감시시스템 로그인</title>

<script type="text/javascript">
function actionLogin() {
    if (document.loginForm.userid.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.userpw.value =="") {
        alert("비밀번호를 입력하세요");
        return false;
    } else {
       // document.loginForm.action="<c:url value='/login/auth.do'/>";
        document.loginForm.submit();
    }
}

</script>
</head>



<body >
	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<!-- 
 -->	
	<div id="myModal" class="modal fade" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">demo.seaice.go.kr</h4>
                </div>
                
                <c:if test="${not empty param.login_error }">
					<h2>${SPRING_SECURITY_LAST_EXCEPTION.message }</h2>
				</c:if>
				
                <div class="modal-body">
	                <form:form name="loginForm" method="post" action="../../j_spring_security_check">
	                <!-- 
	                	<div class="form-group">
			           		<p><input type="text"  name="eid" id="email" placeholder="Email"></p>
			           		<p><input type="password" class="span3" name="passwd" placeholder="Password"></p>
			           		<p><button type="submit" class="btn btn-primary">Sign in</button>
			             		<a href="#">Forgot Password?</a>
			           		</p>
	                	</div>
	                 -->
	                 	<div class="form-group">
                            <label for="userid" class="control-label">ID:</label>
                            <input type="text" id="userid" name="j_username" class="form-control" placeholder="ID goes here">
                        </div>
                        <div class="form-group">
                            <label for="userpw"  class="control-label">PW:</label>
                            <input type="password" id="userpw" name="j_password" class="form-control" placeholder="Password"
                            	onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }">
                        </div>
                        <p>
                        	<button class="btn btn-primary" onclick="javascript:actionLogin()">Sign in</button>
		             		<a href="#">Forgot Password?</a>
		           		</p>
		           		<input type="hidden" name="message" value="${message}" />
		         	</form:form>
               
                </div>
                <div class="modal-footer">
	                New to SEAICE.GO.KR?
	       			<a href="#" class="btn btn-primary">Register</a>
                </div>
            </div>
        </div>
	</div>
 
</body>
</html>
