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
    
	<title>장기해빙변화</title>
	
	
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
	
	<!-- 2c.doe.hicharts -->
	<script src="<c:url value="/js/highchart/highcharts.js"/>"></script>
	<script src="<c:url value="/js/highchart/highcharts-more.js"/>"></script>
	<script src="<c:url value="/js/highchart/modules/exporting.js"/>"></script>



<script>

	var thisYear = 2016; 
		
	function requestData(dateFrom){
		$.ajax({
			type: 'GET',dataType:'json',contentType:'application/json',
			url: '${pageContext.request.contextPath}/ajax/getSeriesData',
			data:'whichSeries=ts_ice',
	        success: function(jsonData) {
				subtractPointData(jsonData.data.ice.someList.ext, 'djd');
				subtractPointData(jsonData.data.ice.someList.rou, 'gmd');
	        },
	        cache: false	
		});
	}
	

	 
	function subtractPointData(someList, targetDiv){
		e00 = [];
		e01 = [];
		e02 = [];
		e03 = [];
		e04 = [];
		e05 = [];
		e06 = [];
		
		e07 = [];
		e08 = [];
		e09 = [];
		e10 = [];
		e11 = [];
		e12 = [];
		e13 = [];
		e14 = [];
		e15 = [];
		currYear = [];
		
		for ( var i = 0; i < someList.length; i++) {
			var dateStrArr = someList[i].date.split(",");
			var mm = parseInt(dateStrArr[0]);
			var dd = parseInt(dateStrArr[1]);

			e00.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e00) ]);
			e01.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e01) ]);
			e02.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e02) ]);
			e03.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e03) ]);
			e04.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e04) ]);
			e05.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e05) ]);
			e06.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e06) ]);
			
			e07.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e07) ]);
			e08.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e08) ]);
			e09.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e09) ]);
			e10.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e10) ]);
			e11.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e11) ]);
			e12.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e12) ]);
			e13.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e13) ]);
			e14.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e14) ]);
			e15.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e15) ]);
			currYear.push([Date.UTC(thisYear,mm -1, dd),parseNumericVal(someList[i].e16) ]);
		}
		var _chart; 
		if(targetDiv == 'djd'){
			_chart = $('#djd').highcharts();				
		}else if(targetDiv == 'gmd'){
			_chart = $('#gmd').highcharts();				
		}else if(targetDiv == 'uld'){
			_chart = $('#uld').highcharts();				
		}
		_chart.series[0].setData(e00); 
		_chart.series[1].setData(e01); 
		_chart.series[2].setData(e02); 
		_chart.series[3].setData(e03); 
		_chart.series[4].setData(e04); 
		_chart.series[5].setData(e05); 
		_chart.series[6].setData(e06); 
		_chart.series[7].setData(e07); 
		_chart.series[8].setData(e08); 
		_chart.series[9].setData(e09); 
		_chart.series[10].setData(e10); 
		_chart.series[11].setData(e11); 
		_chart.series[12].setData(e12); 
		_chart.series[13].setData(e13); 
		_chart.series[14].setData(e14); 
		_chart.series[15].setData(e15); 
		_chart.series[16].setData(currYear); 
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
	
	
	function requestIceData(dateFrom){
		$.ajax({
			type: 'GET',dataType:'json',contentType:'application/json',
			url: '${pageContext.request.contextPath}/ajax/getSeriesData',
			data:'whichSeries=ts_trend',
	        success: function(jsonData) {
				subtractTrendData(jsonData.data.ice.someList.LTTrend, 'ltt_ext');
	        	subtractTrendData(jsonData.data.ice.someList.LTTrend, 'ltt_rou');
	        },
	        cache: false	
		});
	}
	
	
	function subtractTrendData(someList, targetDiv){
		mean_annual = [];
		mean_summer = [];
		mean_winter = [];
		ts_trend = [];
		
		for ( var i = 0; i < someList.length; i++) {
			var dateStrArr = someList[i].date.split(",");
			var yy = parseInt(dateStrArr[0]);
			var mm = parseInt(dateStrArr[1]);
			var dd = parseInt(dateStrArr[2]);
			if(yy!=thisYear){
				ts_trend.push([Date.UTC(yy,mm -1, dd),parseNumericVal((targetDiv=='ltt_ext')? someList[i].ext : someList[i].rou) ]); 
			}
				
			
		}
		var _chart_ltt; 
		if(targetDiv == 'ltt_ext'){
			_chart_ltt = $('#ltt_ext').highcharts();				
		}else if(targetDiv == 'ltt_rou'){
			_chart_ltt = $('#ltt_rou').highcharts();				
		}
		_chart_ltt.series[0].setData(ts_trend); 
//		_chart_ltt.series[1].setData(mean_annual); 
//		_chart_ltt.series[2].setData(mean_summer); 
//		_chart_ltt.series[3].setData(mean_winter); 
	}
	

	
</script>



<script>
	var chart_ext;
	var chart_rou;

	$(document).ready(function(){
		chart_ext = new Highcharts.Chart({
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
                	fontFamily: 'NanumGothic'
            	}
			},
			title: {
	            text: '해빙 면적의 연 변화',
	            align: 'center',
	           // x: 50,
	            style:{
	            	font:'bold 16px NanumGothic'
	            	//font:'16px NanumGothic'
	            }
	        },
	        subtitle: {
	            text: null,
	            x: 25,
	            style:{
	            	font:'normal 12px NanumGothic'
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
				/* plotBands: [{
				    color: 'rgba(199, 230, 253, 0.5)', // Color value
				    from: Date.UTC(2015,7,15), // Start of the plot band
				    to: Date.UTC(2015,8,30) // End of the plot band
				}] */
			},
	        yAxis: {
	        	
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
	            	useHTML: true,
	                text: "해빙 면적 (x10<sup>6</sup> ㎢)",
                	style : {
                		font:'normal 12px NanumGothic'
						//color : '#000000'
                	}	
	            },
	            labels:{
		            style : {
	            		font:'normal 11px NanumGothic'
						//color : '#000000'
		            }
            	},	
	            plotLines: [{ //verticalColoredBand
	               // value: 0,
	                //width: 0,
	                //color: '#346691', 
	            }],
	            tickInterval:2,
	            max:18,
	            min:2
	        },
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
	                var s = '<b>'+this.series.name + '</b><br/>';
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
	        	},
	        	//handle select all or none event haha
	        	 line: {
	                    events: {
	                        legendItemClick: function (e) {
	                        	if(e.currentTarget.index*1 == chart_ext.series.length-1){//all or none selected!! // 9
	                        		var visibility = e.currentTarget.visible ? 0 : 1;
	                        		//console.log('visibility: ' +visibility)
	                        		 for(i=0; i < chart_ext.series.length-1;i++){
	 	            	                if (visibility==0) {
	 	            	                	//console.log('hide')
	 	            	                	chart_ext.series[i].hide();
	 	            	                } else if(visibility==1) {
	 	            	                	//console.log('show') // 계속 타내
	 	            	                	chart_ext.series[i].show();
	 	                                }
	                        		 }   
	                        	/* for(i=0; i < chart_ext.series.length;i++){
	            	                if ($(this).text() === 'Hide') {
	            	                	chart_ext.series[i].hide();
	            	                } else {
	            	                	chart_ext.series[i].show();
	                                }
	                            }
	                            var changeText = ($(this).text() == 'Hide') ? 'Show' : 'Hide';
	                            $(this).text(changeText);
	                        	 */
	                        	}else{
		                           // console.log(e);
		                            var c = 0; // count visible legend items
		                            var c = e.currentTarget.visible ? 0 : 1;
		                            for(i = 0; i < chart_ext.series.length-1; i++) {
	                                	if(chart_ext.series[i] != e.currentTarget && chart_ext.series[i].visible) c++;
		                            }
		                            //console.log(c);
		                            if (chart_ext.series.length-1 == c) { //모든 연도 선택되면 모두선택버튼 활성화
		                                  //$('#visiblityControlBtn').text('Hide');
		                                  chart_ext.series[chart_ext.series.length-1].show()
//		                            } else if (c == 0) {
		                            } else if (c < chart_ext.series.length-1) { // 07~현재연도 중 하나라도 unchecked면 모두선택버튼 비활성화 
		                                  //$('#visiblityControlBtn').text('Show'); 
		                                  chart_ext.series[chart_ext.series.length-1].hide()
		                            } 
	                        	}
	                        }
	                    }
	                }
	        },
	        series: [//07==redSolid prevYear==blueSolid thisYera==blackSolid
		 	            {
		 	             name: '\'00',
		 	             color: '#0099AD' , //aqua
		 	             dashStyle : 'Dash',
		     	         connectNulls:false, data: []},
		 	        	{ 
		     	          name: '\'01',
		     	          color: '#ff00ff' , //fuchsia
		 	           	  dashStyle : 'Dash',
		 	           	  connectNulls:false, data: []}, 
		 	        	{name: '\'02',
		 	           		color: '#808080' ,//gray	  
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'03',
		 	           	color: '#008000' ,// moss green
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'04',
		 	           	color: '#00ff00' , // lime
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'05',
		 	           	  color: '#800000' , //maroon
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'06',
		 	           	color: '#000080' ,// navy
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'07',
			 	             color: '#ff0000' ,   // RED 
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'08',
		 	           	color: '#808000' ,  // olive
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'09',
		 	           	color: '#800080' , // purple
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'10',
		 	           	color: '#74828a' ,//halo silver
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'11',
		 	           	color: '#008080' , // teal
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'12',
		 	           	color: '#ffd436' , // yellow
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'13',
		 	           	color: '#D94C28' ,   //mandarin
		 	           	   dashStyle : 'Dash', 
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'14',
		 	           	color: '#00C4A7' ,    //00C4A7 minty green? 
		 	           	dashStyle : 'Dash',
		 	            connectNulls:false, data: []}, 
		 	           {name: '\'15',
		 	           	 color: '#0000ff', // BLUE        	 
		 	            connectNulls:false, data: []}, 
		 	           {name: '\'16',
		 	           	 color: '#000000', // BLACK            	 
		 	            connectNulls:false, data: []}, 
		 	            {name: ' 모두 선택',
		 	           	 color: '#ffffff', 	 
		 	           	connectNulls:false, data: []}]
 	          ,legend: {
                layout: 'horizontal',
                align: 'left',
        //        verticalAlign: 'top',
                itemWidth:72,
      //          useHTML:true,
                x: 70,
                y: 0,
                borderWidth: 0,
                itemStyle: {
                    fontSize: '12px',
                    fontWeight:'bold'
                } 
             /*something wired    
             	itemMarginTop: 0,
                itemMarginBottom: 0,
                itemStyle: {
                    lineHeight: '14px'
                } 
	        	*/
            }    
			
		}); //
		
		chart_rou = new Highcharts.Chart({
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
                	fontFamily: 'NanumGothic'
            	}
			},
			title: {
	            text: '해빙 표면거칠기의 연 변화', 
	            align: 'center',
	            //x: 50,
	            style:{
	            	font:'bold 16px NanumGothic'
//	            	font:' 16px NanumGothic'
	            }
	        },
	        subtitle: {
	            text: null, //ㄱ+ctrl+space
	            x: 25,
	            style:{
	            	font:'normal 13px NanumGothic'
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
	        yAxis: {
	        	
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
	            	 text: '해빙 표면 거칠기 (㎝)',
                	style : {
                		font:'normal 12px NanumGothic'
						//color : '#000000'
                	}	
	            },
	            labels:{
		            style : {
	            		font:'normal 11px NanumGothic'
						//color : '#000000'
		            },
		            formatter: function() { //numberFormat (Number number, [Number decimals], [String decimalPoint], [String thousandsSep])
		            	return Highcharts.numberFormat(this.value, 2, '.', ',');
		            }
            	},
	            plotLines: [{ //verticalColoredBand
	             //   value: 0,
	              //  width: 0,
	            //    color: '#ff0000',
	            }],
	            tickInterval:0.05,
	            max:0.55,
	            min:0.25
	        },
	        tooltip: {
//	            shared: true,
//	            followPointer: true,
//	            valueSuffix: '°C',
//	            crosshairs: {
//	            	color: '#c4d0e5',
//	            	//snap: false
//	           	},
	            formatter: function() {
	            	var myDate = new Date(this.x);
	            	var newDateMs = Date.UTC(myDate.getUTCFullYear(), myDate.getUTCMonth() , myDate.getUTCDate());
	                var s = '<b>'+this.series.name + '</b><br/>';
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
	        	},
	        	//handle select all or none event haha
	        	 line: {
	                    events: {
	                        legendItemClick: function (e) {
	                        	if(e.currentTarget.index*1 == chart_rou.series.length-1){//all or none selected!! // 9
	                        		var visibility = e.currentTarget.visible ? 0 : 1;
	                        		//console.log('visibility: ' +visibility)
	                        		 for(i=0; i < chart_rou.series.length-1;i++){
	 	            	                if (visibility==0) {
	 	            	                	//console.log('hide')
	 	            	                	chart_rou.series[i].hide();
	 	            	                } else if(visibility==1) {
	 	            	                	//console.log('show') // 계속 타내
	 	            	                	chart_rou.series[i].show();
	 	                                }
	                        		 }   
	                        	/* for(i=0; i < chart_rou.series.length;i++){
	            	                if ($(this).text() === 'Hide') {
	            	                	chart_rou.series[i].hide();
	            	                } else {
	            	                	chart_rou.series[i].show();
	                                }
	                            }
	                            var changeText = ($(this).text() == 'Hide') ? 'Show' : 'Hide';
	                            $(this).text(changeText);
	                        	 */
	                        	}else{
		                           // console.log(e);
		                            var c = 0; // count visible legend items
		                            var c = e.currentTarget.visible ? 0 : 1;
		                            for(i = 0; i < chart_rou.series.length-1; i++) {
	                                	if(chart_rou.series[i] != e.currentTarget && chart_rou.series[i].visible) c++;
		                            }
		                            //console.log(c);
		                            if (chart_rou.series.length-1 == c) { //모든 연도 선택되면 모두선택버튼 활성화
		                                  //$('#visiblityControlBtn').text('Hide');
		                                  chart_rou.series[chart_rou.series.length-1].show()
//		                            } else if (c == 0) {
		                            } else if (c < chart_rou.series.length-1) { // 07~현재연도 중 하나라도 unchecked면 모두선택버튼 비활성화 
		                                  //$('#visiblityControlBtn').text('Show'); 
		                                  chart_rou.series[chart_ext.series.length-1].hide()
		                            } 
	                        	}
	                        }
	                    }
	                }
	        },
	        series: [//07==redSolid prevYear==blueSolid thisYera==blackSolid
	                 {
		 	             name: '\'00',
		 	             color: '#0099AD' , //aqua
		 	             dashStyle : 'Dash',
		     	         connectNulls:false, data: []},
		 	        	{ 
		     	          name: '\'01',
		     	          color: '#ff00ff' , //fuchsia
		 	           	  dashStyle : 'Dash',
		 	           	  connectNulls:false, data: []}, 
		 	        	{name: '\'02',
		 	           		color: '#808080' ,//gray	  
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'03',
		 	           	color: '#008000' ,// moss green
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'04',
		 	           	color: '#00ff00' , // lime
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'05',
		 	           	  color: '#800000' , //maroon
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'06',
		 	           	color: '#000080' ,// navy
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'07',
			 	             color: '#ff0000' ,   // RED 
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'08',
		 	           	color: '#808000' ,  // olive
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'09',
		 	           	color: '#800080' , // purple
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'10',
		 	           	color: '#74828a' ,//halo silver
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'11',
		 	           	color: '#008080' , // teal
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'12',
		 	           	color: '#ffd436' , // yellow
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'13',
		 	           	color: '#D94C28' ,   //mandarin
		 	           	   dashStyle : 'Dash', 
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '\'14',
		 	           	color: '#00C4A7' ,    //00C4A7 minty green? 
		 	           	dashStyle : 'Dash',
		 	            connectNulls:false, data: []}, 
		 	           {name: '\'15',
		 	           	 color: '#0000ff', // BLUE        	 
		 	            connectNulls:false, data: []}, 
		 	           {name: '\'16',
		 	           	 color: '#000000', // BLACK            	 
		 	            connectNulls:false, data: []}, 
		 	            {name: ' 모두 선택',
		 	           	 color: '#ffffff', 	 
		 	           	connectNulls:false, data: []}]
          ,legend: {
                layout: 'horizontal',
                align: 'left',
        //        verticalAlign: 'top',
                itemWidth:72,
      //          useHTML:true,
                x: 80,
              //  y: 100,
                borderWidth: 0,
                itemStyle: {
                    fontSize: '12px',
                    fontWeight:'bold'
                } 
            }    
			
		}); //Deokjeokdo
		
 
	}); //JCV good to go sir
</script>



<script>
$(function () {

//apply the theme
//apply the theme
Highcharts.theme = {
	colors: ["#514F78", "#42A07B", "#9B5E4A", "#72727F", "#1F949A", "#82914E", "#86777F", "#42A07B"],
	chart: {
		className: 'skies',
		borderWidth: 0,
		plotShadow: true,
		plotBackgroundImage: 'http://www.highcharts.com/demo/gfx/skies.jpg',
		plotBackgroundColor: {
			linearGradient: [0, 0, 250, 500],
			stops: [
				[0, 'rgba(255, 255, 255, 1)'],
				[1, 'rgba(255, 255, 255, 0)']
			]
		},
		plotBorderWidth: 1
	},
	title: {
		style: {
			color: '#3E576F',
			font: '16px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
		}
	},
	subtitle: {
		style: {
			color: '#6D869F',
			font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
		}
	},
	xAxis: {
		gridLineWidth: 0,
		lineColor: '#C0D0E0',
		/*tickColor: '#C0D0E0',*/
		tickColor: '#346691',
		labels: {
			style: {
				color: '#666',
				fontWeight: 'bold'
			}
		},
		title: {
			style: {
				color: '#666',
				font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			}
		}
	},
	yAxis: {
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
		alternateGridColor: 'rgba(255, 255, 255, .5)',
		lineColor: '#C0D0E0',
		tickColor: '#C0D0E0',
		tickWidth: 1,
		labels: {
			style: {
				color: '#666',
				fontWeight: 'bold'
			}
		},
		title: {
			style: {
				color: '#666',
				font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			}
		},
	},
	legend: {
		itemStyle: {
			font: '9pt Trebuchet MS, Verdana, sans-serif',
			color: '#3E576F'
		},
		itemHoverStyle: {
			color: 'black'
		},
		itemHiddenStyle: {
			color: 'silver'
		}
	},
	labels: {
		style: {
			color: '#3E576F'
		}
	}
};

// Apply the theme
//var highchartsOptions = Highcharts.setOptions(Highcharts.theme);
//apply the theme
//apply the theme



	var chart_ltt_ext;
	var chart_ltt_rou;

	$(document).ready(function(){
		
		
		
		
		chart_ltt_ext = new Highcharts.Chart({
			chart : {
				type : 'line',
				renderTo : 'ltt_ext',  								events:{load:requestIceData('init')},
				defaultSeriesType : 'line',
				plotBorderWidth : 1,
				plotBorderColor : '#346691', // '#346691',
				zoomType : 'xy',
				//marginLeft : 60,
				//marginRight : 60
				style: {
                	fontFamily: 'NanumGothic'
            	}
			},
			title: {
	            text: '해빙 면적의 장기 변화',
	            align: 'center',
	            //x: 50,
	            style:{
	            	font:'bold 16px NanumGothic'
//	            	font:' 16px NanumGothic'
	            }
	        },
	        subtitle: {
	            text: null,
	            x: 25,
	            style:{
	            	font:'normal 12px NanumGothic'
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
//						   return Highcharts.dateFormat('%b',newDateMs);
						   return Highcharts.dateFormat('%Y',newDateMs);
					}
				},

				//remove leading n trailling padding?space from the series of the timeseries chart haha
				startOnTick: false,
				endOnTick: false,				
				minPadding:0,
				maxPadding:0,
	            //tickmarkplacement:"off",
				
				lineColor : '#346691',
				lineWidth : 1,
				//gridLineWidth : 1
			},
	        yAxis: {
	        	
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
	            	useHTML: true,
	                text: "해빙 면적 (x10<sup>6</sup> ㎢)",
                	style : {
                		font:'normal 12px NanumGothic'
						//color : '#000000'
                	}	
	            },
	            labels:{
		            style : {
	            		font:'normal 11px NanumGothic'
						//color : '#000000'
		            }
            	},	
	            plotLines: [{ //verticalColoredBand
	               // value: 0,
	                //width: 0,
	                //color: '#346691', 
	            }],
	            tickInterval:2,
	            max:18,
	            min:2
	        },
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
	                var s = Highcharts.dateFormat('%Y년 %m월 %d일', newDateMs)+'<br/>';
//	                var s = Highcharts .dateFormat('%e. %b %Y', newDateMs)+'<br/>';
//					s+= '<b>' + this.y + '</b><br/>';
					s+= this.series.name + ': <b>' + this.y + '</b><br/>';
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
		 	             name: ' ',
		 	             color: '#000000' ,
		 	            showInLegend: false,
		     	         connectNulls:false, data: []},
		     	        /*  
		 	        	{name: '연평균<br/>(-0.2213)',
		 	           	 //color: '#000000',
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '여름평균(9월)<br/>(-0.0028)',
		 	           	 color: '#ff0000',            	 
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '겨울평균(3월)<br/>(-0.0898)',
		 	           	 color: '#0000ff',            	 
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	           	 */
		 	           	
		 	       	////////////////////////////////////////////////////////////////	 	           
			 	           {
			 	               type: 'line',
			 	               name: '연평균<br/>(-0.0795)',
			 	               showInLegend: true,
			 	          	   color: '#000000',            	 
			 	           	   dashStyle : 'Dash',
			 	           	   lineWidth : 0.8,
//			 	               data: [[Date.UTC(2007,0,1), 11.9317], [Date.UTC(thisYear-1,11,24), 10.5627]], //ext 2016 avg
			 	               data: [[Date.UTC(1988,0,1), 13.4824], [Date.UTC(thisYear-1,11,24), 11.3365]], //ext 2016 avg
			 	               marker: {
			 	                   enabled: false
			 	               },
			 	               states: {
			 	                   hover: {
			 	                       lineWidth: 0
			 	                   }
			 	               },
			 	               enableMouseTracking: true
			 	           },
			 	           {
			 	               type: 'line',
			 	               name: '여름평균(9월)<br/>(-0.1140)',
			 	               showInLegend: true,
			 	              color: '#CC0000',            	 
			 	           	   dashStyle : 'Dash',
			 	           	lineWidth : 0.8,
//			 	               data: [[Date.UTC(2007,0,1), 5.0735], [Date.UTC(thisYear-1,11,24), 5.0141]], //ext 2016 sep
			 	               data: [[Date.UTC(1988,0,1), 8.17285], [Date.UTC(thisYear-1,11,24), 5.0946]], //ext 2016 sep
			 	               marker: {
			 	                   enabled: false
			 	               },
			 	               states: {
			 	                   hover: {
			 	                       lineWidth: 0
			 	                   }
			 	               },
			 	               enableMouseTracking: true
			 	           },
			 	           {
			 	               type: 'line',
			 	               name: '겨울평균(3월)<br/>(-0.0547)',
			 	               showInLegend: true,
			 	              color: '#0000ff',            	 
			 	           	   dashStyle : 'Dash',
			 	           	lineWidth : 0.8,
	//		 	               data: [[Date.UTC(2007,0,1), 16.0221], [Date.UTC(thisYear-1,11,24), 15.1941]],//ext 2016 mar
			 	               data: [[Date.UTC(1988,0,1), 17.4215], [Date.UTC(thisYear-1,11,24), 15.9437]],//ext 2016 mar
			 	               marker: {
			 	                   enabled: false
			 	               },
			 	               states: {
			 	                   hover: {
			 	                       lineWidth: 0
			 	                   }
			 	               },
			 	               enableMouseTracking: true
			 	           }
			 	           	
			 	/////////////////////////////////////////           	
		 	           	
		 	           	
		 	          ]
	        , legend: {
                layout: 'horizontal',
//                align: 'right',
        //        verticalAlign: 'top',
                itemWidth:120,
      //          useHTML:true,
                x:0 ,
                y: 0,
                borderWidth: 0,
                itemStyle: {
                	//itemMarginTop: 50,
                    //itemMarginBottom: 50,
                    fontSize: '12px',
                    fontWeight:'bold'
                }
             /*something wired    
             	itemMarginTop: 0,
                itemMarginBottom: 0,
                itemStyle: {
                    lineHeight: '14px'
                } */
            }    
			
		}); //Deokjeokdo
		
		chart_ltt_rou = new Highcharts.Chart({
			chart : {
				type : 'line',
				renderTo : 'ltt_rou',  						//		events:{load:requestIceData('init')},
				defaultSeriesType : 'line',
				plotBorderWidth : 1,
				plotBorderColor : '#346691',
				zoomType : 'xy',
				//marginLeft : 60,
				//marginRight : 60
				style: {
                	fontFamily: 'NanumGothic'
            	}
			},
			title: {
	            text: '해빙 표면거칠기의 장기 변화', 
	            align: 'center',
	          //  x: 50,
	            style:{
	            	font:'bold 16px NanumGothic'
//	            	font:' 16px NanumGothic'
	            }
	        },
	        subtitle: {
	            text: null, //ㄱ+ctrl+space
	            x: 25,
	            style:{
	            	font:'normal 13px NanumGothic'
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
//					   return Highcharts.dateFormat('%b',newDateMs);
					   return Highcharts.dateFormat('%Y',newDateMs);
					}
				},
				//remove leading n trailling padding?space from the series of the timeseries chart haha
				startOnTick: false,
				endOnTick: false,				
				minPadding:0,
				maxPadding:0,
	            //tickmarkplacement:"off",
				
				lineColor : '#346691',
				lineWidth : 1,
				gridLineWidth : 0 //
			},
	        yAxis: {
	        	
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
	            	 text: '해빙 표면 거칠기 (㎝)',
                	style : {
                		font:'normal 12px NanumGothic'
						//color : '#000000'
                	}	
	            },
	            labels:{
		            style : {
	            		font:'normal 11px NanumGothic'
						//color : '#000000'
		            },
		            formatter: function() { //numberFormat (Number number, [Number decimals], [String decimalPoint], [String thousandsSep])
		            	return Highcharts.numberFormat(this.value, 2, '.', ',');
		            }
            	},
	            plotLines: [{ //verticalColoredBand
	             //   value: 0,
	              //  width: 0,
	            //    color: '#ff0000',
	            }],
	            tickInterval:0.05,
	            max:0.55,
	            min:0.25
	        },
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
	                var s = Highcharts.dateFormat('%Y년 %m월 %d일', newDateMs)+'<br/>';
//	                var s = Highcharts .dateFormat('%e. %b %Y', newDateMs)+'<br/>';
//					s+= '<b>' + this.y + '</b><br/>';
					s+= this.series.name + ': <b>' + this.y + '</b><br/>';
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
		 	             name: ' ',
		 	             color: '#000000' ,
		 	            showInLegend: false,
		     	         connectNulls:false, data: []},
		     	        /*  
		 	        	{name: '연평균<br/>(-0.0000)',
		 	           	 //color: '#000000',
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '여름평균(9월)<br/>(-0.0005)',
		 	           	 color: '#ff0000',            	 
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	        	{name: '겨울평균(3월)<br/>(-0.0007)',
		 	           	 color: '#0000ff',            	 
		 	           	   dashStyle : 'Dash',
		 	           	connectNulls:false, data: []}, 
		 	           	 */
		 	          	////////////////////////////////////////////////////////////////	 	           
			 	           {
			 	               type: 'line',
			 	               name: '연평균<br/>(-0.0006)',
			 	               showInLegend: true,
			 	          	   color: '#000000',            	 
			 	           	   dashStyle : 'Dash',
			 	           	   lineWidth : 0.8,
//			 	               data: [[Date.UTC(2007,0,1), 0.4262], [Date.UTC(thisYear-1,11,24), 0.4304]], //rou 2016 avg
			 	               data: [[Date.UTC(1988,0,1), 0.410917], [Date.UTC(thisYear-1,11,24), 0.395702]], //rou 2016 avg
			 	               marker: {
			 	                   enabled: false
			 	               },
			 	               states: {
			 	                   hover: {
			 	                       lineWidth: 0
			 	                   }
			 	               },
			 	               enableMouseTracking: true
			 	           },
			 	           {
			 	               type: 'line',
			 	               name: '여름평균(9월)<br/>(-0.0010)',
			 	               showInLegend: true,
			 	              color: '#CC0000',            	 
			 	           	   dashStyle : 'Dash',
			 	           		lineWidth : 0.8,
//			 	               data: [[Date.UTC(2007,0,1), 0.3527], [Date.UTC(thisYear-1,11,24), 0.3601]], //rou 2016 sep
			 	               data: [[Date.UTC(1988,0,1), 0.355684], [Date.UTC(thisYear-1,11,24), 0.329151]], //rou 2016 sep
			 	               marker: {
			 	                   enabled: false
			 	               },
			 	               states: {
			 	                   hover: {
			 	                       lineWidth: 0
			 	                   }
			 	               },
			 	               enableMouseTracking: true
			 	           },
			 	           {
			 	               type: 'line',
			 	               name: '겨울평균(3월)<br/>(0.0004)',
			 	               showInLegend: true,
			 	              color: '#0000ff',            	 
			 	           	   dashStyle : 'Dash',
			 	           	lineWidth : 0.8,
//			 	               data: [[Date.UTC(2007,0,1), 0.4802], [Date.UTC(thisYear-1,11,24), 0.4863]], //rou 2016 mar
			 	               data: [[Date.UTC(1988,0,1), 0.440078], [Date.UTC(thisYear-1,11,24), 0.451781]], //rou 2016 mar
			 	               marker: {
			 	                   enabled: false
			 	               },
			 	               states: {
			 	                   hover: {
			 	                       lineWidth: 0
			 	                   }
			 	               },
			 	               enableMouseTracking: true
			 	           }
			 	           	
			 	/////////////////////////////////////////           	
		 	          ]
	        , legend: {
             layout: 'horizontal',
//             align: 'right',
     //        verticalAlign: 'top',
             itemWidth:120,
   //          useHTML:true,
             x:0 ,
             y: 0,
             borderWidth: 0,
             itemStyle: {
                 fontSize: '12px',
                 fontWeight:'bold'
             }
          /*something wired    
          	itemMarginTop: 0,
             itemMarginBottom: 0,
             itemStyle: {
                 lineHeight: '14px'
             } */
         }    
			
		}); //Deokjeokdo

		//chart_ltt_ext.setOptions(Highcharts.theme);
		
		
	}); //JCV good to go sir
	
	
	
	
	
	
	
	

});
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
		<c import url="/arcticPageLink.do?link=main/inc/dateChooser" />
	</div>	
	 -->
	
	
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<header class="meControllPanel">
		<div class="container" align="left">
            <div class="row form-horizontal">
            	 <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5 demo vcenter">
            	 <!-- 
		            <input type="text" id="meDemo" class="form-control" readonly="readonly">
		            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
            	  -->
		            <div data-tip=" 최근 자료  ">
		            	<input type="text" id="meDemo" class="form-control" readonly="readonly" 
		            		style="cursor:default;"	value="${extSeries.compbegindate4Cal}" >
		            	<i class="glyphicon-calendar fa fa-calendar" style="cursor:default"></i>
		            </div>
		          </div>
            	
            
            
           		<div class="pull-right" style="padding-right:50px;"> 
	            	<ul id="breadcrumbs-one" class="pull-right vcenter" >
						<li><a href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
						<li><a>해빙감시</a></li>
						<li><a>장기해빙변화</a></li>
					</ul>
            	</div>
            </div>
		     
		            
        	<script type="text/javascript">
        	/* 
	        	$('#retrievalRangeSelector').on('click','.option li',function(){
	        		var i = $(this).parents('.select').attr('id');
	        		var v = $(this).children().text();
	        		var o = $(this).attr('id');
	        		var valStr = $(this).attr('value'); // (WEEK || MONTH || YEAR)
	        		$('#'+i+' .selected').attr('id',o);
	        		$('#'+i+' .selected').text(v);
	        		$('#'+i+' .selected').attr('value',valStr);
	        		//var haha = $('#retrievalRangeSelector .selected').attr('value');
	        	}); */
        	
        	
           		/* $('#meDemo').daterangepicker({
           			locale: {
           				format: 'YYYY-MM-DD'
           			}, 
           		    "singleDatePicker": true,
           		    "showDropdowns": true,
           		    "startDate": "<c:out value="${extSeries.compbegindate4Cal}" />", 
           		    "endDate" : "<c:out value="${extSeries.compbegindate4Cal}" />",
           		    "minDate": "2007-01-01",
           		    "maxDate": "<c:out value="${extSeries.compbegindate4Cal}" />"     //today
           		    
           		}, function(start, end, label) {
           			
           			meRequest(start);
           			
           		}); 
		        	
           		function showSeries(e) {
           		    this.graph.attr("stroke", (e.checked ? this.color : '#ccc'));
           		    if(e.checked ==  true){
           		        this.group.toFront();
           		        if(this.visible == false){
           		            this.show();
           		        }
           		    }
           		}
           		
           		$('#checkAll').click(function(){
           		    for(i=0; i < chart.series.length; i++) {
           		        if(chart.series[i].selected == false){
           		            chart.series[i].select();
           		            showSeries.call(chart.series[i], {checked: true});
           		        }
           		    }
           		});
           		$('#uncheckAll').click(function(){
           		    for(i=0; i < chart.series.length; i++) {
           		        if(chart.series[i].selected == true){
           		            chart.series[i].select();
           		            showSeries.call(chart.series[i], {checked: false});
           		        }
           		    }
           		});
	        	*/
           		
		    </script>    
		        
		</div>
	</header>
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	<!--dateChoooooser--> 
	
	
	
	
	
		
		
    <!-- Page Content -->
    <div class="container">
		 			
		<div class="row" style="padding-top:20px">
			<div class="col-lg-12" align="center">
				<div id="djd" class="col-md-6" style="height: 380px"></div>
				<div id="gmd" class="col-md-6" style="height: 380px"></div>
		 	</div>
			<div class="col-lg-12" align="center">
				<div id="ltt_ext" class="col-md-6" style="height: 380px"></div>
				<div id="ltt_rou" class="col-md-6" style="height: 380px"></div>
		 	</div>
	 	</div>
		 	
		 	
	</div>
	
    <!-- Footer -->
	<div id="meFooter"  style="margin-top: 20px;">
		<c:import url="/arcticPageLink.do?link=main/inc/meFooter" />
	</div>	 	
</body>

</html>