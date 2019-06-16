package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsFans;
import cn.ts.mapper.BsFansMapper;
import cn.ts.service.BsFansService;
@Service
public class BsFansServiceImpl implements BsFansService {

	@Autowired
	BsFansMapper BsFansMapper;
	@Override
	public int insertBsFans(BsFans record) {
		// TODO Auto-generated method stub
		return BsFansMapper.insertBsFans(record);
	}

	@Override
	public int deleteBsFans(BsFans record) {
		// TODO Auto-generated method stub
		return BsFansMapper.deleteBsFans(record);
	}

	@Override
	public List<BsFans> selectByUserId(Integer fansId) {
		// TODO Auto-generated method stub
		return BsFansMapper.selectByUserId(fansId);
	}

	@Override
	public BsFans selectByUserIdAndMyFansId(BsFans record) {
		// TODO Auto-generated method stub
		return BsFansMapper.selectByUserIdAndMyFansId(record);
	}

	@Override
	public List<BsFans> selectByMyFansId(int fansId) {
		// TODO Auto-generated method stub
		return BsFansMapper.selectByMyFansId(fansId);
	}

}
