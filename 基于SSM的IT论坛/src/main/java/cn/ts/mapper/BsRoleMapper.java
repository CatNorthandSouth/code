package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsRole;

public interface BsRoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(BsRole record);

    int insertSelective(BsRole record);

    BsRole selectByPrimaryKey(int roleId);
    
    List<BsRole> selectAll();

    int updateByPrimaryKeySelective(BsRole record);

    int updateByPrimaryKey(BsRole record);
    
    BsRole selectByroleName(String rolename);
}