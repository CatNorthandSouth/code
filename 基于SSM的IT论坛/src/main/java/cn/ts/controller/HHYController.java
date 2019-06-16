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

import cn.ts.entity.BsFile;
import cn.ts.entity.BsPostReply;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsUser;
import cn.ts.entity.BsUserRole;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsUserRoleService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;

@Controller
public class HHYController {

	@Autowired
	BsUserService BsUserService;
	@Autowired
	BsUserRoleService BsUserRoleService;
	@RequestMapping("memberlist")
	public String  adminlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "member-list";
	}
	@RequestMapping("HfindUSER")
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
		
		BsUser bs=new BsUser();
		List<BsUser> list=new ArrayList<>();
		if (str.length == 3 && flag == 2) {
			System.out.println("1");
			
			list=BsUserService.selectByTimeANDName(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]),
					new SimpleDateFormat("yyyy-MM-dd").parse(str[1]),str[2]);
		} else if(str.length == 2 && flag == 2){
			System.out.println("2");
	
			list=BsUserService.selectByTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]),
					new SimpleDateFormat("yyyy-MM-dd").parse(str[1]));
		}else if(flag == 1){
			System.out.println("3");
			bs.setUserName(str2);
			list=BsUserService.selectByFileTitle(bs);
		}else{
			return null;
		}
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	
	@RequestMapping("HaddUser")
	@ResponseBody
	public Object HaddUser(@Param("email") String email,@Param("name") String name,@Param("pass") String pass){
		BsUser bs=new BsUser();
		bs.setUserEmail(email);
		bs.setUserName(name);
		System.out.println("添加会员"+name);
		bs.setUserPassword(pass);
		bs.setUserAccount(email);
		bs.setUserUsingState(1);
		bs.setUserRegisterTime(new Date());
		bs.setUserAllmarks(0);
		bs.setUserMyfocus(0);
		bs.setUserMycollect(0);
		bs.setUserMyfans(0);
		//System.out.println(bs);
		boolean flag=BsUserService.insertRegister(bs);
		return flag;
	}
	
	@RequestMapping("Hstart")
	@ResponseBody
	public Object Hstart(@Param("id") String id){
		BsUser bs=new BsUser();
		bs.setUserId(Integer.parseInt(id));
		bs.setUserUsingState(1);
		int i=BsUserService.updateByPrimaryKeySelective(bs);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping("Hend")
	@ResponseBody
	public Object Hend(@Param("id") String id){
		BsUser bs=new BsUser();
		bs.setUserId(Integer.parseInt(id));
		bs.setUserUsingState(0);
		int i=BsUserService.updateByPrimaryKeySelective(bs);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}	
	@RequestMapping("HupdateUserPassword")
	@ResponseBody
	public Object HupdateUserPassword(@Param("Id") String Id,@Param("password") String password){
		BsUser bsUser=new BsUser();
		bsUser.setUserId(Integer.parseInt(Id));
		bsUser.setUserPassword(password);
		int i=BsUserService.updateByPrimaryKeySelective(bsUser);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}		
	@RequestMapping("HdeleteUserList")
	@ResponseBody
	public Object HdeleteUserList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		boolean flag=true;
		for (String string : str) {
			int i=BsUserService.deleteByPrimaryKey(Integer.parseInt(string));
			BsUserRole bsUserRole= BsUserRoleService.selectByUserId(Integer.parseInt(string));
			if (bsUserRole != null) {
				BsUserRoleService.deleteByPrimaryKey(bsUserRole.getUserRoleId());
			}
			if (i == 0) {
				return false;
			}
		}
		return true;
	}
	@RequestMapping("HdeleteUser")
	@ResponseBody
	public Object HdeletePost(@Param("postId") String postId){
		int i=BsUserService.deleteByPrimaryKey(Integer.parseInt(postId));
		BsUserRole bsUserRole= BsUserRoleService.selectByUserId(Integer.parseInt(postId));
		if (bsUserRole != null) {
			BsUserRoleService.deleteByPrimaryKey(bsUserRole.getUserRoleId());
		}
		if (i > 0) {
			System.out.println("删除会员成功");
			return true;
		} else {
			System.out.println("删除会员失败");
			return false;
		}
		
	}	
	
	@RequestMapping("HselectUserList")
	@ResponseBody
	public Object HselectPostList() {
		List<BsUser> list=BsUserService.selectAll();
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	public PageUtils<Object> returnpage(List<BsUser> list) {
		List<String> listboard=new ArrayList<>();
		List<String> listadmin=new ArrayList<>();
		int i=0;
	
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
