package com.model;

/**
 * Lishi entity. @author MyEclipse Persistence Tools
 */

public class Lishi implements java.io.Serializable {

	// Fields

	private Integer id;
	private String gid;
	private String memberid;

	// Constructors

	/** default constructor */
	public Lishi() {
	}

	/** full constructor */
	public Lishi(String gid, String memberid) {
		this.gid = gid;
		this.memberid = memberid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGid() {
		return this.gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

}