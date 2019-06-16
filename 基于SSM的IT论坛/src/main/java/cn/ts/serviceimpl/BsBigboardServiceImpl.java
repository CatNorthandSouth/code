package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsBigboard;
import cn.ts.mapper.BsBigboardMapper;
import cn.ts.service.BsBigboardService;
@Service
public class BsBigboardServiceImpl implements BsBigboardService{

	@Autowired
	BsBigboardMapper BsBigboardMapper;
	@Override
	public int insertBigboardMapper(BsBigboard record) {
		// TODO Auto-generated method stub
		return BsBigboardMapper.insertBigboardMapper(record);
	}
	@Override
	public BsBigboard selectBsBigboardByKey(Integer biboId) {
		// TODO Auto-generated method stub
		return BsBigboardMapper.selectBsBigboardByKey(biboId);
	}
	@Override
	public List<BsBigboard> selectBsBigboard() {
		// TODO Auto-generated method stub
		List<BsBigboard> list = BsBigboardMapper.selectBsBigboard();
		return list;
	}

}
