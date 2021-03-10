package com.model;

/**
 * Liuyan entity. @author MyEclipse Persistence Tools
 */

public class Liuyan implements java.io.Serializable {

	// Fields

	private Integer id;
	private String memberid;
	private String content;
	private String lsavetime;
	private String hcontent;
	private String adminid;
	private String hsavetime;

	// Constructors

	/** default constructor */
	public Liuyan() {
	}

	/** full constructor */
	public Liuyan(String memberid, String content, String lsavetime,
			String hcontent, String adminid, String hsavetime) {
		this.memberid = memberid;
		this.content = content;
		this.lsavetime = lsavetime;
		this.hcontent = hcontent;
		this.adminid = adminid;
		this.hsavetime = hsavetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLsavetime() {
		return this.lsavetime;
	}

	public void setLsavetime(String lsavetime) {
		this.lsavetime = lsavetime;
	}

	public String getHcontent() {
		return this.hcontent;
	}

	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}

	public String getAdminid() {
		return this.adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getHsavetime() {
		return this.hsavetime;
	}

	public void setHsavetime(String hsavetime) {
		this.hsavetime = hsavetime;
	}

}