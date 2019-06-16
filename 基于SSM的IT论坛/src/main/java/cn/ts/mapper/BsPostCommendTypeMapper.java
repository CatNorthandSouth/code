package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsPostCommendType;

public interface BsPostCommendTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BsPostCommendType record);

    int insertSelective(BsPostCommendType record);

    BsPostCommendType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BsPostCommendType record);

    int updateByPrimaryKey(BsPostCommendType record);
    
    List<BsPostCommendType> selectByTypeList();
}