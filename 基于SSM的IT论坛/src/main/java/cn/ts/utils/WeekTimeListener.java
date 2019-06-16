package cn.ts.utils;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;

public class WeekTimeListener implements ServletContextListener {

	private Timer timer=null;
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		if (timer != null) {
			timer.cancel();
			event.getServletContext().log("week定时器取消");
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		ApplicationContext context = ApplicationContextUtil.getApplicationContext();
		TimerTask task = (TimerTask)context.getBean(WeekTimeAccount.class);
		timer=new Timer(true);
		event.getServletContext().log("week定时器启动");
		timer.scheduleAtFixedRate(task, 1200*1000, 24*3600*1000);
	}

}
