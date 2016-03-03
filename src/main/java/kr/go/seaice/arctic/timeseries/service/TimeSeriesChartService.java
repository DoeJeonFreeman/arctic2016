package kr.go.seaice.arctic.timeseries.service;

import java.util.List;

import kr.go.seaice.common.UpToDateStuffVO;

public interface TimeSeriesChartService {
	
	//haha
	UpToDateStuffVO selectLatestStuff(String id) throws Exception;
	//haha
	MostRecentStuffVO retrievingIfArcticDataExists() throws Exception;
	
	MostRecentStuffVO findMatchingArcticData (String selectedDate) throws Exception;
	
	List<MostRecentStuffVO> findMatchingArcticDataList (String selectedDate) throws Exception;
	
	
	/**
	 * @return JSONObject || JSONArray
	 * @param  TimeSeries VO (typeOfData, dRange? )
	 * @throws Exception
	 */
	void getExtentRoughnessGraphic() throws Exception;
	
	TimeSeriesDataVO selectIceExtentSeries() throws Exception;
	
	TimeSeriesDataVO selectIceTrendSeries() throws Exception;
	
	/**
	 * @return pseudoDataSeries
	 * @param  ?
	 * @throws Exception
	 */
	TimeSeriesDataVO selectTimeseriesAndSDistGraphic() throws Exception;
	
}



