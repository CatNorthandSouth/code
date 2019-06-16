package cn.ts.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sun.imageio.plugins.common.ImageUtil;

import cn.ts.entity.BsBigboard;
import cn.ts.entity.BsFilterWord;
import cn.ts.entity.BsPostCollect;
import cn.ts.entity.BsPostReply;
import cn.ts.entity.BsPostZan;
import cn.ts.entity.BsPosts;
import cn.ts.entity.BsReplyZan;
import cn.ts.entity.BsSmallboard;
import cn.ts.entity.BsUser;
import cn.ts.service.BsBigboardService;
import cn.ts.service.BsFilterWordService;
import cn.ts.service.BsPostCollectService;
import cn.ts.service.BsPostReplyService;
import cn.ts.service.BsPostZanService;
import cn.ts.service.BsPostsService;
import cn.ts.service.BsReplyZanService;
import cn.ts.service.BsSmallboardService;
import cn.ts.service.BsUserService;
import cn.ts.utils.PageUtils;
import sun.misc.BASE64Decoder;

@Controller
public class PostDetailsController {

	@Autowired
	BsPostsService bsPostsService;
	@Autowired
	BsUserService BsUserService;
	@Autowired
	BsPostReplyService BsPostReplyService;
	@Autowired
	BsPostCollectService BsPostCollectService;
	@Autowired
	BsBigboardService BsBigboardService;
	@Autowired
	BsSmallboardService BsSmallboardService;
	@Autowired
	BsPostZanService BsPostZanService;
	@Autowired
	BsReplyZanService BsReplyZanService;
	@Autowired
	BsFilterWordService BsFilterWordService;
	@RequestMapping("updatezan")
	@ResponseBody
	public Object updatezan(@Param("postId") String postId){
		BsPosts bsPosts = bsPostsService.selectPostsByPostId(Integer.parseInt(postId));
		return bsPosts;
	}
	
	@RequestMapping("updatereplyzan")
	@ResponseBody
	public Object updatereplyzan(@Param("postId") String postId){
		BsPostReply bsPostReply=BsPostReplyService.selectreplyId(Integer.parseInt(postId));
		System.out.println("...................."+bsPostReply);
		return bsPostReply;
	}
	
	@RequestMapping("clickreplybadzan")
	@ResponseBody
	public void clickreplybadzan(@Param("replyid") String replyid,HttpServletRequest request){
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		System.out.println("回复bad ....."+replyid);
		BsReplyZan bsReplyZan =new BsReplyZan();
		bsReplyZan.setUserId(userId);
		bsReplyZan.setReplyId(Integer.parseInt(replyid));
		bsReplyZan.setState(0);
		BsReplyZan bsReplyZan2=BsReplyZanService.selectReplyZan(bsReplyZan);
		BsPostReply bsPostReply=BsPostReplyService.selectreplyId(Integer.parseInt(replyid));
	
		if (bsReplyZan2 == null) {
			System.out.println("回复good。。。。1");
			BsReplyZanService.insert(bsReplyZan);
			bsPostReply.setReplyBadCount(bsPostReply.getReplyBadCount()+1);
			BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
			
		} else {
			if (bsReplyZan2.getState() == 1) {
				BsReplyZanService.deleteReplyZan(bsReplyZan2);
				BsReplyZanService.insert(bsReplyZan);
				bsPostReply.setReplyGoodCount(bsPostReply.getReplyGoodCount()-1);
				bsPostReply.setReplyBadCount(bsPostReply.getReplyBadCount()+1);
				BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
			} else {
				bsPostReply.setReplyBadCount(bsPostReply.getReplyBadCount()-1);
				BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
				BsReplyZanService.deleteReplyZan(bsReplyZan2);
			}
		}

	}	
	
	@RequestMapping("clickreplygoodzan")
	@ResponseBody
	public void clickreplygoodzan(@Param("replyid") String replyid,HttpServletRequest request){
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		System.out.println("回复good ....."+replyid);
		BsReplyZan bsReplyZan =new BsReplyZan();
		bsReplyZan.setUserId(userId);
		bsReplyZan.setReplyId(Integer.parseInt(replyid));
		bsReplyZan.setState(1);
		BsReplyZan bsReplyZan2=BsReplyZanService.selectReplyZan(bsReplyZan);
		BsPostReply bsPostReply=BsPostReplyService.selectreplyId(Integer.parseInt(replyid));
	
		if (bsReplyZan2 == null) {
			System.out.println("回复good。。。。1");
			BsReplyZanService.insert(bsReplyZan);
			bsPostReply.setReplyGoodCount(bsPostReply.getReplyGoodCount()+1);
			BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
			
		} else {
			if (bsReplyZan2.getState() == 0) {
				BsReplyZanService.deleteReplyZan(bsReplyZan2);
				BsReplyZanService.insert(bsReplyZan);
				bsPostReply.setReplyGoodCount(bsPostReply.getReplyGoodCount()+1);
				bsPostReply.setReplyBadCount(bsPostReply.getReplyBadCount()-1);
				BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
			} else {
				bsPostReply.setReplyGoodCount(bsPostReply.getReplyGoodCount()-1);
				BsPostReplyService.updateByPrimaryKeySelective(bsPostReply);
				BsReplyZanService.deleteReplyZan(bsReplyZan2);
			}
		}

	}
	
	
	@RequestMapping("clickpostbadzan")
	@ResponseBody
	public void clickpostbadzan(@Param("postId") String postId,HttpServletRequest request){
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		BsPostZan bsPostZan=new BsPostZan();
		bsPostZan.setUserId(userId);
		bsPostZan.setPostId(Integer.parseInt(postId));
		bsPostZan.setState(0);
		BsPosts bsPosts = bsPostsService.selectPostsByPostId(Integer.parseInt(postId));
		System.out.println("........."+postId);
		BsPostZan bsPostZan2 = BsPostZanService.selectPostZan(bsPostZan);
		System.out.println("....1..");
		if ( bsPostZan2 == null) {
			System.out.println("....2.1..");
			bsPosts.setPostBadCount(bsPosts.getPostBadCount()+1);
			BsPostZanService.insert(bsPostZan);
			System.out.println("....2.2..");
			bsPostsService.updateByPrimaryKeySelective(bsPosts);
			System.out.println("....2..");
		} else {
			System.out.println("....3.1.."+bsPostZan2.toString());
			if (bsPostZan2.getState() == 1) {
				bsPosts.setPostBadCount(bsPosts.getPostBadCount()+1);
				bsPosts.setPostGoodCount(bsPosts.getPostGoodCount()-1);
				bsPostsService.updateByPrimaryKeySelective(bsPosts);
				BsPostZanService.deletePostcount(bsPostZan2);
				BsPostZanService.insert(bsPostZan);
			} else {
				bsPosts.setPostBadCount(bsPosts.getPostBadCount()-1);
				bsPostsService.updateByPrimaryKeySelective(bsPosts);
				BsPostZanService.deletePostcount(bsPostZan2);
			}
			
			System.out.println("....3..");
		}
		System.out.println(".......4..");
	}
	
	
	@RequestMapping("clickpostgoodzan")
	@ResponseBody
	public void clickpostgoodzan(@Param("postId") String postId,HttpServletRequest request){
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		BsPostZan bsPostZan=new BsPostZan();
		bsPostZan.setUserId(userId);
		bsPostZan.setPostId(Integer.parseInt(postId));
		bsPostZan.setState(1);
		BsPosts bsPosts = bsPostsService.selectPostsByPostId(Integer.parseInt(postId));
		System.out.println("........."+postId);
		BsPostZan bsPostZan2 = BsPostZanService.selectPostZan(bsPostZan);
		System.out.println("....1..");
		if ( bsPostZan2 == null) {
			System.out.println("....2.1..");
			bsPosts.setPostGoodCount(bsPosts.getPostGoodCount()+1);
			BsPostZanService.insert(bsPostZan);
			System.out.println("....2.2..");
			bsPostsService.updateByPrimaryKeySelective(bsPosts);
			System.out.println("....2..");
		} else {
			System.out.println("....3.1.."+bsPostZan2.toString());
			if (bsPostZan2.getState() == 0) {
				bsPosts.setPostBadCount(bsPosts.getPostBadCount()-1);
				bsPosts.setPostGoodCount(bsPosts.getPostGoodCount()+1);
				bsPostsService.updateByPrimaryKeySelective(bsPosts);
				BsPostZanService.deletePostcount(bsPostZan2);
				BsPostZanService.insert(bsPostZan);
			} else {
				bsPosts.setPostGoodCount(bsPosts.getPostGoodCount()-1);
				bsPostsService.updateByPrimaryKeySelective(bsPosts);
				BsPostZanService.deletePostcount(bsPostZan2);
			}
			
			System.out.println("....3..");
		}
		System.out.println(".......4..");
	}
	
	@RequestMapping("collectpoststate")
	@ResponseBody
	public Object collectpoststate(HttpServletRequest request){
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		int postId=(int) request.getSession().getAttribute("sessionPostDetailsId");
		BsPostCollect bsPostCollect=new BsPostCollect();
		bsPostCollect.setCollectPostId(postId);
		bsPostCollect.setCollectAdminId(userId);
		BsPostCollect bsPostCollect2= BsPostCollectService.selectByPostAdminIdAndPostid(bsPostCollect);
		if (bsPostCollect2 == null) {
			System.out.println("..----..."+bsPostCollect2);
			return "1";
		} else {
			System.out.println("..++++..."+bsPostCollect2);
			return "0";
		}
	}
	
	@RequestMapping("togoPostDetails")
	public String selectPostDetails(HttpServletRequest request,Model model){
		int postId=Integer.parseInt(request.getParameter("id"));
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		
		//点击量
		
		BsPosts bsPosts = bsPostsService.selectPostsByPostId(postId);
		bsPosts.setPostReward(bsPosts.getPostReward()+1);
		bsPostsService.updateByPrimaryKeySelective(bsPosts);
		BsUser bsUser=BsUserService.selectByUserName(bsPosts.getPostAdmin());
		BsBigboard bsBigboard=BsBigboardService.selectBsBigboardByKey(bsPosts.getPostBiboId());
		BsSmallboard bsSmallboard= BsSmallboardService.selectsmboIdByKey(bsPosts.getPostSmboId());
		List<BsPostReply> list=BsPostReplyService.selectBsPostReplyByreplyPostId(postId);
		model.addAttribute("bsPosts", bsPosts);
		model.addAttribute("louzhubsUser", bsUser);
		model.addAttribute("huifushu", list.size());
		if (bsPosts.getPostBiboId() == 0 && bsPosts.getPostSmboId() == 0) {
			model.addAttribute("postDetailsName1", "论坛");
			model.addAttribute("postDetailsName2", "公告");			
		} else {
			model.addAttribute("postDetailsName1", bsBigboard.getBiboTitle());
			model.addAttribute("postDetailsName2", bsSmallboard.getSmboTitle());
		}

		request.getSession().setAttribute("sessionPostDetailsId", postId);
		
		return "postDetails";
	}
	
	public String filterWord(String text){
		String str=new String();
		List<BsFilterWord> list = BsFilterWordService.selectByExample();
		if (list.size() > 0) {
			String strFilter=list.get(list.size()-1).getWord();
			String[] strRules = strFilter.split(" ");
			System.out.println(strFilter);
			for (String string : strRules) {
				System.out.println(string);
			}
			for (String rule : strRules) {
				boolean flag = text.contains(rule);
				if (flag == true) {
					str="";
					for (int i = 0; i < rule.length(); i++) {
						str=str+"*";
					}
					//System.out.println(rule);
					String t=text.replace(rule, str);
					text=t;
					//System.out.println("拦截"+t);
					//System.out.println(text);
				} 
			}
		}
		return text;
	}
	
	@RequestMapping("insertPostReply")
	@ResponseBody
	public Object insertPostDetails(HttpServletRequest request,@Param("replyContent") String replyContent){
		int postId=(int) request.getSession().getAttribute("sessionPostDetailsId");
		String userName=(String) request.getSession().getAttribute("sessionUserName");
		BsPosts bsPosts = bsPostsService.selectPostsByPostId(postId);
		BsUser bsUser=BsUserService.selectByUserName(userName);
		
		BsPostReply bsPostReply=new BsPostReply();
		bsPostReply.setReplyPostId(postId);
		bsPostReply.setReplyAdmin(userName);
		bsPostReply.setReplyBadCount(0);
		bsPostReply.setReplyGoodCount(0);
		bsPostReply.setReplyScore(0);
		bsPostReply.setReplyCreateTime(new Date());
		bsPostReply.setReplyBiboId(bsPosts.getPostBiboId());
		bsPostReply.setReplySmboId(bsPosts.getPostSmboId());
		bsPostReply.setReplyContent(filterWord(replyContent));
		System.out.println(bsPostReply);
		BsPostReplyService.insertPost_reply(bsPostReply);
		
		return true;
	}
	
	@RequestMapping("selectReplyList")
	@ResponseBody
	public Object selectReplyList(HttpServletRequest request){
		int postId=(int) request.getSession().getAttribute("sessionPostDetailsId");
		List<BsPostReply> BsPostReplyList= BsPostReplyService.selectBsPostReplyByreplyPostId(postId);
		List<BsUser> BsUserList = new ArrayList<>();
		int i=0;
 		for (BsPostReply bsPostReply : BsPostReplyList) {
			BsUser bsUser=BsUserService.selectByReplyAdmin(bsPostReply.getReplyAdmin());
			BsUserList.add(i, bsUser);
			i++;
		}
 		List<Object> list=new ArrayList<>();
 		list.add(BsPostReplyList);
 		list.add(BsUserList);
		PageUtils<Object> pageUtils=new PageUtils<>();
		pageUtils.setList(list);	
		pageUtils.setPageSize(3);
		pageUtils.setPageIndex(1);
		pageUtils.setPageCount(BsPostReplyList.size());
		if (list.size()%pageUtils.getPageSize()==0) {
			pageUtils.setPageNumber(BsPostReplyList.size()/pageUtils.getPageSize());
		} else {
			pageUtils.setPageNumber(BsPostReplyList.size()/pageUtils.getPageSize()+1);
		}
		
		//System.out.println(pageUtils);
		//System.out.println(pageUtils);
		return pageUtils; 		
	}
	
	
	@RequestMapping("insertCollectPost")
	@ResponseBody
	public Object insertCollectPost(HttpServletRequest request,@Param("flag") String flag,@Param("postContent") String postContent,@Param("userName") String userName,@Param("postId") String postId){
		int userId=(int) request.getSession().getAttribute("sessionUserId");
		BsPostCollect bsPostCollect=new BsPostCollect();
		bsPostCollect.setCollectPostAdmin(userName);
		bsPostCollect.setCollectPostTime(new Date());
		bsPostCollect.setCollectPostTitle(postContent);
		bsPostCollect.setCollectAdminId(userId);
		bsPostCollect.setCollectPostId(Integer.parseInt(postId));
		if (flag.equals("2")) {
			BsPostCollectService.deleteBycollectPostId(Integer.parseInt(postId));
			
		} else if(flag.equals("1")){
			BsPostCollectService.insertCollectPost(bsPostCollect);
		}
		
		return "success";
	}
	private String getFileName(String endName) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String timeStr=sdf.format(new Date());
		String str=RandomStringUtils.random(5, "qwertyuiopasdfghjklzxcvbnm0123456789");
		String name=timeStr+str+"."+endName;
		return name;
	}
	
	@RequestMapping("postimgupload")
	@ResponseBody
	public String postimgupload(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IOException{
		System.out.println(file.getContentType());
		
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
		String fileoldname=file.getContentType();
		System.out.println(fileoldname);
		String[] endname=fileoldname.split("/");
		for (String string : endname) {
			System.out.println(string);
		}
		String filenewname=getFileName(endname[1]);
		path=path+System.getProperty("file.separator")+filenewname;
		System.out.println(path);
		File newfile=new File(path);
		file.transferTo(newfile);
		 Map<String,Object> map = new HashMap<String,Object>();
         Map<String,Object> map2 = new HashMap<String,Object>();
         map.put("code",0);//0表示成功，1失败
         map.put("msg","上传成功");//提示消息
         map.put("data",map2);
         map2.put("src","http://localhost:8080/"+filenewname);//图片url
         map2.put("title",filenewname);//图片名称，这个会显示在输入框里
         //String result = new JSONObject(map).toString();
         return JSON.toJSONString(map);	
		
	}
	
}
