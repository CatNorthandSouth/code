package cn.ts.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.sun.corba.se.internal.Interceptors.PIORB;

import cn.ts.entity.BsBigboard;
import cn.ts.entity.BsFans;
import cn.ts.entity.BsNiuren;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsUser;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsFansService;
import cn.ts.service.BsNiurenService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;
@Controller
public class NiuRenpPaiHangController {
	@Autowired
	BsPostsService BsPostsService;
	@Autowired
	BsUserService bsUserService;
	@Autowired
	BsNiurenService bsNiurenService;
	@Autowired
	BsFansService bsFansService;
	Timer timer;
	@RequestMapping("findniuren")
	public String findniuren(){
		return "tribuneniuren";
	}
	
	@RequestMapping("selectNiuRenHotPost")
	@ResponseBody
	public Object selectHotPost(Model model){
		List<BsPosts> list=BsPostsService.selectPosts();
		//model.addAttribute("hotPostList", list);
		System.out.println("......"+list);
/*		List<BsUser> list1=bsUserService.selectAll();
		for (BsUser bsUser : list1) {
			BsNiuren bsNiuren=new BsNiuren();
			bsNiuren.setNiurenAdmin(bsUser.getUserName());
			bsNiuren.setUserId(bsUser.getUserId());
			bsNiuren.setNiurenPhoto(bsUser.getUserPhoto());
			bsNiurenService.insertNiuRen(bsNiuren);
		}*/
		return list;
	}
	@RequestMapping("selectNiuRenWeekScore")
	@ResponseBody
	public Object selectNiuRenWeekScore(Model model){
		List<BsNiuren> list=bsNiurenService.selectByWeekScore();
		System.out.println(list);
		return list;
	}	
	@RequestMapping("selectNiuRenMonthScore")
	@ResponseBody
	public Object selectNiuRenMonthScore(Model model){
		List<BsNiuren> list=bsNiurenService.selectByMonthScore();
		return list;
	}
	@RequestMapping("selectNiuRenYearScore")
	@ResponseBody
	public Object selectNiuRenYearScore(Model model){
		List<BsNiuren> list=bsNiurenService.selectByYearScore();
		return list;
	}
	@RequestMapping("insertMyfans")
	@ResponseBody 
	public Object insertMyfans(@Param("myFansId") String myFansId,@Param("photoSrc") String photoSrc,@Param("nickName") String nickName, HttpServletRequest request){
		int myfansid=Integer.parseInt(myFansId);
		System.out.println(".....myFansId"+myFansId);
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		BsFans bsFans=new BsFans();
		bsFans.setMyFansAdmin(nickName);
		bsFans.setMyFansId(myfansid);
		bsFans.setMyFansPhoto(photoSrc);
		bsFans.setUserId(userid);
		if (myfansid == userid) {
			
		} else {
			BsFans bsFans1=bsFansService.selectByUserIdAndMyFansId(bsFans);
			if (bsFans1 == null) {
				bsFansService.insertBsFans(bsFans);
			} else {

			}		
		}
		System.out.println(bsFans.getMyFansId()+"..."+bsFans.getUserId());
		return true;
	}
	
	@RequestMapping("insertAllMyfans")
	@ResponseBody 
	public Object insertAllMyfans(@Param("initi") String initi,@Param("data") String data, HttpServletRequest request){	
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		int starti=Integer.parseInt(initi);
		JSONArray jsonArray=new JSONArray(data);
		
		for (int i = starti; i < starti+5; i++) {
			BsFans bsFans=new BsFans();
			bsFans.setMyFansAdmin(jsonArray.getJSONObject(i).get("niurenAdmin").toString());
			bsFans.setMyFansId(Integer.parseInt(jsonArray.getJSONObject(i).get("userId").toString()));
			bsFans.setMyFansPhoto(jsonArray.getJSONObject(i).get("niurenPhoto").toString());
			bsFans.setUserId(userid);
			BsFans bsFans1= bsFansService.selectByUserIdAndMyFansId(bsFans);
			if (bsFans1 == null) {
				if (userid != bsFans.getMyFansId()) {
					bsFansService.insertBsFans(bsFans);
				}
				
			} else {
				
			}
		}
		System.out.println(jsonArray);
		System.out.println(jsonArray.getJSONObject(0).get("niurenAdmin"));
		
		return true;
	}	
	

	
	
	
}
