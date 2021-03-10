package com.model;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodsname;
	private Integer price;
	private Integer jiajia;
	private Integer shuishou;
	private String type;
	private String img;
	private String status;
	private String content;
	private String delstatus;
	private String stime;
	private String etime;
	private Integer maxprice;
	private String memberid;
	private Integer cs;
	private String shstatus;
	private String chengdu;
	private String buytime;
	private String paistyle;
	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** full constructor */
	public Goods(String goodsname, Integer price, Integer jiajia,
			Integer shuishou, String type, String img, String status,
			String content, String delstatus, String stime, String etime,
			Integer maxprice, String memberid, Integer cs, String shstatus,
			String chengdu, String buytime,String paistyle) {
		this.paistyle = paistyle;
		this.goodsname = goodsname;
		this.price = price;
		this.jiajia = jiajia;
		this.shuishou = shuishou;
		this.type = type;
		this.img = img;
		this.status = status;
		this.content = content;
		this.delstatus = delstatus;
		this.stime = stime;
		this.etime = etime;
		this.maxprice = maxprice;
		this.memberid = memberid;
		this.cs = cs;
		this.shstatus = shstatus;
		this.chengdu = chengdu;
		this.buytime = buytime;
	}

	// Property accessors

	public String getPaistyle() {
		return this.paistyle;
	}

	public void setPaistyle(String paistyle) {
		this.paistyle = paistyle;
	}
	
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodsname() {
		return this.goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getJiajia() {
		return this.jiajia;
	}

	public void setJiajia(Integer jiajia) {
		this.jiajia = jiajia;
	}

	public Integer getShuishou() {
		return this.shuishou;
	}

	public void setShuishou(Integer shuishou) {
		this.shuishou = shuishou;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getStime() {
		return this.stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return this.etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public Integer getMaxprice() {
		return this.maxprice;
	}

	public void setMaxprice(Integer maxprice) {
		this.maxprice = maxprice;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public Integer getCs() {
		return this.cs;
	}

	public void setCs(Integer cs) {
		this.cs = cs;
	}

	public String getShstatus() {
		return this.shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

	public String getChengdu() {
		return this.chengdu;
	}

	public void setChengdu(String chengdu) {
		this.chengdu = chengdu;
	}

	public String getBuytime() {
		return this.buytime;
	}

	public void setBuytime(String buytime) {
		this.buytime = buytime;
	}

}