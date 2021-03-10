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

import com.model.Gongneng;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class GongnengAction extends ActionSupport
{
	private int id;
	private String fatherid;
	private String name;
	private String url;
	private CommonDAO commonDAO;
	String suc;
	String no;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFatherid() {
		return fatherid;
	}

	public void setFatherid(String fatherid) {
		this.fatherid = fatherid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	//添加功能
	public String fatherAdd(){
		Gongneng g = new Gongneng();
		g.setName(name);
		g.setFatherid(fatherid);
		if(fatherid.equals("0")){
		g.setUrl("");
		}else{
			g.setUrl(url);
		}
		g.setDelstatus("0");
		suc="";
		commonDAO.save(g);
		return "success";
	}
	
	//修改功能
	public String fatherEdit() {
		Gongneng g = (Gongneng)commonDAO.findById(id, "Gongneng");
		if(fatherid.equals("0")){
			g.setUrl("");
			}else{
				g.setUrl(url);
			}
		g.setName(name);
		commonDAO.update(g);
		suc="";
		return "success";
	}
	
	//删除功能
	public String gongnengDel() {
		Gongneng g = (Gongneng)commonDAO.findById(id, "Gongneng");
		g.setDelstatus("1");
		commonDAO.update(g);
		suc="";
		return "success";
	}
	

	 
}
