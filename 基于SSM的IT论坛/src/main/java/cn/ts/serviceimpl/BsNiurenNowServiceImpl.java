package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsNiuren;
import cn.ts.entity.BsNiurenNow;
import cn.ts.mapper.BsNiurenMapper;
import cn.ts.mapper.BsNiurenNowMapper;
import cn.ts.service.BsNiurenNowService;
import cn.ts.service.BsNiurenService;
@Service
public class BsNiurenNowServiceImpl implements BsNiurenNowService {

	@Autowired
	BsNiurenNowMapper bsNiurenNowMapper;

	@Override
	public int insertNiuRen(BsNiurenNow record) {
		// TODO Auto-generated method stub
		return bsNiurenNowMapper.insertNiuRen(record);
	}

	@Override
	public List<BsNiurenNow> selectAllNiuRen() {
		// TODO Auto-generated method stub
		return bsNiurenNowMapper.selectAllNiuRen();
	}

	@Override
	public List<BsNiurenNow> selectByWeekScore() {
		// TODO Auto-generated method stub
		return bsNiurenNowMapper.selectByWeekScore();
	}

	@Override
	public List<BsNiurenNow> selectByMonthScore() {
		// TODO Auto-generated method stub
		return bsNiurenNowMapper.selectByMonthScore();
	}

	@Override
	public List<BsNiurenNow> selectByYearScore() {
		// TODO Auto-generated method stub
		return bsNiurenNowMapper.selectByYearScore();
	}

	@Override
	public BsNiurenNow selectByUser_id(int userid) {
		// TODO Auto-generated method stub
		return bsNiurenNowMapper.selectByUser_id(userid);
	}

	@Override
	public int updateByPrimaryKey(BsNiurenNow record) {
		// TODO Auto-generated method stub
		return bsNiurenNowMapper.updateByPrimaryKey(record);
	}
	

}
