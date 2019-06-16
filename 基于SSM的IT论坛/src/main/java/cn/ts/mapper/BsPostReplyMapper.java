package cn.ts.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsPostReply;

public interface BsPostReplyMapper {
    int deleteByPrimaryKey(Integer replyId);

    int deleteByreplyPostId(Integer replyPostId);
    int insert(BsPostReply record);

    int insertPost_reply(BsPostReply record);
    
    List<BsPostReply> selectBsPostReply();
    
    List<BsPostReply> selectBsPostReplyByreplyPostId(Integer replyId);

    BsPostReply selectreplyId(Integer replyId);
    int updateByPrimaryKeySelective(BsPostReply record);

    int updateByPrimaryKey(BsPostReply record);
    
	List<BsPostReply> selectByTimeANDName (@Param("starttime") Date start,@Param("endtime") Date end,@Param("fileName") String fileName);
	List<BsPostReply> selectByTime (@Param("starttime") Date start,@Param("endtime") Date end);
	List<BsPostReply> selectByReplyAdmin (BsPostReply record);    
}