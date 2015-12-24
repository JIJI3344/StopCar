package com.mysql;

import com.mysql.jdbc.PreparedStatement;
import com.parking.space.parkingspace;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class parkingspacedata {

	private Connection conn;  
    private PreparedStatement ps; 
    private ResultSet result; 
    
    private List<parkingspace> list;

	public static String pcdata=null;

	public int getstatus(String sql){
    	DBUtil dbUtil = new DBUtil();
        conn=dbUtil.getConn();     //�����ݿ�����
        list = new ArrayList<parkingspace>();
        String number = null;
        String status =null;
		String name = null;
		String time = null;
        if (conn==null) {
			System.out.println("conn is null!");
			DBUtil dbUtil1 = new DBUtil();
			conn=dbUtil1.getConn();     //�����ݿ�����
		}

        	try {  
                    ps=(PreparedStatement) conn.prepareStatement(sql);
                    result=(ResultSet) ps.executeQuery();   //ִ��sql��ѯ��䣬�����ؽ��
                    while(result.next())                                      //�����������ڴ��ݹ��������(�ֶ�)�ļ�¼����true
                    {  
                    	number=result.getString("number");
                    	status=result.getString("status");
						name = result.getString("name");
						time = result.getString("time");
//                        System.out.println(number);
//                        System.out.println(status);

						parkingspace parkingspace= new parkingspace();
						parkingspace.setNumber(number);
						parkingspace.setStatus(status);
						parkingspace.setName(name);
						parkingspace.SetTime(time);
						list.add(parkingspace);
                    }
				}catch (SQLException e) {
	                e.printStackTrace();  
	            }  
		return 0;
    }
    public String data(){
	    JSONArray array=new JSONArray();
		for(parkingspace parkingspace:list){
			//�����û�JSON����
			JSONObject obj=new JSONObject();
			try{
				obj.put("number", parkingspace.getNumber());
				obj.put("status", parkingspace.getStatus());
			}catch (Exception e) {
				// TODO: handle exception
			}
			array.add(obj);
		}
		return array.toString();
	}
	public String IndexData(){
		JSONArray array=new JSONArray();
		for(parkingspace parkingspace:list){
			//�����û�JSON����
			JSONObject obj=new JSONObject();
			try{
				obj.put("number", parkingspace.getNumber());
				obj.put("status", parkingspace.getStatus());
				obj.put("name",parkingspace.getName());
			}catch (Exception e) {
				// TODO: handle exception
			}
			array.add(obj);
		}
		return array.toString();
	}
	public String UserListData(){
		JSONArray array=new JSONArray();
		for(parkingspace parkingspace:list){
			//�����û�JSON����
			JSONObject obj=new JSONObject();
			try{
				obj.put("number", parkingspace.getNumber());
				obj.put("status", parkingspace.getStatus());
				obj.put("name",parkingspace.getName());
				obj.put("time",parkingspace.GetTime());
			}catch (Exception e) {
				// TODO: handle exception
			}
			array.add(obj);
		}
		//System.out.println(array.toString());
		return array.toString();
	}
	public int PcGetStatus(String sql){
		DBUtil dbUtil = new DBUtil();
		conn=dbUtil.getConn();     //�����ݿ�����

		if (conn==null) {
			System.out.println("conn is null!");
			DBUtil dbUtil1 = new DBUtil();
			conn=dbUtil1.getConn();     //�����ݿ�����
		}

		try {
				ps=(PreparedStatement) conn.prepareStatement(sql);
				result=(ResultSet) ps.executeQuery();   //ִ��sql��ѯ��䣬�����ؽ��
				System.out.println("调试是否返回！");
				if(result.next())                                      //�����������ڴ��ݹ��������(�ֶ�)�ļ�¼����true
				{
					pcdata=result.getString("status");
					System.out.println("PCDATA"+pcdata);
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

}
