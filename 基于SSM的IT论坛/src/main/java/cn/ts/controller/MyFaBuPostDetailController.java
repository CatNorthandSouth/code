package cn.ts.controller;

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

import cn.ts.entity.BsBigboard;
import cn.ts.entity.BsNiurenNow;
import cn.ts.entity.BsPostCollect;
import cn.ts.entity.BsPostReply;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsUser;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsNiurenNowService;
import cn.ts.service.BsPostCollectService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsPostZanService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsReplyZanService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;

@Controller
public class MyFaBuPostDetailController {
	@Autowired
	BsPostsService bsPostsService;
	@Autowired
	BsUserService BsUserService;
	@Autowired
	BsPostReplyService BsPostReplyService;
	@Autowired
	BsPostCollectService BsPostCollectService;
	@Autowired
	BsBigboardService BsBigboardService;
	@Autowired
	BsSmallboardService BsSmallboardService;
	@Autowired
	BsPostZanService BsPostZanService;
	@Autowired
	BsReplyZanService BsReplyZanService;
	@Autowired
	BsNiurenNowService BsNiurenNowService;
	
	@RequestMapping("shifoujietiestate")
	@ResponseBody
	public Object shifoujietiestate(HttpServletRequest request){
		System.out.println("我发布的帖子状态。。。。");
		int postId=(int) request.getSession().getAttribute("sessionPostDetailsId");
		BsPosts bsPosts= bsPostsService.selectPostsByPostId(postId);
		if (bsPosts.getPostIspay() == 1) {
			
			return "1";
		} else {
			
			return "0";
		}
	}
	
	@RequestMapping("togoMyFaBuPost")
	public String togoMyFaBuPost(HttpServletRequest request,Model model){
		System.out.println("我发布的帖子详情。。。。");
		int postId=Integer.parseInt(request.getParameter("id"));
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		
		
		BsPosts bsPosts = bsPostsService.selectPostsByPostId(postId);
		BsUser bsUser=BsUserService.selectByUserName(bsPosts.getPostAdmin());
		BsBigboard bsBigboard=BsBigboardService.selectBsBigboardByKey(bsPosts.getPostBiboId());
		BsSmallboard bsSmallboard= BsSmallboardService.selectsmboIdByKey(bsPosts.getPostSmboId());
		List<BsPostReply> list=BsPostReplyService.selectBsPostReplyByreplyPostId(postId);
		model.addAttribute("bsPosts", bsPosts);
		model.addAttribute("louzhubsUser", bsUser);
		model.addAttribute("huifushu", list.size());
	

		request.getSession().setAttribute("sessionPostDetailsId", postId);
		
		return "MyFaBuPostDetail";
	}
	@RequestMapping("selectMyFaBuReplyList")
	@ResponseBody
	public Object selectMyFaBuReplyList(HttpServletRequest request){
		System.out.println("我发布的帖子详情回复列表。。。。");
		int postId=(int) request.getSession().getAttribute("sessionPostDetailsId");
		List<BsPostReply> BsPostReplyList= BsPostReplyService.selectBsPostReplyByreplyPostId(postId);
		List<BsUser> BsUserList = new ArrayList<>();
		int i=0;
 		for (BsPostReply bsPostReply : BsPostReplyList) {
			BsUser bsUser=BsUserService.selectByReplyAdmin(bsPostReply.getReplyAdmin());
			BsUserList.add(i, bsUser);
			i++;
		}
 		List<Object> list=new ArrayList<>();
 		list.add(BsPostReplyList);
 		list.add(BsUserList);
		PageUtils<Object> pageUtils=new PageUtils<>();
		pageUtils.setList(list);	
		pageUtils.setPageSize(3);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(BsPostReplyList.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(BsPostReplyList.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(BsPostReplyList.size()/pageUtils.getPageSize()+1);
		}
		
		//System.out.println(pageUtils);
		//System.out.println(pageUtils);
		return pageUtils; 		
	}
	
	
	@RequestMapping("shifoujietie")
	@ResponseBody
	public Object shifoujietie(HttpServletRequest request,@Param("flag") String flag,@Param("postContent") String postContent,@Param("userName") String userName,@Param("postId") String postId){
		System.out.println("我发布的帖子是否结贴。。。。");
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		BsPosts bsPosts=new BsPosts();
		bsPosts.setPostId(Integer.parseInt(postId));
		if (flag.equals("2")) {
			bsPosts.setPostIspay(0);
			bsPostsService.updateByPrimaryKeySelective(bsPosts);
			
		} else if(flag.equals("1")){
			bsPosts.setPostIspay(1);
			bsPostsService.updateByPrimaryKeySelective(bsPosts);
		}
		
		return "success";
	}
	@RequestMapping("updateMyReplyScore")
	@ResponseBody
	public Object updateMyReplyScore(@Param("postid") String postid,@Param("userid") String userid,@Param("score") String score,@Param("replyid") String replyid){
		System.out.println("我发布的帖子评分");
		BsPostReply bsPostReply=BsPostReplyService.selectreplyId(Integer.parseInt(replyid));
		if (bsPostReply.getReplyScore() > 0) {
			bsPostReply.setReplyScore(bsPostReply.getReplyScore()+Integer.parseInt(score));
		} else {
			bsPostReply.setReplyScore(Integer.parseInt(score));
		}
		BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
		BsPosts bsPosts=bsPostsService.selectPostsByPostId(Integer.parseInt(postid));
		bsPosts.setPostScore(bsPosts.getPostScore()-Integer.parseInt(score));
		bsPostsService.updateByPrimaryKeySelective(bsPosts);
		BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
		BsUser bsUser=BsUserService.selectByPrimaryKey(Integer.parseInt(userid));
		bsUser.setUserAllmarks(bsUser.getUserAllmarks()+Integer.parseInt(score));
		BsNiurenNow bsNiurenNow=BsNiurenNowService.selectByUser_id(bsUser.getUserId());
		bsNiurenNow.setNiurenWeekScore(bsNiurenNow.getNiurenWeekScore()+Integer.parseInt(score));
		BsNiurenNowService.updateByPrimaryKey(bsNiurenNow);
		BsUserService.updateByPrimaryKeySelective(bsUser);
		return true;
	}
	@RequestMapping("deleteMyFaBuPost")
	@ResponseBody
	public Object deleteMyFaBuPost(@Param("postid") String postid){
		System.out.println("我发布的帖子删除postid");
		bsPostsService.deleteByPrimaryKey(Integer.parseInt(postid));
		BsPostReplyService.deleteByreplyPostId(Integer.parseInt(postid));
		return true;
	}
	
}
