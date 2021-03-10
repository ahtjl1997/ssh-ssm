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
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;

import com.model.Liuyan;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class LiuyanAction extends ActionSupport {
	private int id;
	private String memberid;
	private String idlist;
	private String dcontent;
	private String hcontent;
	private String lsavetime;
	private String adminid;
	private String hsavetime;
	private CommonDAO commonDAO;
	String suc;
	String no;
	
	

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getLsavetime() {
		return lsavetime;
	}

	public void setLsavetime(String lsavetime) {
		this.lsavetime = lsavetime;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getHsavetime() {
		return hsavetime;
	}

	public void setHsavetime(String hsavetime) {
		this.hsavetime = hsavetime;
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
	
	

	public String getHcontent() {
		return hcontent;
	}

	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}

	// 添加留言
	public String liuyanAdd() throws UnsupportedEncodingException {
		String s = ServletActionContext.getRequest().getParameter("dcontent"); 
	    s=java.net.URLDecoder.decode(s,"UTF-8"); 
		Liuyan liuyan = new Liuyan();
		liuyan.setContent(s);
		liuyan.setMemberid(memberid);
		liuyan.setLsavetime(Info.getDateStr());
		liuyan.setHcontent("");
		liuyan.setHsavetime("");
		liuyan.setAdminid("");
		commonDAO.save(liuyan);
		suc = "";
		return "success";
	}
	
	// 回复留言
	public String liuyanHf() {
		Liuyan liuyan = (Liuyan)commonDAO.findById(id, "Liuyan");
		liuyan.setHcontent(hcontent);
		liuyan.setHsavetime(Info.getDateStr());
		liuyan.setAdminid(adminid);
		commonDAO.update(liuyan);
		suc = "";
		return "success";
	}


	// 删除留言
	public String liuyanDel() {
		String[] a = idlist.split(",");
		for (int i = 0; i < a.length; i++) {
			Liuyan liuyan = (Liuyan) commonDAO.findById(a[i], "Liuyan");
			commonDAO.delete(liuyan);
		}
		suc = "";
		return "success";
	}

}
