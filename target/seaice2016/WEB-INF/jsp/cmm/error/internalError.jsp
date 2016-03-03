<%--
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
</head>

<body>

<div class="container">
	<!-- 
	<div class="col-xs-12 text-center page-404">
		<h1>Error 404</h1>
		<form class="form-inline" role="form">
			<h3>Page not found</h3>
			<a href="../index_v1.html" class="btn btn-default btn-label-left"><span><i class="fa fa-reply"></i></span> Go to Dashboard</a>
		</form>
	</div>
	 -->
	
		<div id="page-500" class="col-xs-12 text-center">
			<img src="<c:url value="/mestrap/assets/ci/kma_kr_with_systemName_onErr.png" />" alt=""  style="padding-top: 100px;padding-bottom:55px" />
			<h1>Error 500</h1>
			<h3>Internal Server Error</h3>
			<a href="<c:url value='/cmm/main/mainPage.do'/>" class="btn btn-default btn-label-left"><span><i class="fa fa-reply"></i></span> Go to Main</a>
		</div>
</div>


<script type="text/javascript">
$(document).ready(function() {
	$('html').animate({scrollTop: 0},'slow');});
</script>

</body>
</html>
