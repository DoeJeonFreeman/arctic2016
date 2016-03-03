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
    
	<title>해역별분포</title>
	
	
	<script src="<c:url value="/js/jquery/jquery-1.9.1.js"/>"></script>	
    <script src="<c:url value="/mestrap/js/bootstrap.min.js"/>"></script>
	
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

	<!-- datePicker -->
	<link href="<c:url value="/js/daterangepicker/daterangepicker.css"/>" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="<c:url value="/js/daterangepicker/moment.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/daterangepicker/daterangepicker.js"/>"></script>

	<!-- dateJS -->
	<script type="text/javascript" src="<c:url value="/js/jquery/date.js"/>"></script>
	

	
	<script>
		var thisYear = 2016;	
	
	
		Date.prototype.customFormat = function(formatString){
		    var YYYY,YY,MMMM,MMM,MM,M,DDDD,DDD,DD,D,hhh,hh,h,mm,m,ss,s,ampm,AMPM,dMod,th;
		    var dateObject = this;
		    YY = ((YYYY=dateObject.getFullYear())+"").slice(-2);
		    MM = (M=dateObject.getMonth()+1)<10?('0'+M):M;
		    MMM = (MMMM=["January","February","March","April","May","June","July","August","September","October","November","December"][M-1]).substring(0,3);
		    DD = (D=dateObject.getDate())<10?('0'+D):D;
		    DDD = (DDDD=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][dateObject.getDay()]).substring(0,3);
		    th=(D>=10&&D<=20)?'th':((dMod=D%10)==1)?'st':(dMod==2)?'nd':(dMod==3)?'rd':'th';
		    formatString = formatString.replace("#YYYY#",YYYY).replace("#YY#",YY).replace("#MMMM#",MMMM).replace("#MMM#",MMM).replace("#MM#",MM).replace("#M#",M).replace("#DDDD#",DDDD).replace("#DDD#",DDD).replace("#DD#",DD).replace("#D#",D).replace("#th#",th);
	
		    h=(hhh=dateObject.getHours());
		    if (h==0) h=24;
		    if (h>12) h-=12;
		    hh = h<10?('0'+h):h;
		    AMPM=(ampm=hhh<12?'am':'pm').toUpperCase();
		    mm=(m=dateObject.getMinutes())<10?('0'+m):m;
		    ss=(s=dateObject.getSeconds())<10?('0'+s):s;
		    return formatString.replace("#hhh#",hhh).replace("#hh#",hh).replace("#h#",h).replace("#mm#",mm).replace("#m#",m).replace("#ss#",ss).replace("#s#",s).replace("#ampm#",ampm).replace("#AMPM#",AMPM);
		}
	
	
	
		function requestData(dateFrom){
			$.ajax({
				type: 'GET',dataType:'json',contentType:'application/json',
				url: '${pageContext.request.contextPath}/ajax/getSeriesData',
				data:'whichSeries=ts_ice_3p',
		        success: function(jsonData) {
					//fluxTowerSeries
					//if(jsonData.djd.latestStuff !=null){
						var date_lastOne =new Date(thisYear,05,16);
						//datipicker setDate() method is causing the datepicker to always be seen at the bottom of the page..
						// append the following right after datepicker creation code
						/* $('#ui-datepicker-div').css('display','none'); // eliminate the visual artifact on the screen.. 
						$('#datepicker').datepicker("setDate", date_lastOne); */
					//}
					
					subtractPointData(jsonData.data.ice.someList.barents, 'djd');
					subtractPointData(jsonData.data.ice.someList.bering, 'gmd');
					subtractPointData(jsonData.data.ice.someList.hudson, 'uld');
					
		        },
		        cache: false	
			});
		}

		
		function subtractPointData(someList, targetDiv){
			e07 = [];  r07 = [];
			e12 = [];  r12 = [];
			eCurrYear = [];  rCurrYear = [];
			
			
			for ( var i = 0; i < someList.length; i++) {
				var dateStrArr = someList[i].date.split(",");
				var mm = parseInt(dateStrArr[0]);
				var dd = parseInt(dateStrArr[1]);
	
	/* 			nimr_sst.push([Date.UTC(yy,mm -1, dd),parseNumericVal(someList[i].e07) ]);
				buoy_sst.push([Date.UTC(yy,mm -1, dd),parseNumericVal(someList[i].e13) ]);
				diff.push([Date.UTC(yy,mm -1, dd),parseNumericVal(someList[i].e10) ]); */
				e07.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e07) ]);
				e12.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e12) ]);
				eCurrYear.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e16) ]);
				r07.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].r07) ]);
				r12.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].r12) ]);
				rCurrYear.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].r16) ]);
			}
			var _chart; 
			if(targetDiv == 'djd'){
				_chart = $('#djd').highcharts();				
			}else if(targetDiv == 'gmd'){
				_chart = $('#gmd').highcharts();				
			}else if(targetDiv == 'uld'){
				_chart = $('#uld').highcharts();				
			}
			_chart.series[0].setData(e07); 
			_chart.series[1].setData(r07); 
			_chart.series[2].setData(e12); 
			_chart.series[3].setData(r12); 
			_chart.series[4].setData(eCurrYear); 
			_chart.series[5].setData(rCurrYear); 
		}
		
		//missing val  <-assign null
		function parseNumericVal(someStuff){
			if(someStuff == null){
				return null;
			}else if(Math.abs(someStuff)==999){	
				return null;
			}else{
				return parseFloat(someStuff);
			}
		}
	
		
	</script>
	
	
	
	<script>
		var chart_Deokjeok;
		var chart_Geomun;
		var chart_Ulleung;
	
		$(document).ready(function(){
			chart_Deokjeok = new Highcharts.Chart({
				chart : {
					type : 'line',
					renderTo : 'djd',  								events:{load:requestData('init')},
					defaultSeriesType : 'line',
					plotBorderWidth : 1,
					plotBorderColor : '#346691', // '#346691',
					zoomType : 'xy',
					//marginLeft : 60,
					//marginRight : 60
					style: {
	                	fontFamily: 'Dotum'
	            	}
				},
				title: {
		            text: null,
		            align: 'left',
		            x: 50,
		            style:{
		            	font:'bold 14px Dotum'
		            }
		        },
		        subtitle: {
		            text: null,
		            x: 25,
		            style:{
		            	font:'normal 12px Dotum'
		            }
		        },
		        xAxis : {
					type : 'datetime',
					labels : {
						formatter : function() {
							var myDate = new Date(this.value);
							var newDateMs = Date.UTC(myDate.getUTCFullYear(), myDate.getUTCMonth() , myDate.getUTCDate());
						  //return Highcharts.dateFormat('%e. %b',newDateMs);
	//						return Highcharts.dateFormat('%m월 %d일',newDateMs);
						   return Highcharts.dateFormat('%b',newDateMs);
						}
					},
					

					//remove leading n trailling padding?space from the series of the timeseries chart haha
					startOnTick: true,
					endOnTick: false,				
					minPadding:0,
					maxPadding:0,
		            //tickmarkplacement:"on",
					
					lineColor : '#346691',
					lineWidth : 1,
					//gridLineWidth : 1
				},
		        yAxis: [{ //Primary yAxis
		        	
		        	//get rid of horizontal grid lines haha
		    		gridLineWidth: 0,
		            tickColor: '#346691',
		            tickLength: 5,
		            tickWidth: 1,
		            tickPosition: 'inside',
		            labels: {
		                align: 'right',
		                x:-10,
		                y:5
		            },
		            lineWidth:0,
		    		//get rid of horizontal grid lines haha
		        	
		            title: {
		                text: '해빙 면적 (x10^5 ㎢)',
	                	style : {
	                		font:'normal 12px Dotum'
							//color : '#000000'
	                	}	
		            },
		            labels:{
			            style : {
		            		font:'normal 11px Dotum'
							//color : '#000000'
			            }
	            	},	
		            plotLines: [{ //verticalColoredBand
		               // value: 0,
		                //width: 0,
		                //color: '#346691', 
		            }],
		            alignTicks:false,
		            tickInterval:2,
		            max:8,
		            min:0
		        },
	
		        {  
		        	
		        	//get rid of horizontal grid lines haha
		    		gridLineWidth: 0,
		            tickColor: '#346691',
		            tickLength: 5,
		            tickWidth: 1,
		            tickPosition: 'inside',
		            labels: {
		                align: 'right',
		                x:-10,
		                y:5
		            },
		            lineWidth:0,
		    		//get rid of horizontal grid lines haha
		        	
		        	//Tertiary yAxis~
		        	opposite:true,
		        	title: {
	                text: '해빙 표면거칠기 (cm)',
	            	style : {
	            		font:'normal 12px Dotum'
						//color : '#000000'
	            	}	
	            },
	            labels:{
		            style : {
	            		font:'normal 11px Dotum'
						//color : '#000000'
		            }
	        	},	
	            plotLines: [{ //verticalColoredBand
	               // value: 0,
	                //width: 0,
	                //color: '#346691', 
	            }],
	            alignTicks:false,
	            tickInterval:0.1,
	            max:0.60,
	            min:0.20}],
		        
		        tooltip: {
	//	            shared: true,
	//	            valueSuffix: '°C',
	//	            crosshairs: {
	//	            	color: 'red',
	//	            	snap: false
	//	           	},
		            formatter: function() {
		            	var myDate = new Date(this.x);
		            	var newDateMs = Date.UTC(myDate.getUTCFullYear(), myDate.getUTCMonth() , myDate.getUTCDate());
		                var s = this.series.name + '<br/>';
						s+= Highcharts.dateFormat('%m월 %d일', newDateMs)+'<br/>';
	//	                var s = Highcharts .dateFormat('%e. %b %Y', newDateMs)+'<br/>';
						s+= '<b>'+this.y + '</b>'
	//					Highcharts.dateFormat('%Y. %m. %d.', newDateMs)+'<br/>';
	//	                $.each(this.points, function(i, point) {
	//	                    s += this.series.name + ': <b>' + this.y + '°C</b><br/>';
	//	                    Highcharts.dateFormat('%a %e %b %Y', this.point.options.from) + 
	//	                    ' - ' + Highcharts.dateFormat('%a %e %b %Y', this.point.options.to);
	//	                });
		                return s;
		            }
		        },
		        
				exporting: {
					enabled:false
		        },
		        
		        credits: {
		            enabled: false
		        },
		        plotOptions:{
		        	series:{
		        		lineWidth:1,
		    		  	marker:{
			            		symbol:'circle',
			            		radius:2,
			            		enabled:false
		  	            }
		        	}  
		        },
		        series: [
			 	            {
			 	             name: '\'07 해빙면적',
			 	               color: '#CC0000' ,
			     	           connectNulls:false, data: []},
			 	        	{name: '\'07 해빙 표면거칠기',
			 	           	   color: '#CC0000',
			 	           	   dashStyle : 'Dash',
			 	           	   yAxis:1,
			 	              connectNulls:false, data: []}, 
			 	        	{name: '\'12 해빙면적',
			 	           	   color: '#3366CC',    	 
			 	               connectNulls:false, data: []}, 
			 	        	{name: '\'12 해빙 표면거칠기',
			 	           	   color: '#3366CC',            	 
			 	           	   dashStyle : 'Dash',
			 	           		yAxis:1,
			 	           	    connectNulls:false, data: []}, 
			 	        	{name: '\'16 해빙면적',
			 	           	   color: '#000000',
			 	           	   lineWidth: 1.5,
			 	           	   connectNulls:false, data: []}, 
			 	        	{name: '\'16 해빙 표면거칠기',
			 	           	   color: '#000000',            	 
			 	           	   dashStyle : 'Dash',
			 	             	lineWidth: 1.5,
			 	           		yAxis:1,
			 	           	    connectNulls:false, data: []} 
		 	          ],
		 	   legend: {
	                layout: 'horizontal',
	             //   align: 'right',
	        //        verticalAlign: 'top',
	                itemWidth:180,
	      //          useHTML:true,
	                x: 0,
	                y: 0,
	                borderWidth: 0,
	             /*something wired    
	             	itemMarginTop: 0,
	                itemMarginBottom: 0,
	                itemStyle: {
	                    lineHeight: '14px'
	                } */
	            }    
				
			}); //Deokjeokdo
			
			chart_Geomun = new Highcharts.Chart({
				chart : {
					type : 'line',
					renderTo : 'gmd',  								//events:{load:requestData('init')},
					defaultSeriesType : 'line',
					plotBorderWidth : 1,
					plotBorderColor : '#346691',
					zoomType : 'xy',
					//marginLeft : 60,
					//marginRight : 60
					style: {
	                	fontFamily: 'Dotum'
	            	}
				},
				title: {
		            text: null, //ㄱ+ctrl+space
		            align: 'left',
		            x: 50,
		            style:{
		            	font:'bold 16px Dotum'
		            }
		        },
		        subtitle: {
		            text: null, //ㄱ+ctrl+space
		            x: 25,
		            style:{
		            	font:'normal 13px Dotum'
		            }
		        },
		        xAxis : {
					type : 'datetime',
					labels : {
						formatter : function() {
							var myDate = new Date(this.value);
							var newDateMs = Date.UTC(myDate.getUTCFullYear(), myDate.getUTCMonth() , myDate.getUTCDate());
						  //return Highcharts.dateFormat('%e. %b',newDateMs);
	//						return Highcharts.dateFormat('%m월 %d일',newDateMs);
						   return Highcharts.dateFormat('%b',newDateMs);
						}
					},
					

					//remove leading n trailling padding?space from the series of the timeseries chart haha
					startOnTick: true,
					endOnTick: false,				
					minPadding:0,
					maxPadding:0,
		            //tickmarkplacement:"on",
					
					lineColor : '#346691',
					lineWidth : 1,
					gridLineWidth : 0 //
				},
				yAxis: [{ //Primary yAxis
					
					//get rid of horizontal grid lines haha
		    		gridLineWidth: 0,
		            tickColor: '#346691',
		            tickLength: 5,
		            tickWidth: 1,
		            tickPosition: 'inside',
		            labels: {
		                align: 'right',
		                x:-10,
		                y:5
		            },
		            lineWidth:0,
		    		//get rid of horizontal grid lines haha
					
		            title: {
		                text: '해빙 면적 (x10^5 ㎢)',
	                	style : {
	                		font:'normal 12px Dotum'
							//color : '#000000'
	                	}	
		            },
		            labels:{
			            style : {
		            		font:'normal 11px Dotum'
							//color : '#000000'
			            }
	            	},	
		            plotLines: [{ //verticalColoredBand
		               // value: 0,
		                //width: 0,
		                //color: '#346691', 
		            }],
		            alignTicks:false,
		            tickInterval:2,
		            max:8,
		            min:0
		        },
	
		        {  
		        	//get rid of horizontal grid lines haha
		    		gridLineWidth: 0,
		            tickColor: '#346691',
		            tickLength: 5,
		            tickWidth: 1,
		            tickPosition: 'inside',
		            labels: {
		                align: 'right',
		                x:-10,
		                y:5
		            },
		            lineWidth:0,
		    		//get rid of horizontal grid lines haha
		        	
		        	//Tertiary yAxis~
		        	opposite:true,
		        	title: {
	                text: '해빙 표면거칠기 (cm)',
	            	style : {
	            		font:'normal 12px Dotum'
						//color : '#000000'
	            	}	
	            },
	            labels:{
		            style : {
	            		font:'normal 11px Dotum'
						//color : '#000000'
		            }
	        	},	
	            plotLines: [{ //verticalColoredBand
	               // value: 0,
	                //width: 0,
	                //color: '#346691', 
	            }],
	            alignTicks:false,
	            tickInterval:0.1,
	            max:0.60,
	            min:0.20}],
		        tooltip: {
	//	            shared: true,
	//	            valueSuffix: '°C',
	//	            crosshairs: {
	//	            	color: 'red',
	//	            	snap: false
	//	           	},
		            formatter: function() {
		            	var myDate = new Date(this.x);
		            	var newDateMs = Date.UTC(myDate.getUTCFullYear(), myDate.getUTCMonth() , myDate.getUTCDate());
		                var s = this.series.name + '<br/>';
						s+= Highcharts.dateFormat('%m월 %d일', newDateMs)+'<br/>';
	//	                var s = Highcharts .dateFormat('%e. %b %Y', newDateMs)+'<br/>';
						s+= '<b>'+this.y + '</b>'
	//					Highcharts.dateFormat('%Y. %m. %d.', newDateMs)+'<br/>';
	//	                $.each(this.points, function(i, point) {
	//	                    s += this.series.name + ': <b>' + this.y + '°C</b><br/>';
	//	                    Highcharts.dateFormat('%a %e %b %Y', this.point.options.from) + 
	//	                    ' - ' + Highcharts.dateFormat('%a %e %b %Y', this.point.options.to);
	//	                });
		                return s;
		            }
		        },
		        
				exporting: {
					enabled:false
		        },
		        
		        credits: {
		            enabled: false
		        },
		        plotOptions:{
		        	series:{
		        		lineWidth:1,
		    		  	marker:{
			            		symbol:'circle',
			            		radius:2,
			            		enabled:false
		  	            }
		        	}  
		        },
		        series: [
			 	            {
			 	             name: '\'07 해빙면적',
			 	               color: '#CC0000' ,
			     	           connectNulls:false, data: []},
			 	        	{name: '\'07 해빙 표면거칠기',
			 	           	   color: '#CC0000',
			 	           	   dashStyle : 'Dash',
			 	           	   yAxis:1,
			 	              connectNulls:false, data: []}, 
			 	        	{name: '\'12 해빙면적',
			 	           	   color: '#3366CC',    	 
			 	               connectNulls:false, data: []}, 
			 	        	{name: '\'12 해빙 표면거칠기',
			 	           	   color: '#3366CC',            	 
			 	           	   dashStyle : 'Dash',
			 	           		yAxis:1,
			 	           	    connectNulls:false, data: []}, 
			 	        	{name: '\'16 해빙면적',
			 	           	   color: '#000000',
			 	           	   lineWidth: 1.5,
			 	           	   connectNulls:false, data: []}, 
			 	        	{name: '\'16 해빙 표면거칠기',
			 	           	   color: '#000000',            	 
			 	           	   dashStyle : 'Dash',
			 	             	lineWidth: 1.5,
			 	           		yAxis:1,
			 	           	    connectNulls:false, data: []} 
		 	          ],
		 	          
		 	         legend: {
		                 layout: 'horizontal',
		  //               align: 'right',
		         //        verticalAlign: 'top',
		                    itemWidth:180,
		       //          useHTML:true,
		                 x: 10,
		               //  y: 100,
		                 borderWidth: 0
		             }    
				
			}); //Deokjeokdo
			
	
			chart_Ulleung = new Highcharts.Chart({
				chart : {
					type : 'line',
					renderTo : 'uld',  								//events:{load:requestData('init')},
					defaultSeriesType : 'line',
					plotBorderWidth : 1,
					plotBorderColor : '#346691',
					zoomType : 'xy',
					//marginLeft : 60,
					//marginRight : 60
					style: {
	                	fontFamily: 'Dotum'
	            	}
				},
				title: {
		            text: null, //ㄱ+ctrl+space
		            align: 'left',
		            x: 50,
		            style:{
		            	font:'bold 16px Dotum'
		            }
		        },
		        subtitle: {
		            text: null, //ㄱ+ctrl+space
		            x: 25,
		            style:{
		            	font:'normal 13px Dotum'
		            }
		        },
		        xAxis : {
					type : 'datetime',
					labels : {
						formatter : function() {
							var myDate = new Date(this.value);
							var newDateMs = Date.UTC(myDate.getUTCFullYear(), myDate.getUTCMonth() , myDate.getUTCDate());
						  //return Highcharts.dateFormat('%e. %b',newDateMs);
	//						return Highcharts.dateFormat('%m월 %d일',newDateMs);
						   return Highcharts.dateFormat('%b',newDateMs);
						}
					},
					

					//remove leading n trailling padding?space from the series of the timeseries chart haha
					startOnTick: true,
					endOnTick: false,				
					minPadding:0,
					maxPadding:0,
		            //tickmarkplacement:"on",
		            
					lineColor : '#346691',
					lineWidth : 1,
					gridLineWidth : 0 //
				},
				yAxis: [{ //Primary yAxis
					
					//get rid of horizontal grid lines haha
		    		gridLineWidth: 0,
		            tickColor: '#346691',
		            tickLength: 5,
		            tickWidth: 1,
		            tickPosition: 'inside',
		            labels: {
		                align: 'right',
		                x:-10,
		                y:5
		            },
		            lineWidth:0,
		    		//get rid of horizontal grid lines haha
					
		            title: {
		                text: '해빙 면적 (x10^5 ㎢)',
	                	style : {
	                		font:'normal 12px Dotum'
							//color : '#000000'
	                	}	
		            },
		            labels:{
			            style : {
		            		font:'normal 11px Dotum'
							//color : '#000000'
			            }
	            	},	
		            plotLines: [{ //verticalColoredBand
		               // value: 0,
		                //width: 0,
		                //color: '#346691', 
		            }],
		            alignTicks:false,
		            tickInterval:2,
		            max:8,
		            min:0
		        },
	
		        {  
		        	
		        	//get rid of horizontal grid lines haha
		    		gridLineWidth: 0,
		            tickColor: '#346691',
		            tickLength: 5,
		            tickWidth: 1,
		            tickPosition: 'inside',
		            labels: {
		                align: 'right',
		                x:-10,
		                y:5
		            },
		            lineWidth:0,
		    		//get rid of horizontal grid lines haha
		        	//Tertiary yAxis~
		        	opposite:true,
		        	title: {
	                text: '해빙 표면거칠기 (cm)',
	            	style : {
	            		font:'normal 12px Dotum'
						//color : '#000000'
	            	}	
	            },
	            labels:{
		            style : {
	            		font:'normal 11px Dotum'
						//color : '#000000'
		            }
	        	},	
	            plotLines: [{ //verticalColoredBand
	               // value: 0,
	                //width: 0,
	                //color: '#346691', 
	            }],
	            alignTicks:false,
	            tickInterval:0.10,
	            max:0.60,
	            min:0.20}],
		        tooltip: {
	//	            shared: true,
	//	            valueSuffix: '°C',
	//	            crosshairs: {
	//	            	color: 'red',
	//	            	snap: false
	//	           	},
		            formatter: function() {
		            	var myDate = new Date(this.x);
		            	var newDateMs = Date.UTC(myDate.getUTCFullYear(), myDate.getUTCMonth() , myDate.getUTCDate());
		                var s = this.series.name + '<br/>';
						s+= Highcharts.dateFormat('%m월 %d일', newDateMs)+'<br/>';
	//	                var s = Highcharts .dateFormat('%e. %b %Y', newDateMs)+'<br/>';
						s+= '<b>'+this.y + '</b>'
	//					Highcharts.dateFormat('%Y. %m. %d.', newDateMs)+'<br/>';
	//	                $.each(this.points, function(i, point) {
	//	                    s += this.series.name + ': <b>' + this.y + '°C</b><br/>';
	//	                    Highcharts.dateFormat('%a %e %b %Y', this.point.options.from) + 
	//	                    ' - ' + Highcharts.dateFormat('%a %e %b %Y', this.point.options.to);
	//	                });
		                return s;
		            }
		        },
		        
				exporting: {
					enabled:false
		        },
		        
		        credits: {
		            enabled: false
		        },
		        plotOptions:{
		        	series:{
		        		lineWidth:1,
		    		  	marker:{
			            		symbol:'circle',
			            		radius:2,
			            		enabled:false
		  	            }
		        	}  
		        },
		        series: [
			 	            {
			 	             name: '\'07 해빙면적',
			 	               color: '#CC0000' ,
			     	           connectNulls:false, data: []},
			 	        	{name: '\'07 해빙 표면거칠기',
			 	           	   color: '#CC0000',
			 	           	   dashStyle : 'Dash',
			 	           	   yAxis:1,
			 	              connectNulls:false, data: []}, 
			 	        	{name: '\'12 해빙면적',
			 	           	   color: '#3366CC',    	 
			 	               connectNulls:false, data: []}, 
			 	        	{name: '\'12 해빙 표면거칠기',
			 	           	   color: '#3366CC',            	 
			 	           	   dashStyle : 'Dash',
			 	           		yAxis:1,
			 	           	    connectNulls:false, data: []}, 
			 	        	{name: '\'16 해빙면적',
			 	           	   color: '#000000',
			 	           	   lineWidth: 1.5,
			 	           	   connectNulls:false, data: []}, 
			 	        	{name: '\'16 해빙 표면거칠기',
			 	           	   color: '#000000',            	 
			 	           	   dashStyle : 'Dash',
			 	             	lineWidth: 1.5,
			 	           		yAxis:1,
			 	           	    connectNulls:false, data: []} 
		 	          ],
		 	          
		 	         legend: {
		                 layout: 'horizontal',
		 //                align: 'right',
		         //        verticalAlign: 'top',
		                     itemWidth:180,
		       //          useHTML:true,
		                 x: 10,
		               //  y: 100,
		                 borderWidth: 0
		             }    
				
			}); //Deokjeokdo
			
				
		    var path_img = "<c:url value='/data/IMG/OCN/OCN01/Y${fn:substring(sdist.compbegindateInString,0,4) }/dmsp_ssmis_ice_ocn01_${sdist.compbegindateInString}.png'/>";
	        $("#sd_barents").attr("src",path_img); 
	  //      $('#sd_barents').zoom({ on:'click' });	
			
		    var path_img2 = "<c:url value='/data/IMG/OCN/OCN02/Y${fn:substring(sdist.compbegindateInString,0,4) }/dmsp_ssmis_ice_ocn02_${sdist.compbegindateInString}.png'/>";
	        $("#sd_bering").attr("src",path_img2);
	//        $('#sd_bering').zoom({ on:'click' });	
			
		    var path_img3= "<c:url value='/data/IMG/OCN/OCN03/Y${fn:substring(sdist.compbegindateInString,0,4) }/dmsp_ssmis_ice_ocn03_${sdist.compbegindateInString}.png'/>";
	        $("#sd_hudson").attr("src",path_img3);
	   //     $('#sd_hudson').zoom({ on:'click' });	
		}); //JCV good to go sir
	
	</script>


	<script>
		function meRequest(meDateObj){
	 		$.ajax({
     			  type: "get",
     			  url: "<c:url value='/' />arctic/findMatchingStuff",
     			  cache: false,    
     			  data: "selectedDate="+meDateObj.format('YYYY-MM-DD'),
     			  success: function(response){
     			   //var obj = $.parseJSON(response);//alert(obj.roughness);
        	        
        	        changeImgSrc(response.compbegindateInString, response.compbegindate4View)
        	        
     			  },
     			  error: function(){      
     			   alert('Error while request..');
     			  },
     			  cache:false
   			 });
		}
		
		function changeImgSrc(dateStr,dRangeStr){
		    var path_img = "<c:url value='/data/IMG/OCN/OCN01/Y'/>" + dateStr.substring(0,4) + "/dmsp_ssmis_ice_ocn01_"+dateStr+".png";
 	        $("#sd_barents").attr("src",path_img);
 		    path_img =  "<c:url value='/data/IMG/OCN/OCN02/Y'/>" + dateStr.substring(0,4) + "/dmsp_ssmis_ice_ocn02_"+dateStr+".png";
 	        $("#sd_bering").attr("src",path_img);
 		    path_img = "<c:url value='/data/IMG/OCN/OCN03/Y'/>" + dateStr.substring(0,4) + "/dmsp_ssmis_ice_ocn03_"+dateStr+".png";;
 	        $("#sd_hudson").attr("src",path_img);
 	        
 	        $('#dRange_barents span').text(dRangeStr); //or use .html(<strong>textGoesHere</strong>') instead haha
 	        $('#dRange_bering span').text(dRangeStr); 
 	        $('#dRange_hudson span').text(dRangeStr); 
		}
		
		
		
		//var minDate = 20070101;
		//var mostRecent = "${sdist.compbegindateInString}" * 1;
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
				alert("자료 제공 범위는 2007-01-01 부터   ${sdist.compbegindate4Cal}까지 입니다.");
				$('#meDemo').data('daterangepicker').setStartDate(moment(minDate).format('YYYY-MM-DD'));
    			$('#meDemo').data('daterangepicker').setEndDate(moment(minDate).format('YYYY-MM-DD'));
    			$('#meDemo').val(moment(minDate).format('YYYY-MM-DD'));
				meRequest(moment(minDate));
			}else if(dateTarget.getTime() > mostRecentDate.getTime()){
				alert("자료 제공 범위는 2007-01-01 부터   ${sdist.compbegindate4Cal}까지 입니다.");
				$("#btn_getMostRecentOne").trigger( "click" );
			}else{
				$('#meDemo').data('daterangepicker').setStartDate(moment(dateTarget).format('YYYY-MM-DD'));
    			$('#meDemo').data('daterangepicker').setEndDate(moment(dateTarget).format('YYYY-MM-DD'));
    			$('#meDemo').val(moment(dateTarget).format('YYYY-MM-DD'));
				meRequest(moment(dateTarget));
			}
			
			
			//$('#datepicker').datepicker("setDate", currDate);
			
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
		
	</script>

</head>

<body id="fabulousbdtc">
	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
	<!-- 전체 레이어 시작 -->
	<!-- header-->
	<div id="meHeader">
	    <c:import url="/arcticPageLink.do?link=main/inc/meNavTop" />
	</div>
	
	<!-- 
		<div id="dateHandler">
			<c   import url="/arcticPageLink.do?link=main/inc/dateChooser"/>
		</div>	
	-->
	
	
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<header class="meControllPanel">
		<div class="container" align="left">
            <div class="row form-horizontal">
            	 <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5 demo vcenter">
		            <input type="text" id="meDemo" class="form-control" readonly="readonly">
		            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
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
					      <li id="1" role="presentation" value="WEEK"><a role="menuitem" tabindex="-1" href="#">1주일</a></li>
					      <li id="2" role="presentation" value="MONTH"><a role="menuitem" tabindex="-1" href="#">1개월</a></li>
					      <li id="3" role="presentation" value="YEAR"><a role="menuitem" tabindex="-1" href="#">1년</a></li>
					      <!-- 
					      <li role="presentation" class="divider"></li>
					       -->
					    </ul>
				    </div>
				    
				    <!-- 
				    <select id="retrievalIntervalChooser" style="font-size: 9pt;">
						<option value="MONTH">1 Month</option>
						<option value="YEAR">1 Year</option>
					</select>
				     -->
				    
	            	<div class="pull-left">
	            		<button  id="btn_next" type="button" class="meBtn meBtn-primary fa fa-chevron-right"  
	            			onclick="getDateCalculated(this.id)"></button>
	            	</div>
	            </div>	
            
           		<div class="pull-right" style="padding-right:50px;"> 
	            	<ul id="breadcrumbs-one" class="pull-right vcenter" >
						<li><a href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
						<li><a>해빙감시</a></li>
						<li><a>해역별분포</a></li>
					</ul>
            	</div>
            </div>
		     
		            
        	<script type="text/javascript">
        		
 /*        	$('body').on('click','.option li',function(){
        		var i = $(this).parents('.select').attr('id');
        		var v = $(this).children().text();
        		var o = $(this).attr('id');
        		$('#'+i+' .selected').attr('id',o);
        		$('#'+i+' .selected').text(v);
        	}); */
        	
        	
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
					//click event는 발생안하네        			
        			changeImgSrc("<c:out value="${sdist.compbegindateInString}" />","<c:out value="${sdist.compbegindate4View}" />");
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
           			
           		 /* 
           		  console.log("<c:out value="${sdist.compbegindate4Cal}" />");
           		  console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
           		  console.log("[START] " + start.format('YYYY-MM-DD')); //start=longtime
           		  console.log("[END] " + end.format('YYYY-MM-DD'));
           		  console.log("[LABEL] " + label);
           		  console.log(start);
           		  console.log(end);
           		  console.log(label); 
           		  */
           		  
           		});
		        	
		    </script>    
		        
		</div>
	</header>
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
		 
	 
		
    <!-- Page Content -->
    <div class="container" >
		 			
		<div align="center">
		
			<div class="row">
            	<div class="col-lg-12">
               		<h4 class="page-header">바렌츠해(Barents Sea)의 해빙변화</h4>
            	</div>
	            <div class="col-md-5">
	            	<div class="hbox">
						<div align="right" class="titleEnhancer" id="dRange_barents"> 
							<span>${sdist.compbegindate4View}</span>
						</div>
						<div>
							<span class="zoom" id="skewtspan">
								<img id="sd_barents"  width="310px" alt="Barents Sea Ice Extent">
							</span>	
						</div>
					</div>
	            </div>
	            <div class="col-md-7" id="djd" style="height: 350px">
          	  	</div>
			</div>		
			
			<div class="row">
            	<div class="col-lg-12">
               		<h4 class="page-header">베링해(Bering Sea)의 해빙변화</h4>
            	</div>
	            <div class="col-md-5">
	            	<div class="hbox">
						<div align="right" class="titleEnhancer" id="dRange_bering"> 
							<span>${sdist.compbegindate4View}</span>
						</div>
						<div>
							<span class="zoom" id="skewtspan">
								<img id="sd_bering"  width="310px" alt="Bering Sea Ice Extent">
							</span>	
						</div>
					</div>
	            </div>
	            <div class="col-md-7" id="gmd" style="height: 350px">
          	  	</div>
			</div>		
			
			<div class="row">
            	<div class="col-lg-12">
               		<h4 class="page-header">허드슨만(Hudson Bay)의 해빙변화</h4>
            	</div>
	            <div class="col-md-5">
	            	<div class="hbox">
						<div align="right" class="titleEnhancer" id="dRange_hudson"> 
							<span>${sdist.compbegindate4View}</span>
						</div>
						<div>
							<span class="zoom" id="skewtspan">
								<img id="sd_hudson"  width="310px" alt="Hudson Bay Ice Extent">
							</span>	
						</div>
					</div>
	            </div>
	            <div class="col-md-7" id="uld" style="height: 350px">
          	  	</div>
			</div>		
			
		 	
	 	</div>
		
	</div>
	
    <!-- Footer -->
	<div id="meFooter"  style="margin-top: 20px;">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>	 	
	
</body>

</html>