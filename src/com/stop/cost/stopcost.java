package com.stop.cost;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.stopandcost;

import net.sf.json.JSONObject;

public class stopcost extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		String cost = req.getParameter("cost"); //��ȡ������Ĳ���-�û�����Ϣ  
	    String name = req.getParameter("name"); 
	    String parking_id = req.getParameter("parking_id");
	    String number = req.getParameter("number");   
	    System.out.print(parking_id+number+name+cost);
	    
	    stopandcost stopandcost=new stopandcost();
	    boolean result=stopandcost.stop("update parking_space set status=0 where parking_id="
				+parking_id+" and number="+number, "update user set cost=cost+"+cost+" where name="
						+name);
	    JSONObject jsonObject = new JSONObject();
	    System.out.println(result);
        if (result==true) {
        	jsonObject.put("state", "success");
		}
        else {
			jsonObject.put("state", "fail");
		}
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
