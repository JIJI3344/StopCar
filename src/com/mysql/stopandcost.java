package com.mysql;

import java.sql.Connection;

import com.mysql.jdbc.PreparedStatement;

public class stopandcost {

	private Connection conn;  
    private PreparedStatement ps1; 
    private PreparedStatement ps2; 
    public boolean stop(String sql1,String sql2){
    	boolean flag=false;
    	DBUtil dbUtil = new DBUtil(); 
        conn=dbUtil.getConn();     //获得数据库链接  
        if (conn==null) {
    		System.out.println("conn is null!");
    	}
        else {
        	try {
        		ps1=(PreparedStatement) conn.prepareStatement(sql1); 
        		ps2=(PreparedStatement) conn.prepareStatement(sql2);
        		
        		int result1=ps1.executeUpdate();
        		int result2=ps2.executeUpdate();
        		if((result1*result2)!=0){
        			flag=true;
        		}
			} catch (Exception e) {
				// TODO: handle exception
			}
        }
		return flag;
    }
}
