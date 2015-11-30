package com.mysql;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhe-wang on 15-11-18.
 */
public class getid {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet result;
    public static String id = null;

    public int GetID(String sql){
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
                id=result.getString("id");
                System.out.println("id"+id);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

}
