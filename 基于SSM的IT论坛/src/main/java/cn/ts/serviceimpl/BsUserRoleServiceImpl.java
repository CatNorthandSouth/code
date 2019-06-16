package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsUserRole;
import cn.ts.mapper.BsUserRoleMapper;
import cn.ts.service.BsUserRoleService;
@Service
public class BsUserRoleServiceImpl implements BsUserRoleService {

	@Autowired
	BsUserRoleMapper bsUserRoleMapper;
	@Override
	public BsUserRole selectByUserId(Integer userRoleId) {
		// TODO Auto-generated method stub
		return bsUserRoleMapper.selectByUserId(userRoleId);
	}
	@Override
	public List<BsUserRole> selectAll() {
		// TODO Auto-generated method stub
		return bsUserRoleMapper.selectAll();
	}
	@Override
	public int deleteByPrimaryKey(Integer userRoleId) {
		// TODO Auto-generated method stub
		return bsUserRoleMapper.deleteByPrimaryKey(userRoleId);
	}
	@Override
	public int insert(BsUserRole record) {
		// TODO Auto-generated method stub
		return bsUserRoleMapper.insert(record);
	}
	@Override
	public int updateBystate(BsUserRole record) {
		// TODO Auto-generated method stub
		return bsUserRoleMapper.updateBystate(record);
	}
	@Override
	public int deleteByUserRole(BsUserRole bsUserRole) {
		// TODO Auto-generated method stub
		return bsUserRoleMapper.deleteByUserRole(bsUserRole);
	}

}
