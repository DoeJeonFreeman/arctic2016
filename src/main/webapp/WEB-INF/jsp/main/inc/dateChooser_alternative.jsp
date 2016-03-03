<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.go.seaice.common.LoginVO"%>

<!-- datePicker -->
    <link href="<c:url value="/css/bootstrap-datepicker.css"/>" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>


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

<header class="meControllPanel">
			<div class="container" align="left">
			            <div class="row form-horizontal">
			            
			            	<div class="span2 col-md-2" id="sandbox-container">
				                <div class="input-group date">
									<input id="dateComp" type="text" class="form-control">
							  		<span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
								</div>
			            	</div>
			            	
			            	<div class="span3 col-md-3" id="sandbox-container2">
								<div class="input-daterange input-group" id="dateRangePicker">
								    <input type="text" class="input-sm form-control" name="start" id="dateFrom"/>
								    <span class="input-group-addon">to</span>
								    <input type="text" class="input-sm form-control" name="end" id="dateTo" />
								</div>
							</div>															
								
			            </div>
			            
			            		<script type="text/javascript">
							        	$('#sandbox-container .input-group.date').datepicker({
							        		format: "yyyy-mm-dd",
							        	    todayBtn: "linked",
							        	    autoclose: true
							        	});
							        	
							        	
							        	$('#sandbox-container2 .input-daterange').datepicker({
							        	    format: "yyyy-mm-dd",
							        	    startDate: "2007-01-01",
							        	    endDate: "2015-08-15",
							        	    todayBtn: "linked",
							        	    orientation: "top left",
							        	    autoclose: true
							        	});
							        	
							        	
							    </script>    
					<!--  
					-->
			        
			</div>
	</header>
	
	