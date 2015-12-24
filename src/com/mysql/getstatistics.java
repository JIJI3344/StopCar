package com.mysql;

import com.mysql.jdbc.PreparedStatement;
import com.web.statistics;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhe-wang on 15-12-1.
 */
public class getstatistics {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet result;

    private List<statistics> list;

    public int getstatistics(String sql){
        DBUtil dbUtil = new DBUtil();
        conn=dbUtil.getConn();     //�����ݿ�����
        list = new ArrayList<statistics>();
        String book = null;
        String use =null;
        String date = null;
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
                book=result.getString("book");
                use=result.getString("use");
                date = result.getString("date");

                statistics Statistics = new statistics();
                Statistics.setBook(book);
                Statistics.setUse(use);
                Statistics.setDate(date);
                list.add(Statistics);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public String data(){
        JSONArray array=new JSONArray();
        for(statistics Statistics:list){
            //�����û�JSON����
            JSONObject obj=new JSONObject();
            try{
                obj.put("book", Statistics.getBook());
                obj.put("use", Statistics.getUse());
                obj.put("date", Statistics.getDate());
            }catch (Exception e) {
                // TODO: handle exception
            }
            array.add(obj);
        }
        return array.toString();
    }
}
