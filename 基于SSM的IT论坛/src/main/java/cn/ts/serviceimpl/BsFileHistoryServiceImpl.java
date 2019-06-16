package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsFileHistory;
import cn.ts.mapper.BsFileHistoryMapper;
import cn.ts.service.BsFileHistoryService;
@Service
public class BsFileHistoryServiceImpl implements BsFileHistoryService {

	@Autowired
	BsFileHistoryMapper BsFileHistoryMapper;
	@Override
	public int deleteByPrimaryKey(Integer downId) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.deleteByPrimaryKey(downId);
	}

	@Override
	public int insert(BsFileHistory record) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.insert(record);
	}

	@Override
	public int insertSelective(BsFileHistory record) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.insertSelective(record);
	}

	@Override
	public BsFileHistory selectByPrimaryKey(Integer downId) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.selectByPrimaryKey(downId);
	}

	@Override
	public List<BsFileHistory> selectByfileAdminId(int fileAdminId) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.selectByfileAdminId(fileAdminId);
	}

	@Override
	public List<BsFileHistory> selectfiletimesortByfileType(BsFileHistory bsFileHistory) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.selectfiletimesortByfileType(bsFileHistory);
	}

	@Override
	public List<BsFileHistory> selectBySearchTimeSortNo(BsFileHistory bsFileHistory) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.selectBySearchTimeSortNo(bsFileHistory);
	}

	@Override
	public List<BsFileHistory> selectBySearchTimeSort(BsFileHistory bsFileHistory) {
		// TODO Auto-generated method stub
		return BsFileHistoryMapper.selectBySearchTimeSort(bsFileHistory);
	}

}
