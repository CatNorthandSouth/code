package cn.ts.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsFileHistory;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsUser;
import cn.ts.mapper.BsFileHistoryMapper;
import cn.ts.service.BsFileHistoryService;
import cn.ts.service.BsFileService;
import cn.ts.service.BsSmallboardService;
import sun.misc.BASE64Decoder;

@Controller
public class FileUpload {
	
	@Autowired
	BsFileService bsFileService;
	@Autowired
	BsFileHistoryService bsFileHistoryService;
	@Autowired
	BsSmallboardService bsSmallboardService;
	private String getFileName(String endName) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String timeStr=sdf.format(new Date());
		String str=RandomStringUtils.random(5, "qwertyuiopasdfghjklzxcvbnm0123456789");
		String name=timeStr+str+"."+endName;
		return name;
	}
	@RequestMapping("togodownloadpage")
	public Object togodownloadpage(){
		return "download";
	}
	
	@RequestMapping("selecttypelistAll")
	@ResponseBody
	public Object selecttypelistAll(){
		List<BsSmallboard> list= bsSmallboardService.selectAll();
		return list;
	}
	@RequestMapping("hiddenUserId")
	@ResponseBody
	public Object hiddenUserId(HttpServletRequest request){
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		return userid;
	}
	
	@RequestMapping("selectfilelist")
	@ResponseBody
	public Object selectfilelist(@Param("typeId") String typeId,@Param("typeSort") String typeSort ){
		List<BsFile> list=new ArrayList<>();
		if (typeId.equals("0")) {
			if (typeSort.equals("0")) {
				list=bsFileService.selectfiletimesort();
			} else {
				list=bsFileService.selectfileloadcountsort();
			}
		} else {
			if (typeSort.equals("0")) {
				list=bsFileService.selectfiletimesortyfileType(Integer.parseInt(typeId));
			} else {
				list=bsFileService.selectfileloadcountsortByfileType(Integer.parseInt(typeId));
			}			
		}
		return list;
	}
	
	@RequestMapping("FileUpload")
	public String FileUpload(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException, FileUploadException {
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
			return "download";
	}
	@RequestMapping("fileDownload")
	public void fileDownload(HttpServletResponse response,HttpServletRequest request) throws FileNotFoundException{
		String realpath=request.getSession().getServletContext().getRealPath("");
		String path=request.getContextPath();
		realpath=realpath.replace(path.substring(1), "")+"fileUpload";
		response.setHeader("Content-type", "application/octet-stream");
		int userid=(int) request.getSession().getAttribute("sessionUserId");
		
		BsFile bsFile=bsFileService.selectfileByid(Integer.parseInt(request.getParameter("id")));
		BsFileHistory bsFileHistory=new BsFileHistory();
		bsFileHistory.setFileUpId(userid);
		bsFileHistory.setFileUpAdmin(bsFile.getFileUpAdmin());
		bsFileHistory.setFileType(bsFile.getFileType());
		bsFileHistory.setFileSize(bsFile.getFileSize());
		bsFileHistory.setFilePicture(bsFile.getFilePicture());
		bsFileHistory.setFilePath(bsFile.getFilePath());
		bsFileHistory.setFileName(bsFile.getFileName());
		bsFileHistory.setFileLoadCount(bsFile.getFileLoadCount());
		bsFileHistory.setFileId(bsFile.getFileId());
		bsFileHistory.setFileDes(bsFile.getFileDes());
		bsFileHistory.setFileCreateTime(new Date());
		bsFileHistoryService.insert(bsFileHistory);
		
		String name=bsFile.getFilePath();
		name=name.replaceAll("http://localhost:8080/fileUpload/", "");
		System.out.println(name);
		response.setHeader("Content-Disposition", "attachment;filename=apache-"+name);
		FileInputStream in;
		try {
			System.out.println(realpath+File.separator+name);
			in = new FileInputStream(realpath+File.separator+name);
			OutputStream out=response.getOutputStream();
			byte[] buffer=new byte[2048];
			int len=-1;
			while ((len=in.read(buffer))!=-1) {
				out.write(buffer,0,len);
				System.out.println(len);
			}
			out.close();
			System.out.println("++++++");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@RequestMapping("searchFile")
	@ResponseBody
	public Object searchFile(@Param("content") String content,@Param("typeId") String typeId,@Param("typeSort") String typeSort ){
		BsFile bsFile=new BsFile();
		int typeid=Integer.parseInt(typeId);
		bsFile.setFileDes(content);
		bsFile.setFileName(content);
		bsFile.setFileUpAdmin(content);
		List<BsFile> list=new ArrayList<>();
		if (typeId.equals("0")) {
			if (typeSort.equals("0")) {
				list=bsFileService.selectBySearchTimeSortNo(bsFile);
			} else {
				list=bsFileService.selectBySearchLoadCountNo(bsFile);
			}
		} else {
			bsFile.setFileType(typeid);
			if (typeSort.equals("0")) {
				
				list=bsFileService.selectBySearchTimeSort(bsFile);
			} else {
				list=bsFileService.selectBySearchLoadCount(bsFile);
			}			
		}
		System.out.println(list.size()+"  "+list);
		return list;
	}
	
}
