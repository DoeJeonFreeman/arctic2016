package kr.go.seaice.arctic.timeseries.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import kr.go.seaice.arctic.timeseries.service.MostRecentStuffVO;
import kr.go.seaice.arctic.timeseries.service.TimeSeriesChartService;
import kr.go.seaice.arctic.timeseries.service.TimeSeriesDataVO;
import kr.go.seaice.common.UpToDateStuffVO;
import kr.go.seaice.mybatis.MostRecentStuffMapper;
import kr.go.seaice.mybatis.UpToDateStuffMapper;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author Administrator
 *
 */
@Service("chartService")
public class TimeSeriesChartServiceImpl  implements TimeSeriesChartService{

	
	@Autowired 
	UpToDateStuffMapper  latestStuffPicker;
	
	@Autowired 
	MostRecentStuffMapper  mostRecentStuffPicker;

	
	private static final SimpleDateFormat CAL_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	
	
	public UpToDateStuffVO selectLatestStuff(String id) throws Exception {
		return latestStuffPicker.seekLatestOne(id);
	}

	
	public MostRecentStuffVO retrievingIfArcticDataExists() throws Exception {
		return mostRecentStuffPicker.retrieveOneArcticData();
	}
	
	
	public MostRecentStuffVO findMatchingArcticData(String givenDateStr) throws Exception {
		
		String weekAgo = CAL_DATE_FORMAT.format(DateUtils.addDays(CAL_DATE_FORMAT.parse(givenDateStr), -6));
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("dateSelected", givenDateStr);
		hashmap.put("weekAgo", weekAgo);
//		System.out.print("weekAgo: " +  weekAgo + "\t~\t");
//		System.out.println("dateSelected: " + givenDateStr);
		return mostRecentStuffPicker.retrieveMatchingArcticData(hashmap);
	}
	
	
	
	/* 
	 * @see kr.go.seaice.arctic.timeseries.service.TimeSeriesChartService#findMatchingArcticDataList(java.lang.String)
	 * sdist slide show 
	 */
	public List<MostRecentStuffVO> findMatchingArcticDataList(String givenDateStr) throws Exception {
		
		String beginDate = CAL_DATE_FORMAT.format(DateUtils.addMonths(CAL_DATE_FORMAT.parse(givenDateStr), -2));
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("dBegin", beginDate);
		hashmap.put("dEnd", givenDateStr);
		
//		System.out.print("2months before: " +  beginDate + "\t~\t");
//		System.out.println("dateSelected: " + givenDateStr);
		return mostRecentStuffPicker.retrieveMatchingArcticDataList(hashmap);
	}
	
	
//	private DateUtil dateUtil;
	//doesnt need anymore
	//use apache commons-lang dateutils class instead
//	public void setDateUtil(DateUtil dateUtil) {
//		this.dateUtil = dateUtil;
//	}
	
	
	
	public void getExtentRoughnessGraphic() throws Exception {
		// TODO Auto-generated method stub
	}

	public TimeSeriesDataVO selectIceExtentSeries() throws Exception {
		return null;
	}

	public TimeSeriesDataVO selectIceTrendSeries() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public TimeSeriesDataVO selectTimeseriesAndSDistGraphic() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
