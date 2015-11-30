package com.status;

import com.mysql.statuschange;
import com.pc.websocket;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class changestatus extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		String parking_id = req.getParameter("parking_id"); //��ȡ������Ĳ���-�û�����Ϣ  
	    String number = req.getParameter("number"); 
	    String status = req.getParameter("status");
	    System.out.println(parking_id+number+status);
	    
	    statuschange statuschange = new statuschange();  
        boolean result=statuschange.status("update parking_space set status="+status+" where parking_id="
        									+parking_id+" and number="+number);
        

		websocket.send(parking_id,number,status);

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
