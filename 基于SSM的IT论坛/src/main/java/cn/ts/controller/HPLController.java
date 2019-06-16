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
import cn.ts.entity.BsPostReply;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsSmallboardService;
import cn.ts.utils.PageUtils;

@Controller
public class HPLController {


	@Autowired
	BsPostsService bsPostsService;
	@Autowired
	BsSmallboardService BsSmallboardService;
	@Autowired
	BsBigboardService BsBigboardService;
	@Autowired
	BsPostReplyService bsPostReplyService;

	@RequestMapping("pllist")
	public String  adminlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "pl-list";
	}	
	@RequestMapping("HupdatePL")
	@ResponseBody
	public String insertPost(@Param("id") String id,@Param("content") String content){
		BsPostReply bsPostReply=new BsPostReply();
		bsPostReply.setReplyContent(content);
		bsPostReply.setReplyId(Integer.parseInt(id));
		bsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
		return null;
	}
    
	@RequestMapping("HfindPL")
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
		
		System.out.println(str1+str1.length()+".....");
		
		BsPostReply bs=new BsPostReply();

		List<BsPostReply> list=new ArrayList<>();
		if (str.length == 3 && flag == 2) {
			System.out.println("1");
			list=bsPostReplyService.selectByTimeANDName(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]), new SimpleDateFormat("yyyy-MM-dd").parse(str[1]), str[2]);
		} else if(str.length == 2 && flag == 2){
			System.out.println("2");
			list=bsPostReplyService.selectByTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]), new SimpleDateFormat("yyyy-MM-dd").parse(str[1]));
		}else if(flag == 1){
			System.out.println("3");
			bs.setReplyAdmin(str2);
			list=bsPostReplyService.selectByReplyAdmin(bs);
		}else{
			return null;
		}
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	
	@RequestMapping("HdeletePLList")
	@ResponseBody
	public void HdeletePostList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		for (String string : str) {
			System.out.println(string);
			int i=bsPostReplyService.deleteByPrimaryKey(Integer.parseInt(string));
		}
		System.out.println("删除多条回复");
	}
	@RequestMapping("HdeletePL")
	@ResponseBody
	public void HdeletePost(@Param("postId") String postId){
		int i=bsPostReplyService.deleteByPrimaryKey(Integer.parseInt(postId));
		System.out.println("删除回复");
	}
	@RequestMapping("HselectPLList")
	@ResponseBody
	public Object HselectPostList() {
		List<BsPostReply> list=bsPostReplyService.selectBsPostReply();
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	public PageUtils<Object> returnpage(List<BsPostReply> list) {
		List<String> listboard=new ArrayList<>();
		List<String> listadmin=new ArrayList<>();
		int i=0;
	
		for (BsPostReply bs : list) {
			if (bs.getReplyBiboId() == 0 && bs.getReplySmboId() == 0) {
				listboard.add(i, "公告");
			} else {
				String str= (BsSmallboardService.selectsmboIdByKey(bs.getReplySmboId())).getSmboTitle();
				listboard.add(i, str);
			}
			listadmin.add(i, bsPostsService.selectPostsByPostId(bs.getReplyPostId()).getPostTitle());
			i++;
		}
		List<Object> listSUM=new ArrayList<>();
		listSUM.add(list);
		listSUM.add(listboard);
		listSUM.add(listadmin);
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
