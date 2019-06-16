package cn.ts.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsMenu;
import cn.ts.entity.BsRole;
import cn.ts.entity.BsRoleMenu;
import cn.ts.entity.BsUserRole;
import cn.ts.service.BsMenuService;
import cn.ts.service.BsRoleMenuService;
import cn.ts.service.BsRoleService;
import cn.ts.service.BsUserRoleService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;

@Controller
public class HAdminRoleController {
	@Autowired
	BsRoleMenuService BsRoleMenuService;
	@Autowired
	BsUserService BsUserService;
	@Autowired
	BsUserRoleService BsUserRoleService;
	@Autowired
	BsRoleService BsRoleService;
	@Autowired
	BsMenuService BsMenuService;
	@RequestMapping("adminrole")
	public String  adminrole(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "admin-role";
	}
	@RequestMapping("selectAdminRoleList")
	@ResponseBody
	public Object selectAdminRoleList(){
		List<BsRole> list=BsRoleService.selectAll();
		PageUtils<BsRole> pageUtils=new PageUtils<>();
		pageUtils.setList(list);
		pageUtils.setPageSize(7);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		return pageUtils;
	}
	
	@RequestMapping("HdeleteadminRoleList")
	@ResponseBody
	public Object HdeleteadminRoleList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		boolean flag=true;
		for (String string : str) {
			System.out.println(string);
			int i= BsRoleService.deleteByPrimaryKey(Integer.parseInt(string));
			if (i == 0) {
				flag=false;
			}
		}
		System.out.println("删除多条角色");
		return flag;
		//BsUserService.deleteByPrimaryKey(Integer.parseInt(postId));
	}
	@RequestMapping("Hdeleteadminrole")
	@ResponseBody
	public Object Hdeleteadminrole(@Param("postId") String postId){
		System.out.println(postId+"...");
		int i=BsRoleService.deleteByPrimaryKey(Integer.parseInt(postId));
		if (i > 0) {
			System.out.println("删除角色成功");
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping("insertRole")
	@ResponseBody
	public Object insertRole(@Param("name") String name,@Param("desc") String desc,@Param("idAss") String idAss){
		System.out.println("会员角色添加");
	
		String id="";
		String content="";
		String[] a1= idAss.split(",");
		for (int i = 1; i < a1.length-1; i++) {
			String string = a1[i];
			String[] a2=string.split("\"");
			System.out.println(a2[3]);
			BsMenu bsMenu= BsMenuService.selectByPrimaryKey(a2[3]);
			if (i== a1.length-2) {
				id=id+a2[3];
				content=content+bsMenu.getText();
			} else {
				id=id+a2[3]+",";
				content=content+bsMenu.getText()+",";
				
			}
		}
		BsRole bsRole=new BsRole();
		bsRole.setRoleDescript(desc);
		bsRole.setRoleName(name);
		bsRole.setRoleGuize(content);
		bsRole.setRoleState(1);
		BsRoleService.insert(bsRole);
		BsRole bsRole2=BsRoleService.selectByroleName(name);
		BsRoleMenu bsRoleMenu=new BsRoleMenu();
		bsRoleMenu.setMenuId(id);
		bsRoleMenu.setRoleId(bsRole2.getRoleId());
		int i= BsRoleMenuService.insert(bsRoleMenu);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
		
	}
}
