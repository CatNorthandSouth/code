package cn.ts.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsMenu;
import cn.ts.mapper.BsMenuMapper;
import cn.ts.service.BsMenuService;
@Service
public class BsMenuServiceImpl implements BsMenuService {

	@Autowired
	BsMenuMapper BsMenuMapper;
	@Override
	public BsMenu selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return BsMenuMapper.selectByPrimaryKey(id);
	}

}
