package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsFans;

public interface BsFansMapper {
    int deleteByPrimaryKey(Integer fansId);

    int insertBsFans(BsFans record);

    int deleteBsFans(BsFans record);

    List<BsFans> selectByUserId(Integer fansId);
    
    BsFans selectByUserIdAndMyFansId(BsFans record);
    
    List<BsFans> selectByMyFansId(int fansId);

    int updateByPrimaryKeySelective(BsFans record);

    int updateByPrimaryKey(BsFans record);
}