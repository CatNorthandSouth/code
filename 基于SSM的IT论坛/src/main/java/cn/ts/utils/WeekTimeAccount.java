package cn.ts.utils;

import java.util.Calendar;
import java.util.List;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cn.ts.entity.BsNiuren;
import cn.ts.entity.BsNiurenNow;
import cn.ts.service.BsNiurenNowService;
import cn.ts.service.BsNiurenService;
@Controller
public class WeekTimeAccount extends TimerTask {

	@Autowired
	BsNiurenNowService BsNiurenNowService;
	@Autowired
	BsNiurenService BsNiurenService;

	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		Calendar cal=Calendar.getInstance();
		int day_of_week=cal.get(Calendar.DAY_OF_WEEK);
		if (day_of_week == 1) {
			System.out.println("周任务执行");
			List<BsNiurenNow> listniurennow=BsNiurenNowService.selectAllNiuRen();
			
			//BsNiuren bsNiuren=new BsNiuren();
			BsNiurenNow bsNiurenNow1=new BsNiurenNow();
			for (BsNiurenNow bsNiurenNow : listniurennow) {
				BsNiuren bsNiuren=BsNiurenService.selectByUser_id(bsNiurenNow.getUserId());
				bsNiuren.setNiurenWeekScore(bsNiurenNow.getNiurenWeekScore());
				bsNiuren.setNiurenId(bsNiurenNow.getNiurenId());
				BsNiurenService.updateByPrimaryKey(bsNiuren);
				bsNiurenNow1.setNiurenWeekScore(0);
				bsNiurenNow1.setNiurenMonthScore(bsNiurenNow.getNiurenMonthScore()+bsNiurenNow.getNiurenWeekScore());
				bsNiurenNow1.setNiurenYearScore(bsNiurenNow.getNiurenYearScore());
				bsNiurenNow1.setUserId(bsNiurenNow.getUserId());
				bsNiurenNow1.setNiurenAdmin(bsNiurenNow.getNiurenAdmin());
				bsNiurenNow1.setNiurenPhoto(bsNiurenNow.getNiurenPhoto());
				BsNiurenNowService.updateByPrimaryKey(bsNiurenNow1);
			}	
		}
	}

}
