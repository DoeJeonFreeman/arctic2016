package kr.go.seaice.common;

import java.io.Serializable;

public class LoginVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	private String userid;
	private String userpw;
	private String name;
	private String mobile;
	private String email;
	/** hint */
//	private String passwordHint;
	/** flag */
//	private String userSe;
	
	
	public LoginVO() {}
	
	public LoginVO(String userid, String passwd) {
		this.userid = userid;
		this.userpw = passwd;
	}
	
	public LoginVO(String userid, String userpw, String name, String mobile, String email) {
		this.userid = userid;
		this.userpw = userpw;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String toString(){
		return "[userid: "+userid+"][userpw: "+ userpw +"][name: "+name+"]"+"][email: "+email+"]"+"][mobile: "+mobile+"]";
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getUserpw() {
		return userpw;
	}
	
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
}
