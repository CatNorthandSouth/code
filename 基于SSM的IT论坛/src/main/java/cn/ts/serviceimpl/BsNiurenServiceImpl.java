package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsNiuren;
import cn.ts.mapper.BsNiurenMapper;
import cn.ts.service.BsNiurenService;
@Service
public class BsNiurenServiceImpl implements BsNiurenService {

	@Autowired
	BsNiurenMapper BsNiurenMapper;
	@Override
	public int insertNiuRen(BsNiuren record) {
		// TODO Auto-generated method stub
		return BsNiurenMapper.insertNiuRen(record);
	}

	@Override
	public List<BsNiuren> selectAllNiuRen() {
		// TODO Auto-generated method stub
		return BsNiurenMapper.selectAllNiuRen();
	}

	@Override
	public List<BsNiuren> selectByWeekScore() {
		// TODO Auto-generated method stub
		return BsNiurenMapper.selectByWeekScore();
	}

	@Override
	public List<BsNiuren> selectByMonthScore() {
		// TODO Auto-generated method stub
		return BsNiurenMapper.selectByMonthScore();
	}

	@Override
	public List<BsNiuren> selectByYearScore() {
		// TODO Auto-generated method stub
		return BsNiurenMapper.selectByYearScore();
	}

	@Override
	public BsNiuren selectByUser_id(int userid) {
		// TODO Auto-generated method stub
		return BsNiurenMapper.selectByUser_id(userid);
	}

	@Override
	public int updateByPrimaryKey(BsNiuren record) {
		// TODO Auto-generated method stub
		return BsNiurenMapper.updateByPrimaryKey(record);
	}

}
