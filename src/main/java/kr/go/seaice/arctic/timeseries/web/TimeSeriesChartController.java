package kr.go.seaice.arctic.timeseries.web;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.go.seaice.arctic.timeseries.service.MostRecentStuffVO;
import kr.go.seaice.arctic.timeseries.service.TimeSeriesChartService;
import kr.go.seaice.arctic.timeseries.service.TimeSeriesDataVO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class TimeSeriesChartController {

	/** TimeSeriesChartService */
	@Autowired
	private TimeSeriesChartService chartService;
	
	
	@RequestMapping(value = "arctic/spatialDistribution.do")
	public String getSDist(HttpServletRequest request, ModelMap model) throws Exception{
//		UpToDateStuffVO stuff =  chartService.selectLatestStuff("01CON");
		MostRecentStuffVO stuff =  chartService.retrievingIfArcticDataExists();
        model.addAttribute("sdist", stuff);
		return "arctic/spatialDist";
	}
	
	
	/**해빙감시-최근해빙변화경향 시계열차트*/
	@RequestMapping(value = "arctic/timeseries/extent.do")
	public String selectIceExtentSeries(HttpServletRequest request, ModelMap model) throws Exception{
		MostRecentStuffVO mostRecent =  chartService.retrievingIfArcticDataExists();
        model.addAttribute("extSeries", mostRecent);
		return "arctic/extentTimeseries";
	}
	
	/**해빙감시-장기해빙변화경향*/
	@RequestMapping(value = "arctic/timeseries/trend.do")
	public String fxxkingTest(HttpServletRequest request, ModelMap model) throws Exception{
		MostRecentStuffVO mostRecent =  chartService.retrievingIfArcticDataExists();
		model.addAttribute("extSeries", mostRecent);
		return "arctic/lttrend";
	}
	
	
	/**해빙감시-해역별분포*/
	@RequestMapping(value = "arctic/ocean.do")
	public String selectMostRecnetArcticOceanStuff(HttpServletRequest request, ModelMap model) throws Exception{
		MostRecentStuffVO stuff =  chartService.retrievingIfArcticDataExists();
        model.addAttribute("sdist", stuff);
		return "arctic/ocean";
	}
	
	/**via ajax*/
	@RequestMapping(value = "arctic/findMatchingStuff", method=RequestMethod.GET)
	@ResponseBody
	public MostRecentStuffVO selectMatchingData(String selectedDate, ModelMap model) throws Exception{
		MostRecentStuffVO stuff =  chartService.findMatchingArcticData(selectedDate);
		return stuff;
	}
	
	/**via ajax*/
	@RequestMapping(value = "arctic/findMatchingStuffs", method=RequestMethod.GET)
	@ResponseBody
	public List<MostRecentStuffVO> selectMatchingDataList(String dBegin, String dEnd, ModelMap model) throws Exception{
		List<MostRecentStuffVO> stuff =  chartService.findMatchingArcticDataList(dEnd);
		return stuff;
	}
	
	
	@RequestMapping(value = "/ajax/getSeriesData")
	@ResponseBody
	public TimeSeriesDataVO timeseriesOutputter(@RequestParam("whichSeries") String typeId, HttpServletRequest req ){
//		("timeseriesOutputter(" + typeId + ") call this method causes 406(not acceptable) error" );
		String path = req.getSession().getServletContext().getRealPath("/arcticData")+"/ASC/CONCENT/" + typeId + ".json";
		
		JSONObject json_subtracted = new JSONObject();
		FileReader reader = null;
		
		try {
			// read the json file
			reader = new FileReader(path);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

			json_subtracted.put("someList",jsonObject);
			
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		} catch (ParseException ex) {
			ex.printStackTrace();
		} catch (NullPointerException ex) {
			ex.printStackTrace();
		}finally{
	            try {
	            	if(reader !=null)reader.close();
		        } catch (IOException e) {
	                e.printStackTrace();
		        }
        }
		
		TimeSeriesDataVO series = new TimeSeriesDataVO();
		JSONObject obj = new JSONObject();
		obj.put("ice", json_subtracted);
		series.setTypeId("haha");
		series.setData(obj);
		
		return series;
	}
	

	
	
}
