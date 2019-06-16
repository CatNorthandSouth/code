package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsSmallboard;

public interface BsSmallboardMapper {
    int deleteByPrimaryKey(Integer smboId);

    int insertinsertBsSmallboard(BsSmallboard record);

    int insertSelective(BsSmallboard record);

    List<BsSmallboard> selectAll();
    
    List<BsSmallboard> selectBsSmallboardByKey(Integer smboBiboId);

    BsSmallboard selectsmboIdByKey(Integer smboId);
    
    int updateByPrimaryKeySelective(BsSmallboard record);

    int updateByPrimaryKey(BsSmallboard record);
}