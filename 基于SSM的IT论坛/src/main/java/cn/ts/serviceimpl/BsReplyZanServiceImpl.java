package cn.ts.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsReplyZan;
import cn.ts.mapper.BsReplyZanMapper;
import cn.ts.service.BsReplyZanService;
@Service
public class BsReplyZanServiceImpl implements BsReplyZanService{

	@Autowired
	BsReplyZanMapper BsReplyZanMapper;
	@Override
	public int deleteReplyZan(BsReplyZan record) {
		// TODO Auto-generated method stub
		return BsReplyZanMapper.deleteReplyZan(record);
	}

	@Override
	public int selectReplyGoogZan(BsReplyZan record) {
		// TODO Auto-generated method stub
		return BsReplyZanMapper.selectReplyGoogZan(record);
	}

	@Override
	public int selectReplyBadZan(BsReplyZan record) {
		// TODO Auto-generated method stub
		return BsReplyZanMapper.selectReplyBadZan(record);
	}

	@Override
	public int insert(BsReplyZan record) {
		// TODO Auto-generated method stub
		return BsReplyZanMapper.insert(record);
	}

	@Override
	public BsReplyZan selectReplyZan(BsReplyZan record) {
		// TODO Auto-generated method stub
		return BsReplyZanMapper.selectReplyZan(record);
	}

}
