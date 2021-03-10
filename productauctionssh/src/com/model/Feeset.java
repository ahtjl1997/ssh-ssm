package com.model;

/**
 * Feeset entity. @author MyEclipse Persistence Tools
 */

public class Feeset implements java.io.Serializable {

	// Fields

	private Integer id;
	private String fee;

	// Constructors

	/** default constructor */
	public Feeset() {
	}

	/** full constructor */
	public Feeset(String fee) {
		this.fee = fee;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFee() {
		return this.fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

}