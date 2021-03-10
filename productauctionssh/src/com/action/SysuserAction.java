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
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

/**
 * 系统用户功能
 * @author Administrator
 *
 */
public class SysuserAction extends ActionSupport
{
	private int id;
	private String idlist;
	private String usertype;
	private String username;
	private String userpwd;
	private String validcode;
	private String realname;
	private String sex;
	private String idcard;
	private String tel;
	private String email;
	private String addr;
	private String delstatus;
	private String savetime;
	private String xiangpian;
	String suc;
	String no;
	String err;
	private int index=1;
	private CommonDAO commonDAO;
	private File upFile;
	private String upFileContentType;
	private String upFileFileName;
	private static final int FILE_SIZE=16*1024;
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getValidcode() {
		return validcode;
	}
	public void setValidcode(String validcode) {
		this.validcode = validcode;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
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
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public CommonDAO getCommonDAO() {
		return commonDAO;
	}
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	
	
	
	public String getXiangpian() {
		return xiangpian;
	}
	public void setXiangpian(String xiangpian) {
		this.xiangpian = xiangpian;
	}
	public File getUpFile() {
		return upFile;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public String getUpFileContentType() {
		return upFileContentType;
	}
	public void setUpFileContentType(String upFileContentType) {
		this.upFileContentType = upFileContentType;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}
	public String getErr() {
		return err;
	}
	public void setErr(String err) {
		this.err = err;
	}
	
	
	public String getIdlist() {
		return idlist;
	}
	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}
	//文件上传
	public void upLoadFile(File source,File target){
		  InputStream in=null;
		  OutputStream out=null;
		  try{
		   in=new BufferedInputStream(new FileInputStream(source),FILE_SIZE);
		   out=new BufferedOutputStream(new FileOutputStream(target),FILE_SIZE);
		   byte[] image=new byte[FILE_SIZE];
		   while(in.read(image)>0){
		    out.write(image);
		   }
		  }catch(IOException ex){
		   ex.printStackTrace();
		  }finally{
		   try{
		    in.close();
		    out.close();
		   }catch(IOException ex){
		    
		   }
		  }
		 }
	
	//管理员登陆
	public String adminLogin(){
		Map session= ServletActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		String validc = (String) request.getSession().getAttribute("validcode");
		String hql="from Sysuser where username='"+username+"' and userpwd='"+userpwd+"' and delstatus='0'";
		System.out.println(hql);
		List adminList=commonDAO.findByHql(hql);
		if(adminList.size()!=0&&validc.equals(validcode)){
			Sysuser sysuser=(Sysuser)adminList.get(0);
			 session.put("admin", sysuser);
			 suc="";
			 return "success";
		}else if(adminList.size()!=0&&!validc.equals(validcode)){
			err="";
			return "err";
		}else{
			no="";
			return "no";
		}
	}
	//后台用户修改密码
	public String adminPwdEdit(){
		Sysuser s = (Sysuser)commonDAO.findById(id, "Sysuser");
		if(!s.getUserpwd().equals(userpwd)){
			no="旧密码不正确";
			return "erro";
		}else{
			s.setUserpwd(userpwd);
			commonDAO.update(s);
			suc="密码修改成功";
			return "success";
		}
		
	}
	//新增系统用户前检查用户名唯一性 jqery
	 public void usernamecheck() throws IOException
	 {
		     System.out.println("html");
	    	 ArrayList<Sysuser> list = (ArrayList<Sysuser>)commonDAO.findByHql("from Sysuser where username='"+username+"' and delstatus='0' ");
	    	 int responseContext;
	    	 if(list.size()==0){
	    		 responseContext = 0;
	    	 }else{
	    		 responseContext=1;
	    	 }
	 		HttpServletResponse response=ServletActionContext.getResponse();
	 		response.setContentType("text/html");
	 		PrintWriter out = response.getWriter();
	 		out.println(responseContext);
	 		out.flush();
	 		out.close();
	 }
	 
	//新建系统用户
		public String adminAdd(){
			Sysuser s = new Sysuser();
			ArrayList<Sysuser> list = (ArrayList<Sysuser>)commonDAO.findByHql("from Sysuser where delstatus='0' and username='"+username+"'");
			if(list.size()==0){
		    s.setUsername(username);
			s.setUserpwd(userpwd);
			s.setUsertype(usertype);
			s.setRealname(realname);
			s.setImg(xiangpian);
			s.setTel(tel);
			s.setEmail(email);
			s.setSex(sex);
			s.setDelstatus("0");
			s.setSavetime(Info.getDateStr());
			commonDAO.save(s);
			suc="";
			return "success";
			}else{
				no="";
				return "error";
			}
		}
	
	//编辑系统用户
	public String adminEdit(){
		Sysuser s = (Sysuser)commonDAO.findById(id, "Sysuser");
		s.setUserpwd(userpwd);
		s.setRealname(realname);
		s.setImg(xiangpian);
		s.setTel(tel);
		s.setEmail(email);
		s.setUsertype(usertype);
		s.setSex(sex);
		commonDAO.update(s);
		suc="编辑系统用户成功";
		return "success";
	}
	
	
	
	//管理员退出
	public String adminExit(){
		Map session= ServletActionContext.getContext().getSession();
		session.remove("admin");
		return "success";
	}
	
	//删除管理员用户
	public String adminDel(){
		String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		Sysuser s = (Sysuser)commonDAO.findById(a[i], "Sysuser");
		s.setDelstatus("1");
		commonDAO.update(s);
		}
		suc="";
		return "success";
	}
	
	//修改密码
	public String passEdit(){
		Sysuser sysuser = (Sysuser)commonDAO.findById(id, "Sysuser");
		System.out.println("userpwd==="+userpwd);
		sysuser.setUserpwd(userpwd);
		commonDAO.update(sysuser);
		suc="";
		return "success";
	}
	
	
	
	
	


	 
}
