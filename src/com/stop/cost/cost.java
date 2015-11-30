package com.stop.cost;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.getcost;

import net.sf.json.JSONObject;

public class cost extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		String name = req.getParameter("name");
		System.out.print(name);
		
		getcost getcost=new getcost();
		String cost=getcost.getcost("select * from user where name="+name);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("cost", cost);
		
        System.out.println(jsonObject.toString());
		out.write(jsonObject.toString());
		out.flush();
		out.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}
