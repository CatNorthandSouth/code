package cn.ts.utils;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
@Controller
public class YearTimeListener implements ServletContextListener {

	private Timer timer=null;
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		if (timer != null) {
			timer.cancel();
			event.getServletContext().log("Year定时器取消");
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		ApplicationContext context = ApplicationContextUtil.getApplicationContext();
		TimerTask task = (TimerTask)context.getBean(YearTimeAccount.class);
		timer=new Timer(true);
		event.getServletContext().log("Year定时器启动");
		timer.scheduleAtFixedRate(task, 0, 24*3600*1000);
	}

}
