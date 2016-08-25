package kr.go.seaice.arctic.timeseries.service;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;

/**
 * @author 2c.me.doe 
 *
 */
public class MostRecentStuffVO implements Serializable {

	//generated serial version id haha
	private static final long serialVersionUID = -1929541415566158442L;
	//sequential unique identifier haha
	private int seriesno;
	//composite 7 days !!
	private Date compbegindate;
	//arctic ice extent --> math.pow(10,6)
	private double extent;
	//roughness index 
	private double roughness;
	//arcticOcean_Barents Sea 
	private double ocean01;
	//arcticOcean_Hudson Bay 
	private double ocean02;
	//arcticOcean_Bearing Sea 
	private double ocean03;
	
//	private String sensor;
	
	private static final SimpleDateFormat MAIN_DATE_FORMAT = 
			new SimpleDateFormat("yyyy.MM.dd.");
	private static final SimpleDateFormat VIEW_DATE_FORMAT = 
			new SimpleDateFormat("MM.dd.");
	private static final SimpleDateFormat PLAIN_DATE_FORMAT = 
			new SimpleDateFormat("yyyyMMdd");
	private static final SimpleDateFormat CAL_DATE_FORMAT = 
			new SimpleDateFormat("yyyy-MM-dd");
	
	
	public MostRecentStuffVO() {
		// TODO Auto-generated constructor stub
	}
	
	public MostRecentStuffVO(Date compbegindate, double extent, double roughness) {
		super();
		this.compbegindate = compbegindate;
		this.extent = extent;
		this.roughness = roughness;
	}

	public MostRecentStuffVO(Date compbegindate, double extent,
			double roughness, double ocean01, double ocean02, double ocean03) {
		super();
		this.compbegindate = compbegindate;
		this.extent = extent;
		this.roughness = roughness;
		this.ocean01 = ocean01;
		this.ocean02 = ocean02;
		this.ocean03 = ocean03;
	}

	public int getSeriesno() {
		return seriesno;
	}

	public void setSeriesno(int seriesno) {
		this.seriesno = seriesno;
	}

	public Date getCompbegindate() {
		return compbegindate;
	}

	public void setCompbegindate(Date compbegindate) {
		this.compbegindate = compbegindate;
	}

	public double getExtent() {
		return extent;
	}

	public void setExtent(double extent) {
		this.extent = extent;
	}

	public double getRoughness() {
		return roughness;
	}

	public void setRoughness(double roughness) {
		this.roughness = roughness;
	}

	public double getOcean01() {
		return ocean01;
	}

	public void setOcean01(double ocean01) {
		this.ocean01 = ocean01;
	}

	public double getOcean02() {
		return ocean02;
	}

	public void setOcean02(double ocean02) {
		this.ocean02 = ocean02;
	}

	public double getOcean03() {
		return ocean03;
	}

	public void setOcean03(double ocean03) {
		this.ocean03 = ocean03;
	}
	
	public String getExtentInkmSquared(){
		Double d = (double)this.extent*(Math.pow(10, 6));
		return String.format("%,d",d.intValue());
	}
	
	//
	public String getSensor() {
		String sensor="";
		Long selected =  DateUtils.addDays(compbegindate, 6).getTime();
		try {
			Long F08_SSMI = MostRecentStuffVO.CAL_DATE_FORMAT.parse("1991-12-18").getTime();
			Long F11_SSMI = MostRecentStuffVO.CAL_DATE_FORMAT.parse("1995-09-29").getTime();
			Long F13_SSMI = MostRecentStuffVO.CAL_DATE_FORMAT.parse("2006-12-31").getTime();
			Long F17_SSMIS = MostRecentStuffVO.CAL_DATE_FORMAT.parse("2016-03-31").getTime();
//			Long F18_SSMIS = MostRecentStuffVO.CAL_DATE_FORMAT.parse("YYYY-MM-DD");
			
			if(selected <= F08_SSMI){ // 1988.01.01 ~ 1991.12.18.
				sensor = "F08 SSM/I";
			}else if(F08_SSMI < selected && selected <= F11_SSMI ){
				sensor = "F11 SSM/I";
			}else if(F11_SSMI < selected && selected <= F13_SSMI ){
				sensor = "F13 SSM/I";
			}else if(F13_SSMI < selected && selected <= F17_SSMIS ){
				sensor = "F17 SSMIS";
			}else if(F17_SSMIS < selected){
				sensor = "F18 SSMIS";
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return sensor;
	}
	
	//return yyyy.mm.dd. ~ yyyy.mm.dd. (week after)
	public String getCompbegindate4Main() {
		String dateBegin = MostRecentStuffVO.MAIN_DATE_FORMAT.format(this.compbegindate);
		String weekAfter =  MostRecentStuffVO.MAIN_DATE_FORMAT.format(DateUtils.addDays(compbegindate, 6));
		return dateBegin + " ~ " + weekAfter;
	}
	
	//return yyyy.mm.dd. ~ mm.dd. 
	public String getCompbegindate4View() {
		String dateBegin = MostRecentStuffVO.MAIN_DATE_FORMAT.format(this.compbegindate);
		String weekAfter =  MostRecentStuffVO.VIEW_DATE_FORMAT.format(DateUtils.addDays(compbegindate, 6));
		return dateBegin + " ~ " + weekAfter;
	}
	
	//return yyyymmdd
	public String getCompbegindateInString() {
		return MostRecentStuffVO.PLAIN_DATE_FORMAT.format(this.compbegindate);
	}
	
	//return yyyy-mm-dd
	public String getCompbegindate4Cal() {
		return MostRecentStuffVO.CAL_DATE_FORMAT.format(this.compbegindate);
	}
	
}
