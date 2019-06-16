package cn.ts.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;

import cn.ts.entity.BsNiuren;
import cn.ts.entity.BsNiurenNow;
import cn.ts.entity.BsRank;
import cn.ts.entity.BsRole;
import cn.ts.entity.BsRoleMenu;
import cn.ts.entity.BsSystemLog;
import cn.ts.entity.BsUser;
import cn.ts.entity.BsUserRole;
import cn.ts.service.BsNiurenNowService;
import cn.ts.service.BsNiurenService;
import cn.ts.service.BsRankService;
import cn.ts.service.BsRoleMenuService;
import cn.ts.service.BsRoleService;
import cn.ts.service.BsSystemLogService;
import cn.ts.service.BsUserRoleService;
import cn.ts.service.BsUserService;

@Controller
public class LoginController {

	@Autowired
	BsRoleService bsRoleService;
	@Autowired
	BsSystemLogService bsSystemLogService;
	@Autowired
	BsUserRoleService BsUserRoleService;
	@Autowired
	BsRoleMenuService BsRoleMenuService;
	@Autowired
	private BsUserService bsUserService;
	@Autowired
	BsRankService BsRankService;
	@Autowired
	BsNiurenNowService BsNiurenNowService;
	@Autowired
	BsNiurenService BsNiurenService;	
	@RequestMapping("/Qlogin")
	public String ToLogin(){
		return "Login";
	}
	
	@RequestMapping("checkUser")
	@ResponseBody
	public Object CheckUser(@Param("account")String account,@Param("password")String password){

		boolean flag;
		System.out.println("CheckUser...account:"+account+"   password:"+password);
		//System.out.println(".........1212....");
	    BsUser ByUserName=bsUserService.selectByAccountAndPassword(account, password);
	    //System.out.println(".........1212....");
	    BsUser ByEmail=bsUserService.selectByEmailAndPassword(account, password);
	    //System.out.println(".........1212....");
	    if (ByUserName != null || ByEmail != null) {  
	    	flag=true;
	    	System.out.println("数据库存在该账号");
		} else {
			System.out.println("数据库不存在该账号");
			flag=false;
		}
	    return flag;
	}
	//历史排名
	public void createrank(int userid) {
		BsRank bsRank1=new BsRank();
		BsRank bsRank= BsRankService.selectByUserId(userid);
		BsUser bsUser= bsUserService.selectByPrimaryKey(userid);
		List<BsUser> list=bsUserService.selectByuserAllmarks(bsUser.getUserAllmarks());
		if (bsRank == null) {
			
			List<BsUser> list2=bsUserService.selectAll();
			bsRank1.setPreRank(list2.size());
			if (list.size() == 0) {
				bsRank1.setNowRank(1);
			} else {
				bsRank1.setNowRank(list.size());
			}
			
			bsRank1.setUserId(userid);
			BsRankService.insert(bsRank1);
		} else {
		
			bsRank.setPreRank(bsRank.getNowRank());
			if (list.size() == 0) {
				bsRank1.setNowRank(1);
			} else {
				bsRank1.setNowRank(list.size());
			}
			BsRankService.updateByPrimaryKey(bsRank);
		}
	}
	//插入牛人排行榜
	public void createNiuRen(int userid) {
		BsNiurenNow bsNiurenNow= BsNiurenNowService.selectByUser_id(userid);
		BsUser bsUser=bsUserService.selectByPrimaryKey(userid);
		BsNiuren bsNiuren2=new BsNiuren();
		BsNiurenNow bsNiurenNow1=new BsNiurenNow();
		List<BsNiurenNow> list=BsNiurenNowService.selectAllNiuRen();
		for (BsNiurenNow bsNiurenNow2 : list) {
			System.out.println(bsNiurenNow2);
		}
		if (bsNiurenNow == null) {
			bsNiuren2.setNiurenAdmin(bsUser.getUserName());
			bsNiuren2.setNiurenPhoto(bsUser.getUserPhoto());
			bsNiuren2.setUserId(userid);
			bsNiuren2.setNiurenMonthScore(0);
			bsNiuren2.setNiurenWeekScore(0);
			bsNiuren2.setNiurenYearScore(0);
			bsNiurenNow1.setNiurenAdmin(bsUser.getUserName());
			bsNiurenNow1.setNiurenPhoto(bsUser.getUserPhoto());
			bsNiurenNow1.setUserId(userid);
			bsNiurenNow1.setNiurenMonthScore(0);
			bsNiurenNow1.setNiurenWeekScore(0);
			bsNiurenNow1.setNiurenYearScore(0);
			BsNiurenNowService.insertNiuRen(bsNiurenNow1);
			BsNiurenService.insertNiuRen(bsNiuren2);
		} else {
			bsNiurenNow.setNiurenWeekScore(bsNiurenNow.getNiurenWeekScore()+1);
			BsNiurenNowService.updateByPrimaryKey(bsNiurenNow);
			
		}
	}
	
	public void createloginhistory(HttpServletRequest request) {
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		BsUser bsUser=bsUserService.selectByPrimaryKey(userid);
		BsUserRole bsUserRole = BsUserRoleService.selectByUserId(bsUser.getUserId());
		BsSystemLog bsSystemLog=new BsSystemLog();
		if (bsUserRole != null) {
			BsRoleMenu bsRoleMenu = BsRoleMenuService.selectByRoleId(bsUserRole.getRoleId());
			System.out.println(bsRoleMenu);
	    	//插入登陆痕迹
	    	BsRole bsRole=bsRoleService.selectByPrimaryKey(bsUserRole.getRoleId());
	    	bsSystemLog.setType(bsRole.getRoleName());
			bsSystemLog.setContent("登陆成功");
		} else {
			bsSystemLog.setType("普通会员");
		}
	
	
		
		
		bsSystemLog.setLogintime(new Date());
		//if (request.getHeader("x-forwarded-for") == null){
			bsSystemLog.setIp(HloginController.getIpAddress(request));
		//} else {
			//bsSystemLog.setIp(request.getHeader("x-forwarded-for"));
		//}
		bsSystemLog.setUserid(bsUser.getUserId());
		
		bsSystemLog.setUsername(bsUser.getUserName());
		bsSystemLogService.insert(bsSystemLog);		
	}
	
	@RequestMapping("login")
	@ResponseBody
	public Object Login(HttpServletRequest request,@Param("account")String account,@Param("password")String password) throws ServletException, IOException{
		String username=account;
		//String password=password;
		
	    BsUser ByUserName=bsUserService.selectByAccountAndPassword(username, password);
	    BsUser ByEmail=bsUserService.selectByEmailAndPassword(username, password);	   
	    if (ByUserName != null) {
	    	System.out.println("数据库查询密码。。。。");
	    	HttpSession httpSession=request.getSession();
	    	httpSession.setAttribute("sessionUserName", ByUserName.getUserName());
	    	httpSession.setAttribute("sessionUserId", ByUserName.getUserId());
	    	httpSession.setAttribute("user-img", ByUserName.getUserPhoto());
	    	httpSession.setAttribute("oldaccount", ByUserName.getUserAccount());
	    	httpSession.setAttribute("oldpassword", ByUserName.getUserPassword());
	    	httpSession.setMaxInactiveInterval(3600);
	    	ByUserName.setUserLoginTime(new Date());
	    	ByUserName.setUserAllmarks(ByUserName.getUserAllmarks()+1);
	    	bsUserService.updateByPrimaryKeySelective(ByUserName);
	    	createrank(ByUserName.getUserId());
	    	createNiuRen(ByUserName.getUserId());
	    	createloginhistory(request);
	    	if (ByUserName.getUserUsingState() == 1) {
	    		return true;
			} else {
				return false;
			}
		} else if(ByEmail != null) {
			System.out.println("数据库查询密码。。。。");
			createrank(ByEmail.getUserId());
			createNiuRen(ByEmail.getUserId());
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("sessionUserName", ByEmail.getUserName());
	    	httpSession.setAttribute("sessionUserId", ByEmail.getUserId());
	    	httpSession.setAttribute("user-img", ByEmail.getUserPhoto());
	     	httpSession.setAttribute("oldaccount", ByEmail.getUserAccount());
	    	httpSession.setAttribute("oldpassword", ByEmail.getUserPassword());
	    	httpSession.setMaxInactiveInterval(3600);
	    	ByEmail.setUserLoginTime(new Date());
	    	ByEmail.setUserAllmarks(ByEmail.getUserAllmarks()+1);
	    	bsUserService.updateByPrimaryKeySelective(ByEmail);
	    	createloginhistory(request);
	    	if (ByEmail.getUserUsingState() == 1) {
	    		return true;
			} else {
				return false;
			}
			
			
		}else {
			return false;
		}
	    
	    //return	"mainpage";		
	}
	@RequestMapping("togomainpage")
	public String togomainpage(HttpServletRequest request,HttpServletResponse response,Model model){
		System.out.println("去主页。。。。");
		String username=request.getParameter("login_number");
		String password=request.getParameter("login_password");
		System.out.println("login...username:"+username+"   password:"+password);
	    BsUser ByUserName=bsUserService.selectByAccountAndPassword(username, password);
	    BsUser ByEmail=bsUserService.selectByEmailAndPassword(username, password);
	    BsRank bsRank=new BsRank();
	    if (ByUserName != null) {
	    	
	    	model.addAttribute("ByUser", ByUserName);
	    	bsRank= BsRankService.selectByUserId(ByUserName.getUserId());
	    	
	    	
		} else {
			
			model.addAttribute("ByUser", ByEmail);
			bsRank= BsRankService.selectByUserId(ByUserName.getUserId());
		}
	    model.addAttribute("BybsRank",bsRank);
		return	"mainpage";
	}
	/*
	 * 2019/1/16
	 * 找回密码
	 * */
	@RequestMapping("findpassword")
	public String findPassword() {
		// TODO Auto-generated method stub
		System.out.println("找回密码。。。。");
		return "findPassword";
	}
/*	@RequestMapping("getmainHeader")
	public Object getHeaderImg(HttpServletRequest request,Model model){
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		BsUser bsUser=bsUserService.selectByPrimaryKey(userid);
		System.out.println("获取导航栏头像"+bsUser.getUserPhoto());
		model.addAttribute("header-userimg", bsUser.getUserPhoto());
		return "mainHeader";
	}*/
	
	
}
