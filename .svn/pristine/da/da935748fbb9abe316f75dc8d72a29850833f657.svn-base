package kr.go.seaice.arctic.timeseries.service.impl;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;

@Repository("chartDAO")
public class ChartDAO{

	
	private int getMonths(String dFrom){
		return (dFrom.length()==8)? 1:12;
	}
	
	//Ice testRunner.
	public JSONObject getSmallIceExtent(String path){
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
		return json_subtracted;
		//return haha
	}
	
	
	/**
	 * @param filePath
	 * @param dateFrom
	 * @return JSONObject(includes RMSE, Bias, NumberofOBServation)
	 */
	public boolean isNumeric(String str)  {  
		  try  {  
		    double d = Double.parseDouble(str);  
		  } catch(NumberFormatException nfe)  {  
		    return false;  
		  }  
		  return true;  
	}
	
}
