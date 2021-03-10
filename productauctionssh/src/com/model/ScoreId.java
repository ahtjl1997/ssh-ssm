package com.model;

/**
 * ScoreId entity. @author MyEclipse Persistence Tools
 */

public class ScoreId implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer score;
	private String content;
	private String saleid;
	private String memberid;

	// Constructors

	/** default constructor */
	public ScoreId() {
	}

	/** full constructor */
	public ScoreId(Integer id, Integer score, String content, String saleid,
			String memberid) {
		this.id = id;
		this.score = score;
		this.content = content;
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

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ScoreId))
			return false;
		ScoreId castOther = (ScoreId) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())))
				&& ((this.getScore() == castOther.getScore()) || (this
						.getScore() != null
						&& castOther.getScore() != null && this.getScore()
						.equals(castOther.getScore())))
				&& ((this.getContent() == castOther.getContent()) || (this
						.getContent() != null
						&& castOther.getContent() != null && this.getContent()
						.equals(castOther.getContent())))
				&& ((this.getSaleid() == castOther.getSaleid()) || (this
						.getSaleid() != null
						&& castOther.getSaleid() != null && this.getSaleid()
						.equals(castOther.getSaleid())))
				&& ((this.getMemberid() == castOther.getMemberid()) || (this
						.getMemberid() != null
						&& castOther.getMemberid() != null && this
						.getMemberid().equals(castOther.getMemberid())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result
				+ (getScore() == null ? 0 : this.getScore().hashCode());
		result = 37 * result
				+ (getContent() == null ? 0 : this.getContent().hashCode());
		result = 37 * result
				+ (getSaleid() == null ? 0 : this.getSaleid().hashCode());
		result = 37 * result
				+ (getMemberid() == null ? 0 : this.getMemberid().hashCode());
		return result;
	}

}