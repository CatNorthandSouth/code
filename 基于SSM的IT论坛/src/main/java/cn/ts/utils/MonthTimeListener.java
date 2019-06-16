package cn.ts.utils;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;

public class MonthTimeListener implements ServletContextListener {

	private Timer timer=null;
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		if (timer != null) {
			timer.cancel();
			event.getServletContext().log("month定时器取消");
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		ApplicationContext context = ApplicationContextUtil.getApplicationContext();
		TimerTask task = (TimerTask)context.getBean(MonthTimeAccount.class);
		timer=new Timer(true);
		//int period=30*24*3600*1000;
		event.getServletContext().log("month定时器启动");
		timer.scheduleAtFixedRate(task, 600*1000, 1000*3600*24);
	}

}
