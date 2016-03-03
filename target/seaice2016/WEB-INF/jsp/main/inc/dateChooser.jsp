<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- datePicker -->
    <link href="<c:url value="/js/daterangepicker/daterangepicker.css"/>" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="<c:url value="/js/daterangepicker/moment.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/daterangepicker/daterangepicker.js"/>"></script>


<style>
#breadcrumbs-one{
  /* background: #eee; */
  background: #c0c0c0;
  border-width: 0px;
  border-style: solid;
  border-color: #f5f5f5 #e5e5e5 #ccc;
  border-radius: 5px;
  box-shadow: 0 0 2px rgba(0,0,0,.0);
  overflow: hidden;
  width: 100%;
  margin-bottom:2px;
}

#breadcrumbs-one li{
  float: left;
}

#breadcrumbs-one a{
  padding: .7em 1em .7em 2em;
  float: left;
  text-decoration: none;
  color: #444;
  position: relative;
  text-shadow: 0 1px 0 rgba(255,255,255,.5);
  background-color: #ddd;
  background-image: linear-gradient(to right, #bbb, #c0c0c0);  
}

#breadcrumbs-one li:first-child a{
  padding-left: 1em;
  border-radius: 5px 0 0 5px;
}

#breadcrumbs-one a:hover{
  background: #fff;
}

#breadcrumbs-one a::after,
#breadcrumbs-one a::before{
  content: "";
  position: absolute;
  top: 50%;
  margin-top: -1.5em;   
  border-top: 1.5em solid transparent;
  border-bottom: 1.5em solid transparent;
  border-left: 1em solid;
  right: -1em;
}

#breadcrumbs-one a::after{ 
  z-index: 2;
  border-left-color: #c0c0c0;  
}

#breadcrumbs-one a::before{
  border-left-color: #ccc;  
  right: -1.1em;
  z-index: 1; 
}

#breadcrumbs-one a:hover::after{
  border-left-color: #fff;
}

#breadcrumbs-one .current,
#breadcrumbs-one .current:hover{
  font-weight: bold;
  background: none;
}

#breadcrumbs-one .current::after,
#breadcrumbs-one .current::before{
  content: normal;  
}
</style>




<style>
.demo i {
    position: absolute;
    bottom: 10px;
    right: 24px;
    top: auto;
    cursor: pointer;
}

#meDemo{
	font-size:12px;	
	
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    line-height: 1.42857143;
    color: #555;
    background-color: #eee;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
	
}

</style>

<script type="text/javascript">

</script>

	<header class="meControllPanel">
			<div class="container" align="left">
			            <div class="row form-horizontal">
		<!-- 	            
			            	<div class="col-lg-2 col-md-2 col-sm-3 col-xs-5" id="sandbox-container">
				                <div class="input-group date">
									<input id="dateComp" type="text" class="form-control">
							  		<span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
								</div>
			            	</div> 
		 -->	            
			            
			            
			            	
			            	 <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5 demo vcenter">
					            <input type="text" id="meDemo" class="form-control">
					            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
					          </div>
			            	
			            	
			            <div class="vcenter">
			            	<div class="pull-left">
			            		<button  type="button" class="meBtn meBtn-primary meBtn-lg outline">최근</button>
			            	</div>
			            	<div class="pull-left">
			            		<button type="button" class="meBtn meBtn-primary  fa fa-chevron-left"></button>
			            	</div>
			            	
			            	
			            	
			            	<div class="dropdown pull-left">
							    <button class="  btn-small dropdown-toggle " type="button" id="menu1" data-toggle="dropdown" style="margin-top:5px;"> 7일 
							    <span class="caret"></span></button>
							    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
							      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">7일</a></li>
							      <li role="presentation" class="divider"></li>
							      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1달</a></li>
							    </ul>
						    </div>
			            	<div class="pull-left">
			            		<button type="button" class="meBtn meBtn-primary fa fa-chevron-right"></button>
			            	</div>
			            </div>	
			            	
			            	${sdist.compbegindate4Cal}
			            	
			            	<div class="pull-right" style="padding-right:50px;"> 
				            	<ul id="breadcrumbs-one" class="pull-right vcenter" >
									<li><a href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
									<li><a href="#">해빙감시</a></li>
									<li><a href="#">SSMIS</a></li>
								</ul>
			            	</div>
			            </div>
			            
			            		<script type="text/javascript">
			            		//alert('fxxk:: ' +  '<c:out value="${sdist.compbegindate4Cal}" />');
			            		//alert("${sdist.compbegindate4Main}");
				            		$('#meDemo').daterangepicker({
				            			locale: {
				            				format: 'YYYY-MM-DD'
				            			}, 
				            		    "singleDatePicker": true,
				            		    "showDropdowns": true,
				            		    /* "startDate": moment().subtract(6, 'days'), */
				            		    /* 
				            		    "endDate":moment().subtract(0, 'days'),
				            		    */
				            		    "startDate": "<c:out value="${sdist.compbegindate4Cal}" />", 
				            		    "endDate": "<c:out value="${sdist.compbegindate4Cal}" />",
				            		    "minDate": "2007-01-01",
				            		    "maxDate": "<c:out value="${sdist.compbegindate4Cal}" />"     //today
				            		    
				            		}, function(start, end, label) {
				            		  console.log("<c:out value="${sdist.compbegindate4Cal}" />");
				            		  console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
				            		  console.log("[START] " + start.format('YYYY-MM-DD')); //start=longtime
				            		  console.log("[END] " + end.format('YYYY-MM-DD'));
				            		  console.log("[LABEL] " + label);
				            		  console.log(start);
				            		  console.log(end);
				            		  console.log(label);
				            		  
				            		  
				            		  $.ajax({
				            			  type: "get",
				            			  url: "<c:url value='/' />arctic/findMatchingStuff",
				            			  cache: false,    
				            			  data: "selectedDate="+start.format('YYYY-MM-DD'),
				            			  success: function(response){
				            			   //var obj = $.parseJSON(response);
				            			   //alert(obj.roughness);
				            			   alert(response.compbegindateInString);
				            			  },
				            			  error: function(){      
				            			   alert('Error while request..');
				            			  }
				            			 });
				            		  
				            		  
				            		  
				            		});
							        	
							    </script>    
					<!--  
					-->
			        
			</div>
	</header>
	
	