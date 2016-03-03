<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

	<script src="<c:url value="/js/jquery/jquery-1.9.1.js"/>"></script>	
    <script src="<c:url value="/mestrap/js/bootstrap.min.js"/>"></script>
	
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/mestrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/mestrap/css/modern-business.css"/>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/mestrap/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/screen.css" type="text/css" />
	
<script type="text/javascript">
//<![CDATA[
           
function check() {
    //var form = document.getElementById("writeForm");
    //TODO Validation login add 
    return true;
}

function goList() {
    var form = document.getElementById("listForm");
    form.submit();
}

function goView() {
    var form = document.getElementById("viewForm");
    form.submit();
}

//]]>                    
</script>
</head>
<body>

<!-- header-->
<div id="meHeader">
    <c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
</div>


<div class="container">
	<div id="content" class="row" style="min-height: 800px;">

<!--  contents begin -->
<div id="url-navi">BBS</div>
<h1><spring:message code="bbs.board.${param.boardCd }" /></h1>
<div id="bbs">
<h2><spring:message code="bbs.new.article" /></h2>
<sf:form id="writeForm" action="write" method="post" commandName="article" enctype="multipart/form-data" onsubmit="return check();">
<p style="margin: 0;padding: 0;">
<input type="hidden" name="boardCd" value="${param.boardCd }" />
<input type="hidden" name="articleNo" value="${param.articleNo }" />
<input type="hidden" name="curPage" value="${param.curPage }" />
<input type="hidden" name="searchWord" value="${param.searchWord }" />
</p>
<sf:errors path="*" cssClass="error" />
<table id="write-form">
<tr>
    <td><spring:message code="global.title" /></td>
    <td>
    	<sf:input path="title" style="width: 90%" /><br />
    	<sf:errors path="title" cssClass="error" />
    </td>
</tr>
<tr>
    <td colspan="2">
        <textarea name="content" rows="17" cols="50"></textarea><br />
        <sf:errors path="content" cssClass="error" />
    </td>
</tr>
<tr>
    <td><spring:message code="global.attach.file" /></td>
    <td><input type="file" name="attachFile" /></td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="submit" value="<spring:message code="global.submit" />" />
    <input type="button" value="<spring:message code="global.list" />" onclick="goList()" />
    <c:if test="${not empty param.articleNo }">    
    <input type="button" value="<spring:message code="bbs.back.to.article" />" onclick="goView()" />
    </c:if>
</div>
</sf:form>
</div>
<!-- contents end -->

		</div>
</div>

	<div id="meFooter">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>



<!-- invisible form  -->
<div id="form-group" style="display: none">
    <form id="viewForm" action="view" method="get">
    <p>
        <input type="hidden" name="articleNo" value="${param.articleNo }" />
        <input type="hidden" name="boardCd" value="${param.boardCd }" />
        <input type="hidden" name="curPage" value="${param.curPage }" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
    </p>
    </form>
    <form id="listForm" action="list" method="get">
    <p>
        <input type="hidden" name="boardCd" value="${param.boardCd }" />
        <input type="hidden" name="curPage" value="${param.curPage }" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
    </p>
    </form>   
</div>

</body>
</html>