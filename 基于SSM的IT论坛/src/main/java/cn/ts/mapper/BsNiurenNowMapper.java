package cn.ts.mapper;

import java.util.List;


import cn.ts.entity.BsNiurenNow;

public interface BsNiurenNowMapper {
    int deleteByPrimaryKey(Integer niurenId);
    
    BsNiurenNow selectByUser_id(int userid);

    int insertNiuRen(BsNiurenNow record);

    int insertSelective(BsNiurenNow record);

    List<BsNiurenNow> selectAllNiuRen();
    
    List<BsNiurenNow> selectByWeekScore();
    
    List<BsNiurenNow> selectByMonthScore();
    
    List<BsNiurenNow> selectByYearScore();

    int updateByPrimaryKeySelective(BsNiurenNow record);

    int updateByPrimaryKey(BsNiurenNow record);
}