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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
		String name = req.getParameter("name");
		boolean result;
	    System.out.println(parking_id+number+status);

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义格式，不显示毫秒
		Timestamp now = new Timestamp(System.currentTimeMillis());//获取系统当前时间
		String str = df.format(now);         //String转化为Timestamp:

		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");//定义格式，不显示毫秒
		String str1 = df1.format(now);         //String转化为Timestamp:


		System.out.println(str1);
		statuschange statuschange = new statuschange();
		if (status.equals("0")){
			result=statuschange.status("update parking_space set status="+status+" ,name= "+null+" , time="+null+" where parking_id="
					+parking_id+" and number="+number);
		}else {
			result=statuschange.status("update parking_space set status="+status+" ,name= "+name+" , time='"+str+"' where parking_id="
					+parking_id+" and number="+number);

			if(status.equals("1")){
				boolean test = statuschange.status("update statistics set book=book+1 where date="+str1);

			}else {
				boolean test = statuschange.status("update statistics set book=book+1 where date="+str1);
			}
		}

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
