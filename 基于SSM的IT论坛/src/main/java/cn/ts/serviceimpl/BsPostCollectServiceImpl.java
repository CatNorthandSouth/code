package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsPostCollect;
import cn.ts.mapper.BsPostCollectMapper;
import cn.ts.service.BsPostCollectService;
@Service
public class BsPostCollectServiceImpl implements BsPostCollectService {

	@Autowired
	BsPostCollectMapper BsPostCollectMapper;
	@Override
	public int deleteBycollectPostId(Integer collectPostId) {
		// TODO Auto-generated method stub
		return BsPostCollectMapper.deleteBycollectPostId(collectPostId);
	}

	@Override
	public int insertCollectPost(BsPostCollect record) {
		// TODO Auto-generated method stub
		return BsPostCollectMapper.insertCollectPost(record);
	}

	@Override
	public BsPostCollect selectByCollectPostAdmin(String collectPostAdmin) {
		// TODO Auto-generated method stub
		return BsPostCollectMapper.selectByCollectPostAdmin(collectPostAdmin);
	}

	@Override
	public List<BsPostCollect> selectByAllCollectPostAdmin(String collectPostAdmin) {
		// TODO Auto-generated method stub
		return BsPostCollectMapper.selectByAllCollectPostAdmin(collectPostAdmin);
	}

	@Override
	public int deleteBycollectId(int collectid) {
		// TODO Auto-generated method stub
		return BsPostCollectMapper.deleteBycollectId(collectid);
	}

	@Override
	public List<BsPostCollect> selectByPostAdminId(int postadminid) {
		// TODO Auto-generated method stub
		return BsPostCollectMapper.selectByPostAdminId(postadminid);
	}

	@Override
	public BsPostCollect selectByPostAdminIdAndPostid(BsPostCollect bsPostCollect) {
		// TODO Auto-generated method stub
		return BsPostCollectMapper.selectByPostAdminIdAndPostid(bsPostCollect);
	}



}
