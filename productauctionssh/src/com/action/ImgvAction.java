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

import com.model.Imgv;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class ImgvAction extends ActionSupport {
	private int id;
	private String tupian;
	private String idlist;
	private String img;
	private CommonDAO commonDAO;
	String suc;
	String no;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	// 添加焦点图
	public String imgvAdd() {
		Imgv imgv = new Imgv();
		imgv.setImg(tupian);
		commonDAO.save(imgv);
		suc = "";
		return "success";
	}

	// 编辑焦点图
	public String imgvEdit() {
		Imgv  imgv  = (Imgv) commonDAO.findById(id, "Imgv");
		imgv.setImg(tupian);
		commonDAO.update(imgv);
		suc = "";
		return "success";
	}

	// 删除焦点图
	public String imgvDel() {
		String[] a = idlist.split(",");
		for (int i = 0; i < a.length; i++) {
			Imgv imgv = (Imgv) commonDAO.findById(a[i], "Imgv");
			commonDAO.delete(imgv);
		}
		suc = "";
		return "success";
	}

}
