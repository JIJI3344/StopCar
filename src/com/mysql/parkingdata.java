package com.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gps.parking;
import com.mysql.jdbc.PreparedStatement;


public class parkingdata {
    private Connection conn;  
    private PreparedStatement ps; 
    private ResultSet result; 
	private String longs;
	private String latis;
	
	private List<parking> list;
	
	public int getgps(String sql) {
		
		DBUtil dbUtil = new DBUtil(); 
        conn=dbUtil.getConn();     //�����ݿ�����  
        list = new ArrayList<parking>();
		longs = null;
		latis = null;
        if (conn==null) {
			System.out.println("conn is null!");
		}
        else{
        	try {  
        		for (int i = 1; i < 5; i++) {
                    ps=(PreparedStatement) conn.prepareStatement(sql+i);
                    result=(ResultSet) ps.executeQuery();
                    if(result.next())
                    {  
                    	longs=result.getString("longtitude");
                    	latis=result.getString("latitude");
//                        System.out.println(longs);
//                        System.out.println(latis);
                    }
                    parking parking= new parking();
                    parking.setId(String.valueOf(i));
                    parking.setlatitude(latis);
                    parking.setLongtitude(longs);
                    list.add(parking);
        		}
				}catch (SQLException e) {  
	                e.printStackTrace();  
	            }  
        	}
		return 0;
        }
	public String data(){
	    JSONArray array=new JSONArray();
		for(parking parking:list){

			JSONObject obj=new JSONObject();
			try{
				obj.put("id", parking.getId());
				obj.put("longtitude", parking.getLongtitude());
				obj.put("latitude", parking.getLatitude());
			}catch (Exception e) {
				// TODO: handle exception
			}
			array.add(obj);
		}
		return array.toString();
	}

}