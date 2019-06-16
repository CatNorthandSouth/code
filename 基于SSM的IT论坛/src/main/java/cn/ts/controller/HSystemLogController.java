package cn.ts.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.ast.statement.SQLIfStatement.Else;
import com.alibaba.druid.sql.visitor.functions.If;

import cn.ts.entity.BsRole;
import cn.ts.entity.BsSystemLog;
import cn.ts.entity.BsUserRole;
import cn.ts.service.BsRoleService;
import cn.ts.service.BsSystemLogService;
import cn.ts.service.BsUserRoleService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;

@Controller
public class HSystemLogController {

	@Autowired
	BsSystemLogService bsSystemLogService;
	@Autowired
	BsUserService bsUserService;
	@Autowired
	BsRoleService bsRoleService;
	@Autowired
	BsUserRoleService bsUserRoleService;

	@RequestMapping("sysLog")
	public String  adminlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		List<BsSystemLog> list= bsSystemLogService.selectByAll();
		model.addAttribute("Logsum", list.size());
		return "sys-log";
	}

	@RequestMapping("HdeleteListLog")
	@ResponseBody
	public void HdeleteListLog(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		for (String string : str) {
			bsSystemLogService.deleteByPrimaryKey(Integer.parseInt(string));
			System.out.println(string);
		}
		//BsUserService.deleteByPrimaryKey(Integer.parseInt(postId));
	}
	@RequestMapping("HdeleteLog")
	@ResponseBody
	public void HdeleteLog(@Param("postId") String postId){
		System.out.println(postId+"...");
		bsSystemLogService.deleteByPrimaryKey(Integer.parseInt(postId));
	}
	
	
	@RequestMapping("selectSysLogAll")
	@ResponseBody
	public Object selectSysLogAll(){
		List<BsSystemLog> list= bsSystemLogService.selectByAll();
		PageUtils<BsSystemLog> pageUtils=new PageUtils<>();
		pageUtils.setList(list);
		pageUtils.setPageSize(7);
		pageUtils.setPageCount(list.size());
		pageUtils.setPageIndex(1);
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		return pageUtils;
	}
}
