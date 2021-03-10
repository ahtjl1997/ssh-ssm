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

import com.model.Member;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import com.util.Retainone;

/**
 * 系统用户功能
 * @author Administrator
 *
 */
public class MemberAction extends ActionSupport
{
	private int id;
	private String idlist;
	private String uname;
	private String upass;
	private String realname;
	private String sex;
	private String age;
	private String tel;
	private String email;
	private String addr;
	private String img;
	private String savetime;
	private String touxiang;
	private String jine;
	private String randoms;
	private String delstatus;
	private String utype;
	String suc;
	String no;
	String err;
	private int index=1;
	private CommonDAO commonDAO;
	private File upFile;
	private String upFileContentType;
	private String upFileFileName;
	private static final int FILE_SIZE=16*1024;
	
	
	
	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

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

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
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

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	

	public String getJine() {
		return jine;
	}

	public void setJine(String jine) {
		this.jine = jine;
	}

	public String getTouxiang() {
		return touxiang;
	}

	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
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

	public String getErr() {
		return err;
	}

	public void setErr(String err) {
		this.err = err;
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
	
	

	public String getDelstatus() {
		return delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	
	
	

	public String getRandoms() {
		return randoms;
	}

	public void setRandoms(String randoms) {
		this.randoms = randoms;
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
	
	
	
	//会员登陆
	public String memberLogin(){
		Map session= ServletActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("yzm==="+session.get("random"));
		String yzm = Info.getUTFStr(session.get("random").toString());
		System.out.println("yzm1===="+yzm);
		String hql="from Member where uname='"+uname+"' and upass='"+upass+"' and delstatus='0'";
		List list=commonDAO.findByHql(hql);
		if(yzm.equals(randoms)){
		if(list.size()!=0){
			Member member=(Member)list.get(0);
			 session.put("member", member);
			 suc="";
			 return "success";
		}else{
			 no="";
			 return "error";
		}
		}else{
			 err="";
			 return "error";
		}
	}
	//新增系统用户前检查用户名唯一性 jqery
	 public void usernamecheck() throws IOException
	 {
		     System.out.println("html");
	    	 ArrayList<Member> list = (ArrayList<Member>)commonDAO.findByHql("from Member where uname='"+uname+"' and delstatus='0' ");
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
	 
	 //会员注册
	 public String memberRegist(){
		 Member member = new Member();
		 member.setUname(uname);
		 member.setUpass(upass);
		 member.setEmail(email);
		 member.setAddr("");
		 member.setRealname("");
		 member.setTel("");
		 member.setSex("");
		 member.setSavetime(Info.getDateStr());
		 member.setDelstatus("0");
		 member.setYue("0");
		 member.setUtype(utype);
		 commonDAO.save(member);
		 suc="";
		 return "success";
	 }
	//会员退出
	 public String memberExit(){
		 Map session = ServletActionContext.getContext().getSession();
		 session.remove("member");
		 suc="";
		 return "success";
	 }
	 
	 //修改会员资料
	 public String memberEdit(){
		 Member member = (Member)commonDAO.findById(id, "Member");
		 member.setImg(touxiang);
		 member.setEmail(email);
		 member.setRealname(realname);
		 member.setSex(sex);
		 member.setAddr(addr);
		 member.setTel(tel);
		 commonDAO.update(member);
		 suc="";
		 return "success";
	 }
	 
	 //修改密码
	 public String upassEdit(){
		 Member member = (Member)commonDAO.findById(id, "Member");
		 member.setUpass(upass);
		 commonDAO.update(member);
		 suc="";
		 return "success";
	 }
	 
	 //充值
	 public String chongZhi(){
		 Member member = (Member)commonDAO.findById(id, "Member");
		 double total = Double.parseDouble(member.getYue().toString())+Double.parseDouble(jine);
		 Retainone rt = new Retainone();
		 String totaljine = rt.getAdecimal(total+"");
		 member.setYue(totaljine);
		 commonDAO.update(member);
		 suc="";
		 return "success";
	 }
	 
	 public String memberDel(){
			String[] a = idlist.split(",");
			for(int i=0;i<a.length;i++){
			Member member = (Member)commonDAO.findById(a[i], "Member");
			member.setDelstatus("1");
			commonDAO.update(member);
			}
			suc="";
			return "success";
		}
	 
	 public String mbEdit(){
		 Member member = (Member)commonDAO.findById(id, "Member");
		 member.setEmail(email);
		 member.setUpass(upass);
		 member.setRealname(realname);
		 member.setSex(sex);
		 member.setAddr(addr);
		 member.setTel(tel);
		 commonDAO.update(member);
		 suc="";
		 return "success";
	 }

	 
}
