package com.GymInfo.gymManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Feedback {
	@Id
	private Long fId;
	private String userName;
	@Lob
	private String content;
	
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Feedback(Long fId, String userName, String content) {
		super();
		this.fId = fId;
		this.userName = userName;
		this.content = content;
	}
	public Long getfId() {
		return fId;
	}
	public void setfId(Long fId) {
		this.fId = fId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}