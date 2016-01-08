package com.mysql;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;

public class stopandcost {

	private Connection conn;  
    private PreparedStatement ps1; 
    public boolean stop(String sql1){
    	boolean flag=false;
    	DBUtil dbUtil = new DBUtil(); 
        conn=dbUtil.getConn();     //�����ݿ�����  
        if (conn==null) {
    		System.out.println("conn is null!");
    	}
        else {
        	try {
        		ps1=(PreparedStatement) conn.prepareStatement(sql1); 

        		int result1=ps1.executeUpdate();
        			flag=true;
			} catch (Exception e) {
				// TODO: handle exception
			}
        }
		return flag;
    }
}
