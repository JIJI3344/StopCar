package com.android.landandregister;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.mysql.DBUtil;

public class registerservlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		String name = req.getParameter("name"); //��ȡ������Ĳ���-�û�����Ϣ  
	    String password = req.getParameter("password");   
	    System.out.println("name="+name+"password="+password);
	    
	    DBUtil dbUtil = new DBUtil();  
        boolean result=dbUtil.checkName("select * from user where name="+name);
        
        JSONObject jsonObject = new JSONObject();
        System.out.println(result);
        if (result==true) {
        	jsonObject.put("state", "name exist!");
		}
        else {
			jsonObject.put("state", "success");
			dbUtil.Addusr("insert into user (name,password) values (?,?)", new String[]{name,password});
		}
        
        System.out.println(jsonObject.toString());
		out.write(jsonObject.toString());
		out.flush();
		out.close();
	}

}
