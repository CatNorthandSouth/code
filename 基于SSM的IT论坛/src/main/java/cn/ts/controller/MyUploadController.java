package cn.ts.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsFileHistory;
import cn.ts.entity.BsSmallboard;
import cn.ts.service.BsFileHistoryService;
import cn.ts.service.BsFileService;
import cn.ts.service.BsSmallboardService;

@Controller
public class MyUploadController {
	@Autowired
	BsFileService bsFileService;
	@Autowired
	BsSmallboardService bsSmallboardService;
	@Autowired
	BsFileHistoryService bsFileHistoryService;
	@RequestMapping("selectfilelist1")
	@ResponseBody
	public Object selectfilelist1(HttpServletRequest request,@Param("typeId") String typeId,@Param("typeSort") String typeSort ){
		List<BsFile> list=new ArrayList<>();
		List<BsFileHistory> list1=new ArrayList<>();
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		BsFile bsFile=new BsFile();
		if (typeId.equals("0")) {
			if (typeSort.equals("0")) {
				list=bsFileService.selectfileUpId(userid);
				return list;
			} else {
				list1=bsFileHistoryService.selectByfileAdminId(userid);
				return list1;
			}
		} else {
			if (typeSort.equals("0")) {
				bsFile.setFileType(Integer.parseInt(typeId));
				bsFile.setFileUpId(userid);
				list=bsFileService.selectMY_filetimesortyfileType(bsFile);
				return list;
			} else {
				BsFileHistory bsFileHistory=new BsFileHistory();
				bsFileHistory.setFileUpId(userid);
				bsFileHistory.setFileType(Integer.parseInt(typeId));
				list1=bsFileHistoryService.selectfiletimesortByfileType(bsFileHistory);
				return list1;
			}			
		}
		
	}
	

	@RequestMapping("deleteMyFile")
	@ResponseBody
	public Object deleteMyFile(@Param("fileid") String fileid){
		int flag = bsFileService.deletefile(Integer.parseInt(fileid));
		if (flag == 1) {
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping("deleteMyFileHistory")
	@ResponseBody
	public Object deleteMyFileHistory(@Param("fileid") String fileid){
		int flag = bsFileHistoryService.deleteByPrimaryKey(Integer.parseInt(fileid));
		if (flag == 1) {
			return true;
		} else {
			return false;
		}
	}	
	
	@RequestMapping("searchFile1")
	@ResponseBody
	public Object searchFile1(HttpServletRequest request,@Param("content") String content,@Param("typeId") String typeId,@Param("typeSort") String typeSort ){
		BsFile bsFile=new BsFile();
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		int typeid=Integer.parseInt(typeId);
		bsFile.setFileDes(content);
		bsFile.setFileName(content);
		bsFile.setFileUpAdmin(content);
		bsFile.setFileUpId(userid);
		BsFileHistory bsFileHistory=new BsFileHistory();
		bsFileHistory.setFileDes(content);
		bsFileHistory.setFileName(content);
		bsFileHistory.setFileUpAdmin(content);
		bsFileHistory.setFileUpId(userid);
		List<BsFile> list=new ArrayList<>();
		List<BsFileHistory> list1=new ArrayList<>();
		System.out.println(bsFile);
		if (typeId.equals("0")) {
			if (typeSort.equals("0")) {
				list=bsFileService.selectMY_BySearchTimeSortNo(bsFile);
				return list;
			} else {
				list1=bsFileHistoryService.selectBySearchTimeSortNo(bsFileHistory);
				return list1;
			}
		} else {
			bsFile.setFileType(typeid);
			if (typeSort.equals("0")) {
				
				list=bsFileService.selectMY_BySearchTimeSort(bsFile);
				return list;
			} else {
				list1=bsFileHistoryService.selectBySearchTimeSort(bsFileHistory);
				return list1;
			}			
		}
		
	}
	@RequestMapping("togoMyUpload")
	public String togoMyUpload(){
		return "MyUpload";
	}
	@RequestMapping("FileMYUpload")
	public String FileMYUpload(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException, FileUploadException {
			request.setCharacterEncoding("utf-8");
			int userid=(int) request.getSession().getAttribute("sessionUserId");
			String username=(String) request.getSession().getAttribute("sessionUserName");
			String realpath=request.getSession().getServletContext().getRealPath("");
			String contextpath=request.getContextPath();
			System.out.println(realpath);
			System.out.println(contextpath);
			realpath=realpath.replace(contextpath.substring(1), "")+"fileUpload";
			System.out.println(realpath);
			FileItemFactory fileItemFactory=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(fileItemFactory);
			File file=new File(realpath);
			if (!file.exists()) {
				file.mkdirs();
			}
			
			upload.setFileSizeMax(1024*1024*1024);
			BsFile bsFile=new BsFile();
			bsFile.setFileCreateTime(new Date());
			bsFile.setFileUpAdmin(username);
			bsFile.setFileUpId(userid);
			List<String> strlist=new ArrayList<>();
			boolean isMultipart=ServletFileUpload.isMultipartContent(request);
			int i=0;
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
						} else {
							System.out.println("这是一个文件表单元素");
							String name=fileItem.getName();
							
							String filename=UUID.randomUUID().toString()+"_"+name.substring(name.lastIndexOf("."));
							realpath=realpath+System.getProperty("file.separator")+filename;
							String endname=filename.replace(".", " ");
							String[] endname1=endname.split(" ");
							bsFile.setFilePicture("http://localhost:8080/"+endname1[1]+".png");
							bsFile.setFilePath("http://localhost:8080/"+"fileUpload/"+filename);
							File f=new File(realpath);
							System.out.println(fileItem.getSize());
							bsFile.setFileSize((double)fileItem.getSize());
							fileItem.write(f);
						}
					}
					bsFile.setFileName(strlist.get(0));
					bsFile.setFileType(Integer.parseInt(strlist.get(1)));
					bsFile.setFileDes(strlist.get(2));
					bsFile.setFileLoadCount(0);
					System.out.println(bsFile);
					bsFileService.insertfile(bsFile);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			return "MyUpload";
	}	
	
	
}
