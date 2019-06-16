package cn.ts.utils;
 
import java.io.IOException;
import java.util.HashMap;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
 
public class KeyWordFilter implements Filter{
	private FilterConfig filterConfig;
	
	public static HashMap keyMap = null;
	public static String path;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;
		String keyWordPath = filterConfig.getInitParameter("key");
		path = filterConfig.getServletContext().getRealPath(keyWordPath);
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, 
			FilterChain chain) throws IOException, ServletException {
		System.out.println("敏感词过滤");
		HttpServletRequest req = (HttpServletRequest)request;
		if(keyMap == null){
				keyMap = (HashMap)PropertiesUtil.readProperties(path);
		}
		if(req.getMethod().equals("POST")){
			System.out.println("敏感词过滤。。。"+keyMap+"  ");
			
			chain.doFilter(new KeyWordRequestWrapper(req,keyMap), response);
		}else{
			chain.doFilter(request, response);
		}
	}
 
	@Override
	public void destroy() {
		this.filterConfig = null; 
	}
 
}
