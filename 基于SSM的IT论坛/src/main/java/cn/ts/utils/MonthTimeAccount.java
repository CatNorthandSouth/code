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
public class MonthTimeAccount extends TimerTask {

	@Autowired
	BsNiurenNowService BsNiurenNowService;
	@Autowired
	BsNiurenService BsNiurenService;
	@Override
	public void run() {
		// TODO Auto-generated method stub
		Calendar cal=Calendar.getInstance();
		int day_of_month=cal.get(Calendar.DAY_OF_MONTH);
		if (day_of_month == 1) {
			System.out.println("执行月任务开始");
			List<BsNiurenNow> listniurennow= BsNiurenNowService.selectAllNiuRen();
			//BsNiuren bsNiuren=new BsNiuren();
			BsNiurenNow bsNiurenNow1=new BsNiurenNow();
			for (BsNiurenNow bsNiurenNow : listniurennow) {
				BsNiuren bsNiuren=BsNiurenService.selectByUser_id(bsNiurenNow.getUserId());
				bsNiuren.setNiurenMonthScore(bsNiurenNow.getNiurenMonthScore());
				bsNiuren.setNiurenId(bsNiurenNow.getNiurenId());
				BsNiurenService.updateByPrimaryKey(bsNiuren);
				bsNiurenNow1.setNiurenMonthScore(0);
				bsNiurenNow1.setNiurenYearScore(bsNiurenNow.getNiurenMonthScore()+bsNiurenNow.getNiurenYearScore());
				bsNiurenNow1.setUserId(bsNiurenNow.getUserId());
				bsNiurenNow1.setNiurenWeekScore(bsNiurenNow.getNiurenWeekScore());
				bsNiurenNow1.setNiurenAdmin(bsNiurenNow.getNiurenAdmin());
				bsNiurenNow1.setNiurenPhoto(bsNiurenNow.getNiurenPhoto());
				BsNiurenNowService.updateByPrimaryKey(bsNiurenNow1);
			}
			System.out.println("执行月任务结束");
		}
		

	}

}
