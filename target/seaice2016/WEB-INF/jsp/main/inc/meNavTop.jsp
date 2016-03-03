<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<script type="text/javascript">

    function fn_main_headPageMove(menuNo, url){
	    document.selectOne.menuNo.value=menuNo;
	    document.selectOne.link.value=url;
	    document.selectOne.action = "${pageContext.request.contextPath}/arcticPageLink.do";
	    //alert(document.selectOne.action);
	    document.selectOne.submit();
    }
    
    function fn_main_headPageMove_bbs(url){
        document.selectOne.action = "${pageContext.request.contextPath}/"+url;
        document.selectOne.method = "get";
	    document.selectOne.submit();
    }
    
    function fn_main_headPageAction(menuNo, url){
        document.selectOne.menuNo.value=menuNo;
        document.selectOne.link.value="";
        document.selectOne.action = "${pageContext.request.contextPath}/"+url;
        document.selectOne.method = "post";
        //alert(document.selectOne.action);
        document.selectOne.submit();
    }
    
</script>

<form name="selectOne" action="#LINK">
	<input name="menuNo" type="hidden" />
	<input name="link" type="hidden" />
</form>

  <!-- toolbar top -->
<div class="me-toolbar">
  
    <div class="container">
        	
		    <div class="text-right">
         		<div class="col-md-24">
            		<ul class="list-inline">
            		
	            		<security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
							<security:authentication property="principal.username" var="check" />
						</security:authorize>
            		
            			<li>
            				<a onclick="javascript:fn_main_headPageMove('8318','cmm/sitemap')"><i class="fa fa-sitemap fa-fw"></i> Site map </a>
            			</li>
              			<c:choose>
							<c:when test="${empty check}">
              				</c:when>	
		    				<c:otherwise>
							<!-- 
              					<li><a href="${pageContext.request.contextPath}/uat/uia/arcticUser.do"><i class="fa fa-sign-in fa-fw"></i> Log in</a></li>
							 -->
		    				
						        <li><a onclick=""><i class="fa fa-cog fa-spin"></i> "${check}" 님</a> 관리자로 로그인하셨습니다.</li>
						        <li><a href="${pageContext.request.contextPath}/j_spring_security_logout"><i class="fa fa-sign-out fa-fw"></i> Log out</a></li>
		    				</c:otherwise>
		    			</c:choose>	
                    </ul>
          		</div>
      	 	 </div>
      	 	 
	         <div class="hidden-xs row vcenter">
	           	<a href="${pageContext.request.contextPath}/cmm/main/mainPage.do" id="arcticSysTitle" style="font-size:20px; font-weight:bold; text-decoration:none;">
	           		<img src="${pageContext.request.contextPath}/mestrap/assets/ci/kma_kor_hor_antiAlias_w220.png" alt="kma.go.kr logo" class="logo-eclipse-default" width="220px;"  style="padding-bottom:10px;"/>&nbsp; 북극해빙감시시스템
	       	 	</a>              
	         </div>		    
	</div>
	
	
</div>
 <nav class="navbar navbar-default navbar-static-top" role="navigation" id="meNavbar">
     <div class="container">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-mecollapse">
                 <span class="sr-only">Toggle navigation</span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
             </button>
             <!-- navbar-brand visible-xs -->
             <a class="navbar-brand visible-xs" href="${pageContext.request.contextPath}/cmm/main/mainPage.do">
             	<img style="max-width:330px; margin-top: -12px;" src="${pageContext.request.contextPath}/mestrap/assets/ci/kma_kr_460by64.png">
           	 </a>
         </div>
         <!-- Collect the nav links, forms, and other content for toggling -->
         <div class="collapse navbar-collapse" id="navbar-mecollapse">
             <ul class="nav navbar-nav navbar-right">
             
             	  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">해빙감시<b class="caret"></b></a>
                     <ul class="dropdown-menu" id="meDropdown-mnt">
                         <li>
                             <a href="#LINK" onclick="javascript:fn_main_headPageAction('11','arctic/spatialDistribution.do')" >해빙분포</a>
                         </li>
                         <li>
                             <a href="#LINK" onclick="javascript:fn_main_headPageAction('12','arctic/timeseries/extent.do')" >최근해빙변화</a>
                         </li>
                         <li>
                             <a href="#LINK" onclick="javascript:fn_main_headPageAction('13','arctic/timeseries/trend.do')" >장기해빙변화</a>
                         </li>
                         <li>
                             <a href="#LINK" onclick="javascript:fn_main_headPageAction('14','arctic/ocean.do')" >해역별분포</a>
                         </li>
                     </ul>
                 </li>
             
                 <li>
                     <a href="#LINK" onclick="javascript:fn_main_headPageAction('21','arctic/monthlyPrediction.do')" >해빙전망</a>
                 </li>
                 <li>
                     <a href="#LINK" onclick="javascript:fn_main_headPageAction('31','arctic/passage.do')" >북극항로</a>
                 </li>
                 <li class="dropdown">
                     <a  class="dropdown-toggle" data-toggle="dropdown">게시판 <b class="caret"></b></a>
                     <ul class="dropdown-menu" id="meDropdown-bbs">
                         <li>
                         	<a href= '${pageContext.request.contextPath}/bbs/list?boardCd=notice&curPage=1'>공지사항</a>
                         </li>
                         <li>
                             <a href= '${pageContext.request.contextPath}/bbs/list?boardCd=anal&curPage=1'>분석정보</a>
                         </li>
                         <li>
                             <a href= '${pageContext.request.contextPath}/bbs/list?boardCd=refs&curPage=1'>참고자료</a>
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

	
	