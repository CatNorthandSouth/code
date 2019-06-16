package cn.ts.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsSmallboard;
import cn.ts.service.BsFileService;
import cn.ts.service.BsSmallboardService;
import cn.ts.utils.PageUtils;

@Controller
public class HFileController {

	@Autowired
	BsFileService bsFileService;
	@Autowired
	BsSmallboardService bsSmallboardService;
	@RequestMapping("wenjianlist")
	public String  adminlist(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("pageid"));
		String RoleMenu = (String) request.getSession().getAttribute("RoleMenu");
		if (RoleMenu.contains(request.getParameter("pageid")) == true) {
			model.addAttribute("flag", true);
		} else {
			model.addAttribute("flag", false);
		}
		return "wenjian-list";
	}
	
	@RequestMapping("HdeleteFile")
	@ResponseBody
	public Object HdeletePost(@Param("postId") String postId){
		System.out.println(postId+"删除单个文件");
		int i= bsFileService.deletefile(Integer.parseInt(postId));
		if (i > 0) {
			System.out.println("删除成功");
			return true;
		} else {
			System.out.println("删除失败");
			return false;
		}
	}
	@RequestMapping("HdeleteFileList")
	@ResponseBody
	public Object HdeletePostList(@Param("postId") String postId){
		System.out.println("..."+postId);
		postId=postId.replace("[", "");
		postId=postId.replace("]", "");
		postId=postId.replace("\"", "");
		System.out.println("..."+postId);
		String[] str=postId.split(",");
		boolean flag=true;
		for (String string : str) {
			System.out.println("删除多个文件"+string);
			int i= bsFileService.deletefile(Integer.parseInt(string));
			if (i == 0) {
				return false;
			}
		}
		return true;
	}	
	@RequestMapping("HupdateFile")
	@ResponseBody
	public String insertPost(@Param("id") String id,@Param("title") String title,@Param("content") String content,@Param("typeid") String typeid){
		BsFile bsFile=new BsFile();
		System.out.println(typeid);
		
		bsFile.setFileType(Integer.parseInt(typeid));
		bsFile.setFileId(Integer.parseInt(id));
		bsFile.setFileDes(content);
		bsFile.setFileName(title);
		bsFileService.updateByPrimaryKeySelective(bsFile);
		return null;
	}	
	
	
	@RequestMapping("HfindFile")
	@ResponseBody
	public Object HfindPost(@Param("postId") String postId) throws ParseException{
		String str1= postId.replace("and", "!").trim();
		String[] str3=str1.split("!");
		System.out.println(str3.length);
		String[] str=new String[3];
		String str2=new String();
		int flag=0;
		if (str3.length == 1) {
			str2=str1.replace("!", "");
			
			flag=1;
		} else {
			flag=2;
			str=str1.split("!");
		}
		
		System.out.println(str1+str1.length()+str.length);
		
		BsFile bs=new BsFile();

		List<BsFile> list=new ArrayList<>();
		if (str.length == 3 && flag == 2) {
			System.out.println("1");
			
			list=bsFileService.selectByTimeANDName(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]),
					new SimpleDateFormat("yyyy-MM-dd").parse(str[1]),str[2]);
		} else if(str.length == 2 && flag == 2){
			System.out.println("2");
	
			list=bsFileService.selectByTime(new SimpleDateFormat("yyyy-MM-dd").parse(str[0]),
					new SimpleDateFormat("yyyy-MM-dd").parse(str[1]));
		}else if(flag == 1){
			System.out.println("3");
			bs.setFileName(str2);
			list=bsFileService.selectByFileTitle(bs);
		}else{
			return null;
		}
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	@RequestMapping("HselectFileList")
	@ResponseBody
	public Object HselectFileList() {
		List<BsFile> list= bsFileService.selectfile();
		System.out.println(list.size()+" "+list);
		return returnpage(list);
	}
	public PageUtils<Object> returnpage(List<BsFile> list) {
		List<String> listboard=new ArrayList<>();
		int i=0;
		for (BsFile bs : list) {

			String str= (bsSmallboardService.selectsmboIdByKey(bs.getFileType())).getSmboTitle();
			listboard.add(i, str);
			i++;
		}
		List<Object> listSUM=new ArrayList<>();
		listSUM.add(list);
		listSUM.add(listboard);
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
		
		return pageUtils;
	}
}
