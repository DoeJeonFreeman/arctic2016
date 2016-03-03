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
    
    
<style>
.blogShort{ border-bottom:1px solid #ddd;}
.add{background: #333; padding: 10%; height: 100%;}
.nav-sidebar { 
    width: 100%;
    padding: 30px 0; 
    border-right: 1px solid #ddd;
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
    background-color: #E50000;   
}
.nav-sidebar .text-overflow a,
.nav-sidebar .text-overflow .media-body {
    white-space: nowrap;
    overflow: hidden;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis; 
}

.btn-blog {
    color: #ffffff;
    background-color: #E50000;
    border-color: #E50000;
    border-radius:0;
    margin-bottom:10px
}
.btn-blog:hover,
.btn-blog:focus,
.btn-blog:active,
.btn-blog.active,
.open .dropdown-toggle.btn-blog {
    color: white;
    background-color:#0b56a8;
    border-color: #0b56a8;
}
article h2{color:#333333;}
h2{color:#0b56a8;}
 .margin10{margin-bottom:10px; margin-right:10px;}
 
 .container .text-style
{
  text-align: justify;
  line-height: 23px;
  margin: 0 13px 0 0;
  font-size: 19px;
}
    
#refList{
	
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
	

    <!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser
	<header class="meControllPanel">
		<div class="container" align="left">
            <div class="row form-horizontal">
           		<div class="pull-right" style="padding-right:50px;"> 
	            	<ul id="breadcrumbs-one" class="pull-right vcenter" >
						<li><a href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
						<li><a>시스템개요</a></li>
					</ul>
            	</div>
            </div>
		        
		</div>
	</header>
	--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	
    
    <!-- /.container -->
	<div class="container">
            <div class="col-lg-12">
                <h2 class="page-header">시스템개요</h2>
            </div>

<!-- 
	<section class="col-md-2">
		<ul id="leftnav" class="ul-left-nav fa-ul hidden-print">
                  <li class="separator">
            <a class="separator" href="#">
             시스템 개요            </a>
          </li>
                  <li>
            <i class="fa fa-angle-double-right orange fa-fw"></i>
            <a href="" target="_self">
              해빙면적            </a>
          </li>
                  <li>
            <i class="fa fa-angle-double-right orange fa-fw"></i>
            <a href="" target="_self">
              해빙 표면거철기            </a>
          </li>
        
            </ul>
	</section>
 -->
	
	<!-- #0b56a8 -->
	<section class="col-md-10 col-md-offset-1">
		<h5><a name="about"><strong>개요</strong></a></h5>
	    <p>해빙은 지구에 입사하는 태양에너지를 반사시켜 극지방을 차갑게 유지함으로써 지구의 평균기온을 일정하게 한다. 그러나 최근 지구온난화의 영향으로 북극지역의 기온이 상승함에 따라 북극해빙이 빠르게 감소하고 있다. 2012년 9월 북극 해빙의 최저면적은 3,600,000km² 으로 1979년 말 위성관측이 시작된 이후 역대 최저면적을 기록했으며 또한 4,000,000km² 이하의 면적으로 기록된 최초의 해이다. 해빙감소는 지구온난화를 가속시키고 북극해 인근 지역 뿐 아니라 우리나라의 기후변화에 영향을 미친다. 최근 증가하고 있는 한파, 가뭄, 폭염 등도 해빙 감소와 관련이 높은 것으로 연구되고 있다. 또한 북극해빙의 감소는 북극항로 이용여부와도 관련 있기 때문에 최근 북극해 지역과 해빙의 감소에 대한 관심이 증가하고 있다. <a target="_blank" href="http://kma.go.kr">기상청</a>은 이러한 상황에 대응하고 해빙의 변화를 감시하기 위해 마이크로파 위성자료(SSMIS : Special Sensor Microwave Imager/Sounder)를 이용하여 북극해빙 감시 시스템을 구축하였다. 본 시스템은 매주 최신의 해빙감시 정보를 업데이트하며 연 2회(5월, 11월) “북극현황 분석보고서”를 제공한다. 
		</p>

		<h5><a name="history"><strong>해빙면적(Sea Ice Extent)</strong></a></h5>
      	<p>해빙면적은 위성에서 산출되는 해빙농도를 이용하여 계산한다. 본 시스템은 2007년 1월 1일부터 현재까지 7일 동안의 해빙농도를 평균하여 면적을 산출한다.
		</p>


		<h5><a name="history"><strong>해빙 표면거칠기(Small-Scale Sea ice Surface Roughness)</strong></a></h5>
      	<p>해빙 표면거칠기는 해빙표면의 울퉁불퉁한 정도를 지수로 표현한 것으로 해빙표면의 물성(물 or 얼음)을 의미한다. <a target="_blank" href="http://kma.go.kr">기상청</a>은 독자적인 기술로 마이크로파 위성자료의 편광성을 이용하여 해빙 표면거칠기를 산출하는 기술을 개발하였으며 이를 이용하여 7일 평균된 해빙 표면거칠기 정보를 제공한다.
			해빙 표면거칠기에 따른 해빙의 물성은 다음과 같다. 
		</p>
			<ul>
	            <li>
	            	물 :   표면거칠기 &lt; 0.2 cm
	            </li>
	            <li>혼합 :  0.2 cm &lt; 표면거칠기 &lt; 0.4 cm</li>
	            <li>얼음/눈 :  표면거칠기 &gt; 0.4 cm</li>
            </ul>        
            
            
            
         
		<h5><a name="history"><strong>해빙 변화</strong></a></h5>	
      	<p>북극해빙은 매년 태양고도의 변화에 따라 녹고 얼음을 반복하는 계절변동이 뚜렷하다. 태양이 비추지 않는 겨울 동안 해빙은 지속적으로 증가하여 3월에 최대로 증가하였다가 태양이 뜨기 시작하는 봄부터 녹기 시작한다. 여름 동안 감소한 해빙은 9월에 최저 면적에 도달한 후 태양이 지는 시기와 함께 다시 증가하기 시작한다. 최근 여름철 해빙의 면적 감소가 급격히 진행되고 있으며 2012년 9월에는 위성관측이 시작된 이후 최저면적을 기록한 바 있다. 해빙 표면거칠기는 해빙이 녹음에 따라 감소하며 최저가 되는 시기는 해빙면적의 최소시기보다 약 한달 정도 앞선 8월에 관측된다. 이는 해빙 표면거칠기의 변화가 북극해빙 면적의 최소시점 전망에 활용 가능한 정보라는 것을 의미한다.
		</p>
            
        <p align="center"> 
			<img src="<c:url value='/assets/arctic/summary_trend.png'/>" class="img-responsive"  alt="해빙변화경향 시계열차트"/>&lt;북극해빙면적(왼쪽)과 표면거칠기(오른쪽)의 장기변화 경향  &gt;   
        </p> 
        
		<h5><a name="history"><strong>해빙전망</strong></a></h5>
		<p>북극의 변화는 우리나라 및 동아시아, 북미지역의 기후변화에 영향을 준다. 또한 북극에서의 과학 활동, 항로 운항이용에 북극해빙정보는 다양하게 사용할 수 있다. <a target="_blank" href="http://kma.go.kr">기상청</a>과 전남대학교 정지훈 교수팀은 독자적인 해빙전망정보 생산 기술을 개발하고 있다. 장기간해빙자료를 이용하여 통계적인 방법으로 해빙의 계절적 변화 특성을 분석하고, 그 결과를 이용하여 앞으로의 해빙변화를 전망한다. 본 시스템에서는 예측일 기준으로 3개월까지의 미래 전망 정보를 제공한다. 
		</p>
		
		<h5><a name="history"><strong>북극항로</strong></a></h5>
		<p>북극해빙의 감소로 여름철 북극항로의 이용이 가능해졌다. 북극항로 이용에 도움이 되고자, 본 시스템에서는 7개의 북극항로 구역에서의 해빙면적과 해빙표면거칠기 정보를 제공한다. 
		</p>
		<!--		
        <h5><a name="history"><strong>북극해빙 지도</strong></a></h5>
        <p align="center"> 
			<img src="<c:url value='/assets/arctic/map.jpg'/>" class="img-responsive"  alt="북극해빙 지도 이미지"/>
        </p> 
        -->
	</section>
</div>	
	
	

	
	
	
<!-- 
	<div class="container">
		<section class="col-sm-2">
    		<nav class="nav-sidebar">
				<ul class="nav tabs">
		          <li class="active"><a href="#tab1" data-toggle="tab">Lorem ipsum</a></li>
		          <li class=""><a href="#tab2" data-toggle="tab">Dolor asit amet</a></li>
		          <li class=""><a href="#tab3" data-toggle="tab">Stet clita</a></li>                               
				</ul>
			</nav>
		</section>
		<section class="col-sm-8">
			<div class="tab-pane active text-style" id="tab1">
 				<h2>Lorem ipsum</h2>
       			<p>
         			Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's 
			         standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make 
			         a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining 
			         essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
			         and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
         			Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's 
			         standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make 
			         a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining 
			         essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
			         and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
         			
			    </p>
       			<hr>
      			<img src="http://placehold.it/350x250" class="img-rounded pull-right">   
			</div>
		</section>
	</div>
	
 -->
	
	

	
	
    <!-- Footer -->
    <!-- Footer -->
    <!-- Footer -->
	<div id="meFooter"  style="margin-top: 20px;">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>
	
	<!-- jQuery 
    <script src="<c:url value="/mestrap/js/jquery.js"/>"></script>
	-->

    <!-- Bootstrap Core JavaScript 
    <script src="<c:url value="/mestrap/js/bootstrap.min.js"/>"></script>
    -->
    <!-- Bootstrap Core JavaScript -->
<!-- //전체 레이어 끝 -->
</body>
</html>

