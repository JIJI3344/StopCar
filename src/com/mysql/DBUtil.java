package com.mysql;

import com.mysql.jdbc.PreparedStatement;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
/*访问数据库工具类：获取数据库链接*/  
public class DBUtil {  
    private String dbName = "stopcar";   //name
    private String url="jdbc:mysql://localhost:3306/"+dbName;//URI 
    private String user="root";                       //MySQL login  name
    private String psd="123456";                  //MySQL  login  password
      
    private PreparedStatement ps= null;
    private ResultSet result;
    private Serializable ret= null;
      
    //获取数据库链接的方法getConn()  
    private Connection conn;                      
    public Connection getConn()  
    {         
        try {  
            Class.forName("com.mysql.jdbc.Driver");             //根据字符串new一个实例，Class类为类装载器
            conn=DriverManager.getConnection(url,user,psd); //获取数据库链接，传入参数：数据库名称、账户名、密码 
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return conn;      
    }  
      
    //查询数据库业务逻辑 
    public boolean checkUser(String sql,String[] args)  
    {  
        boolean flag=false;  
        conn=getConn();     //获得数据库链接  
        if (conn==null) {
			System.out.println("conn is null!");
		}
        else {
        	try {  
                ps=(PreparedStatement) conn.prepareStatement(sql);  
                if(args!=null)  //对sql语句每个占位符赋值    
                {  
                    for(int i=0;i<args.length;i++)  
                        ps.setString(i+1, args[i]);  
                    result=(ResultSet) ps.executeQuery();    //执行sql查询语句，并返回结果集
                    if(result.next())                                      //�����������ڴ��ݹ��������(�ֶ�)�ļ�¼����true
                    {  
                        flag=true;  
                    }  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
		}
               
        return flag;          
    }  
    
    public boolean checkName(String sql)  
    {  
        boolean flag=false;  
        conn=getConn();     //�����ݿ�����  
        if (conn==null) {
			System.out.println("conn is null!");
		}
        else{
        	try {  
                ps=(PreparedStatement) conn.prepareStatement(sql);  
//                if(args!=null)  //��sql���ÿ��ռλ��ֵ  
//                {  
//                    for(int i=0;i<args.length;i++)  
//                        ps.setString(i+1, args[i]);  
                    result=(ResultSet) ps.executeQuery();   //ִ��sql��ѯ��䣬�����ؽ��
                    if(result.next())                                      //�����������ڴ��ݹ��������(�ֶ�)�ļ�¼����true
                    {  
                        flag=true;  
                    }  
//                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }
               
        return flag;          
    }  
    public boolean Addusr(String sql,String[] args)
    {  
        boolean flag=false;
        
        conn=getConn();     //�����ݿ�����  
        if (conn==null) {
			System.out.println("conn is null!");
		}
        else{
            try {  
                ps=(PreparedStatement) conn.prepareStatement(sql);  
                if(args!=null)  //��sql���ÿ��ռλ��ֵ  
                {  
                    for(int i=0;i<args.length;i++)  
                        ps.setString(i+1, args[i]);  
                    int i=ps.executeUpdate();   //�������¼�ɹ�����������1
                    if(result.next())
                    {
                        flag=true;
                    }  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            } 
        }
        
        return flag;          
    }
    public boolean Add(String sql)
    {
        boolean flag=false;

        System.out.println(sql);

        conn=getConn();     //获得数据库链接
        if (conn==null) {
            System.out.println("conn is null!");
        }
        else{
            try {
                ps=(PreparedStatement) conn.prepareStatement(sql);

                int i=ps.executeUpdate();   //如果插入记录成功，返回整型1

                if(i==1)
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
