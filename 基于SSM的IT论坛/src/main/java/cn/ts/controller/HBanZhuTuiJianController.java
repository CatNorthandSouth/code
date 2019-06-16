package cn.ts.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsPostCommend;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.service.BsPostCommendService;
import cn.ts.service.BsPostsService;
import cn.ts.utils.PageUtils;

@Controller
public class HBanZhuTuiJianController {

	
	@Autowired
	BsPostsService BsPostsService;
	@Autowired
	BsPostCommendService BsPostCommendService;
	
	@RequestMapping("banzhutuijian")
	public String banZhuTuiJian(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "banzhutuijian";
	}
	@RequestMapping("HdeletePostCommondList")
	@ResponseBody
	public void HdeletePostCommondList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		for (String string : str) {
			//System.out.println(string);
			BsPostCommend bsPostCommend=BsPostCommendService.selectBypocoPostId(Integer.parseInt(string));
			System.out.println("版主推荐多条删除。。。。"+bsPostCommend);
			BsPostCommendService.deleteByPrimaryKey(bsPostCommend.getPocoId());
		}
		//System.out.println(postId);
	}
	@RequestMapping("HinsertPostCommond")
	@ResponseBody
	public Object HinsertPostCommond(@Param("title") String title,HttpServletRequest request){
		System.out.println("版主推荐添加成功。。。"+title);
		BsPostCommend bsPostCommend=BsPostCommendService.selectBypocoPostId(Integer.parseInt(title));
		if (bsPostCommend == null) {
			BsPosts bsPosts= BsPostsService.selectPostsByPostId(Integer.parseInt(title));
			if (bsPosts != null && bsPosts.getPostSmboId() != 0 &&bsPosts.getPostBiboId() != 0) {
				BsPostCommend bsPostCommend2=new BsPostCommend();
				bsPostCommend2.setPocoCommendReason("...");
				bsPostCommend2.setPocoCommendTime(new Date());
				bsPostCommend2.setPocoCommendType(1);
				bsPostCommend2.setPocoPostId(Integer.parseInt(title));
				BsPostCommendService.insert(bsPostCommend2);
				System.out.println("版主推荐添加成功。。。");
				return true;
			} else {
				return false;
			}
			
		} else {
			return false;
		}
	}
	
	@RequestMapping("HdeletePostCommond")
	@ResponseBody
	public void HdeletePostCommond(@Param("postId") String postId){
		
		BsPostCommend bsPostCommend=BsPostCommendService.selectBypocoPostId(Integer.parseInt(postId));
		System.out.println("版主推荐删除。。。。"+bsPostCommend);
		BsPostCommendService.deleteByPrimaryKey(bsPostCommend.getPocoId());
	}
	
	@RequestMapping("HfindPostCommond")
	@ResponseBody
	public Object HfindPostCommond(@Param("postId") String postId) throws ParseException{
		String str1= postId.replace("and", "!").trim();
		String[] str3=str1.split("!");
		System.out.println(str3.length);
		String[] str=new String[3];
		String str2=new String();
		int flag=0;
		if (str3.length == 1) {
			str2=str1.replace("!", "");
			
			flag=1;
		} else {
			flag=2;
			str=str1.split("!");
		}
		
		System.out.println(str1+str1.length()+str.length);
		
		BsPosts bs=new BsPosts();

		List<BsPosts> list=new ArrayList<>();
		if (str.length == 3 && flag == 2) {
			System.out.println("1");
			bs.setPostTitle(str[2]);
			bs.setPostCreateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]));
			bs.setPostUpdateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[1]));
			list=BsPostsService.findHpost(bs);
		} else if(str.length == 2 && flag == 2){
			System.out.println("2");
			bs.setPostCreateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]));
			bs.setPostUpdateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[1]));
			list=BsPostsService.findHpost1(bs);
		}else if(flag == 1){
			System.out.println("3");
			bs.setPostTitle(str2);
			list=BsPostsService.findHpost2(bs);
		}else{
			return null;
		}
		List<BsPosts> list2=new ArrayList<>();
		for (BsPosts bsPosts : list) {
			BsPostCommend bsPostCommend= BsPostCommendService.selectBypocoPostId(bsPosts.getPostId());
			if (bsPostCommend == null) {
				
			} else {
				list2.add(bsPosts);
			}
		}
		
		PageUtils<BsPosts> pageUtils=new PageUtils<>();
		pageUtils.setList(list2);
		pageUtils.setPageSize(7);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list2.size());
		if (list2.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list2.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list2.size()/pageUtils.getPageSize()+1);
		}	
		System.out.println(" 版主推荐搜索       "+pageUtils.toString());
		return pageUtils;
	}	
	
	
	@RequestMapping("HselectPostCommendList")
	@ResponseBody
	public Object selectPostCommendList(Model model){
		
		//System.out.println("pageid:"+numberId);
		List<BsPosts> list=new ArrayList<>();	
		//model.addAttribute("hotPostList", list);
		PageUtils<BsPosts> pageUtils=new PageUtils<>();
		list=BsPostsService.selectPostsbyCommend();
		pageUtils.setList(list);
			
		pageUtils.setPageSize(7);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		
		//System.out.println(pageUtils);
		System.out.println("后台版主推荐数据"+pageUtils.getList()+"..");
		return pageUtils;
	}
	
}
