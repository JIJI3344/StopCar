package com.mysql;

import com.mysql.jdbc.PreparedStatement;
import com.parking.space.parkingspace;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhe-wang on 15-11-25.
 */
public class web {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet result;
    public String respose = null;
    public String number;
    public String name;
    private String status;
    private List<parkingspace> list;

    public void GetRespose(String sql){
        DBUtil dbUtil = new DBUtil();
        conn=dbUtil.getConn();     //�����ݿ�����
        conn=dbUtil.getConn();     //�����ݿ�����
        if (conn==null) {
            System.out.println("conn is null!");
            DBUtil dbUtil1 = new DBUtil();
            conn=dbUtil1.getConn();     //�����ݿ�����
        }
        try {
            ps=(PreparedStatement) conn.prepareStatement(sql);
            result=(ResultSet) ps.executeQuery();   //ִ��sql��ѯ��䣬�����ؽ��
            //System.out.println("调试是否返回！");
            if(result.next())                                      //�����������ڴ��ݹ��������(�ֶ�)�ļ�¼����true
            {
                status=result.getString("status");
                number=result.getString("number");
                //name=result.getString("name");

            }
            parkingspace parkingspace= new parkingspace();
            parkingspace.setNumber(number);
            parkingspace.setStatus(status);
            list.add(parkingspace);

        }catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
