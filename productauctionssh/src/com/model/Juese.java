package com.model;

/**
 * Juese entity. @author MyEclipse Persistence Tools
 */

public class Juese implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String delstatus;

	// Constructors

	/** default constructor */
	public Juese() {
	}

	/** full constructor */
	public Juese(String name, String delstatus) {
		this.name = name;
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

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

}