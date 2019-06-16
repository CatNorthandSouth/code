package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsUserRole;

public interface BsUserRoleMapper {
    int deleteByPrimaryKey(Integer userRoleId);
    
    int deleteByUserRole(BsUserRole bsUserRole);

    int insert(BsUserRole record);

    int insertSelective(BsUserRole record);

    BsUserRole selectByPrimaryKey(Integer userRoleId);
    
    BsUserRole selectByUserId(Integer userRoleId);

    int updateBystate(BsUserRole record);

    int updateByPrimaryKey(BsUserRole record);
    
    List<BsUserRole> selectAll();
}