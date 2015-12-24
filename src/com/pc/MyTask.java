package com.pc;

import com.mysql.parkingdata;
import com.mysql.statuschange;

import javax.servlet.ServletContext;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimerTask;

/**
 * Created by zhe-wang on 15-12-1.
 */
public class MyTask extends TimerTask{
    private static final int C_SCHEDULE_HOUR   = 9; //晚上0点时,执行
    private static boolean isRunning = false;
    private ServletContext context = null;

    public MyTask(ServletContext context) {
        this.context = context;
    }
    public void run() {
        Calendar cal = Calendar.getInstance();
        if (!isRunning)  {
            if (C_SCHEDULE_HOUR == cal.get(Calendar.HOUR_OF_DAY)) {
                isRunning = true;
                context.log("开始执行指定任务");

                //TODO 添加自定义的详细任务，以下只是示例
                timerDoSomething();
                isRunning = false;
                context.log("指定任务执行结束");
            }
        } else {
            context.log("上一次任务执行还未结束");
        }
    }
    public static void timerDoSomething(){
        statuschange statuschange = new statuschange();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//定义格式，不显示毫秒
        Timestamp now = new Timestamp(System.currentTimeMillis());//获取系统当前时间
        String str = df.format(now);

        for (int i=1 ; i<= parkingdata.parkingNumber;i++) {
            statuschange.status("insert into statistics values (0,0,"+str+i+")");
        }

    }
}
