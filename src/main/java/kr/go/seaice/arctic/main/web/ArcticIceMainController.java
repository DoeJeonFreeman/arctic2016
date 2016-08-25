package kr.go.seaice.arctic.main.web;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.go.seaice.arctic.board.Article;
import kr.go.seaice.arctic.board.BoardService;
import kr.go.seaice.arctic.timeseries.service.MostRecentStuffVO;
import kr.go.seaice.arctic.timeseries.service.TimeSeriesChartService;
import kr.go.seaice.common.PagingHelper;
import kr.go.seaice.common.UpToDateStuffVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller 
public class ArcticIceMainController {

	 @Autowired
	 private BoardService boardService;
	
	 @Autowired
	 private TimeSeriesChartService timeseriesService;
	 
	/**
	 *
	 * @param request
	 * @param commandMap
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/forwardPage.do")
	public String forwardPageWithMenuNo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap)
	  throws Exception{
		return "";
	}

	/**
	 * 1.mostRecentStuffInfo 2.visitStatistics_  3.noticex5?
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/mainPage.do")
	public String getMainView(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//notice x last 5
        int numPerPage = 3;
        int pagePerBlock = 3;
        int totalRecord = boardService.getTotalRecord("notice", "");
        PagingHelper pagingHelper = new PagingHelper(totalRecord, 1, numPerPage, pagePerBlock);
        boardService.setPagingHelper(pagingHelper);
        List<Article> list = boardService.getArticleList("notice", "");
        model.addAttribute("notices", list);
//        System.out.println("[numPerPage] " + numPerPage);
//        System.out.println("[noticeList.length] " + list.size());
        //notice x last 3
        MostRecentStuffVO stuff =  timeseriesService.retrievingIfArcticDataExists();
        model.addAttribute("mostRecentStuff", stuff);
		return "main/MainViewArctic";
	}
	
	@RequestMapping(value = "arctic/monthlyPrediction.do")
	public String getPredictiveIceModel(HttpServletRequest request, ModelMap model) throws Exception{
		UpToDateStuffVO stuff =  timeseriesService.selectLatestStuff("02PRE");
        model.addAttribute("mostRecentStuff", stuff);
		return "arctic/monthlyPrediction";
	}
	
	@RequestMapping(value = "arctic/passage.do")
	public String getArcticSeaRoute(HttpServletRequest request, ModelMap model) throws Exception{
		MostRecentStuffVO seaRoute =  timeseriesService.retrievingIfArcticDataExists();
		model.addAttribute("seaRoute", seaRoute);
		return "arctic/seaRoute";
	}
}