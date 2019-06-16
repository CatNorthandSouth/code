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
public class YearTimeAccount extends TimerTask {

	@Autowired
	BsNiurenNowService BsNiurenNowService;
	@Autowired
	BsNiurenService BsNiurenService;
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		//BsNiuren bsNiuren=new BsNiuren();
		
		Calendar cal=Calendar.getInstance();
		int day_of_year=cal.get(Calendar.DAY_OF_YEAR);
		if (day_of_year == 1) {
			System.out.println("执行年任务开始");
			List<BsNiurenNow> listniurennow= BsNiurenNowService.selectAllNiuRen();
			BsNiurenNow bsNiurenNow1=new BsNiurenNow();
			for (BsNiurenNow bsNiurenNow : listniurennow) {
				BsNiuren bsNiuren=BsNiurenService.selectByUser_id(bsNiurenNow.getUserId());
				bsNiuren.setNiurenYearScore(bsNiurenNow.getNiurenYearScore());
				//bsNiuren.setNiurenId(bsNiurenNow.getNiurenId());
				BsNiurenService.updateByPrimaryKey(bsNiuren);
				bsNiurenNow1.setNiurenYearScore(0);
				bsNiurenNow1.setNiurenMonthScore(bsNiurenNow.getNiurenMonthScore());
				bsNiurenNow1.setNiurenWeekScore(bsNiurenNow.getNiurenWeekScore());
				bsNiurenNow1.setNiurenAdmin(bsNiurenNow.getNiurenAdmin());
				bsNiurenNow1.setNiurenPhoto(bsNiurenNow.getNiurenPhoto());
				bsNiurenNow1.setUserId(bsNiurenNow.getUserId());
				BsNiurenNowService.updateByPrimaryKey(bsNiurenNow1);
			}
			System.out.println("执行年任务结束");
		} 

	}

}
