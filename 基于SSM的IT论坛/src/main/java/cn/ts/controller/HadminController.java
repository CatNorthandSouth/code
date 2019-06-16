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

import cn.ts.entity.BsPosts;
import cn.ts.entity.BsRole;
import cn.ts.entity.BsRoleMenu;
import cn.ts.entity.BsUser;
import cn.ts.entity.BsUserRole;
import cn.ts.service.BsRoleMenuService;
import cn.ts.service.BsRoleService;
import cn.ts.service.BsUserRoleService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;

@Controller
public class HadminController {

	@Autowired
	BsRoleMenuService BsRoleMenuService;
	@Autowired
	BsUserService BsUserService;
	@Autowired
	BsUserRoleService BsUserRoleService;
	@Autowired
	BsRoleService BsRoleService;
	@RequestMapping("adminlist")
	public String  adminlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "admin-list";
	}
	@RequestMapping("HfindadminList")
	@ResponseBody
	public Object HfindadminList() {
		// TODO Auto-generated method stub
		List<BsRole> list=BsRoleService.selectAll();
		return list;
	}

	@RequestMapping("Hfindadmin")
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
		List<BsUser> listUser=new ArrayList<>();
		List<BsUserRole> listUserRole=BsUserRoleService.selectAll();
		for (BsUserRole bsUserRole : listUserRole) {
			for (BsUser bsUser : list) {
				if (bsUserRole.getUserId() == bsUser.getUserId()) {
					BsRole bsRole=BsRoleService.selectByPrimaryKey(bsUserRole.getRoleId());
					bsUser.setUserUsingState(bsUserRole.getState());
					bsUser.setUserRealName(bsRole.getRoleName());
					listUser.add(bsUser);
				}
			}
			
		}
		
		
		System.out.println(listUser.size()+" "+listUser);
		return returnpage(listUser);
	}
	
	@RequestMapping("Haddadmin")
	@ResponseBody
	public Object HaddUser(@Param("username") String username,@Param("role") String role){
		System.out.println(username+"   "+role);
		BsRole bsRole= BsRoleService.selectByPrimaryKey(Integer.parseInt(role));
		if (bsRole == null) {
			return false;
		}
		BsUserRole bsUserRole=new BsUserRole();
		boolean bs = BsUserService.selectByAccount(username);
		BsUser bsUser=BsUserService.selectByUserAccount(username);
		bsUserRole.setState(1);
		bsUserRole.setUserId(bsUser.getUserId());
		bsUserRole.setRoleId(Integer.parseInt(role));
		BsUserRoleService.insert(bsUserRole);
		return bs;
	}
	
	@RequestMapping("Hadminstart")
	@ResponseBody
	public Object Hstart(@Param("postId") String postId){
		BsUserRole bs=new BsUserRole();
		bs.setState(1);
		bs.setUserId(Integer.parseInt(postId));
		int i= BsUserRoleService.updateBystate(bs);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping("Hadminend")
	@ResponseBody
	public Object Hend(@Param("postId") String postId){
		BsUserRole bs=new BsUserRole();
		bs.setState(0);
		bs.setUserId(Integer.parseInt(postId));
		int i=BsUserRoleService.updateBystate(bs);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}	
	@RequestMapping("Hupdateadmin")
	@ResponseBody
	public Object HupdateUserPassword(@Param("id") String id,@Param("adminid") String adminid){
		System.out.println(id+" .. "+adminid);
		BsUserRole bs=new BsUserRole();
		bs.setRoleId(Integer.parseInt(adminid));
		bs.setUserId(Integer.parseInt(id));
		int i=BsUserRoleService.updateBystate(bs);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}		
	@RequestMapping("HdeleteadminList")
	@ResponseBody
	public Object HdeleteUserList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		for (String string : str) {
			System.out.println(string);
			BsUserRole bsUserRole=new BsUserRole();
			String[] str1=string.split("-");
			bsUserRole.setUserId(Integer.parseInt(str1[0]));
			bsUserRole.setRoleId(Integer.parseInt(str1[1]));
			int i=BsUserRoleService.deleteByUserRole(bsUserRole);
			if (i > 0) {
				System.out.println("删除管理员成功");
				
			} else {
				System.out.println("删除管理员失败");
				return false;
			}
		}
		return true;
		//BsUserService.deleteByPrimaryKey(Integer.parseInt(postId));
	}
	@RequestMapping("Hdeleteadmin")
	@ResponseBody
	public Object HdeletePost(@Param("postId") String postId){
		System.out.println(postId+"...");
		BsUserRole bsUserRole=new BsUserRole();
		String[] str=postId.split("-");
		bsUserRole.setUserId(Integer.parseInt(str[0]));
		bsUserRole.setRoleId(Integer.parseInt(str[1]));
		int i=BsUserRoleService.deleteByUserRole(bsUserRole);
		if (i > 0) {
			System.out.println("删除管理员成功");
			return true;
		} else {
			System.out.println("删除管理员失败");
			return false;
		}
	}	
	
	@RequestMapping("HselectAdminList")
	@ResponseBody
	public Object HselectPostList() {
		List<BsUserRole> listUserRole=BsUserRoleService.selectAll();
		List<BsUser> listUser=new ArrayList<>();
		for (BsUserRole bsUserRole : listUserRole) {
			BsUser User=BsUserService.selectByPrimaryKey(bsUserRole.getUserId());
			BsRole Role=BsRoleService.selectByPrimaryKey(bsUserRole.getRoleId());
			User.setUserRealName(Role.getRoleName());
			User.setUserUsingState(bsUserRole.getState());
			User.setUserAllmarks(Role.getRoleId());
			//User.setUserMyfans(bs);
			listUser.add(User);
		}
		
 		System.out.println(listUser.size()+" "+listUser);
		return returnpage(listUser);
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
