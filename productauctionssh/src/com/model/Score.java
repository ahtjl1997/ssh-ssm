package com.model;

/**
 * Score entity. @author MyEclipse Persistence Tools
 */

public class Score implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer score;
	private String content;
	private String gid;
	private String saleid;
	private String memberid;

	// Constructors

	/** default constructor */
	public Score() {
	}

	/** full constructor */
	public Score(Integer score, String content, String gid, String saleid,
			String memberid) {
		this.score = score;
		this.content = content;
		this.gid = gid;
		this.saleid = saleid;
		this.memberid = memberid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGid() {
		return this.gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getSaleid() {
		return this.saleid;
	}

	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

}