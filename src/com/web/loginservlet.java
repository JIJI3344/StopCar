package com.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mysql.DBUtil;
import com.mysql.getid;


public class loginservlet extends HttpServlet {
	public static String id = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		RequestDispatcher rd= null;
		String forward= null;
		
		String name = req.getParameter("name"); 
	    String password = req.getParameter("password");   
	    System.out.println("name="+name+"password="+password);
	    
 
		DBUtil dbUtil = new DBUtil();
		getid GetID = new getid();
		boolean result=dbUtil.checkUser(
				"select * from parking where name=? and password=?", new String[]{name,password});

		if(result){
			GetID.GetID("select * from parking where name=" + name);
			id=GetID.id;
			forward ="index.jsp";
		}else {
			forward="signin.jsp";
		}

		rd =req.getRequestDispatcher(forward);
		rd.forward(req,resp);
		
	}

}
