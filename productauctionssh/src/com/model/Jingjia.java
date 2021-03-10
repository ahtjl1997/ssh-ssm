package com.model;

/**
 * Jingjia entity. @author MyEclipse Persistence Tools
 */

public class Jingjia implements java.io.Serializable {

	// Fields

	private Integer id;
	private String gid;
	private String memberid;
	private Integer chuprice;
	private String delstatus;
	private String savetime;

	// Constructors

	/** default constructor */
	public Jingjia() {
	}

	/** full constructor */
	public Jingjia(String gid, String memberid, Integer chuprice,
			String delstatus, String savetime) {
		this.gid = gid;
		this.memberid = memberid;
		this.chuprice = chuprice;
		this.delstatus = delstatus;
		this.savetime = savetime;
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

	public Integer getChuprice() {
		return this.chuprice;
	}

	public void setChuprice(Integer chuprice) {
		this.chuprice = chuprice;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}