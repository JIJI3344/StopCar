package com.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class statuschange {

	private Connection conn;  
    private PreparedStatement ps; 
    private ResultSet result; 
    
	public boolean status(String sql){
		boolean flag=false;
    	DBUtil dbUtil = new DBUtil(); 
        conn=dbUtil.getConn();     //������ݿ�����  
        if (conn==null) {
    		System.out.println("conn is null!");
    	}
        else {
        	try {  
                ps=(PreparedStatement) conn.prepareStatement(sql);  
                int result=ps.executeUpdate();

                if(result>0)                                      //�����������������ڴ��ݹ���������(�ֶ�)�ļ�¼����true
                {  
                    flag=true;  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
		}
		return flag;
	}
}
