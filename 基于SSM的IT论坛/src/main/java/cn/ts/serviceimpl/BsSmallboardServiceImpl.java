package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsSmallboard;
import cn.ts.mapper.BsSmallboardMapper;
import cn.ts.service.BsSmallboardService;
@Service
public class BsSmallboardServiceImpl implements BsSmallboardService {

	@Autowired
	BsSmallboardMapper BsSmallboardMapper; 
	@Override
	public int insertinsertBsSmallboard(BsSmallboard record) {
		// TODO Auto-generated method stub
		return BsSmallboardMapper.insertinsertBsSmallboard(record);
	}
	@Override
	public List<BsSmallboard> selectBsSmallboardByKey(Integer smboBiboId) {
		// TODO Auto-generated method stub
		List<BsSmallboard> list=BsSmallboardMapper.selectBsSmallboardByKey(smboBiboId);
		return list;
	}
	@Override
	public BsSmallboard selectsmboIdByKey(Integer smboId) {
		// TODO Auto-generated method stub
		return BsSmallboardMapper.selectsmboIdByKey(smboId);
	}
	@Override
	public List<BsSmallboard> selectAll() {
		// TODO Auto-generated method stub
		return BsSmallboardMapper.selectAll();
	}

}
