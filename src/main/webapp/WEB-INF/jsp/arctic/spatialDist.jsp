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
    
	<title>해빙분포</title>
	
	<script src="<c:url value="/js/jquery/jquery-1.9.1.js"/>"></script>	
    <script src="<c:url value="/mestrap/js/bootstrap.min.js"/>"></script>
	
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/mestrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/mestrap/css/modern-business.css"/>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/mestrap/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">	
    
	<!-- datePicker -->
	<link href="<c:url value="/js/daterangepicker/daterangepicker.css"/>" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="<c:url value="/js/daterangepicker/moment.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/daterangepicker/daterangepicker.js"/>"></script>
    <!-- dateJS -->
	<script type="text/javascript" src="<c:url value="/js/jquery/date.js"/>"></script>
	
	
	<!-- sel2sli test -->
	<!-- 
	<script src="<c:url value="/js/carousel/ui/jquery-ui-1.7.1.custom.min.js"/>"></script>
	<script src="<c:url value="/js/carousel/ui/jquery-ui-1.7.1.custom.css"/>"></script>
 	<script type="text/javascript" src="<c:url value="/js/select2slider/js/jquery-ui-1.7.1.custom.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/select2slider/js/selectToUISlider.jQuery.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/js/select2slider/css/redmond/jquery-ui-1.7.1.custom.css"/>" type="text/css" />
	<link rel="Stylesheet" href="<c:url value="/js/select2slider/css/ui.slider.extras.css"/>" type="text/css" />
	 -->
	 
	 
	 
	<!-- slider -->
	<script src="<c:url value="/js/carousel/ui/jquery-ui-1111.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/js/carousel/ui/themes/eggplant/jquery-ui.css"/>">
	<!-- 
	 -->
	<link rel="stylesheet" href="<c:url value="/js/carousel/jquery.ui.labeledslider.css"/>">
	<script src="<c:url value="/js/carousel/jquery.ui.labeledslider.js"/>"></script>
	<!-- 
	 -->
	<!-- timer -->
    <script type="text/javascript" src="<c:url value="/js/carousel/jquery.timer.js"/>"></script>
	
	<!-- modal popup -->
	<script src="<c:url value="/js/modal/bootstrap-modalmanager.js"/>"></script>	
	<script src="<c:url value="/js/modal/bootstrap-modal.js"/>"></script>	
    <link href="<c:url value="/css/bootstrap-modal-bs3patch.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/bootstrap-modal.css"/>" rel="stylesheet">
    
	<!-- pan n zoom -->	
    <script src="<c:url value="/js/scalable/panzoom/jquery.panzoom.js"/>"></script>
    <script src="<c:url value="/js/scalable/panzoom/jquery.mousewheel.js"/>"></script>
    
    <!-- spinner -->
	<!-- 
    <link rel="stylesheet" href="<c:url value="/js/spinner/css/custom.css"/>">
	<link rel="stylesheet" href="<c:url value="/js/spinner/css/iosOverlay.css"/>">
	<link rel="stylesheet" href="<c:url value="/js/spinner/css/prettify.css"/>">
	<script src="<c:url value="/js/spinner/js/modernizr-2.0.6.min.js"/>"></script>
	<script src="<c:url value="/js/spinner/js/iosOverlay.js"/>"></script> 
	<script src="<c:url value="/js/spinner/js/spin.min.js"/>"></script> 
	<script src="<c:url value="/js/spinner/js/prettify.js"/>"></script> 
	 -->
    


	<style>
	     #inverted-contain .panzoom { width: 100%; height: 100%; }
	</style>
	
	
	
</head>

<body id="fabulousbdtc">

	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
	
	<div id="meHeader">
	    <c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
	</div>
<!-- 
	<div id="dateHandler">
		<c import url="/arcticPageLink.do?link=main/inc/dateChooser_alternative" />
	</div>	
 -->
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<header class="meControllPanel">
		<div class="container" align="left">
            <div class="row form-horizontal">
            	 <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5 demo vcenter">
		            <input type="text" id="meDemo" class="form-control meHandCursor" readonly="readonly">
		            <i class="glyphicon-calendar fa fa-calendar" style="cursor:default"></i>
		          </div>
            	
            	
	            <div class="vcenter">
	            	<div class="pull-left" style="margin-right: 15px;">
	            		<button  type="button" class="meBtn meBtn-primary meBtn-lg outline " style="margin-top:2px;" id="btn_getMostRecentOne">최근</button>
	            	</div>
	            	
	            	<div class="pull-left">
	            		<button  id="btn_prev" type="button" class="meBtn meBtn-primary  fa fa-chevron-left"
	            			 onclick="getDateCalculated(this.id)"></button>
	            	</div>
	            	
	            	
	            	<div id="retrievalRangeSelector" class="dropdown select pull-left" style="margin-left: 3px;margin-right: 3px">
					    <button class="  btn-small dropdown-toggle " type="button" id="menu1" data-toggle="dropdown" style="margin-top:6px;">
					    	<span class="selected" id="1" value="WEEK">1주일</span><span class="caret"></span>
				    	</button>
					    <ul class="dropdown-menu option" role="menu" >
					      <li id="1" role="presentation" value="WEEK"><a role="menuitem" tabindex="-1" >1주일</a></li>
					      <li id="2" role="presentation" value="MONTH"><a role="menuitem" tabindex="-1" >1개월</a></li>
					      <li id="3" role="presentation" value="YEAR"><a role="menuitem" tabindex="-1" >1년</a></li>
					      <!-- 
					      <li role="presentation" class="divider"></li>
					       -->
					    </ul>
				    </div>
				    
	            	<div class="pull-left">
	            		<button  id="btn_next" type="button" class="meBtn meBtn-primary fa fa-chevron-right"  
	            			onclick="getDateCalculated(this.id)"></button>
	            	</div>
	            	
	            	<div class="pull-left" style="margin-left:10px;margin-top:10px;">
	            		|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="trigger">영상 콘트롤러 보기 <i class="fa fa-caret-down"></i></a>
	            	</div>
	            	
	            </div>	
            
           		<div class="pull-right" style="padding-right:50px;"> 
	            	<ul id="breadcrumbs-one" class="pull-right vcenter" >
						<li><a href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
						<li><a>해빙감시</a></li>
						<li><a>해빙분포</a></li>
					</ul>
            	</div>
            </div>
		     
		            
        	<script type="text/javascript">
        	
	        	$('#retrievalRangeSelector').on('click','.option li',function(){
	        		var i = $(this).parents('.select').attr('id');
	        		var v = $(this).children().text();
	        		var o = $(this).attr('id');
	        		var valStr = $(this).attr('value'); // (WEEK || MONTH || YEAR)
	        		$('#'+i+' .selected').attr('id',o);
	        		$('#'+i+' .selected').text(v);
	        		$('#'+i+' .selected').attr('value',valStr);
	        		//var haha = $('#retrievalRangeSelector .selected').attr('value');
	        	});
        	
        		$('#btn_getMostRecentOne').click(function(){
        			//change the selected date range of that picker
        			$('#meDemo').data('daterangepicker').setStartDate('<c:out value="${sdist.compbegindate4Cal}" />');
        			$('#meDemo').data('daterangepicker').setEndDate('<c:out value="${sdist.compbegindate4Cal}" />');
        			$('#meDemo').val('<c:out value="${sdist.compbegindate4Cal}" />');
					//fire click event programmtically haha    
        			//changeImgSrc("<c:out value="${sdist.compbegindateInString}" />","<c:out value="${sdist.compbegindate4View}" />" ,"<c:out value="${sdist.extentInkmSquared}" />");
        			var aniPanActivated = $("#sliderContainer").is(":visible");
    		      	if(aniPanActivated){
    		      		var mRecentOne = '${sdist.compbegindate4Cal}';
    			      	var dStrArr =  mRecentOne.split('-');		
    					var mRecent = new Date(dStrArr[0],dStrArr[1]-1,dStrArr[2]);
    					meRequest(moment(mRecent));
    		      	}else{
	        			changeImgSrc("<c:out value="${sdist.compbegindateInString}" />","<c:out value="${sdist.compbegindate4View}" />" ,"<c:out value="${sdist.extentInkmSquared}" />");
    		      	}
        		});
        	
           		$('#meDemo').daterangepicker({
           			locale: {
           				format: 'YYYY-MM-DD'
           			}, 
           		    "singleDatePicker": true,
           		    "showDropdowns": true,
           		    /* "startDate": moment().subtract(6, 'days'), */
           		    /* "endDate":moment().subtract(0, 'days'),*/
           		    "startDate": "<c:out value="${sdist.compbegindate4Cal}" />", 
           		    "endDate" : "<c:out value="${sdist.compbegindate4Cal}" />",
           		    "minDate": "2007-01-01",
           		    "maxDate": "<c:out value="${sdist.compbegindate4Cal}" />"     //today
           		    
           		}, function(start, end, label) {
           			
           			meRequest(start);
           		  
           		});
           		
           		$("#trigger").click(function(){ 
           			//console.log($(this).text());
	            	var meNewText = $(this).text().includes('보기')?  '영상 콘트롤러 숨기기 <i class="fa fa-caret-up">' : '영상 콘트롤러 보기 <i class="fa fa-caret-down">';
//	           	    $(this).text(meNewText);
	           	    $(this).html(meNewText);
           		});
		        	
		    </script>    
		        
		</div>
	</header>
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	
	
	
	<!-- image slider -->
	<!-- image slider -->
	<header class="meCarouselPanel"> <!-- meCarouselPanel -->
		<div class="container" >
			<div class="imgControlPanel " align="center"  id="sliderContainer" style="display: none;height: 55px; "> <!--  display: none;      color:yellow; background-color:#eeeeee; width: 600px -->
				<div class="col-xs-12 pull-left"  style="padding-top: 15px; padding-right: 90px"> <!--  background-color:yellow; -->
					<div id="slider"  style="width: 100%;"></div>
				</div>
				
				<div class="pull-right" style="padding-top: 0px; margin-top:-5px; width:70px; ">
				<!-- 
					<input type="button" value="play" id="playBtn"  onclick="animatinResumeHandler()"/>
					<button type="button" id="button_play" class="btn" onclick='buttonPlayPress()'>
				      <i class="fa fa-play"></i>
				    </button>
				 -->
				    <div id="carouselButtons">
					      <button id="playButton" type="button" class="btn btn-default btn-xs" onclick="animatinResumeHandler()">
					          <span class="glyphicon glyphicon-play"></span>
					       </button>
					      <button id="pauseButton" type="button" class="btn btn-default btn-xs" onclick='animatinPauseHandler()'>
					          <span class="glyphicon glyphicon-pause"></span>
					      </button>
					  </div>
				    
					<!-- 
					<input type="button" value="play" id="playBtn"  onclick="animatinResumeHandler()"/>
					<input type="button" value="pause" id="pauseBtn"   onclick="animatinPauseHandler()"/>
					 -->
				</div>
				
				<!-- 
				<div  class="imgCtrl"  style="padding-left: 30px;">
					<input type="button"  id="playBtn"  onclick="animatinResumeHandler()"/>
					<input type="button"  id="pauseBtn"   onclick="animatinPauseHandler()"/>
				</div>
				 -->
			</div>
		</div>
	</header>		
	<!-- image slider -->
	<!-- image slider -->
	
	
		
	<!-- Page Content -->
    <div class="container" >
		 			
		<div align="center">
		
			<div class="row">
			
            	<p class="col-lg-12">
			<!-- 
               		<h4 class="page-header">ice graphic goes here ext / rou</h4>
			 -->
            	</p>
            	
            	<!-- 
            	<div class="container">
					<label for="speed">Select a Speed:</label>
					<select name="speed" id="speed" style="display:none">
					<optgroup label="2007">
						<option value="Slower">Slower</option>
						<option value="Slow">Slow</option>
					</optgroup>	
					<optgroup label="2008">
						<option value="Med" selected="selected">Med</option>
						<option value="Fast">Fast</option>
					</optgroup>	
					<optgroup label="2010">
						<option value="Faster">Faster</option>
						<option value="Faaster">Faaster</option>
						<option value="Faaaster">Faaaaster</option>
					</optgroup>		
					</select>
            	</div>
            	 -->
            	
            	
            	
	            <div class="col-md-6">
	            	<div class="">
						<div align="center" class="dRangeStr_SSMIS"> 
							<div><h4>SSMIS 해빙 면적</h4></div>
							<p>${sdist.compbegindate4View}</p>
						</div>
						<p>
							<span class="mePopup_ext">
								<img id="img_ssmi_ext"  alt="SSMIS 북극해빙면적" onerror="return errOccuredWhileChangingSource(this)"
									class="btn img-responsive" style="width:90%; height:auto;">
							</span>	
						</p>
						<div align="center" class="titleEnhancer" > 
							<div id="extInKm">해빙 면적 = <span>${sdist.extentInkmSquared}</span> ㎢</div>
							<div>(7일 평균)</div>
						</div>
					</div>
	            </div>
	            
	            <div class="col-md-6" id="djd">
	            	<div class="">
						<div align="center" class="dRangeStr_SSMIS"> 
							<div><h4>SSMIS 해빙 표면거칠기</h4></div>
							<p>${sdist.compbegindate4View}</p>
						</div>
						<p>
							<span class="mePopup_rou">
								<img id="img_ssmi_rou" alt="SSMIS 북극해빙거칠기"  onerror="return errOccuredWhileChangingSource(this)" 
									class="btn img-responsive" style="width:90%; height:auto;">
							</span>	
						</p>
						<div align="center" > 
							<img id="legend_rou" alt="SSMIS 북극해빙거칠기 범례" class="img-responsive" style="width:77%; height:auto;"
								src="<c:url value='/assets/arctic/'/>rouIndex_labeled.png">
						</div>
					</div>
          	  	</div>
			</div>		
			
		
			<!-- 
			 -->
	 	</div>
	</div>
	
	
	<!-- modal  panzoom -->
	<div id="ajax-modal" class="modal container fade" tabindex="-1" style="display: none;"></div>
		
	
	
    <!-- Footer -->
	<div id="meFooter" style="margin-top: 20px;">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>	


	
	<script>
	
		//document is good to go man
		//$(function () {
	
		$(document).ready(function(){
			//var abc = $('select#speed').selectToUISlider().next();
		    var path_img = "<c:url value='/data/IMG/SEAICE/Y${fn:substring(sdist.compbegindateInString,0,4) }/dmsp_ssmis_ice_${sdist.compbegindateInString}.png' />"; 
	        $("#img_ssmi_ext").attr("src",path_img);
			
		    var path_img2 = "<c:url value='/data/IMG/ROUGH/Y${fn:substring(sdist.compbegindateInString,0,4) }/dmsp_ssmis_rou_${sdist.compbegindateInString}.png' />"; 
	        $("#img_ssmi_rou").attr("src",path_img2);
	        
	        currDateString = "${sdist.compbegindateInString}";
	        titleString = "${sdist.compbegindate4View}";
			
	        
	        $('#slider').labeledslider({
		        min: 0,
		        max: 7,
				/* 
		        tickLabels: {
		          0:'369369',
		          3:'짝',
		          6:'짝'
		        }, */
		        slide: function(event, ui) {
			    },
			    change : function(event, ui) {
			 	  	idx = ui.value;
			 	  	idx *= 1; 
			 	  	var iceObj = iceList[idx];
        	        changeImgSrc(iceObj.compbegindateInString, iceObj.compbegindate4View, iceObj.extentInkmSquared);
			    },
		      });	
	        
	       
		      timer = $.timer(function() {
		    	 // var startPos = $('#slider').labeledslider('option','min');
		    	  setPosition();
		    	  $('#slider').labeledslider('value',idx); //slide trigger change event
	      		  timer.set({ time : 1500, autostart : false });
	  		  });
	        
	     //   $('#slider').labeledslider({max:18}); //set options.max
	        
	     
	          var layout = $("#sliderContainer"),trigger = $("#trigger");

		      $(trigger).click( function(){
		      	var isInvisible =  ! $("#sliderContainer").is(":visible");
		      	//console.log(isInvisible)
		      	if(isInvisible){
			      	var dStrArr =  $("#meDemo").val().split('-');		
					var currDate = new Date(dStrArr[0],dStrArr[1]-1,dStrArr[2]);
					meRequest(moment(currDate));
		      	}else{
		      	  	animatinPauseHandler();		    	  
			      	var lastPosition = $('#slider').labeledslider('option','max');
			      	$('#slider').labeledslider('value',lastPosition);
		      	}
		      	
		      	layout.slideToggle("fast");
		      //  $("#slider").labeledslider().update();
		      
		      });   
	        
		}); //JCV good to go sir
		
		
		
		
		function meRequest(meDateObj){
	 		$.ajax({
     			  type: "get",
     			  url: "<c:url value='/' />arctic/findMatchingStuff",
     			  cache: false,    
     			  data: "selectedDate="+meDateObj.format('YYYY-MM-DD'),
     			  success: function(response){
        	        changeImgSrc(response.compbegindateInString, response.compbegindate4View, response.extentInkmSquared);
        	        
        	        var isInvisible =  ! $("#sliderContainer").is(":visible");
        	        //console.log('labeledSlider isInvisible:: ' + isInvisible);
        	        
if(!isInvisible) meRequestList(meDateObj,meDateObj);
        	        
     			  },
     			  error: function(){      
     			   alert('Error while request..');
     			  },
     			  cache:false
   			 });
		}
		
		function meRequestList(dBegin,dEnd){
	 		$.ajax({
     			  type: "get",
     			  url: "<c:url value='/' />arctic/findMatchingStuffs",
     			  cache: false,    
     			  data: "dBegin=" + dBegin.format('YYYY-MM-DD') + "&dEnd=" + dEnd.format('YYYY-MM-DD'),
     			  success: function(response){
        	        //changeImgSrc(response.compbegindateInString, response.compbegindate4View, response.extentInkmSquared)
        	        //alert(response);
        	        doStuff(response);
     			  },
     			  error: function(){      
     			   alert('Error while request..');
     			  },
     			  cache:false
   			 });
		}
		
		
		var iceList;
		function doStuff(meArr){
			animatinPauseHandler();
			iceList = [];
			iceList = meArr;
			//
			idx,listSize = meArr.length-1;//slider length lastpostionIdx, 
			buildSliderData(meArr);
			/* 
			var rangeStr = meArr[0].compbegindate4Cal + ' ~ ' +  meArr[meArr.length-1].compbegindate4Cal; 
			var str= rangeStr + ' [ ' + meArr.length + ' ] \n\n';
	        for(var i=0; i<meArr.length; i++){
	        	str+= meArr[i].compbegindateInString + '\n';
	        }
	        console.log(str);
	         */
		}
		
		
		function buildSliderData(iceList){
			$('#slider').labeledslider({max:iceList.length-1});		
			var lastPosition = $('#slider').labeledslider('option','max');
//console.log('lastPosition: ' + lastPosition)
			var arr = [];
			for(var i=0; i<iceList.length; i++){
				var s = iceList[i].compbegindate4Cal;
				var dStrArr =  s.split('-');		
				var meDate = new Date(dStrArr[0],dStrArr[1]-1,dStrArr[2]);				
				
				var dLable = moment(meDate).format('MM-DD');
				arr[i+''] = dLable;
			}
//			$('#slider').labeledslider('animate', 'slow');
			$('#slider').labeledslider({tickLabels:arr});
			$('#slider').labeledslider('value',lastPosition);
		}
		
		
		var timer;     
		var idx,listSize = 7; //max = $('#slider').labeledslider('option','max');
		//var idx,listSize;
		function setPosition(){
			if(idx < listSize){
				idx+=1;
			}else if(idx == listSize){
				idx = 0;
			}
		}
		
		function animatinResumeHandler(){
			if(! timer.isActive) {
				timer.play();
			}
		}
		
		function animatinPauseHandler(){
			if(timer!=null  && timer.isActive){
				timer.pause();
			}
		}
		
		
		function changeImgSrc(dateStr,dRangeStr,extValInKmSquared){
	        $("#img_ssmi_ext").attr("src","<c:url value='/data/IMG/SEAICE/Y'/>" + dateStr.substring(0,4) + "/dmsp_ssmis_ice_"+dateStr+".png");
	        $("#img_ssmi_rou").attr("src","<c:url value='/data/IMG/ROUGH/Y'/>" + dateStr.substring(0,4) + "/dmsp_ssmis_rou_"+dateStr+".png");
	        $('.dRangeStr_SSMIS p').text(dRangeStr); //or use .html(<strong>textGoesHere</strong>') instead haha
	        $('#extInKm span').text(extValInKmSquared);
	        currDateString = dateStr;
	        titleString = dRangeStr;
	        /*
	        fade in n out.. not crossfade haha
			$("#img_ssmi_ext").fadeOut(1000, function() {
		        $("#img_ssmi_ext").attr("src","<c:url value='/data/GROU/EXT/ssmi_weekly_mean_nh_ext_'/>"+dateStr+".png");
		        $("#img_ssmi_ext").fadeIn(1000);
		    });//.fadeIn(1000);
		    return false; 
		    $("#img_ssmi_ext").attr("src","<c:url value='/data/GROU/EXT/ssmi_weekly_mean_nh_ext_'/>"+dateStr+".png").stop(true,true).hide().fadeIn();
		    */
		}
		
		
		var minDate = new Date(2007,0,01);
		var recentStuffArr = "${sdist.compbegindate4Cal}".split('-');
		var mostRecentDate = new Date(recentStuffArr[0],recentStuffArr[1]-1,recentStuffArr[2]);
		/* console.log(mostRecentDate instanceof Date && !isNaN(mostRecentDate.valueOf())) */
		
		function getDateCalculated(whichOperator){
			var dStrArr =  $("#meDemo").val().split('-');		
			//var currDate = $('#meDemo').data('daterangepicker').startDate;    ---> not a date obj
			var currDate = new Date(dStrArr[0],dStrArr[1]-1,dStrArr[2]);
			var dateTarget = getRetrievalInterval(whichOperator,currDate);
			
			if(dateTarget.getTime() < minDate.getTime()){
				alert("자료 제공 범위는 2007-01-01 부터  ${sdist.compbegindate4Cal}까지 입니다.");
				$('#meDemo').data('daterangepicker').setStartDate(moment(minDate).format('YYYY-MM-DD'));
   				$('#meDemo').data('daterangepicker').setEndDate(moment(minDate).format('YYYY-MM-DD'));
   				$('#meDemo').val(moment(minDate).format('YYYY-MM-DD'));
				meRequest(moment(minDate));
			}else if(dateTarget.getTime() > mostRecentDate.getTime()){
				alert("자료 제공 범위는 2007-01-01 부터  ${sdist.compbegindate4Cal}까지 입니다.");
				$("#btn_getMostRecentOne").trigger( "click" );
			}else{
				$('#meDemo').data('daterangepicker').setStartDate(moment(dateTarget).format('YYYY-MM-DD'));
   				$('#meDemo').data('daterangepicker').setEndDate(moment(dateTarget).format('YYYY-MM-DD'));
   				$('#meDemo').val(moment(dateTarget).format('YYYY-MM-DD'));
				meRequest(moment(dateTarget));
			}
			//updateSelectedDate( $("#datepicker").val().split('-').join(''));
		}
		
		
		function getRetrievalInterval(operator,currDate){
			var dateCalculated = currDate;
			//var interval = $('#retrievalIntervalChooser').find(":selected").val()+'';
   		var interval = $('#retrievalRangeSelector .selected').attr('value');
			var math_it_up={ 'btn_next': function (x, y) { return x + y },
				    		 'btn_prev': function (x, y) { return x - y }
			};
			
	 		if(interval=='DAY'){
	 			dateCalculated.setDate(math_it_up[operator](dateCalculated.getDate(),1));
			}else if(interval=='WEEK'){
				dateCalculated.setDate(math_it_up[operator](dateCalculated.getDate(),7));
			}else if(interval=='MONTH'){
				//dateCalculated.setMonth(math_it_up[operator](dateCalculated.getMonth(),1));
				var addOrSubtractMonth= (operator=='btn_prev')? -1:1; //31 Jan + 1 month = 28 Feb
				dateCalculated = new Date(dateCalculated).add(addOrSubtractMonth).month();
			}else if(interval=='YEAR'){
				dateCalculated = new Date(dateCalculated).add((operator=='btn_prev')? -1:1).year();
			}
			return dateCalculated;
		}
		
		function errOccuredWhileChangingSource(imgObj){
		//	imgObj.onerror = '';
			imgObj.src = "<c:url value='/assets/onError/noDataAvailable.png'/>";
			return true;
		}
		
		/* 
		var state = 'stop';
		function buttonPlayPress() {
		    if(state=='stop'){
		      state='play';
		      var button = d3.select("#button_play").classed('btn-success', true); 
		      button.select("i").attr('class', "fa fa-pause");  
		    }
		    else if(state=='play' || state=='resume'){
		      state = 'pause';
		      d3.select("#button_play i").attr('class', "fa fa-play"); 
		    }
		    else if(state=='pause'){
		      state = 'resume';
		      d3.select("#button_play i").attr('class', "fa fa-pause");        
		    }
		    console.log("button play pressed, play was "+state);
		 }
			 */		
			 
			 
		
	</script>
		


	<script type="text/javascript">
		$.fn.modal.defaults.spinner = $.fn.modalmanager.defaults.spinner = 
	      '<div class="loading-spinner" style="width: 200px; margin-left: -100px;">' +
	        '<div class="progress progress-striped active">' +
	          '<div class="progress-bar" style="width: 100%;"></div>' +
	        '</div>' +
	      '</div>';

	    $.fn.modalmanager.defaults.resize = true;
	</script>
	
	<script id="ajax" type="text/javascript">
		var currDateString;
		var titleString;
		$('.mePopup_ext .btn').on('click', function(e){
	//		$('#panzoomDialog').modalmanager('removeLoading');	
		  	var path = "<c:url value='/data/ASC/SEAICE/Y'/>" + currDateString.substring(0,4) + "/dmsp_ssmis_ice_"   +currDateString+".svg";
		  
			//$('#myPleaseWait').modal('show');
		  /* 
			var opts = {
					lines: 13, // The number of lines to draw
					length: 11, // The length of each line
					width: 5, // The line thickness
					radius: 17, // The radius of the inner circle
					corners: 1, // Corner roundness (0..1)
					rotate: 0, // The rotation offset
					color: '#FFF', // #rgb or #rrggbb
					speed: 1, // Rounds per second
					trail: 60, // Afterglow percentage
					shadow: false, // Whether to render a shadow
					hwaccel: false, // Whether to use hardware acceleration
					className: 'spinner', // The CSS class to assign to the spinner
					zIndex: 2e9, // The z-index (defaults to 2000000000)
					top: 'auto', // Top position relative to parent in px
					left: 'auto' // Left position relative to parent in px
			};
			//var target = document.createElement("div");
			//document.body.appendChild(target);
//			var spinner = new Spinner(opts).spin(target);
			var spinner = new Spinner(opts).spin($('#modal-body'));
			iosOverlay = iosOverlay({
				text: "Fetching SVG..",
				duration: 8e3,
				spinner: spinner
			});
//			return false;
		   */
		  
		  $('#icePopup').load(function(){
//		     $('#panzoomDialog').modalmanager('removeLoading');
		  }).attr('src',path);

		  
		  $('#popupTitle').text('SSMIS 해빙 면적('+titleString+')');
		  $('#meReset').click();
//		  $('#panzoomDialog').modalmanager('loading');
		  $('#panzoomDialog').modal('show');
		  
		});	
		
		$('.mePopup_rou .btn').on('click', function(){
		  $('#panzoomDialog').modalmanager('removeLoading');
		  var path = "<c:url value='/data/ASC/ROUGH/Y'/>" + currDateString.substring(0,4) + "/dmsp_ssmis_rou_"   +currDateString+".svg";
		  $('#icePopup').load(function(){
			  //$('#panzoomDialog').modalmanager('removeLoading');
		  }).attr('src',path);
		  $('#popupTitle').text('SSMIS 해빙 표면거칠기('+titleString+')');
		  $('#meReset').click();
//		  $('#panzoomDialog').modalmanager('loading');
		  $('#panzoomDialog').modal('show');
		});	

	</script> 
	
	
	
<div id="panzoomDialog" class="modal container fade" tabindex="-1" style="display: none;">
 	<div id="modalHeader" class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 id="popupTitle"></h4>
	</div>
	<div id="meModalBody" class="modal-body ">
		<section id="inverted-contain">
	      <div class="buttons">
	        <button class="btn btn-primary zoom-in"><i class="fa fa-fw fa-search-plus"></i>확대</button>
	        <button class="btn btn-primary zoom-out"><i class="fa fa-fw fa-search-minus"></i>축소</button>
	        <button id="meReset" class="btn btn-primary reset">Reset</button>
	      </div>
	      
	      <div class="panzoom-parent">
	       	<img id="icePopup" class="panzoom"   width="500"/>
	      </div>
	      
	      
	      <script>
	        (function() {
	          var $section = $('#inverted-contain');
	          $section.find('.panzoom').panzoom({
	            $zoomIn: $section.find(".zoom-in"),
	            $zoomOut: $section.find(".zoom-out"),
	            $reset: $section.find(".reset"),
	            startTransform: 'scale(1.0)',
	            increment: 0.5,
	            maxScale:3,
	            minScale: 1,
	          }).panzoom('zoom');
	          
	          $('#meReset').click();
	        })();
	      </script>
		 </section>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn">Close</button>
	</div>
</div>


<!-- Modal Start here
<div class="modal fade bs-example-modal-sm" id="myPleaseWait" tabindex="-1"
    role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-time">
                    </span>Please Wait
                 </h4>
            </div>
            <div class="modal-body">
                <div class="progress">
                    <div class="progress-bar progress-bar-info
                    progress-bar-striped active"
                    style="width: 100%">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
-->
<!-- Modal ends Here -->



</body>

</html>