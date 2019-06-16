package cn.ts.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.ts.entity.BsBigboard;
import cn.ts.entity.BsLunbo;
import cn.ts.entity.BsPostReply;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsRank;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsUser;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsFileService;
import cn.ts.service.BsLunboService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsRankService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;

@Controller
public class MainPageController {

	String flagid="aa";
	String ttid="1";
	@Autowired
	BsPostsService BsPostsService;
	@Autowired
	BsUserService bsUserService;
	@Autowired
	BsBigboardService BsBigboardService;
	@Autowired
	BsSmallboardService BsSmallboardService;
	@Autowired
	BsFileService BsFileService;
	@Autowired
	BsLunboService BsLunboService;
	@Autowired
	BsPostReplyService BsPostReplyService;
	@Autowired
	BsRankService BsRankService;
	
	@RequestMapping("selectHotPost")
	@ResponseBody
	public Object selectHotPost(Model model){
		List<BsPosts> list=BsPostsService.selectPosts();
		//model.addAttribute("hotPostList", list);
		//System.out.println(list);
		return list;
	}
	@RequestMapping("findmainpage")
	public String findmainpage(HttpServletRequest request,Model model){
	    int sessionuserid=(int) request.getSession().getAttribute("sessionUserId");
	    if (sessionuserid != 0) {
	    	BsUser bsUser=bsUserService.selectByPrimaryKey(sessionuserid);
	    	HttpSession httpSession=request.getSession();
			httpSession.setAttribute("sessionUserName", bsUser.getUserName());
	    	httpSession.setAttribute("sessionUserId", bsUser.getUserId());
	    	httpSession.setMaxInactiveInterval(3600);
			model.addAttribute("ByUser", bsUser);
			BsRank bsRank= BsRankService.selectByUserId(bsUser.getUserId());
			model.addAttribute("BybsRank",bsRank);
		}
	    
	    
		return "mainpage";
	}
	@RequestMapping("tojingxuanbankuai")
	@ResponseBody
	public void tojingxuanbankuai(@Param("id") String id){
		flagid=id;
		
	}
	@RequestMapping("findFlagId")
	@ResponseBody
	public String jingxuanbankuai(){
		//System.out.println(flagid);
		
		return  JSON.toJSONString(flagid);
	}
	@RequestMapping("initmainTimer")
	@ResponseBody
	public String initmainTimer(){
		//System.out.println(ttid);
		return JSON.toJSONString(ttid);
	}
	@RequestMapping("initTimer")
	@ResponseBody
	public void initTimer(@Param("flagsum") String flagsum){
		ttid=flagsum;
	}
	
	@RequestMapping("selectboardList")
	@ResponseBody
	public Object selectboardList(){
		List<BsBigboard> BigboardList=BsBigboardService.selectBsBigboard();
		List<Object> list=new ArrayList<>();
		List<Object> list1=new ArrayList<>();
		int i=0;
		for (BsBigboard bsBigboard : BigboardList) {
			List<BsSmallboard> SmallboardList=BsSmallboardService.selectBsSmallboardByKey(bsBigboard.getBiboId());
			list1.add(i, SmallboardList);
			i++;
		}
		list.add(BigboardList);
		list.add(list1);
		return list;
	}
	
	@RequestMapping("togosmalltribune")
	public String togosmalltribune(HttpServletRequest request,Model model){
		String strBoard=request.getParameter("id");
		String[] board=strBoard.split("and");
		int bigBoard=Integer.parseInt(board[0]);
		int smallBoard=Integer.parseInt(board[1]);
		BsPosts bsPosts=new BsPosts();
		bsPosts.setPostBiboId(bigBoard);
		bsPosts.setPostBiboId(smallBoard);
		BsSmallboard bsSmallboard=BsSmallboardService.selectsmboIdByKey(smallBoard);
		BsBigboard bsBigboard= BsBigboardService.selectBsBigboardByKey(bigBoard);
		List<BsPosts> zeroList= BsPostsService.selectPostsByBoardzero(bsPosts);
		model.addAttribute("zeroList", zeroList);
		model.addAttribute("bsSmallboard", bsSmallboard);
		model.addAttribute("bsBigboard", bsBigboard);
		return "bankuaiListPage";
	}
	@RequestMapping("selectSmallTribune")
	@ResponseBody
	public Object selectSmallTribune(HttpServletRequest request,@Param("smallboard") String smallboard){
		
		BsPosts bsPosts=new BsPosts();
		bsPosts.setPostSmboId(Integer.parseInt(smallboard));
		List<BsPosts> zeroList= BsPostsService.selectPostsByBoardzero(bsPosts);
	
		PageUtils<BsPosts> pageUtils=new PageUtils<>();	
		pageUtils.setList(zeroList);
		pageUtils.setPageSize(8);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(zeroList.size());
		if (zeroList.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(zeroList.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(zeroList.size()/pageUtils.getPageSize()+1);
		}
		System.out.println(pageUtils);
		return  pageUtils;
	}
	@RequestMapping("searchMainList1")
	@ResponseBody
	public void searchMainList1(@Param("content") String content,HttpServletRequest request){
		request.getSession().setAttribute("searchconent", content);
	}
	@RequestMapping("searchMainList")
	@ResponseBody
	public Object searchMainList(HttpServletRequest request){
		BsPosts bsPosts=new BsPosts();
		flagid="1";
		//System.out.println(content+"......");
		//request.getSession().setAttribute("searchconent", "hello");
		String str=(String) request.getSession().getAttribute("searchconent");
		bsPosts.setPostAdmin(str);
		bsPosts.setPostContent(str);
		bsPosts.setPostTitle(str);
		List<BsPosts> list=BsPostsService.selectSearchPosts(bsPosts);
	
		PageUtils<BsPosts> pageUtils=new PageUtils<>();	
		pageUtils.setList(list);
		pageUtils.setPageSize(8);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		System.out.println(pageUtils);
		return  pageUtils;		

	}
	@RequestMapping("goSearchList")
	public String goSearchList(){
		return "searchList";
	}
	
	@RequestMapping("getreplysum")
	@ResponseBody
	public Object getreplysum(@Param("id") String id){
		List<BsPostReply> list= BsPostReplyService.selectBsPostReplyByreplyPostId(Integer.parseInt(id));
		System.out.println("获取热帖恢复总数"+list.size());
		return list.size();
	}
	
	@RequestMapping("selectlunbo")
	@ResponseBody
	public Object selectlunbo(){
		List<BsLunbo> list=BsLunboService.selectAll();
		List<BsLunbo> list1=new ArrayList<>();
		int i=0;
		for (BsLunbo bsLunbo : list) {
			if (bsLunbo.getLunboState() == 1) {
				list1.add(bsLunbo);
				i++;
				if (i == 6) {
					break;
				}
			}
			
		}
		return list1;
	}
	
}
