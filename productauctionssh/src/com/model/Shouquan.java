package com.model;

/**
 * Shouquan entity. @author MyEclipse Persistence Tools
 */

public class Shouquan implements java.io.Serializable {

	// Fields

	private Integer id;
	private String jsid;
	private String gnid;
	private String fatherid;

	// Constructors

	/** default constructor */
	public Shouquan() {
	}

	/** full constructor */
	public Shouquan(String jsid, String gnid, String fatherid) {
		this.jsid = jsid;
		this.gnid = gnid;
		this.fatherid = fatherid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getJsid() {
		return this.jsid;
	}

	public void setJsid(String jsid) {
		this.jsid = jsid;
	}

	public String getGnid() {
		return this.gnid;
	}

	public void setGnid(String gnid) {
		this.gnid = gnid;
	}

	public String getFatherid() {
		return this.fatherid;
	}

	public void setFatherid(String fatherid) {
		this.fatherid = fatherid;
	}

}