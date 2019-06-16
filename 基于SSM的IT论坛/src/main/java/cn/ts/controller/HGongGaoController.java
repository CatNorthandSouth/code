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

import cn.ts.entity.BsBigboard;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsTribuneNotice;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsTribuneNoticeService;
import cn.ts.utils.PageUtils;
@Controller
public class HGongGaoController {

	@Autowired
	BsPostsService bsPostsService;
	@Autowired
	BsSmallboardService BsSmallboardService;
	@Autowired
	BsBigboardService BsBigboardService;
	@Autowired
	BsPostReplyService BsPostReplyService;
	@Autowired
	BsTribuneNoticeService BsTribuneNoticeService;
	
	@RequestMapping("gonggaolist")
	public String  adminlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid")+"...");
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "gonggao-list";
	}

	@RequestMapping("HinsertGongGao")
	@ResponseBody
	public Object HinsertPost(HttpServletRequest request,@Param("title") String title,@Param("content") String content,@Param("typeid") String typeid){
		BsPosts bsPosts=new BsPosts();
		System.out.println(typeid);
		System.out.println(content);
		System.out.println(title);
		//BsSmallboard bsSmallboard=BsSmallboardService.selectsmboIdByKey(Integer.parseInt(typeid));
		bsPosts.setPostBiboId(0);
		bsPosts.setPostSmboId(0);
		bsPosts.setPostUpdateTime(new Date());
		bsPosts.setPostAdmin((String) request.getSession().getAttribute("sessionUserName"));
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
	//	System.out.println(bsSmallboard);
		int i1=bsPostsService.insertPosts(bsPosts);
		List<BsPosts> list=bsPostsService.SelectAll();
		BsTribuneNotice bsTribuneNotice=new BsTribuneNotice();
		bsTribuneNotice.setTribunePostId(list.get(list.size()-1).getPostId());
		int i2=BsTribuneNoticeService.insertTribuneNotice(bsTribuneNotice);
		if (i1 > 0 && i2 > 0) {
			System.out.println("添加公告成功");
			return true;
			
		} else {
			System.out.println("添加公告失败");
			return false;
		}
		
	}
	@RequestMapping("HupdateGongGao")
	@ResponseBody
	public Object insertPost(@Param("id") String id,@Param("title") String title,@Param("content") String content,@Param("typeid") String typeid){
		BsPosts bsPosts=new BsPosts();System.out.println(typeid);

		bsPosts.setPostUpdateTime(new Date());
		bsPosts.setPostId(Integer.parseInt(id));
		bsPosts.setPostContent(content);
		bsPosts.setPostTitle(title);
	
		bsPostsService.updateByPrimaryKeySelective(bsPosts);
		return true;
	}
    
	@RequestMapping("HfindGongGao")
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
			list=bsPostsService.findHGongGao(bs);
		} else if(str.length == 2 && flag == 2){
			System.out.println("2");
			bs.setPostCreateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]));
			bs.setPostUpdateTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[1]));
			list=bsPostsService.findHGongGao1(bs);
		}else if(flag == 1){
			System.out.println("3");
			bs.setPostTitle(str2);
			list=bsPostsService.findHGongGao2(bs);
		}else{
			return null;
		}
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	
	@RequestMapping("HdeleteGongGaoList")
	@ResponseBody
	public Object HdeletePostList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		boolean flag=true;
		for (String string : str) {
			System.out.println(string);
			int i1=bsPostsService.deleteByPrimaryKey(Integer.parseInt(string));
			int i2=BsPostReplyService.deleteByreplyPostId(Integer.parseInt(string));
			int i3= BsTribuneNoticeService.deleteTribuneNotice(Integer.parseInt(string));
			if (i1 == 0 || i3 == 0) {
				flag=false;
			}
		}
		
		System.out.println("删除多条公告极其回复");
		return flag;
	}
	@RequestMapping("HdeleteGongGao")
	@ResponseBody
	public Object HdeletePost(@Param("postId") String postId){
		boolean flag=true;
		int i1=bsPostsService.deleteByPrimaryKey(Integer.parseInt(postId));
		int i2=BsPostReplyService.deleteByreplyPostId(Integer.parseInt(postId));
		int i3= BsTribuneNoticeService.deleteTribuneNotice(Integer.parseInt(postId));
		if (i1 == 0 || i3 == 0) {
			flag=false;
		}
		System.out.println("删除公告极其回复");
		return flag;
	}
	@RequestMapping("HselectGongGaoList")
	@ResponseBody
	public Object HselectPostList() {
		List<BsPosts> list= bsPostsService.selectGongGao();
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	public PageUtils<Object> returnpage(List<BsPosts> list) {

	
		List<Object> listSUM=new ArrayList<>();
		listSUM.add(list);
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
