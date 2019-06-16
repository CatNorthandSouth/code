package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsSystemLog;
import cn.ts.mapper.BsSystemLogMapper;
import cn.ts.service.BsSystemLogService;
@Service
public class BsSystemLogServiceImpl implements BsSystemLogService {

	@Autowired
	BsSystemLogMapper BsSystemLogMapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return BsSystemLogMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(BsSystemLog record) {
		// TODO Auto-generated method stub
		return BsSystemLogMapper.insert(record);
	}

	@Override
	public BsSystemLog selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return BsSystemLogMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<BsSystemLog> selectByAll() {
		// TODO Auto-generated method stub
		return BsSystemLogMapper.selectByAll();
	}

	@Override
	public List<BsSystemLog> selectByUserId(int userid) {
		// TODO Auto-generated method stub
		return BsSystemLogMapper.selectByUserId(userid);
	}

}
