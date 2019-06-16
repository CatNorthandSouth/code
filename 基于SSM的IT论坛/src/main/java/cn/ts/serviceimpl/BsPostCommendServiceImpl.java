package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsPostCommend;
import cn.ts.mapper.BsPostCommendMapper;
import cn.ts.service.BsPostCommendService;
@Service
public class BsPostCommendServiceImpl implements BsPostCommendService {

	@Autowired
	BsPostCommendMapper BsPostCommendMapper;
	@Override
	public List<BsPostCommend> selectByPostId() {
		// TODO Auto-generated method stub
		List<BsPostCommend> list=BsPostCommendMapper.selectByPostId();
		return list;
	}
	@Override
	public BsPostCommend selectBypocoPostId(int postid) {
		// TODO Auto-generated method stub
		return BsPostCommendMapper.selectBypocoPostId(postid);
	}
	@Override
	public int deleteByPrimaryKey(Integer pocoId) {
		// TODO Auto-generated method stub
		return BsPostCommendMapper.deleteByPrimaryKey(pocoId);
	}
	@Override
	public int insert(BsPostCommend record) {
		// TODO Auto-generated method stub
		return BsPostCommendMapper.insert(record);
	}

}
