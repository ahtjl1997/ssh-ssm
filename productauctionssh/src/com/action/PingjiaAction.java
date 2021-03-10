package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;

import com.model.Jingjia;
import com.model.Member;
import com.model.Pingjia;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class PingjiaAction extends ActionSupport {
	private int id;
	private String goodsid;
	private String idlist;
	private String memberid;
	private String dcontent;
	private String savetime;
	private CommonDAO commonDAO;
	String suc;
	String no;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public CommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	public String getSuc() {
		return suc;
	}

	public void setSuc(String suc) {
		this.suc = suc;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	// 添加评价
	public String pingjiaAdd() {
		Map session = ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		if(member!=null){
		ArrayList<Jingjia> list = (ArrayList<Jingjia>)commonDAO.findByHql("from Jingjia where memberid='"+member.getId()+"' and gid='"+goodsid+"'");
		if(list.size()>0){
		Pingjia pingjia = new Pingjia();
		pingjia.setContent(dcontent);
		pingjia.setMemberid(member.getId().toString());
		pingjia.setSavetime(Info.getDateStr());
		pingjia.setGoodsid(goodsid);
		commonDAO.save(pingjia);
		goodsid=goodsid;
		suc = "";
		}else{
			goodsid=goodsid;
			no="";
		}
		return "success";
		}else{
			return "error";
		}
	}

	// 删除评价
	public String pingjiaDel() {
		System.out.println("6666666666");
		String[] a = idlist.split(",");
		for (int i = 0; i < a.length; i++) {
			Pingjia pingjia = (Pingjia) commonDAO.findById(a[i], "Pingjia");
			commonDAO.delete(pingjia);
		}
		suc = "";
		return "success";
	}

}
