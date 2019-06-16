package cn.ts.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsRoleMenu;
import cn.ts.mapper.BsRoleMenuMapper;
import cn.ts.service.BsRoleMenuService;
@Service
public class BsRoleMenuServiceImpl implements BsRoleMenuService {

	@Autowired
	BsRoleMenuMapper bsRoleMenuMapper;
	@Override
	public BsRoleMenu selectByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		return bsRoleMenuMapper.selectByRoleId(roleId);
	}
	@Override
	public int insert(BsRoleMenu record) {
		// TODO Auto-generated method stub
		return bsRoleMenuMapper.insert(record);
	}

}
