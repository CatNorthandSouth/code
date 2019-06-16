package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsRole;

public interface BsRoleService {

  //  BsRole selectByPrimaryKey(String roleId);
    
    List<BsRole> selectAll();
    
    int deleteByPrimaryKey(Integer userRoleId);
    
    int insert(BsRole record);
    BsRole selectByroleName(String rolename);

	BsRole selectByPrimaryKey(int roleId);
}
