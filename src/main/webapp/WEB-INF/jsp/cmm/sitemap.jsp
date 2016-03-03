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

    <script type="text/javascript">

	    function fn_main_headPageMove(menuNo, url){
		    document.selectOne.menuNo.value=menuNo;
		    document.selectOne.link.value=url;
		    document.selectOne.action = "<c:url value='/arcticPageLink.do'/>";
		    //alert(document.selectOne.action);
		    document.selectOne.submit();
	    }
	    
	    function fn_main_headPageMove_bbs(url){
	        document.selectOne.action = "<c:url value='/' />"+url;
	        document.selectOne.method = "get";
		    document.selectOne.submit();
	    }
	    
	    function fn_main_headPageAction(menuNo, url){
	        document.selectOne.menuNo.value=menuNo;
	        document.selectOne.link.value="";
	        document.selectOne.action = "<c:url value='/' />"+url;
	        document.selectOne.method = "post";
	        //alert(document.selectOne.action);
	        document.selectOne.submit();
	    }
    
	</script>
    
    
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

        <!-- Reference Section -->
        <div class="container">
            <div class="col-lg-12">
                <h2 class="page-header">Site map</h2>
            </div>
            
            
            
            
            <div class="col-md-12">
            
            
            	<div id="">
					<div class="sitemapWrap">
						<div class="sitemapList02">
							<h3>01&nbsp;&nbsp;해빙감시</h3>
							<div class="sitemapListWrap">
								<h5>해빙분포</h5>
								<ul>
									<li><a href="<c:url value='/arctic/spatialDistribution.do'/>">SSMIS 해빙 면적</a></li>
									<li><a href="<c:url value='/arctic/spatialDistribution.do'/>">SSMIS 해빙 표면거칠기</a></li>
								</ul>
							</div>
							<div class="sitemapListWrap">
								<h5>최근해빙변화</h5>
								<ul>
									<li><a href="<c:url value='/arctic/timeseries/uptodate.do'/>">최근 해빙 변화 경향</a></li>
								</ul>
							</div>
							<div class="sitemapListWrap">
								<h5>장기해빙변화</h5>
								<ul>
									<li><a href="<c:url value='/arctic/timeseries/trend.do'/>">해빙 면적의 연 변화</a></li>
									<li><a href="<c:url value='/arctic/timeseries/trend.do'/>">해빙 표면거칠기의 연 변화</a></li>
									<li><a href="<c:url value='/arctic/timeseries/trend.do'/>">해빙 면적의 장기 변화</a></li>
									<li><a href="<c:url value='/arctic/timeseries/trend.do'/>">해빙 표면거칠기의 장기 변화</a></li>
								</ul>
							</div>
							<div class="sitemapListWrap">
								<h5>해역별분포</h5>
								<ul>
									<li><a href="<c:url value='/arctic/ocean.do'/>">바렌츠해의 해빙 변화</a></li>
									<li><a href="<c:url value='/arctic/ocean.do'/>">베링해의 해빙 변화</a></li>
									<li><a href="<c:url value='/arctic/ocean.do'/>">허드슨만의 해빙 변화</a></li>
								</ul>
							</div>
						</div>
						<div class="sitemapList01">
							<h3>02&nbsp;&nbsp;해빙전망</h3>
							<ul>
								<li><a href="<c:url value='/arctic/predictive.do'/>">해빙전망</a></li>
							</ul>
						</div>
						<div class="sitemapList01">
							<h3>03&nbsp;&nbsp;북극항로</h3>
							<ul>
								<li><a href="<c:url value='/arctic/passage.do'/>">SSMIS 해빙 면적</a></li>
								<li><a href="<c:url value='/arctic/passage.do'/>">해빙 면적변화 시계열 그래프</a></li>
								<li><a href="<c:url value='/arctic/passage.do'/>">해빙 표면거칠기변화 시계열 그래프</a></li>
							</ul>
						</div>
					</div>
					<div class="sitemapWrap">
						<div class="sitemapList01 first">
							<h3>04&nbsp;&nbsp;게시판</h3>
							<ul>
								<li><a href="<c:url value='/bbs/list?boardCd=notice&curPage=1'/>">공지사항</a></li>
								<li><a href="<c:url value='/bbs/list?boardCd=anal&curPage=1'/>">분석정보</a></li>
								<li><a href="<c:url value='/bbs/list?boardCd=refs&curPage=1'/>">참고자료</a></li>
							</ul>
						</div>
						<div class="sitemapList01">
							<h3>05&nbsp;&nbsp;시스템개요</h3>
							<ul>
								<li><a href="#" onclick="javascript:fn_main_headPageMove('51','cmm/sysSummary')">북극해빙감시시스템 개요</a></li>
								<li><a href="#" onclick="javascript:fn_main_headPageMove('51','cmm/sysSummary')">해빙 면적</a></li>
								<li><a href="#" onclick="javascript:fn_main_headPageMove('51','cmm/sysSummary')">해빙 표면거칠기</a></li>
								<li><a href="#" onclick="javascript:fn_main_headPageMove('51','cmm/sysSummary')">해빙 변화 경향</a></li>
								<li><a href="#" onclick="javascript:fn_main_headPageMove('51','cmm/sysSummary')">북극해빙 지도</a></li>
							</ul>
						</div>
						<div class="sitemapList01">
							<h3>06&nbsp;&nbsp;관련사이트</h3>
							<ul>
								<li><a href="#" onclick="javascript:fn_main_headPageMove('61','cmm/reference')">관련사이트</a></li>
							</ul>
						</div>
					</div>
				</div>
            </div>
            
        </div>
        <!-- /.container -->


    </div>
    <!-- /contents wrapper -->
	
	
	
	
	
	
    <!-- Footer-->
	<div id="meFooter">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>
	

<!-- //전체 레이어 끝 -->
</body>
</html>

