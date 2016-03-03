<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


    <script src="<c:url value="/js/scalable/panzoom/jquery.panzoom.js"/>"></script>
    <script src="<c:url value="/js/scalable/panzoom/jquery.mousewheel.js"/>"></script>

      
		<style>
		     #inverted-contain .panzoom { width: 100%; height: 100%; }
		</style>
<!-- 
<script type="text/javascript">

var itemSize=3;

$(document).ready(function() {
	$('#control_resize_small').click(function() {
		console.log('control_resize_small.click()');
		rowItem_resizable(6);
	});
	
	$('#control_resize_medium').click(function() {
		console.log('control_resize_medium.click()');
		rowItem_resizable(12);
	});
	
	$('#control_resize_large').click(function() {
		console.log('control_resize_small.click()');
		rowItem_resizable(24);
	});
	
	var rowItem_resizable = function(size) {
		console.log('col-md-'+itemSize);
		console.log('col-md-'+size);
		console.log('col-lg-'+size);
		$('#svgDialog').removeClass('col-md-'+itemSize);
		$('#svgDialog').removeClass('col-xs-'+itemSize);
		$('#svgDialog').removeClass('col-lg-'+itemSize);
		$('#svgDialog').addClass('col-md-'+size);
		$('#svgDialog').addClass('col-xs-'+size);
		$('#svgDialog').addClass('col-lg-'+size);
		itemSize = size;
	}; 
});
</script>

 -->
 
 <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4>SSMIS 해빙분포 (2012.06.18. ~ 2012.06.25.)</h4>
</div>


<!-- 
<section id="focal">
      <h1>Use the mousewheel to zoom on a focal point</h1>
      <div class="parent">
        <div class="panzoom">
          <img id="svgDialog" src="<c:url value="/repos/rou.svg"/>"  width="3000"/>
        </div>
      </div>
      <script>
        (function() {
          var $section = $('#focal');
          var $panzoom = $section.find('.panzoom').panzoom();
          $panzoom.on('mousewheel.focal', function( e ) {
            e.preventDefault();
            var delta = e.delta || e.originalEvent.wheelDelta;
            var zoomOut = delta ? delta < 0 : e.originalEvent.deltaY > 0;
            $panzoom.panzoom('zoom', zoomOut, {
              startTransform: 'scale(1.0)',
              increment: 0.1,
              minScale:0.5,
              //onStart:0.7, //doesnt work
              maxScale:1,
              contain:'invert', //'invert'
              animate: false,
              duration: 200,
              focal: e
            });
          });
          $panzoom.panzoom("reset");
        })();
      </script>
    </section>
 -->






  

<div class="modal-body ">




<section id="inverted-contain">
  <!-- 
      <h1>Inverted containment within the parent element (to hide what's behind)</h1>
   -->
      <div class="buttons">
        <button class="zoom-in">Zoom In</button>
        <button class="zoom-out">Zoom Out</button>
        <!-- 
        <input type="range" class="zoom-range">
         -->
        <button id="meReset" class="reset">Reset</button>
      </div>
      
      <div class="panzoom-parent">
       	<img class="panzoom"  width="500"/>
      </div>
      
      

      
      
      <script>
        (function() {
          var $section = $('#inverted-contain');
          $section.find('.panzoom').panzoom({
            $zoomIn: $section.find(".zoom-in"),
            $zoomOut: $section.find(".zoom-out"),
          //  $zoomRange: $section.find(".zoom-range"),
            $reset: $section.find(".reset"),
            startTransform: 'scale(1.0)',
            increment: 0.5,
            maxScale:3,
            minScale: 1,
            //contain: 'invert'
          }).panzoom('zoom');
          
          $('#meReset').click();
        })();
      </script>
 </section>



<!-- 
	<div class="center-block">
		<button type="button" class="btn btn-default btn-sm" id='control_resize_small' title='표출 그림 작게 '><span class="glyphicon glyphicon-th-large"></span></button>
		<button type="button" class="btn btn-default btn-sm" id='control_resize_large' title='표출 그림 크게 '><span class="glyphicon glyphicon-th-large"></span></button>
		<button type="button" class="btn btn-default btn-sm" id='control_resize_medium' title='표출 그림 중간 크기 '><span class="glyphicon glyphicon-th-large"></span></button>
	</div>
 -->
<!-- 
	<ul class="nav nav-tabs">
		<li class="active"><a href="#tab1" data-toggle="tab">해빙 면적</a></li>
		<li><a href="#tab2" data-toggle="tab">해빙 표면거칠기</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active center-block" id="tab1"><p>2015.08.06. ~ 2015.08.12.</p></div>
		<div class="tab-pane" id="tab2"><p>2015.08.06. ~ 2015.08.12.</p></div>
	</div>
 -->
	<!-- 
	<button class="btn update">Update</button>
	 -->
	
</div>
<!-- 
 -->
<div class="modal-footer">
	<button type="button" data-dismiss="modal" class="btn">Close</button>
	<button type="button" class="btn btn-primary">Save</button>
</div>



