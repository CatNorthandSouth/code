package cn.ts.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsPosts;
import cn.ts.entity.BsUser;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;
@Controller
public class MyPostController {

	@Autowired
	BsPostsService BsPostsService;
	@Autowired
	BsUserService bsUserService;
	
	String numberId;
	@RequestMapping("togoMyfabu")
	public String togoMyPost(HttpServletRequest request,Model model){
/*		String pageid=request.getParameter("pageid");
		numberId=pageid;
		String pagename1;
		String pagename2;
		if (pageid.equals("1")) {
			pagename1="apache论坛";
			pagename2="我发布的";
			
		} else {
			pagename1="apache论坛";
			pagename2="我发布的";
		}
		model.addAttribute("pagename1", pagename1);
		model.addAttribute("pagename2", pagename2);*/
		System.out.println("请求我的发布网页。。。");
		return "mypost";
	}
	@RequestMapping("selectMyPostList")
	@ResponseBody
	public Object selectMyPostList(Model model,HttpServletRequest request){
		
		//System.out.println("pageid:"+numberId);
		List<BsPosts> list=new ArrayList<>();	
		//model.addAttribute("hotPostList", list);
		PageUtils<BsPosts> pageUtils=new PageUtils<>();
		
			int sesionid= (int) request.getSession().getAttribute("sessionUserId");
			BsPosts bsPosts=new BsPosts();
			bsPosts.setPostAdminId(sesionid);
			list=BsPostsService.selectMyFaBu(bsPosts);
			pageUtils.setList(list);
			
		pageUtils.setPageSize(8);
		pageUtils.setPageIndex(1);
		
		pageUtils.setPageCount(list.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		
		//System.out.println(pageUtils);
		System.out.println("请求我的发布网页数据。。。");
		System.out.println(pageUtils.getList());
		return pageUtils;
	}
}
