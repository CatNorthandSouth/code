package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsRole;
import cn.ts.mapper.BsRoleMapper;
import cn.ts.service.BsRoleService;
@Service
public class BsRoleServiceImpl implements BsRoleService {

	@Autowired
	BsRoleMapper BsRoleMapper;
	@Override
	public BsRole selectByPrimaryKey(int roleId) {
		// TODO Auto-generated method stub
		return BsRoleMapper.selectByPrimaryKey(roleId);
	}

	@Override
	public List<BsRole> selectAll() {
		// TODO Auto-generated method stub
		return BsRoleMapper.selectAll();
	}

	@Override
	public int deleteByPrimaryKey(Integer userRoleId) {
		// TODO Auto-generated method stub
		return BsRoleMapper.deleteByPrimaryKey(userRoleId);
	}

	@Override
	public int insert(BsRole record) {
		// TODO Auto-generated method stub
		return BsRoleMapper.insert(record);
	}

	@Override
	public BsRole selectByroleName(String rolename) {
		// TODO Auto-generated method stub
		return BsRoleMapper.selectByroleName(rolename);
	}



}
