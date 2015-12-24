package com.pc;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by zhe-wang on 15-12-1.
 */
public class TaskManager implements ServletContextListener {
    private java.util.Timer timer = null;
    @Override
    public void contextInitialized(ServletContextEvent event) {
        timer = new java.util.Timer(true);
        event.getServletContext().log("定时器已启动");
        timer.schedule(new MyTask(event.getServletContext()), 0,24*60*60*1000);  //每一天看一次
        event.getServletContext().log("已经添加任务调度表");
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {

        timer.cancel();
        event.getServletContext().log("定时器销毁");
    }
}