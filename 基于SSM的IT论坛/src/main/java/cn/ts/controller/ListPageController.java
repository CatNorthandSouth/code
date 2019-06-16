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
import cn.ts.service.BsPostsService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;
@Controller
public class ListPageController {

	@Autowired
	BsPostsService BsPostsService;
	@Autowired
	BsUserService bsUserService;
	
	String numberId;
	@RequestMapping("togoHotPostList")
	public String togoHotPostList(HttpServletRequest request,Model model){
		String pageid=request.getParameter("pageid");
		numberId=pageid;
		String pagename1;
		String pagename2;
		if (pageid.equals("1")) {
			pagename1="apache论坛";
			pagename2="热帖·技术区";
			
		} else {
			pagename1="apache论坛";
			pagename2="版主推荐·技术区";
		}
		model.addAttribute("pagename1", pagename1);
		model.addAttribute("pagename2", pagename2);
		//System.out.println(pagename2);
		return "listPage";
	}
	@RequestMapping("selectHotPostList")
	@ResponseBody
	public Object selectHotPostList(Model model){
		
		//System.out.println("pageid:"+numberId);
		List<BsPosts> list=new ArrayList<>();	
		//model.addAttribute("hotPostList", list);
		PageUtils<BsPosts> pageUtils=new PageUtils<>();
		if (numberId.equals("1")) {
			list=BsPostsService.selectPosts();
			pageUtils.setList(list);
		} else {
			list=BsPostsService.selectPostsbyCommend();
			pageUtils.setList(list);
		}	
		pageUtils.setPageSize(8);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		
		//System.out.println(pageUtils);
		System.out.println(pageUtils.getList());
		return pageUtils;
	}
	@RequestMapping("selectPostCommend")
	@ResponseBody
	public Object selectPostCommend(Model model){
		
		//System.out.println("pageid:"+numberId);
		List<BsPosts> list=new ArrayList<>();	
		//model.addAttribute("hotPostList", list);
		PageUtils<BsPosts> pageUtils=new PageUtils<>();
		list=BsPostsService.selectPostsbyCommend();
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
		System.out.println(pageUtils.getList());
		return pageUtils;
	}
}
