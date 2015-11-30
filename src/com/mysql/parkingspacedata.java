package com.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mysql.jdbc.PreparedStatement;
import com.parking.space.parkingspace;

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
        if (conn==null) {
			System.out.println("conn is null!");
			DBUtil dbUtil1 = new DBUtil();
			conn=dbUtil1.getConn();     //�����ݿ�����
		}

        	try {  
        		for (int i = 1; i < 7; i++) {
                    ps=(PreparedStatement) conn.prepareStatement(sql+" and number="+i);
                    result=(ResultSet) ps.executeQuery();   //ִ��sql��ѯ��䣬�����ؽ��
                    if(result.next())                                      //�����������ڴ��ݹ��������(�ֶ�)�ļ�¼����true
                    {  
                    	number=result.getString("number");
                    	status=result.getString("status");
//                        System.out.println(number);
//                        System.out.println(status);
                    }
                    parkingspace parkingspace= new parkingspace();
                    parkingspace.setNumber(number);
                    parkingspace.setStatus(status);

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
