package cn.ts.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsRank;
import cn.ts.mapper.BsRankMapper;
import cn.ts.service.BsRankService;
@Service
public class BsRankServiceImpl implements BsRankService {

	@Autowired
	BsRankMapper BsRankMapper;
	@Override
	public int deleteByUserId(Integer userid) {
		// TODO Auto-generated method stub
		return BsRankMapper.deleteByUserId(userid);
	}

	@Override
	public int insert(BsRank record) {
		// TODO Auto-generated method stub
		return BsRankMapper.insert(record);
	}

	@Override
	public BsRank selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return BsRankMapper.selectByPrimaryKey(id);
	}

	@Override
	public BsRank selectByUserId(int userid) {
		// TODO Auto-generated method stub
		return BsRankMapper.selectByUserId(userid);
	}

	@Override
	public int updateByPrimaryKeySelective(BsRank record) {
		// TODO Auto-generated method stub
		return BsRankMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(BsRank record) {
		// TODO Auto-generated method stub
		return BsRankMapper.updateByPrimaryKey(record);
	}

}
