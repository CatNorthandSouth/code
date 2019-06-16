package cn.ts.mapper;

import cn.ts.entity.BsRoleMenu;

public interface BsRoleMenuMapper {
    int deleteByPrimaryKey(Integer roleMenuId);

    int insert(BsRoleMenu record);

    int insertSelective(BsRoleMenu record);

    BsRoleMenu selectByPrimaryKey(Integer roleMenuId);
    
    BsRoleMenu selectByRoleId(Integer roleId);

    int updateByPrimaryKeySelective(BsRoleMenu record);

    int updateByPrimaryKey(BsRoleMenu record);
}