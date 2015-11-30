package com.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mysql.DBUtil;
import com.mysql.getid;

public class signupservlet extends HttpServlet {

	public static String id = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		RequestDispatcher rd= null;
		String forward= null;
		
		String name = req.getParameter("name"); 
	    String password = req.getParameter("password0");   
	    System.out.println("name="+name+"password="+password);
	    
	    DBUtil dbUtil = new DBUtil();
		getid GetID = new getid();
	    boolean result=dbUtil.checkName("select * from parking where name="+name);
	    
	    if(result==true){
	    	req.setAttribute("result", result);
	    	System.out.println(result);
		    forward="/signup.jsp";
	    }else {
			dbUtil.Addusr("insert into parking (name,password) values (?,?)", new String[]{name,password});
			GetID.GetID("select * from parking where name=" + name);
			id=GetID.id;
		    forward="/personal.jsp";
		}

	    
	    rd =req.getRequestDispatcher(forward);
   	 	rd.forward(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
