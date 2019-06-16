package cn.ts.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsBigboard;
import cn.ts.entity.BsFilterWord;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsUser;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsFilterWordService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsUserService;

@Controller
public class WritePostsController {

	@Autowired
	BsPostsService BsPostsService;
	@Autowired
	BsBigboardService BsBigboardService;
	@Autowired
	BsSmallboardService BsSmallboardService;
	@Autowired
	BsUserService bsUserService;
	@Autowired
	BsFilterWordService BsFilterWordService;
	
	@RequestMapping("selectdownsmallboard")
	@ResponseBody
	public Object selectdownsmallboard(){
		 List<BsSmallboard> list=BsSmallboardService.selectAll();
		// System.out.println("......");
		 return list;
	}
	
	
	@RequestMapping("togoWritePosts")
	public String togoWritePosts(Model model){
		BsUser bsUser=bsUserService.selectByPrimaryKey(1);
		model.addAttribute("bsUser", bsUser);
		return "writePosts";
	} 
	public String filterWord(String text){
		String str=new String();
		List<BsFilterWord> list = BsFilterWordService.selectByExample();
		if (list.size() > 0) {
			String strFilter=list.get(list.size()-1).getWord();
			String[] strRules = strFilter.split(" ");
			System.out.println(strFilter);
			for (String string : strRules) {
				System.out.println(string);
			}
			for (String rule : strRules) {
				boolean flag = text.contains(rule);
				if (flag == true) {
					str="";
					for (int i = 0; i < rule.length(); i++) {
						str=str+"*";
					}
					//System.out.println(rule);
					String t=text.replace(rule, str);
					text=t;
					//System.out.println("拦截"+t);
					//System.out.println(text);
				} 
			}
		}
		return text;
	}
	
	
	@RequestMapping("insertPost")
	public String insertPost(BsPosts bsPosts,BsUser bsUser,HttpServletRequest request){
		System.out.println(bsPosts);
		int sesionid=(int) request.getSession().getAttribute("sessionUserId");
		BsUser bsUser1=bsUserService.selectByPrimaryKey(sesionid);
		bsPosts.setPostAdmin(bsUser1.getUserName());
		bsPosts.setPostAdminId(sesionid);
		 /*int a=bsUser1.getUserAllmarks()-bsPosts.getPostScore();*/
		//System.out.println(a);
		bsPosts.setPostBadCount(0);
		bsPosts.setPostGoodCount(0);
		bsPosts.setPostTitle(filterWord(bsPosts.getPostTitle()));
		bsPosts.setPostContent(filterWord(bsPosts.getPostContent()));
		bsPosts.setPostIslocked(0);
		bsPosts.setPostIspay(0);
	/*	DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ss=df.format(new Date());*/
		bsPosts.setPostCreateTime(new Date());
		bsPosts.setPostUpdateTime(new Date());
		bsPosts.setPostReward(0);
		BsPostsService.insertPosts(bsPosts);
		return "redirect:togoWritePosts";
	}
	
	@RequestMapping("selectBigboard")
	@ResponseBody
	public Object selectBigboard(){
		List<BsBigboard> bsBigboard=BsBigboardService.selectBsBigboard();
		/*for (BsBigboard bsBigboard2 : bsBigboard) {
			System.out.println(bsBigboard2);
		}*/
		return bsBigboard;
	}
	
	@RequestMapping("selectBsSmallboard")
	@ResponseBody
	public Object selectBsSmallboard(@Param("parentVal") Integer parentVal){
		
		List<BsSmallboard> list=BsSmallboardService.selectBsSmallboardByKey(parentVal);
		/*for (BsSmallboard bsBigboard2 : list) {
			System.out.println(bsBigboard2);
		}*/
		return list;
	}
}
