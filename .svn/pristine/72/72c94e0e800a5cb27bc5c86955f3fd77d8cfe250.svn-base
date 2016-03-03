package kr.go.seaice.common;

import java.io.Serializable;
import java.util.Date;

/**
 * @author me
 * 
 * get most recent stuff
 *
 */
public class UpToDateStuffVO implements Serializable{
	
	private static final long serialVersionUID = -7147016742738953109L;
	
	private String id;
	private String lateststuff;
	private String description;
	private Date beginat;
	private Date seeker_run_at;
	
//	private static final SimpleDateFormat CAL_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	
	
	public UpToDateStuffVO() {}
	
	public UpToDateStuffVO(String id, String lateststuff, Date beginat) {
		this.id = id;
		this.lateststuff = lateststuff;
		this.beginat = beginat;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLateststuff() {
		return lateststuff;
	}

	public void setLateststuff(String lateststuff) {
		this.lateststuff = lateststuff;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getBeginat() {
		return beginat;
	}

	public void setBeginat(Date beginat) {
		this.beginat = beginat;
	}

	public Date getSeeker_run_at() {
		return seeker_run_at;
	}

	public void setSeeker_run_at(Date seeker_run_at) {
		this.seeker_run_at = seeker_run_at;
	}

	//return yyyy-mm-dd
	public String getLateststuff4Cal() {
//		return UpToDateStuffVO.CAL_DATE_FORMAT.format(this.lateststuff);
		return lateststuff.substring(0, 4)+"-"+lateststuff.subSequence(4, 6)+"-01";
	}
	
}
