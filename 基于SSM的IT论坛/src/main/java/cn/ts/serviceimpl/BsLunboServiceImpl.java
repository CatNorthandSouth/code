package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsLunbo;
import cn.ts.mapper.BsLunboMapper;
import cn.ts.service.BsLunboService;
@Service
public class BsLunboServiceImpl implements BsLunboService {

	@Autowired
	BsLunboMapper BsLunboMapper;
	@Override
	public int deleteByPrimaryKey(Integer lunboId) {
		// TODO Auto-generated method stub
		return BsLunboMapper.deleteByPrimaryKey(lunboId);
	}

	@Override
	public int insert(BsLunbo record) {
		// TODO Auto-generated method stub
		return BsLunboMapper.insert(record);
	}

	@Override
	public BsLunbo selectByPrimaryKey(Integer lunboId) {
		// TODO Auto-generated method stub
		return BsLunboMapper.selectByPrimaryKey(lunboId);
	}

	@Override
	public List<BsLunbo> selectAll() {
		// TODO Auto-generated method stub
		return BsLunboMapper.selectAll();
	}

	@Override
	public int updateByPrimaryKeySelective(BsLunbo record) {
		// TODO Auto-generated method stub
		return BsLunboMapper.updateByPrimaryKeySelective(record);
	}

}
