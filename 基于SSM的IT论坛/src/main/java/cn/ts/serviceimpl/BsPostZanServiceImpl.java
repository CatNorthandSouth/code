package cn.ts.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsPostZan;
import cn.ts.mapper.BsPostZanMapper;
import cn.ts.service.BsPostZanService;
@Service
public class BsPostZanServiceImpl implements BsPostZanService {

	@Autowired
	BsPostZanMapper BsPostZanService;
	@Override
	public int insert(BsPostZan record) {
		// TODO Auto-generated method stub
		return BsPostZanService.insert(record);
	}

	@Override
	public int insertSelective(BsPostZan record) {
		// TODO Auto-generated method stub
		return BsPostZanService.insertSelective(record);
	}

	@Override
	public int selectPostZanGoogCount(BsPostZan record) {
		// TODO Auto-generated method stub
		return BsPostZanService.selectPostZanGoogCount(record);
	}

	@Override
	public int selectPostZanBadCount(BsPostZan record) {
		// TODO Auto-generated method stub
		return BsPostZanService.selectPostZanBadCount(record);
	}

	@Override
	public BsPostZan selectPostZan(BsPostZan record) {
		// TODO Auto-generated method stub
		return BsPostZanService.selectPostZan(record);
	}

	@Override
	public int deletePostcount(BsPostZan record) {
		// TODO Auto-generated method stub
		return BsPostZanService.deletePostcount(record);
	}

}
