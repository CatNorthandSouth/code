package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsUserRole;

public interface BsUserRoleService {
	 BsUserRole selectByUserId(Integer userRoleId);
	 
	  List<BsUserRole> selectAll();
	  
	 int deleteByPrimaryKey(Integer userRoleId);
	 
	    int insert(BsUserRole record);
	    
	    int updateBystate(BsUserRole record);
	    
	    int deleteByUserRole(BsUserRole bsUserRole);
}
