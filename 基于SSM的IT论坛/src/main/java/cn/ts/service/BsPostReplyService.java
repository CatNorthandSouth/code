package cn.ts.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsPostReply;

public interface BsPostReplyService {
	
    List<BsPostReply> selectBsPostReply();
    int deleteByreplyPostId(Integer replyPostId);
    List<BsPostReply> selectBsPostReplyByreplyPostId(Integer replyId);
    
    int insertPost_reply(BsPostReply record);
    
    int deleteByPrimaryKey(Integer replyId);
    BsPostReply selectreplyId(Integer replyId);
    int updateByPrimaryKeySelective(BsPostReply record);  
    
	List<BsPostReply> selectByTimeANDName (@Param("starttime") Date start,@Param("endtime") Date end,@Param("fileName") String fileName);
	List<BsPostReply> selectByTime (@Param("starttime") Date start,@Param("endtime") Date end);
	List<BsPostReply> selectByReplyAdmin (BsPostReply bs);   
}
