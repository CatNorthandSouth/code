package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsLunbo;

public interface BsLunboMapper {
    int insertSelective(BsLunbo record);

    int deleteByPrimaryKey(Integer lunboId);

    int insert(BsLunbo record);
    
    BsLunbo selectByPrimaryKey(Integer lunboId);
    
    List<BsLunbo> selectAll();

    int updateByPrimaryKeySelective(BsLunbo record);

    int updateByPrimaryKey(BsLunbo record);
}