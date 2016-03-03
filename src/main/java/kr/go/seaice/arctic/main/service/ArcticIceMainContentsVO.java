package kr.go.seaice.arctic.main.service;

import java.io.Serializable;

public class ArcticIceMainContentsVO implements Serializable{

	/**
	 * generated serial version id..
	 */
	private static final long serialVersionUID = -3049586645583076884L;

	
	/**
	 * 작업항목 이름
	 */
	private String workItemName;
	/**
	 * To-Do List 항목 별 업무화면 URL
	 */
	private String workItemURL;

	/**
	 * getItemCount 항목 개수 getter
	 * @return
	 */
	public int getItemCount(){
		return 0;
	}

	/**
	 * getWorkItemName To-Do List 항목 명 getter
	 * @return To-Do List 항목 명
	 */
	public String getWorkItemName(){
		return workItemName;
	}

	/**
	 * getWorkItemURL 업무화면 URL getter
	 * @return 업무화면 URL
	 */
	public String getWorkItemURL(){
		return workItemURL;
	}
	
	
}
