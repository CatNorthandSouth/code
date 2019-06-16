package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsTribuneNotice;
import cn.ts.mapper.BsTribuneNoticeMapper;
import cn.ts.service.BsTribuneNoticeService;
@Service
public class BsTribuneNoticeServiceImpl implements BsTribuneNoticeService {

	@Autowired
	BsTribuneNoticeMapper BsTribuneNoticeMapper;

	@Override
	public int deleteTribuneNotice(Integer tribuneNoticeId) {
		// TODO Auto-generated method stub
		return BsTribuneNoticeMapper.deleteTribuneNotice(tribuneNoticeId);
	}

	@Override
	public int insertTribuneNotice(BsTribuneNotice record) {
		// TODO Auto-generated method stub
		return BsTribuneNoticeMapper.insertTribuneNotice(record);
	}

	@Override
	public List<BsTribuneNotice> selectBsTribuneNotice() {
		// TODO Auto-generated method stub
		return BsTribuneNoticeMapper.selectBsTribuneNotice();
	}


}
