package cn.ts.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsLunbo;
import cn.ts.entity.BsUser;
import cn.ts.service.BsLunboService;
import cn.ts.utils.PageUtils;
import sun.misc.BASE64Decoder;

@Controller
public class HlunboController {

	@Autowired
	BsLunboService BsLunboService;
	@RequestMapping("bannerlist")
	public String  bannerlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid")+"...");
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "banner-list";
	}

	@RequestMapping("FileUpload1")
	public void FileUpload(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException, FileUploadException {
			request.setCharacterEncoding("utf-8");
			System.out.println("....");
			int userid=(int) request.getSession().getAttribute("sessionUserId");
			String username=(String) request.getSession().getAttribute("sessionUserName");
			String realpath=request.getSession().getServletContext().getRealPath("");
			String contextpath=request.getContextPath();
			System.out.println(realpath);
			System.out.println(contextpath);
			realpath=realpath.replace(contextpath.substring(1), "")+"picture";
			System.out.println(realpath);
			FileItemFactory fileItemFactory=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(fileItemFactory);
			File file=new File(realpath);
			if (!file.exists()) {
				file.mkdirs();
			}
			
			upload.setFileSizeMax(1024*1024*1024);
			List<String> strlist=new ArrayList<>();
			boolean isMultipart=ServletFileUpload.isMultipartContent(request);
			int i=0;
			BsLunbo bsLunbo=new BsLunbo();
			if (isMultipart) {
				List<FileItem> list;
				try {
					list = upload.parseRequest(request);
					for (FileItem fileItem : list) {
						if (fileItem.isFormField()) {
							System.out.println(fileItem.getFieldName());
							System.out.println(new String(fileItem.getString().getBytes("iso-8859-1"),"utf-8"));
							strlist.add(i,new String(fileItem.getString().getBytes("iso-8859-1"),"utf-8"));
							i++;
							bsLunbo.setLunboState(Integer.parseInt(new String(fileItem.getString().getBytes("iso-8859-1"),"utf-8")));
						} else {
							System.out.println("这是一个文件表单元素");
							String name=fileItem.getName();
							
							String filename=UUID.randomUUID().toString()+"_"+name.substring(name.lastIndexOf("."));
							realpath=realpath+System.getProperty("file.separator")+filename;
							String endname=filename.replace(".", " ");
							String[] endname1=endname.split(" ");
							
							bsLunbo.setLunboPath("http://localhost:8080/"+filename);
							File f=new File(realpath);
							System.out.println(fileItem.getSize());
						
							fileItem.write(f);
						}
					}
					BsLunboService.insert(bsLunbo);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
	}	
	
	@RequestMapping("HselectlunboList")
	@ResponseBody
	public Object HselectPostList() {
		List<BsLunbo> list=BsLunboService.selectAll(); 
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	public PageUtils<Object> returnpage(List<BsLunbo> list) {
		List<String> listboard=new ArrayList<>();
		List<String> listadmin=new ArrayList<>();
		int i=0;
	
		List<Object> listSUM=new ArrayList<>();
		listSUM.add(list);
		listSUM.add(listboard);
		listSUM.add(listadmin);
		PageUtils<Object> pageUtils=new PageUtils<>();
		pageUtils.setList(listSUM);
		pageUtils.setPageSize(7);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(list.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(list.size()/pageUtils.getPageSize()+1);
		}		
		System.out.println(".."+pageUtils.toString());
		return pageUtils;
	}
	@RequestMapping("showlunbo")
	@ResponseBody
	public Object showlunbo(@Param("postId") String postId){
		BsLunbo bsLunbo=new BsLunbo();
		bsLunbo.setLunboId(Integer.parseInt(postId));
		bsLunbo.setLunboState(1);
		int i=BsLunboService.updateByPrimaryKeySelective(bsLunbo);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping("unshowlunbo")
	@ResponseBody
	public Object unshowlunbo(@Param("postId") String postId){
		BsLunbo bsLunbo=new BsLunbo();
		bsLunbo.setLunboId(Integer.parseInt(postId));
		bsLunbo.setLunboState(0);
		int i=BsLunboService.updateByPrimaryKeySelective(bsLunbo);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}	
	@RequestMapping("deletelunbo")
	@ResponseBody
	public Object deletelunbo(@Param("postId") String postId){
		int i=BsLunboService.deleteByPrimaryKey(Integer.parseInt(postId));
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}
}
