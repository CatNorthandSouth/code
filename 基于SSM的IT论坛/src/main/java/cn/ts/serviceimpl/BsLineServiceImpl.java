package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsLine;
import cn.ts.mapper.BsLineMapper;
import cn.ts.service.BsLineService;
@Service
public class BsLineServiceImpl implements BsLineService {

	@Autowired
	BsLineMapper BsLineMapper;
	@Override
	public List<BsLine> selectLine() {
		// TODO Auto-generated method stub
		return BsLineMapper.selectLine();
	}

}
