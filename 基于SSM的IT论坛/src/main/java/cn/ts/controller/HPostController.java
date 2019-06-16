package cn.ts.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.TTCCLayout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsBigboard;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsUser;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;

@Controller
public class HPostController {

	@Autowired
	BsUserService bsUserService;
	@Autowired
	BsPostsService bsPostsService;
	@Autowired
	BsSmallboardService BsSmallboardService;
	@Autowired
	BsBigboardService BsBigboardService;
	@Autowired
	BsPostReplyService BsPostReplyService;
	@RequestMapping("questionlist")
	public String  adminlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "question-list";
	}
	
    @RequestMapping("Hfindboard")
    @ResponseBody
    public Object Hfindboard() {
		// TODO Auto-generated method stub
    	List<BsBigboard> listBig=BsBigboardService.selectBsBigboard();
    	List<Object> list1=new ArrayList<>();
    	List<Object> list2=new ArrayList<>();
    	int i=0;
    	for (BsBigboard bsbig : listBig) {
			List<BsSmallboard> listsmall=BsSmallboardService.selectBsSmallboardByKey(bsbig.getBiboId());
			list1.add(i, listsmall);
			i++;
		}
    	list2.add(listBig);
    	list2.add(list1);
    	return list2;
	}
	@RequestMapping("HinsertPost")
	@ResponseBody
	public String HinsertPost(HttpServletRequest request,@Param("title") String title,@Param("content") String content,@Param("typeid") String typeid){
		BsPosts bsPosts=new BsPosts();
		System.out.println(typeid);
		System.out.println(content);
		System.out.println(title);
		int sesionid=(int) request.getSession().getAttribute("sessionUserId");
		BsUser bsUser1=bsUserService.selectByPrimaryKey(sesionid);
		BsSmallboard bsSmallboard=BsSmallboardService.selectsmboIdByKey(Integer.parseInt(typeid));
		bsPosts.setPostBiboId(bsSmallboard.getSmboBiboId());
		bsPosts.setPostSmboId(bsSmallboard.getSmboId());
		bsPosts.setPostUpdateTime(new Date());
		bsPosts.setPostAdmin(bsUser1.getUserName());
		bsPosts.setPostAdminId(sesionid);
		bsPosts.setPostBadCount(0);
		bsPosts.setPostGoodCount(0);
		bsPosts.setPostCreateTime(new Date());
		bsPosts.setPostScore(10);
		bsPosts.setPostIslocked(0);
		bsPosts.setPostIspay(0);
		bsPosts.setPostReward(0);
		bsPosts.setPostUpdateTime(new Date());
		bsPosts.setPostContent(content);
		bsPosts.setPostTitle(title);
		System.out.println(bsSmallboard);
		bsPostsService.insertPosts(bsPosts);
		return null;
	}
	@RequestMapping("HupdatePost")
	@ResponseBody
	public String insertPost(@Param("id") String id,@Param("title") String title,@Param("content") String content,@Param("typeid") String typeid){
		BsPosts bsPosts=new BsPosts();System.out.println(typeid);
		BsSmallboard bsSmallboard=BsSmallboardService.selectsmboIdByKey(Integer.parseInt(typeid));
		bsPosts.setPostBiboId(bsSmallboard.getSmboBiboId());
		bsPosts.setPostSmboId(bsSmallboard.getSmboId());
		bsPosts.setPostUpdateTime(new Date());
		bsPosts.setPostId(Integer.parseInt(id));
		bsPosts.setPostContent(content);
		bsPosts.setPostTitle(title);
		System.out.println(bsSmallboard);
		bsPostsService.updateByPrimaryKeySelective(bsPosts);
		return null;
	}
    
	@RequestMapping("HfindPost")
	@ResponseBody
	public Object HfindPost(@Param("postId") String postId) throws ParseException{
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
			list=bsPostsService.findHpost(bs);
		} else if(str.length == 2 && flag == 2){
			System.out.println("2");
			bs.setPostCreateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]));
			bs.setPostUpdateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[1]));
			list=bsPostsService.findHpost1(bs);
		}else if(flag == 1){
			System.out.println("3");
			bs.setPostTitle(str2);
			list=bsPostsService.findHpost2(bs);
		}else{
			return null;
		}
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	
	@RequestMapping("HdeletePostList")
	@ResponseBody
	public void HdeletePostList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		for (String string : str) {
			System.out.println("您正在删除ID："+string+"帖子");
			bsPostsService.deleteByPrimaryKey(Integer.parseInt(string));
			BsPostReplyService.deleteByreplyPostId(Integer.parseInt(string));
		}
		System.out.println(postId);
	}
	@RequestMapping("HdeletePost")
	@ResponseBody
	public void HdeletePost(@Param("postId") String postId){
		System.out.println("您正在删除ID："+postId+"帖子");
		bsPostsService.deleteByPrimaryKey(Integer.parseInt(postId));
		BsPostReplyService.deleteByreplyPostId(Integer.parseInt(postId));
		
	}
	@RequestMapping("HselectPostList")
	@ResponseBody
	public Object HselectPostList() {
		List<BsPosts> list= bsPostsService.selectPosts();
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	public PageUtils<Object> returnpage(List<BsPosts> list) {
		List<String> listboard=new ArrayList<>();
		int i=0;
		List<Integer> listflag=new ArrayList<>();
		for (BsPosts bs : list) {
			if (bs.getPostBiboId() == 0 && bs.getPostSmboId() == 0) {
				listflag.add(i);
				System.out.println("------------");
			} 
			i++;
		}
		for (Integer index : listflag) {
			System.out.println(list.remove(index));
			System.out.println("------------"+listflag);
		}
		System.out.println(list);
		i=0;
		for (BsPosts bs : list) {

			String str= (BsSmallboardService.selectsmboIdByKey(bs.getPostSmboId())).getSmboTitle();
			listboard.add(i, str);
			i++;
		}
		List<Object> listSUM=new ArrayList<>();
		listSUM.add(list);
		listSUM.add(listboard);
		PageUtils<Object> pageUtils=new PageUtils<>();
		pageUtils.setList(listSUM);
		pageUtils.setPageSize(7);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}		
		System.out.println(".."+pageUtils.toString());
		return pageUtils;
	}
}
