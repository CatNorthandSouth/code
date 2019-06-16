package cn.ts.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class LoginFilter implements Filter {

	private static List<String> urls=new ArrayList<>();
	static{
		urls.add("/css");
		urls.add("/fonts");
		urls.add("/img");
		urls.add("/js");
		urls.add("/500.jsp");
		urls.add("/X-admin");
		urls.add("/errorpage.jsp");
		urls.add("/Qlogin");
		urls.add("/login");
		urls.add("/yonghushouze.jsp");
		urls.add("/Hlogin");
		urls.add("/checkUser");
		urls.add("/findpassword");
		urls.add("/checkRegisterAccount");
		urls.add("/checkRegisterEmail");
		urls.add("/register");
		urls.add("/checkCode");
		urls.add("/sendemail");
		urls.add("/updatepassword");
		//urls.add("/revisepassword");
		//urls.add("/Hlogin");
		urls.add("/toHlogin");
		urls.add("/revisepassword");
		urls.add("/getCode");

	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("登陆拦截器。。。");
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		//得到当前页面所在目录下全名称
		String urlPattern=req.getServletPath();
		//得到页面所在服务器绝对路径
		String path=req.getRequestURI();
		//System.out.println("guoluqi");
		for (String url : urls) {
			if (url.equals(urlPattern) || path.contains(url)) {
				chain.doFilter(request, response);
				return ;
			}
		}
		if (req.getSession().getAttribute("sessionUserName") == null) {
			if ("Hindex".equals(urlPattern) || path.contains("Hindex")) {
				res.sendRedirect("/bs/Hlogin");
			} else {
				res.sendRedirect("/bs/Qlogin");
			}
			
		} else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
