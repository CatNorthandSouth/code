package cn.ts.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsLunbo;
import cn.ts.entity.BsPostReply;
import cn.ts.entity.BsRole;
import cn.ts.entity.BsRoleMenu;
import cn.ts.entity.BsSystemLog;
import cn.ts.entity.BsUser;
import cn.ts.entity.BsUserRole;
import cn.ts.mapper.BsUserRoleMapper;
import cn.ts.service.BsFileService;
import cn.ts.service.BsLunboService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsRoleMenuService;
import cn.ts.service.BsRoleService;
import cn.ts.service.BsSystemLogService;
import cn.ts.service.BsUserRoleService;
import cn.ts.service.BsUserService;

@Controller
public class HloginController {

	@Autowired
	BsRoleService bsRoleService;
	@Autowired
	BsSystemLogService bsSystemLogService;
	@Autowired
	BsUserService BsUserService;
	@Autowired
	BsUserRoleService BsUserRoleService;
	@Autowired
	BsRoleMenuService BsRoleMenuService;
	@Autowired
	BsFileService BsFileService;
	@Autowired
	BsPostReplyService BsPostReplyService;
	@Autowired
	BsLunboService BsLunboService;
	@RequestMapping("Hlogin")
	public String Hlogin(){
		System.out.println("去往后台登录页。。。。");
		return "Hlogin";
	}
	public static String getIpAddress(HttpServletRequest request){
		         
		String ipAddress = request.getHeader("x-forwarded-for");
		          
		if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
		       ipAddress = request.getHeader("Proxy-Client-IP");
		 }
		if (ipAddress == null || ipAddress.length() == 0 || "unknow".equalsIgnoreCase(ipAddress)) {
		       ipAddress = request.getHeader("WL-Proxy-Client-IP");
		 }
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
		       ipAddress = request.getRemoteAddr();
             
        if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
		 //根据网卡获取本机配置的IP地址
		        InetAddress inetAddress = null;
		        try {
		            inetAddress = InetAddress.getLocalHost();
		         } catch (UnknownHostException e) {
	                e.printStackTrace();
		         }
		            ipAddress = inetAddress.getHostAddress();
		         }
         }
		 
		//对于通过多个代理的情况，第一个IP为客户端真实的IP地址，多个IP按照','分割
		if(null != ipAddress && ipAddress.length() > 15){
		  //"***.***.***.***".length() = 15
		      if(ipAddress.indexOf(",") > 0){
		         ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
		      }
		}
		  
		return ipAddress;
	 }	
	
	@RequestMapping("toHlogin")
	@ResponseBody
	public Object toHlogin(HttpServletRequest request){
		String userName = request.getParameter("user");
		String password = request.getParameter("pass");
		System.out.println(userName+"  "+password);
		BsUser bsUser = new BsUser();
		bsUser = BsUserService.selectByAccountAndPassword(userName, password);
		if (bsUser == null) {
			bsUser = BsUserService.selectByEmailAndPassword(userName, password);
		}
		if (bsUser != null) {
			System.out.println("后台验证密码.....");
			BsUserRole bsUserRole = BsUserRoleService.selectByUserId(bsUser.getUserId());
			if (bsUserRole != null) {
				System.out.println(bsUserRole);
				BsRoleMenu bsRoleMenu = BsRoleMenuService.selectByRoleId(bsUserRole.getRoleId());
				System.out.println(bsRoleMenu);
				//model.addAttribute("ByUser", bsUser);
				request.getSession().setAttribute("sessionUserName", bsUser.getUserName());
				request.getSession().setAttribute("sessionUserId", bsUser.getUserId());
				request.getSession().setAttribute("RoleMenu", bsRoleMenu.getMenuId());
				request.getSession().setAttribute("user-img", bsUser.getUserPhoto());
				request.getSession().setAttribute("oldaccount", bsUser.getUserAccount());
				request.getSession().setAttribute("oldpassword", bsUser.getUserPassword());
				request.getSession().setMaxInactiveInterval(3600);
				bsUser.setUserLoginTime(new Date());
		    	BsUserService.updateByPrimaryKeySelective(bsUser);
		    	
		    	//插入登陆痕迹
		    	BsRole bsRole=bsRoleService.selectByPrimaryKey(bsUserRole.getRoleId());
				BsSystemLog bsSystemLog=new BsSystemLog();
			
				bsSystemLog.setContent("登陆成功");
			
				
				bsSystemLog.setLogintime(new Date());
				
				bsSystemLog.setIp(getIpAddress(request));
				
				bsSystemLog.setUserid(bsUser.getUserId());
				bsSystemLog.setType(bsRole.getRoleName());
				bsSystemLog.setUsername(bsUser.getUserName());
				bsSystemLogService.insert(bsSystemLog);
		    	
		    //	
				if (bsUser.getUserUsingState() == 1) {
					return "true";
				} else {
					return "false";
				}
							
			} else {
				return "false";	
			}
	
		} else {
			return "false";	
		}

	}
	
	@RequestMapping("Hindex")
	public String Hindex(HttpServletRequest request,Model model){
		System.out.println(request.getSession().getAttribute("RoleMenu"));
		String userName = request.getParameter("username");
		String password = request.getParameter("pass");
		BsUser bsUser = BsUserService.selectByAccountAndPassword(userName, password);
		
		if (bsUser == null) {
			bsUser = BsUserService.selectByEmailAndPassword(userName, password);
		}
		model.addAttribute("ByUser", bsUser);
		return "index";
	}
	@RequestMapping("HWelcome")
	public String HWelcome(HttpServletRequest request,Model model){
		//System.out.println("Hwelcome网页。。。。。");
		int userid= (int) request.getSession().getAttribute("sessionUserId");
		BsUser bsUser= BsUserService.selectByPrimaryKey(userid);
		List<BsSystemLog> list=bsSystemLogService.selectByUserId(userid);
		model.addAttribute("loginsum", list.size());
		model.addAttribute("Loglist",list.get(1));
		List<BsUser> listuser=BsUserService.selectAll();
		List<BsFile> listfile=BsFileService.selectfile();
		List<BsUserRole> listuserrole=BsUserRoleService.selectAll();
		List<BsLunbo> listlunbo=BsLunboService.selectAll();
		List<BsPostReply> listpostreply=BsPostReplyService.selectBsPostReply();
		model.addAttribute("listuser", listuser.size());
		model.addAttribute("listfile", listfile.size());
		model.addAttribute("listuserrole", listuserrole.size());
		model.addAttribute("listlunbo", listlunbo.size());
		model.addAttribute("listpostreply", listpostreply.size());
		System.out.println("Hwelcome网页。。。。。");
		return "welcome";
	}
}
