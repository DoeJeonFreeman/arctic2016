<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>북극해빙감시시스템</title>
	
	<script src="<c:url value="/js/jquery/jquery-1.9.1.js"/>"></script>	
    <script src="<c:url value="/mestrap/js/bootstrap.min.js"/>"></script> 
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/mestrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/mestrap/css/modern-business.css"/>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/mestrap/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">

    
    
    <script type="text/javascript">
		//<![CDATA[ 
		
		function check() {
		    //var form = document.getElementById("signUpForm");
		    //TODO Validation 
		    return true;
		}
		
		//]]> 
	</script>
	
	<style type="text/css">
		input{
			color:#000000;
		}
	</style>
</head>

<body>
	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
<!-- 전체 레이어 시작 -->

	<!-- header-->
	<div id="meHeader">
	    <c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
	</div>
	

    <!-- Page Content -->
    <div class="contentWrapper">
		<div id="container">
			<div id="content" style="min-height: 800px;">
				<!-- contents begin -->
				<div id="url-navi">SignUp TestRunner.run()</div>
				<h1>brypt</h1>
				<sf:form id="signUpForm" action="signUp" method="post" commandName="user" onsubmit="return check();">
				<sf:errors path="*" cssClass="error" />
				<table>
				<tr>
					<td style="width: 200px;">USERID</td>
					<td style="width: 390px;">
						<sf:input path="userid" /><br />
						<sf:errors path="userid" cssClass="error" />
					</td>
				</tr>
				
				<tr>
					<td>NAME</td>
					<td>
						<sf:input path="name" /><br />
						<sf:errors path="name" cssClass="error" />
					</td>
				</tr>
				
				<tr>
					<td>USERPW</td>
					<td>
						<sf:password path="userpw" /><br />
						<sf:errors path="userpw" cssClass="error" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;font-weight: bold;">
						user.signup.warning
					</td>
				</tr>
				<tr>
					<td>global.confirm</td>
					<td><input type="password" name="confirm" /></td>
				</tr>
				<tr>
					<td>EMAIL</td>
					<td>
						<sf:input path="email" /><br />
						<sf:errors path="email" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td>MOBILE</td>
					<td>
						<sf:input path="mobile" /><br />
						<sf:errors path="mobile" cssClass="error" />
					</td>
				</tr>
				</table>
				<div style="text-align: center;padding-bottom: 15px;">
					<input type="submit" value=" global.submit" />
				</div>
				</sf:form>
				<!-- contents end -->			
			</div>
		</div>
    </div>
    <!-- /contents wrapper -->
	
    <!-- Footer-->
	<div id="meFooter">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>
	

<!-- //전체 레이어 끝 -->
</body>
</html>

