<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="<spring:message code="bbs.modify.keywords" />" />
<meta name="Description" content="<spring:message code="bbs.modify.description" />" />

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
    //var form = document.getElementById("modifyForm");
    //TODO Validation 
    return true;
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
			<h2><spring:message code="global.modify" /></h2>
			<sf:form id="modifyForm" action="modify" method="post" commandName="article" 
				enctype="multipart/form-data" onsubmit="return check()">
			<p style="margin: 0;padding: 0;">
			<input type="hidden" name="articleNo" value="${param.articleNo }" />
			<input type="hidden" name="boardCd" value="${param.boardCd }" />
			<input type="hidden" name="curPage" value="${param.curPage }" />
			<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
			<sf:errors path="*" cssClass="error"/>
			<table id="write-form">
			<tr>
			    <td><spring:message code="global.title" /></td>
			    <td>
			    	<sf:input path="title" style="width: 90%" value="${article.title }" /><br />
			    	<sf:errors path="title" cssClass="error" />
			    </td>
			</tr>
			<tr>
			    <td colspan="2">
			        <textarea name="content" rows="17" cols="50">${article.content }</textarea><br />
			        <sf:errors path="content" cssClass="error" />
			    </td>
			</tr>
			<tr>
			    <td><spring:message code="global.attach.file" /></td>
			    <td><input type="file" name="attachFile" /></td>
			</tr>
			</table>
			<div style="text-align: center;padding-bottom: 15px;">
			    <input type="submit" value="<spring:message code="global.submit" />" class="btn btn-primary btn-xs"/>
			    <input type="button" value="<spring:message code="global.cancel" />" onclick="goView()" class="btn btn-primary btn-xs"/>
			</div>
			</sf:form>
			</div>
			<!-- contents end -->
					
					</div>
			    </div>
			    
		<div id="meFooter">
			<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
		</div>
		
		        
			
			<div id="form-group" style="display: none">
			    <form id="viewForm" action="view" method="get">
			    <p>
			        <input type="hidden" name="articleNo" value="${param.articleNo }" />
			        <input type="hidden" name="boardCd" value="${param.boardCd }" />
			        <input type="hidden" name="curPage" value="${param.curPage }" />
			        <input type="hidden" name="searchWord" value="${param.searchWord }" />
			    </p>
			    </form>
			</div>

</body>
</html>