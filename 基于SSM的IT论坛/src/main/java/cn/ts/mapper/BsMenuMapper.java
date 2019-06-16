package cn.ts.mapper;

import cn.ts.entity.BsMenu;

public interface BsMenuMapper {
    int deleteByPrimaryKey(String id);

    int insert(BsMenu record);

    int insertSelective(BsMenu record);

    BsMenu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BsMenu record);

    int updateByPrimaryKey(BsMenu record);
}