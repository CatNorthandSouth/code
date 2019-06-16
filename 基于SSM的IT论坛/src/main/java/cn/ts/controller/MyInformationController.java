package cn.ts.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.annotations.Param;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.util.Base64Decoder;

import java.util.*;

import cn.ts.entity.BsFans;
import cn.ts.entity.BsPostCollect;
import cn.ts.entity.BsUser;
import cn.ts.service.BsFansService;
import cn.ts.service.BsPostCollectService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;
import sun.misc.BASE64Decoder;

@Controller
public class MyInformationController {

	@Autowired
	BsUserService bsUserService;
	@Autowired
	BsFansService BsFansService;
	@Autowired
	BsPostCollectService bsPostCollectService;
	@RequestMapping("gotoMyInformation")
	public String gotoMyInformation(Model model,HttpServletRequest request){
		System.out.println("我的个人信息页");
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		BsUser bsUser = bsUserService.selectByPrimaryKey(userid);
		model.addAttribute("bsUser", bsUser);
		System.out.println(bsUser);
		return "MyInformation";
	}
	@RequestMapping("updateMyInformation")
	public String updateMyInformation(BsUser bsUser,Model model,HttpServletRequest request){

		int userid=(int) request.getSession().getAttribute("sessionUserId");
		String s_province=request.getParameter("s_province");
		String s_city=request.getParameter("s_city");
		String s_county=request.getParameter("s_county");
		bsUser.setUserProvince(s_province);
		bsUser.setUserCity(s_city);
		bsUser.setUserArea(s_county);
		bsUserService.updateByPrimaryKeySelective(bsUser);
		bsUser = bsUserService.selectByPrimaryKey(userid);
		model.addAttribute("bsUser", bsUser);
		return "MyInformation";
	}
	@RequestMapping("selectMyInformation")
	@ResponseBody
	public Object selectMyInformation(HttpServletRequest request,Model model){
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		

		return bsUserService.selectByPrimaryKey(userid);
	}	
	@RequestMapping("imageUpload")
	public String imageUpload(){
	
		return "ImageUpload";
	}	
	private String getFileName(String endName) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String timeStr=sdf.format(new Date());
		String str=RandomStringUtils.random(5, "qwertyuiopasdfghjklzxcvbnm0123456789");
		String name=timeStr+str+"."+endName;
		return name;
	}
	
	@RequestMapping("selectMyfocus")
	@ResponseBody
	public Object selectMyfocus(HttpServletRequest request,Model model){
		System.out.println("selectMyfocus");
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		List<BsFans> list1=BsFansService.selectByUserId(userid);
		List<BsUser> list=new ArrayList<>();	
		for (BsFans bsfans : list1) {
			BsUser bsUser=bsUserService.selectByPrimaryKey(bsfans.getMyFansId());
			list.add(bsUser);
		}
		PageUtils<BsUser> pageUtils=new PageUtils<>();
		pageUtils.setList(list);
		pageUtils.setPageSize(4);
		pageUtils.setPageIndex(1);	
		pageUtils.setPageCount(list.size());
		BsUser bsUser1=bsUserService.selectByPrimaryKey(userid);
		bsUser1.setUserMyfocus(list.size());
		bsUserService.updateByPrimaryKeySelective(bsUser1);
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		//System.out.println(pageUtils);
		return pageUtils;
	}
	@RequestMapping("selectMyfans")
	@ResponseBody
	public Object selectMyfans(HttpServletRequest request,Model model){
		System.out.println("selectMyfans");
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		List<BsFans> list1=BsFansService.selectByMyFansId(userid);
		List<BsUser> list=new ArrayList<>();	
		for (BsFans bsfans : list1) {
			BsUser bsUser=bsUserService.selectByPrimaryKey(bsfans.getUserId());
			list.add(bsUser);
		}
		PageUtils<BsUser> pageUtils=new PageUtils<>();
		pageUtils.setList(list);
		pageUtils.setPageSize(4);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		BsUser bsUser1=bsUserService.selectByPrimaryKey(userid);
		bsUser1.setUserMyfans(list.size());
		bsUserService.updateByPrimaryKeySelective(bsUser1);
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		return pageUtils;
	}
	@RequestMapping("selectMycollect")
	@ResponseBody
	public Object selectMycollect(HttpServletRequest request,Model model){
		System.out.println("selectMycollect");
		String userName=(String) request.getSession().getAttribute("sessionUserName");
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		System.out.println(userName);
		List<BsPostCollect> list=bsPostCollectService.selectByPostAdminId(userid);
		System.out.println(".."+list);
		PageUtils<BsPostCollect> pageUtils=new PageUtils<>();
		pageUtils.setList(list);
		pageUtils.setPageSize(4);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		BsUser bsUser1=bsUserService.selectByPrimaryKey(userid);
		bsUser1.setUserMycollect(list.size());
	
		bsUserService.updateByPrimaryKeySelective(bsUser1);
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}
		System.out.println(pageUtils);
		
		return pageUtils;
	}
	
	@RequestMapping("deletepostcollect")
	@ResponseBody
	public Object deletepostcollect(@Param("collectpostid") String collectpostid,HttpServletRequest request){
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		int i= bsPostCollectService.deleteBycollectId(Integer.parseInt(collectpostid));
		if (i > 0) {
			BsUser bsUser= bsUserService.selectByPrimaryKey(userid);
			bsUser.setUserMycollect(bsUser.getUserMycollect()-1);
			bsUserService.updateByPrimaryKeySelective(bsUser);
			System.out.println("取消我收藏的文件");
			return true;
		} else {
			System.out.println("取消我收藏的文件失败");
			return false;
		}
		
	}		

	@RequestMapping("deletemyfocus")
	@ResponseBody
	public Object deletemyfocus(HttpServletRequest request,@Param("fansid") String fansid){
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		BsFans bsFans=new BsFans();
		bsFans.setMyFansId(Integer.parseInt(fansid));
		bsFans.setUserId(userid);
		int i= BsFansService.deleteBsFans(bsFans);
		
		if (i > 0) {
			BsUser bsUser= bsUserService.selectByPrimaryKey(userid);
			bsUser.setUserMyfocus(bsUser.getUserMyfocus()-1);
			bsUserService.updateByPrimaryKeySelective(bsUser);
			System.out.println("取消我的关注的");
			return true;
		} else {
			System.out.println("取消我的关注失败");
			return false;
		}
		
	}	
	@RequestMapping("imageSave")
	@ResponseBody
	public Object imageSave(@Param("file")String file,HttpServletRequest request,BsUser bsUser) throws IOException{
		System.out.println(file);
		String arr1= file.replace("/", " ");
		String arr2=arr1.replace(";", " ");
		String arr3[]=arr2.split(" ");
		String endName=arr3[1];
		System.out.println(endName);
		BASE64Decoder decoder=new BASE64Decoder();
		file=file.substring(23);
		byte[] imageByte=decoder.decodeBuffer(file);
		String path=request.getSession().getServletContext().getRealPath("");
		System.out.println(path);
		String contextPath=request.getContextPath();
		System.out.println(contextPath);
		path=path.replace(contextPath.substring(1), "")+"picture";
		System.out.println(path);
		File dir=new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String fileName=getFileName(endName);
		path=path+System.getProperty("file.separator")+fileName;
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		bsUser.setUserId(userid);
		bsUser.setUserPhoto("http://localhost:8080/"+fileName);
		request.getSession().setAttribute("user-img", bsUser.getUserPhoto());
	//	httpSession.setAttribute("user-img", ByUserName.getUserPhoto());
		bsUserService.updateByPrimaryKeySelective(bsUser);
		OutputStream out=new FileOutputStream(path);
		System.out.println("....."+path);
		out.write(imageByte);
		out.flush();
		out.close();
		return 1;
	}
}
