package cn.ts.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.ts.entity.BsUser;
import cn.ts.service.BsUserService;

@Controller

public class RegisterController {

	@Autowired
	private BsUserService bsUserService;
	
	/*
	 * 验证账户是否已经注册
	 * */
	@RequestMapping("checkRegisterAccount")
	@ResponseBody
	public String checkRegisterAccount(@Param("account")String account){
		System.out.println("checkRegisterAccount....account:"+account);
		boolean registerAccountFlag=bsUserService.selectByAccount(account);
		return JSON.toJSONString(registerAccountFlag);
	}
	/*
	 * 验证邮箱是否已经注册
	 * */
	@RequestMapping("checkRegisterEmail")
	@ResponseBody
	public String checkRegisterEmail(@Param("email")String email){
		System.out.println("checkRegisterEmail....email:"+email);
		boolean registerEmailFlag=bsUserService.selectByEmail(email);
		return JSON.toJSONString(registerEmailFlag);
	}
	/*
	 * 把注册的信息添加到数据库
	 * */
	@RequestMapping("register")
	@ResponseBody
	public String ToRegister(@Param("account")String account,@Param("password")String password,@Param("email")String email){
		BsUser bsUser=new BsUser();
		bsUser.setUserAccount(account);
		bsUser.setUserPassword(password);
		bsUser.setUserEmail(email);
		bsUser.setUserRegisterTime(new Date());
		bsUser.setUserDeleteState(0);
		bsUser.setUserUsingState(1);
		bsUser.setUserAllmarks(0);
		bsUser.setUserMycollect(0);
		bsUser.setUserMyfans(0);
		bsUser.setUserMyfocus(0);
		bsUser.setUserName(account);
		boolean registerFlag=bsUserService.insertRegister(bsUser);
		return JSON.toJSONString(registerFlag);		
	}
}
