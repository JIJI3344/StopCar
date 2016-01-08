package com.mysql;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhe-wang on 16-1-8.
 */
public class getstatus {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet result;
    public static String status = null;

    public int GetStauts(String sql){
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
            //System.out.println("调试是否返回！");
            if(result.next())                                      //�����������ڴ��ݹ��������(�ֶ�)�ļ�¼����true
            {
                status=result.getString("status");
                System.out.println("status为："+status);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}
