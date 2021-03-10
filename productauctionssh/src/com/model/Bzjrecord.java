package com.model;

/**
 * Bzjrecord entity. @author MyEclipse Persistence Tools
 */

public class Bzjrecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodid;
	private String memberid;
	private String fee;

	// Constructors

	/** default constructor */
	public Bzjrecord() {
	}

	/** full constructor */
	public Bzjrecord(String goodid, String memberid, String fee) {
		this.goodid = goodid;
		this.memberid = memberid;
		this.fee = fee;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodid() {
		return this.goodid;
	}

	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getFee() {
		return this.fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

}