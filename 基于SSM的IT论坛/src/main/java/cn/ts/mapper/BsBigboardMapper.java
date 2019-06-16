package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsBigboard;

public interface BsBigboardMapper {
    int deleteByPrimaryKey(Integer biboId);

    int insertBigboardMapper(BsBigboard record);

    int insertSelective(BsBigboard record);

    BsBigboard selectBsBigboardByKey(Integer biboId);
    
    List<BsBigboard> selectBsBigboard();

    int updateByPrimaryKeySelective(BsBigboard record);

    int updateByPrimaryKey(BsBigboard record);
}