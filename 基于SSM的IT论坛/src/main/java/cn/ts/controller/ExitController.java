package cn.ts.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExitController {

	@RequestMapping("exitApacheCN")
	public String exitApacheCN(HttpServletRequest request){
		request.getSession().invalidate();
		System.out.println("退出系统。。。");
		return "Login";
	}
	@RequestMapping("exitHoutai")
	public String exitHoutai(HttpServletRequest request){
		request.getSession().invalidate();
		System.out.println("退出系统。。。");
		return "Hlogin";
	}
}
