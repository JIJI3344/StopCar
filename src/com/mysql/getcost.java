package com.mysql;

import java.sql.Connection;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;
import com.stop.cost.cost;

public class getcost {

    private Connection conn;  
    private PreparedStatement ps; 
    private ResultSet result; 
    private String cost=null;
    public String getcost(String sql){
		DBUtil dbUtil = new DBUtil(); 
        conn=dbUtil.getConn();     //������ݿ�����  
        if (conn==null) {
			System.out.println("conn is null!");
		}
        else {
			try {
				ps=(PreparedStatement) conn.prepareStatement(sql);
                result=(ResultSet) ps.executeQuery();   //ִ��sql��ѯ��䣬�����ؽ����
                if (result.next()) {
					cost=result.getString("cost");
					System.out.println(cost);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return cost;
    }
}
