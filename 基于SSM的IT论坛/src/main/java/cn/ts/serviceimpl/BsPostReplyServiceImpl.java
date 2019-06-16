package cn.ts.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsPostReply;
import cn.ts.mapper.BsPostReplyMapper;
import cn.ts.mapper.BsPostsMapper;
import cn.ts.service.BsPostReplyService;
@Service
public class BsPostReplyServiceImpl implements BsPostReplyService {

	@Autowired
	BsPostReplyMapper bsPostReplyMapper;
	@Override
	public List<BsPostReply> selectBsPostReply() {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.selectBsPostReply();
	}

	@Override
	public List<BsPostReply> selectBsPostReplyByreplyPostId(Integer replyId) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.selectBsPostReplyByreplyPostId(replyId);
	}

	@Override
	public int insertPost_reply(BsPostReply record) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.insertPost_reply(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer replyId) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.deleteByPrimaryKey(replyId);
	}

	@Override
	public int updateByPrimaryKeySelective(BsPostReply record) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<BsPostReply> selectByTimeANDName(Date start, Date end, String fileName) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.selectByTimeANDName(start, end, fileName);
	}

	@Override
	public List<BsPostReply> selectByTime(Date start, Date end) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.selectByTime(start, end);
	}

	@Override
	public List<BsPostReply> selectByReplyAdmin(BsPostReply record) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.selectByReplyAdmin(record);
	}

	@Override
	public BsPostReply selectreplyId(Integer replyId) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.selectreplyId(replyId);
	}

	@Override
	public int deleteByreplyPostId(Integer replyPostId) {
		// TODO Auto-generated method stub
		return bsPostReplyMapper.deleteByreplyPostId(replyPostId);
	}

}
