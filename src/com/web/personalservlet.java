package com.web;

import com.mysql.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhe-wang on 9/20/15.
 */
public class personalservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd= null;
        String forward= null;

        String number = req.getParameter("number");
        String longitude = req.getParameter("longitude");
        String latitude = req.getParameter("latitude");

        System.out.println(number+" "+longitude+" "+latitude);



        DBUtil dbUtil = new DBUtil();
        boolean result=dbUtil.Add("update parking set number="+number+" ,longitude="+longitude+" ," +
                "latitude="+latitude+" where id="+loginservlet.id);
        if(result==true){
            forward="/index.jsp";
        }else {
            req.setAttribute("result", result);
            forward="/personal.jsp";
        }
        for (int i = 1 ; i <= Integer.parseInt(number) ; i ++){
            dbUtil.Add("insert into parking_space values ("+ i + "," +loginservlet.id+ ",0,null,null)");
        }

        rd =req.getRequestDispatcher(forward);
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
        
    }
}


