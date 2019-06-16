package cn.ts.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.ts.entity.BsSendEmailHistory;
import cn.ts.entity.BsUser;
import cn.ts.service.BsUserService;
import cn.ts.utils.SendEmail;

@Controller
public class FindPasswordController {

	@Autowired
	BsUserService BsUserService;
	/*
	 * 2019/1/17
	 * 验证验证码是否正确
	 * */
	@RequestMapping("checkCode")
	@ResponseBody
	public String checkImgCode(HttpServletRequest req, HttpServletResponse resp){
		String code=req.getParameter("code");
		System.out.println(code+".....");
		String flag="";
		String sessionCode=req.getSession().getAttribute("code").toString();
		if (code != null && !"".equals(code) &&sessionCode != null && !"".equals(sessionCode)) {
			if (code.equalsIgnoreCase(sessionCode)) {
				flag="success";
			} else {
				flag="false";
			}
		} else {
			flag="false";
		}
		return flag;		
	}
	/*
	 * 2019/1/18
	 * 发送邮件找回密码
	 * */
	@RequestMapping("sendemail")
	@ResponseBody
	public Object sendEmailToRevisePassword(HttpServletRequest request,@RequestParam(value="receivedEmail") String receivedEmail,@RequestParam(value="receiveder") String receiveder){
		System.out.println("邮件发送前。。。。。。。。。。");
		BsSendEmailHistory bsSendEmailHistory=new BsSendEmailHistory();
		bsSendEmailHistory.setSendEmailAccount("apachecntribune@163.com");
		bsSendEmailHistory.setSendEmailPassword("163wangyi");
		bsSendEmailHistory.setSender("apacheCNtribune");
		bsSendEmailHistory.setSendDate(new Date());
		bsSendEmailHistory.setReceiveder("尊敬的会员："+receiveder);
		BsUser bsUser=BsUserService.selectByUserAccount(receiveder);
		HttpSession Hsession=request.getSession();
		Hsession.setAttribute("oldaccount", bsUser.getUserAccount());
		Hsession.setAttribute("oldpassword", bsUser.getUserPassword());
		Hsession.setMaxInactiveInterval(3600);
		System.out.println(Hsession.getAttribute("oldaccount"));
		bsSendEmailHistory.setReceiveEmailAccount(receivedEmail);
		bsSendEmailHistory.setEmailTheme("找回密码申请");
		bsSendEmailHistory.setEmailContent("您好，您的密码是:"+bsUser.getUserPassword());
		bsSendEmailHistory.setEmailType(1);
		System.out.println(bsSendEmailHistory);
		SendEmail sendEmail=new SendEmail();
		sendEmail.sendEmail(bsSendEmailHistory);
		System.out.println("邮件发送后。。。。。。。。。。");
		String str="success";
		return str;
	}
	/*
	 * 2019/1/18
	 * */
	@RequestMapping("updatepassword")
	@ResponseBody
	public Object updatePassword(@RequestParam(value="newpassword",required=false) String password,@RequestParam("username") String username){
		System.out.println(username);
		System.out.println(password);
		BsUser bsUser=BsUserService.selectByUserAccount(username);
		bsUser.setUserAccount(username);
		bsUser.setUserPassword(password);
		System.out.println(bsUser);
		int i=BsUserService.updateByPrimaryKeySelective(bsUser);
		if (i>0) {
			return true;
		} else {
			return false;
		}
	}
	/*
	 * 2019/1/17
	 * 请求修改密码页RevisePassword
	 * */
	@RequestMapping("revisepassword")
	public String revisePassword(HttpServletRequest request,Model model){
		//request.setAttribute();
		//request.setAttribute();
		model.addAttribute("username",request.getSession().getAttribute("oldaccount"));
		model.addAttribute("oldpassword", request.getSession().getAttribute("oldpassword"));
		return "RevisePassword";
	}
}
