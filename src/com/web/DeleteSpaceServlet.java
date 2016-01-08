package com.web;

import com.mysql.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhe-wang on 16-1-8.
 */
public class DeleteSpaceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd= null;
        String forward= null;

        String request = req.getParameter("request");

        if (request.equals("delete")){
            String number = req.getParameter("number");
            String parking_id = req.getParameter("parking_id");

            DBUtil dbUtil = new DBUtil();
            dbUtil.Add("delete from parking_space where number = "+number+" and parking_id = "+parking_id);

            forward="/index.jsp";
        }else {

        }

        rd =req.getRequestDispatcher(forward);
        rd.forward(req,resp);
    }
}
