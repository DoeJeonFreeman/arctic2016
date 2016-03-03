<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

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
	<script type="text/javascript" src="<c:url value="/js/bbs-view.js"/>"></script>
	
</head>
<body>
	<!-- header-->
	<div id="meHeader">
		<c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
	</div>
	
	<!--dateChoooooser--> 
	<header class="meControllPanel">
		<div class="container" align="left">
            <div class="row form-horizontal">
           		<div class="pull-right" style="padding-right:50px;"> 
	            	<ul id="breadcrumbs-one" class="pull-right vcenter" >
						<li><a href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
						<li><a>게시판</a></li>
						<li><a><spring:message code="bbs.board.${param.boardCd }"/></a></li>
					</ul>
            	</div>
            </div>
		        
		</div>
	</header>
	<!--dateChoooooser--> 
	
	
	<div class="container">
 		<section class="col-md-2 hidden-xs hidden-sm" style="padding-top:20px;">
			<ul id="leftnav" class="ul-left-nav fa-ul hidden-print">
	       		<li>
	            	<i class="fa fa-angle-double-right orange fa-fw"></i>
	            	<a href="<c:url value='/' />bbs/list?boardCd=notice&curPage=1">공지사항</a>
	          	</li>
	       		<li>
	            	<i class="fa fa-angle-double-right orange fa-fw"></i>
	            	<a href="<c:url value='/' />bbs/list?boardCd=anal&curPage=1">분석정보</a>
	          	</li>
	       		<li>
	            	<i class="fa fa-angle-double-right orange fa-fw"></i>
	            	<a href="<c:url value='/' />bbs/list?boardCd=refs&curPage=1">참고자료</a>
	          	</li>
			</ul>
		</section>

	<div class="container">

			<!-- contents begin -->
				<section class="col-md-9" style="min-height: 700px;">
		
		
					<div id="url-navi"><h5 class="glyphicon glyphicon-th"><spring:message code="bbs.board.${param.boardCd }" /></h5></div>
					
					<div id="bbs">
					
					<div class="view-menu" style="margin-bottom: 5px;">
					    <security:authorize access="! isAnonymous()">
						<!-- access="#userid == principal.username or hasRole('ROLE_ADMIN')" -->
					    <div class="fl">
					        <input type="button" value="<spring:message code="global.modify" />" class="goModify btn btn-primary btn-xs" /> 
					        <input type="button" value="<spring:message code="global.delete" />" class="goDelete btn btn-primary btn-xs" />
					    </div>
					    </security:authorize>        
					</div>
					
					<table>
					<tr>
					    <th style="width: 50px;text-align: left;vertical-align: top;">제목:</th>
					    <th style="text-align: left;color: #555;"><c:out value="${fn:escapeXml(title) }"/></th>
					</tr>
					</table>
					<div id="gul-content">
					    <span id="date-writer-hit">edited ${fn:escapeXml(regdate) } by ${fn:escapeXml(name) } hit ${fn:escapeXml(hit) }</span>
					    <p>${content}</p>
					    <p id="file-list" style="text-align: right">
					    	<c:forEach var="file" items="${attachFileList }" varStatus="status">
					    	
					    	    <a href="#" title="${fn:escapeXml(file.pseudoname) }" class="download">${fn:escapeXml(file.filename) }</a>
					    	    
								<security:authorize access="hasRole('ROLE_ADMIN')">
						    		<a href="#" title="${fn:escapeXml(file.attachFileNo) }">x</a>
								</security:authorize>
								<br />    	
							</c:forEach>
					    </p>
					</div>
					
					<form id="addCommentForm" action="addComment" method="post" style="margin-bottom: 10px;">
						<p style="margin: 0;padding: 0">
							<input type="hidden" name="articleNo" value="${param.articleNo }" />
							<input type="hidden" name="boardCd" value="${param.boardCd }" />
							<input type="hidden" name="curPage" value="${param.curPage }" />
							<input type="hidden" name="searchWord" value="${param.searchWord }" />
						</p>
						<security:authorize access="! isAnonymous()">
						    <div id="addComment">
						        <textarea name="memo" rows="7" cols="50"></textarea>
						    </div>
						    <div style="text-align: right;">
						        <input type="submit" value="<spring:message code="bbs.new.comments" />" class="btn btn-primary btn-xs"/>
						    </div>
					    </security:authorize>
					</form>
					
					<!--  comments begin -->
					<c:forEach var="comment" items="${commentList }" varStatus="status">
					<div class="comments">
					    <span class="writer">${comment.name }</span>
					    <span class="date">${comment.regdate }</span>
						<security:authorize access="isAuthenticated()">
					    <span class="modify-del">
					        <a href="#" class="comment-toggle"><spring:message code="global.modify" /></a> | 
					        <a href="#" class="comment-delete" title="${comment.commentNo }"><spring:message code="global.delete" /></a>
					    </span>
						</security:authorize>
					    <p class="view-comment">${fn:escapeXml(comment.memo) }</p>
					    <form class="modify-comment" action="updateComment" method="post" style="display: none;">
					    <p>
					        <input type="hidden" name="commentNo" value="${comment.commentNo }" />
					        <input type="hidden" name="boardCd" value="${param.boardCd }" />
					        <input type="hidden" name="articleNo" value="${param.articleNo }" />
					        <input type="hidden" name="curPage" value="${param.curPage }" />
					        <input type="hidden" name="searchWord" value="${param.searchWord }" />
					    </p>
					    <div style="text-align: right;">
					            <a href="#" class="comments-modify-submit"><spring:message code="global.submit" /></a> | <a href="#"><spring:message code="global.cancel" /></a>
					    </div>
					    <div>
					        <textarea class="modify-comment-ta" name="memo" rows="7" cols="50">${comment.memo }</textarea>
					    </div>
					    </form>
					</div>
					</c:forEach>
					<!--  comments end -->
					
					
					<div class="next-prev">
					    <c:if test="${nextArticle != null }">
					    <p><spring:message code="bbs.next.article" /> : <a href="#" title="${nextArticle.articleNo }">${fn:escapeXml(nextArticle.title) }</a></p>
					    </c:if>
					    <c:if test="${prevArticle != null }">
					    <p><spring:message code="bbs.prev.article" /> : <a href="#" title="${prevArticle.articleNo }">${fn:escapeXml(prevArticle.title) }</a></p>
					    </c:if>
					</div>
					
					<div class="view-menu" style="margin-bottom: 47px;">
					    <security:authorize access="isAuthenticated()">
					    <div class="fl">
					        <input type="button" value="<spring:message code="global.modify" />" class="goModify btn btn-primary btn-xs" />
					        <input type="button" value="<spring:message code="global.delete" />" class="goDelete btn btn-primary btn-xs" />
					    </div>
					    </security:authorize>        
					    <div class="fr">
							<c:if test="${nextArticle != null }">    
					        <input type="button" value="<spring:message code="bbs.next.article" />" title="${nextArticle.articleNo }" class="next-article  btn btn-primary btn-xs" />
							</c:if>
							<c:if test="${prevArticle != null }">        
					        <input type="button" value="<spring:message code="bbs.prev.article" />" title="${prevArticle.articleNo}" class="prev-article  btn btn-primary btn-xs" />
							</c:if>        
					        <input type="button" value="<spring:message code="global.list" />" class="goList btn btn-primary btn-xs" />
					        <security:authorize access="! isAnonymous()">
					        	<input type="button" value="<spring:message code="bbs.new.article" />" class="goWrite  btn btn-primary btn-xs" />
					        </security:authorize>
					    </div>
					</div>
					
					<!--  BBS list in detailed Article -->
					<table id="list-table">
					<tr>
						<th style="width: 60px;">번호</th>
						<th style="text-align: left;">제목</th>
						<th style="width: 84px;">등록일</th>
						<th style="width: 60px;">조회</th>
					</tr>
					
					<c:forEach var="article" items="${list }" varStatus="status">        
					<tr>
						<td style="text-align: center;">
						<c:choose>
							<c:when test="${param.articleNo == article.articleNo }"> 	
								<i class="fa fa-chevron-right"></i>
								<!-- 
								<img src="../images/arrow.gif" alt="<spring:message code="global.here" />" />
								 -->
							</c:when>
							<c:otherwise>
							${listItemNo - status.index }
							</c:otherwise>
						</c:choose>	
						</td>
						<td>
							<a href="#" title="${article.articleNo }">${fn:escapeXml(article.title) }</a>
							<c:if test="${article.attachFileNum > 0 }">	
								<i class="fa fa-paperclip fa-fw"></i>
							<!-- 
								<img src="../images/attach.png" alt="<spring:message code="global.attach.file" />" />
							 -->	
							</c:if>
							<c:if test="${article.commentNum > 0 }">		
							<span class="bbs-strong">[${article.commentNum }]</span>
							</c:if>		
						</td>
						<td style="text-align: center;">${article.regdateForList }</td>
						<td style="text-align: center;">${article.hit }</td>
					</tr>
					</c:forEach>
					</table>
					                
					<div id="paging">
						<c:if test="${prevPage > 0 }">
							<a href="#" title="${prevPage }">[<spring:message code="global.prev" />]</a>
						</c:if>
						
						<c:forEach var="i" begin="${firstPage }" end="${lastPage }">
							<c:choose>
								<c:when test="${param.curPage == i }">
									<span class="bbs-strong">${i }</span>
								</c:when>	
								<c:otherwise>	
									<a href="#" title="${i }">${i }</a>
								</c:otherwise>
							</c:choose>			
						</c:forEach>
						
						<c:if test="${nextPage > 0 }">	
							<a href="#" title="${nextPage }">[<spring:message code="global.next" />]</a>
						</c:if>
					</div>
					
					<div id="list-menu">
						<security:authorize access="! isAnonymous()">
							<input type="button" value="<spring:message code="bbs.new.article" />" class=" btn btn-primary btn-xs"/>
						</security:authorize>
					</div>
					
					<div id="search">
						<form action="list" method="get">
						<p style="margin: 0;padding: 0;">
							<input type="hidden" name="boardCd" value="${param.boardCd }" />
							<input type="hidden" name="curPage" value="1" />
							<input type="text" name="searchWord" size="15" maxlength="30" />
							<input type="submit" value="<spring:message code="global.search" />" class=" btn btn-primary btn-xs"/>
						</p>
						</form>
					</div>
					
					</div><!-- #bbs end -->
<!-- contents end -->
			</section>

		<!-- #content end 
		</div>
		-->
		
		
	</div>
	<!-- #container end -->
</div>	
		<div id="meFooter">
			<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
		</div>

	<!-- display none none none none -->
	<div id="form-group" style="display: none">
		<form id="listForm" action="list" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="viewForm" action="view" method="get">
			<p>
				<input type="hidden" name="articleNo" /> <input type="hidden"
					name="boardCd" value="${param.boardCd }" /> <input type="hidden"
					name="curPage" value="${param.curPage }" /> <input type="hidden"
					name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="writeForm" action="write_form" method="get">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="modifyForm" action="modify_form" method="get">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="delForm" action="del" method="post">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="deleteCommentForm" action="deleteComment" method="post">
			<p>
				<input type="hidden" name="commentNo" /> <input type="hidden"
					name="articleNo" value="${param.articleNo }" /> <input
					type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="deleteAttachFileForm" action="deleteAttachFile"
			method="post">
			<p>
				<input type="hidden" name="attachFileNo" /> <input type="hidden"
					name="articleNo" value="${param.articleNo }" /> <input
					type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="downForm" action="../file/download" method="post">
			<p>
				<input type="hidden" name="filename" />
				<input type="hidden" name="pseudoname" />
			</p>
		</form>
	</div>
	
</body>
</html>