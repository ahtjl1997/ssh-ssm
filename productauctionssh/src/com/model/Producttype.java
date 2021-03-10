package com.model;

/**
 * Producttype entity. @author MyEclipse Persistence Tools
 */

public class Producttype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String typename;
	private String delstatus;

	// Constructors

	/** default constructor */
	public Producttype() {
	}

	/** full constructor */
	public Producttype(String typename, String delstatus) {
		this.typename = typename;
		this.delstatus = delstatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypename() {
		return this.typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

}