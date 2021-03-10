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

import com.model.Notice;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class NoticeAction extends ActionSupport
{
	private int id;
	private String title;
	private String img;
	private String content;
	private String xiangpian;
	private String idlist;
	private String num;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getIdlist() {
		return idlist;
	}


	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}


	public String getNum() {
		return num;
	}


	public void setNum(String num) {
		this.num = num;
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

	

	public String getXiangpian() {
		return xiangpian;
	}


	public void setXiangpian(String xiangpian) {
		this.xiangpian = xiangpian;
	}

	//添加公告
	public String noticeAdd(){
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setImg(xiangpian);
		notice.setContent(content);
		notice.setSavetime(Info.getDateStr());
		notice.setNum("0");
		commonDAO.save(notice);
		suc="";
		return "success";
	}
	
	
	//编辑公告
	public String noticeEdit(){
		Notice notice = (Notice)commonDAO.findById(id, "Notice");
		notice.setTitle(title);
		notice.setImg(xiangpian);
		notice.setContent(content);
		commonDAO.update(notice);
		suc="";
		return "success";
	}
	
	//删除公告
	public String noticeDel(){
		String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		Notice notice = (Notice)commonDAO.findById(a[i], "Notice");
		commonDAO.delete(notice);
		}
		suc="";
		return "success";
	}

	 
}
