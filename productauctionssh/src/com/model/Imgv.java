package com.model;

/**
 * Imgv entity. @author MyEclipse Persistence Tools
 */

public class Imgv implements java.io.Serializable {

	// Fields

	private Integer id;
	private String img;

	// Constructors

	/** default constructor */
	public Imgv() {
	}

	/** full constructor */
	public Imgv(String img) {
		this.img = img;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}