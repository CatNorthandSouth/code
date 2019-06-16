package cn.ts.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsPosts;
import cn.ts.entity.BsTribuneNotice;
import cn.ts.mapper.BsPostsMapper;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsTribuneNoticeService;

@Controller
public class BsTribuneNoticeController {

	@Autowired
	BsTribuneNoticeService BsTribuneNoticeService;
	@Autowired
	BsPostsService BsPostsService;
	@RequestMapping("selectBsTribuneNotice")
	@ResponseBody
	public Object selectBsTribuneNotice(){
		List<BsTribuneNotice> TribuneNoticeList=BsTribuneNoticeService.selectBsTribuneNotice();
		List<BsPosts> NoticePostsList=new ArrayList<>();
		for (BsTribuneNotice bsTribuneNotice : TribuneNoticeList) {
			BsPosts bsPosts=BsPostsService.selectPostsByNotice(bsTribuneNotice.getTribunePostId());
			NoticePostsList.add(bsPosts);
		}
		System.out.println("主页获取公告数据"+NoticePostsList.toString());
		return NoticePostsList;
	}
	
}
