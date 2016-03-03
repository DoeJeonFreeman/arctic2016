<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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


<!--
여기에 버튼액션 정의하자 
	<script type="text/javascript" src="<c:url value="/js/bbs-view.js"/>"></script>
 -->

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/screen.css" type="text/css" />

	<script type="text/javascript">
		//<![CDATA[
		function goList(curPage) {
			var form = document.getElementById("listForm");
			form.curPage.value = curPage;
			form.submit();
		}
		
		function goView(articleNo) {
			var form = document.getElementById("viewForm");
			form.articleNo.value = articleNo;
			form.submit();
		}
		
		function goWrite() {
			var form = document.getElementById("writeForm");
			form.submit();
		}
		//]]>
	</script>           
	
	
	
	<style>
		.blogShort{ border-bottom:1px solid #ddd;}
		.add{background: #333; padding: 10%; height: 100%;}
		.nav-sidebar { 
		    width: 100%;
		    padding: 30px 0; 
		    border-right: 1px solid #eee;
		}
		.nav-sidebar a {
		    color: #333;
		    -webkit-transition: all 0.08s linear;
		    -moz-transition: all 0.08s linear;
		    -o-transition: all 0.08s linear;
		    transition: all 0.08s linear;
		}
		.nav-sidebar .active a { 
		    cursor: default;
		    background-color: #0b56a8; 
		    color: #fff; 
		}
		.nav-sidebar .active a:hover {
 		   background-color: #0b56a8;   
		}
		.nav-sidebar .text-overflow a,
		.nav-sidebar .text-overflow .media-body {
		    white-space: nowrap;
		    overflow: hidden;
		    -o-text-overflow: ellipsis;
		    text-overflow: ellipsis; 
		}
		

		.ul-left-nav>li{
			padding-bottom:7px;
		}

	</style>
	
	
	
	
</head>
<body>







<!-- header-->
<div id="meHeader">
    <c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
</div>
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<header class="meControllPanel">
		<div class="container" align="left">
            <div class="row form-horizontal">
            	 <!-- 
            	 <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5 demo vcenter">
		            <div data-tip="최근 데이터 생산일">
		            	<input type="text" id="meDemo" class="form-control" readonly="readonly" 
		            		style="cursor:default;"	value="${extSeries.compbegindate4Cal}" >
		            	<i class="glyphicon-calendar fa fa-calendar" style="cursor:default"></i>
		            </div>
		          </div>
            	  -->
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
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	




<div class="container">
 		<section class="col-md-2 hidden-xs hidden-sm" style="padding-top:20px;">
			<ul id="leftnav" class="ul-left-nav fa-ul hidden-print">
	       		<li>
	            	<i class="fa fa-angle-double-right orange fa-fw"></i>
	            	<a href="<c:url value='/' />bbs/list?boardCd=notice&curPage=1" >공지사항</a>
	          	</li>
	       		<li>
	            	<i class="fa fa-angle-double-right orange fa-fw"></i>
	            	<a href="<c:url value='/' />bbs/list?boardCd=anal&curPage=1" >분석정보</a>
	          	</li>
	       		<li>
	            	<i class="fa fa-angle-double-right orange fa-fw"></i>
	            	<a href="<c:url value='/' />bbs/list?boardCd=refs&curPage=1" >참고자료</a>
	          	</li>
			</ul>
		</section>
<!-- 
 -->
 		
 <!-- 
 		<section class="col-sm-2">
    		<nav class="nav-sidebar">
				<ul class="nav tabs">
		          <li class="active"><a href="#tab1" data-toggle="tab">공지사항</a></li>
		          <li class=""><a href="#tab2" data-toggle="tab">분석정보</a></li>
		          <li class=""><a href="#tab3" data-toggle="tab">참고자료</a></li>                               
				</ul>
			</nav>
		</section>
 
		<section class="col-md-2">
			<ul id="leftnav" class="ul-left-nav fa-ul hidden-print">
            	<li class="separator">
            		<a class="separator" href="index.php">게시판            </a>
          		</li>
                <li>
            		<i class="fa fa-angle-double-right orange fa-fw"></i>
            		<a href="/legal/" target="_self">공지사항            </a>
            	</li>	
                <li>
            		<i class="fa fa-angle-double-right orange fa-fw"></i>
            		<a href="/legal/" target="_self">분석정보            </a>
            	</li>	
                <li>
            		<i class="fa fa-angle-double-right orange fa-fw"></i>
            		<a href="/legal/" target="_self">참고자료            </a>
            	</li>	
            </ul>
		</section>
  -->
		
		<section class="col-md-9" style="min-height: 700px;">
		
		<!-- 
			<div id="content" class="row" style="min-height: 800px;">
		 -->
				<div id="url-navi"><h5 class="glyphicon glyphicon-th"><spring:message code="bbs.board.${param.boardCd }" /></h5></div>
				<!-- 
				<h4 class="glyphicon glyphicon-th-large"><spring:message code="bbs.board.${param.boardCd }" /></h4>
				 -->
				<p></p>
				<div id="bbs">
					<!-- BBS Headings -->
					<table>
						<tr>
							<th style="width: 60px;">번호</th>
							<th style="text-align: left;">제목</th>
							<th style="width: 84px;">등록일</th>
							<th style="width: 60px;">조회</th>
						</tr>
						<!--  bbs list begin-->
						<c:forEach var="article" items="${list }" varStatus="status">	
						<tr>
							<td style="text-align: center;">${listItemNo - status.index}</td>
							<td>
								<a href="javascript:goView('${article.articleNo }')">${fn:escapeXml(article.title) }</a>
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
					<!--  bbs list end -->
					</table>
					
					<div id="paging">
						
						<c:if test="${prevPage > 0 }">
							<a href="javascript:goList('${prevPage }')">[<spring:message code="global.prev" />]</a>
						</c:if>
				
						<c:forEach var="i" begin="${firstPage }" end="${lastPage }" varStatus="stat">
							<c:choose>
							<c:when test="${param.curPage == i}">
								<span class="bbs-strong">${i }</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:goList('${i }')">${i }</a>
							</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${nextPage > 0 }">
							<a href="javascript:goList('${nextPage }')">[<spring:message code="global.next" />]</a>
						</c:if>
						
					</div>
				
					<div id="list-menu">
					<security:authorize access="! isAnonymous()">
						<input type="button" value="<spring:message code="bbs.new.article" />" onclick="goWrite()" class=" btn btn-primary btn-xs"/>
					</security:authorize>	
					</div>
				
					<div id="search">
						<form id="searchForm" action="./list" method="get">
							<p style="margin: 0;padding: 0;">
								<input type="hidden" name="boardCd" value="${param.boardCd }" />
								<input type="hidden" name="curPage" value="1" />
								<input type="text" name="searchWord" size="15" maxlength="30" />
								<input type="submit" value="<spring:message code="global.search" />" class=" btn btn-primary btn-xs"/>
							</p>	
						</form>
					</div>
				</div>
			<!-- 
			</div>
			 -->	
		
		</section>

	
	<!-- row end 
	</div>
	-->

<!-- container end -->
</div>

	<div id="meFooter">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>



<div id="form-group">
	<form id="listForm" action="list" method="get">
		<p>
			<input type="hidden" name="boardCd" value="${param.boardCd }" />
			<input type="hidden" name="curPage" />
			<input type="hidden" name="searchWord" value="${param.searchWord }" />
		</p>
		</form>
		<form id="viewForm" action="view" method="get">
		<p>
			<input type="hidden" name="articleNo" />
			<input type="hidden" name="boardCd" value="${param.boardCd }" />
			<input type="hidden" name="curPage" value="${param.curPage }" />
			<input type="hidden" name="searchWord" value="${param.searchWord }" />
		</p>
		</form>
		<form id="writeForm" action="write_form" method="get">
		<p>
			<input type="hidden" name="boardCd" value="${param.boardCd }" />
			<input type="hidden" name="curPage" value="${param.curPage }" />
			<input type="hidden" name="searchWord" value="${param.searchWord }" />
		</p>
	</form>
</div>


</body>
</html>
