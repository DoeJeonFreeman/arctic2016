<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.go.seaice.common.LoginVO"%>

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

<!-- topmenu start -->
<form name="selectOne" action="#LINK">
	<input name="menuNo" type="hidden" />
	<input name="link" type="hidden" />
</form>

  <!-- Navigation -->
    <div id="meIntro" class="row" align="right">

        	
		<div class="header_login">
		    <%
		       LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO"); 
		       if(loginVO == null){ 
		    %>
		    <div id="row-toolbar" class="text-right hidden-print">
         		<div id="row-toolbar-col" class="col-md-24">
            		<ul class="list-inline">
            		<!-- 
              			<li><a data-toggle="modal" data-target="#myModal"><i class="fa fa-user fa-fw"></i> Create account</a></li>
            		 -->
              			<li><a data-toggle="modal" data-target="#myModal"><i class="fa fa-sign-in fa-fw"></i> Log in</a></li>
                    </ul>
          		</div>
        	</div>
       	<!-- 
		    <div id="header_loginname">
	        	<a class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myModal"> Log in </a>
	        	
		        <a class="glyphicon glyphicon-th-large" href="<c:url value='/uat/uia/arcticUser.do'/>">로그로그인</a>
		        
	        	 <button type="button" class="btn btn-default btn-sm">
		           <span class="glyphicon glyphicon-log-in"></span> Log in
		         </button>
		    </div>
       	 -->
		    <% }else { %>
		    <c:set var="loginName" value="<%= loginVO.getName()%>"/>
		    <div id="header_loginname">
		    <!-- 
		        <a href="#LINK" onclick="alert('꽌리자메뉴제공'); return false;"><c:out value="${loginName}"/> 님</a> 관리자로 로그인하셨습니다.
		     -->
		        <a href="#LINK" class="glyphicon glyphicon-user" onclick="alert('관리자메뉴제공'); return false;"> <c:out value="${loginName}"/> 님</a> 관리자로 로그인하셨습니다.
		        <a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a>
		    </div>
		    <% } %>    
		</div>
  	</div> 
     
    
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="meNavbar">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<c:url value='/cmm/main/mainPage.do'/>">
                <!-- 
                	<img style="max-width:100px; margin-top: -40px;" src="<c:url value="/mestrap/assets/ci/under-construction.png" />">
                	<img style="max-width:80px; margin-top: -40px;" src="<c:url value="/mestrap/assets/ci/kma_eng_hor.png" />">
                 -->
                	<img style="max-width:300px; margin-top: -3px;" src="<c:url value="/mestrap/assets/ci/kma_kr_with_systemName_300.png" />">
               	</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                
                	  <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">해빙감시<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#LINK" onclick="javascript:fn_main_headPageMove('11','arctic/spatialDist')" >해빙분포</a>
                            </li>
                            <li>
                                <a href="#LINK" onclick="javascript:fn_main_headPageMove('12','arctic/extentTimeseries')" >최근해빙변화</a>
                            </li>
                            <li>
                                <a href="#LINK" onclick="javascript:fn_main_headPageMove('13','arctic/lttrend')" >장기해빙변화</a>
                            </li>
                            <li>
                                <a href="#LINK" onclick="javascript:fn_main_headPageMove('14','arctic/ocean')" >해역별분포</a>
                            </li>
                        </ul>
                    </li>
                
                    <li>
                        <a href="#LINK" onclick="javascript:fn_main_headPageAction('21','arctic/predictive.do')" >해빙예측</a>
                    </li>
                    <li>
                        <a href="#LINK" onclick="javascript:fn_main_headPageAction('31','arctic/passage.do')" >북극항로</a>
                    </li>
                    <li class="dropdown">
                        <a  class="dropdown-toggle" data-toggle="dropdown">게시판 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                            	<a href= '<c:url value='/' />bbs/list?boardCd=notice&curPage=1'>공지사항</a>
	                            <!-- 
	                                <a href="#LINK">1 Notice</a>
	                             -->
                            </li>
                            <li>
                                <a href= '<c:url value='/' />bbs/list?boardCd=anal&curPage=1'>분석정보</a>
	                            <!-- 
   		                            <a  onclick="javascript:fn_main_headPageMove_bbs('bbs/list?boardCd=data&curPage=1')">2 Anal</a>
        	                     -->
                            </li>
                            <li>
                                <a href= '<c:url value='/' />bbs/list?boardCd=refs&curPage=1'>참고자료</a>
                                <!-- 
                                <a href="#LINK">3 Refs</a>
                                 -->
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#LINK" onclick="javascript:fn_main_headPageMove('51','cmm/sysSummary')" >시스템개요</a>
                    </li>
                    <li>
                        <a href="#LINK" onclick="javascript:fn_main_headPageMove('61','cmm/reference')" >관련사이트</a>
                    </li>
                </ul>
            </div>
            <!-- navbar-collapse -->
        </div>
        <!-- container -->
    </nav>
<!-- topmenu end -->

	<c:import url="/arcticPageLink.do?link=cmm/auth/UserLoginDialog"/>

	
	