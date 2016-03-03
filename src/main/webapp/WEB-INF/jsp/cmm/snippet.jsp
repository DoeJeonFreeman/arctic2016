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
    
	<title>북극항로</title>
	
	<script src="<c:url value="/mestrap/js/jquery.js"/>"></script>	
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/mestrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/mestrap/css/modern-business.css"/>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/mestrap/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
	<!-- 2c.doe.hicharts -->
	<script src="<c:url value="/js/highchart/highcharts.js"/>"></script>
	<script src="<c:url value="/js/highchart/highcharts-more.js"/>"></script>
	<script src="<c:url value="/js/highchart/modules/exporting.js"/>"></script>
	
	<script type="text/javascript" src="<c:url value="/js/jquery/date.js"/>"></script>
	
	<!-- 2c.doe.hicharts -->
	<script src="<c:url value="/js/scalable/colorpicker.js"/>"></script>
	<script src="<c:url value="/js/scalable/mapcolorizer2.js"/>"></script>
	<script src="<c:url value="/js/scalable/messagebox.js"/>"></script>
	
	
	<script src="<c:url value="/js/modal/bootstrap-modalmanager.js"/>"></script>	
	<script src="<c:url value="/js/modal/bootstrap-modal.js"/>"></script>	
    <link href="<c:url value="/css/bootstrap-modal-bs3patch.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/bootstrap-modal.css"/>" rel="stylesheet">
	
	
	

</head>

<body onload="mapcolorizer = new MapColorizer(document.getElementById('map'))" > <!-- onload="mapcolorizer = new MapColorizer(document.getElementById('map'))" -->
	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
	<!-- 전체 레이어 시작 -->

	<!-- header-->
	<div id="meHeader">
	    <c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
	</div>
	
		
	   <!-- Page Content -->
    <div class="container" >
		
		<h2>Colorizer</h2>
	    <p>
	    	<object id="map" data="<c:url value="/js/scalable/BlankMap-World6_compact_+++.svg"/>" width="100%" height="415px" type="image/svg+xml"></object>
	      	Click a country to give it a color!
        </p>
        
	    <button onclick="mapcolorizer.export_svg()">Export SVG</button>
	    <button onclick="mapcolorizer.export_stylesheet()">Export map stylesheet only</button>
	    
	    <p style="font-size:75%; text-align: right">By <a href="mailto:ed@opera.com">Erik Dahlström</a>, 2008<br/>
	    	World map from <a href="http://commons.wikimedia.org/wiki/Image:BlankMap-World6,_compact.svg">Wikimedia Commons</a>, public domain.
	    	<!-- width100퍼줬을 때 object,img 간 사이즈 상이함 ㅡ,.ㅡ  
      		<object data="<c:url value="/js/scalable/arctic.svg"/>" width="100%"  type="image/svg+xml"></object>
	    	 -->
      		<img src="<c:url value="/js/scalable/arctic.svg"/>" width="50%" class="img-responsive" />
	    </p>
	    
	    
	    
	</div>	 			
	  
	  <!-- 
      <button class="demo btn btn-primary btn-large" data-toggle="modal" data-target="#full-width">View Demo full width</button>
      <div id="full-width" class="modal container  fade" tabindex="-1">
	      <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3>Full Width</h3>
		  </div>
		  <div class="modal-body">
		    <p>This modal will resize itself to the same dimensions as the container class.</p>
		    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sollicitudin ipsum ac ante fermentum suscipit. In ac augue non purus accumsan lobortis id sed nibh. Nunc egestas hendrerit ipsum, et porttitor augue volutpat non. Aliquam erat volutpat. Vestibulum scelerisque lobortis pulvinar. Aenean hendrerit risus neque, eget tincidunt leo. Vestibulum est tortor, commodo nec cursus nec, vestibulum vel nibh. Morbi elit magna, ornare placerat euismod semper, dignissim vel odio. Phasellus elementum quam eu ipsum euismod pretium.</p>
		    <img id="lion"  src="<c:url value="/repos/lion.svg" />"  width="100%"  class="img-responsive"/>
		  </div>
		  <div class="modal-footer">
		    <button type="button" data-dismiss="modal" class="btn">Close</button>
		    <button type="button" class="btn btn-primary">Save changes</button>
		  </div>
	  </div>
	
	   -->  
		
		
		
		<div id="ajax-modal" class="modal container fade" tabindex="-1" style="display: none;"></div>
		
		<div class="ajax" style="position: relative; overflow: hidden">
            <h3>AJAX (via jQuery.load)</h3>
            <pre class="pre-scrollable prettyprint linenums" data-source="#ajax">
            </pre>
            <div class="text-center">
            <button class="demo btn btn-primary btn-lg" data-toggle="modal">View Demo</button>
            </div>
          </div>
          
		
		
		
		
		
		
		
		
		
	<hr>
       <!-- Footer -->
	<div id="meFooter">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>	 	
	
	
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
	 	var $modal = $('#ajax-modal');
		
		$('.ajax .demo').on('click', function(){
		  $('body').modalmanager('loading');
		  //window.open('<c:url value="/arcticPageLink.do?link=/arctic/ajaxModalViaJQuery"/>');	
		  setTimeout(function(){
	        $modal.load('<c:url value="/arcticPageLink.do?link=/arctic/ajaxModalViaJQuery"/>', '', function(){
		      $modal.modal();
 /*어펜드던 프리펜드던 나중에!!!!*/
//		      $modal.modal('loading');					
//			  $modal.modal('loading').find('.modal-body').append('<img id="svgDialog" src="<c:url value="/repos/rou.svg"/>"  class="img-responsive" />');
 /*어펜드던 프리펜드던 나중에!!!!*/
		    });
		  }, 1000);
		});	
		/* button update comment out
		$modal.on('click', '.update', function(){
		  $modal.modal('loading');
		  setTimeout(function(){
		    $modal
		      .modal('loading')
		      .find('.modal-body')
		        .prepend('<div class="alert alert-info fade in">' +
		          'Yup!<button type="button" class="close" data-dismiss="alert">&times;</button>' +
		        '</div>');
		  }, 1000);
		}); */ 
	</script> 
	
	
	
	
<!-- <script type="text/javascript">

var itemSize=3;

$(document).ready(function() {
	// Load required scripts and draw graphs
	// LoadAmchartsScripts(DrawAllAmCharts);
	
	
	//box ui-draggable ui-droppable
	//to disable for concrete element add class .no-drop
	
	/**
	*/
	$('#control_resize_small').click(function() {
		console.log('control_resize_small.click()');
		rowItem_resizable(3);
	//	View.SizeChange(3);
	});
	
	$('#control_resize_medium').click(function() {
		console.log('control_resize_medium.click()');
		rowItem_resizable(4);
	//	View.SizeChange(4);
	});
	
	$('#control_resize_large').click(function() {
		console.log('control_resize_small.click()');
		rowItem_resizable(6);
	//	View.SizeChange(6);
	});
	
	var rowItem_resizable = function(size) {
//		if(g_body_mode!=1) return;
		console.log('col-md-'+itemSize);
		console.log('col-md-'+size);
		$('#svgDialog').removeClass('col-md-'+itemSize);
		$('#svgDialog').removeClass('col-xs-'+itemSize);
		$('#svgDialog').addClass('col-md-'+size);
		$('#svgDialog').addClass('col-xs-'+size);
		itemSize = size;
	}; 
	
	
	// $('#myModal').on('show.bs.modal', function () {
       // $(this).find('.modal-body').css({
              // width:'auto', //probably not needed
              // height:'auto', //probably not needed 
              // 'max-height':'100%'
       // });
	// });
	
	
});
</script> -->
	
	
</body>

</html>