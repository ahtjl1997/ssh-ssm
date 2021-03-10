package com.model;

/**
 * Gongneng entity. @author MyEclipse Persistence Tools
 */

public class Gongneng implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String fatherid;
	private String url;
	private String delstatus;

	// Constructors

	/** default constructor */
	public Gongneng() {
	}

	/** full constructor */
	public Gongneng(String name, String fatherid, String url, String delstatus) {
		this.name = name;
		this.fatherid = fatherid;
		this.url = url;
		this.delstatus = delstatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFatherid() {
		return this.fatherid;
	}

	public void setFatherid(String fatherid) {
		this.fatherid = fatherid;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

}