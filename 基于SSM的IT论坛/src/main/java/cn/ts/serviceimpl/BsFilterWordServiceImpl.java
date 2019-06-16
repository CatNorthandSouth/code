package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsFilterWord;
import cn.ts.mapper.BsFilterWordMapper;
import cn.ts.service.BsFilterWordService;
@Service
public class BsFilterWordServiceImpl implements BsFilterWordService {

	@Autowired
	BsFilterWordMapper BsFilterWordMapper;
	@Override
	public int deleteByExample() {
		// TODO Auto-generated method stub
		return BsFilterWordMapper.deleteByExample();
	}

	@Override
	public int insert(BsFilterWord record) {
		// TODO Auto-generated method stub
		return BsFilterWordMapper.insert(record);
	}

	@Override
	public List<BsFilterWord> selectByExample() {
		// TODO Auto-generated method stub
		return BsFilterWordMapper.selectByExample();
	}

}
