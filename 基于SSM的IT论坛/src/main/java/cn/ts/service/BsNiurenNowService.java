package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsNiuren;
import cn.ts.entity.BsNiurenNow;

public interface BsNiurenNowService {

    int insertNiuRen(BsNiurenNow record);

    List<BsNiurenNow> selectAllNiuRen();
    
    List<BsNiurenNow> selectByWeekScore();
    
    List<BsNiurenNow> selectByMonthScore();
    
    List<BsNiurenNow> selectByYearScore();
    
    BsNiurenNow selectByUser_id(int userid);
    
    int updateByPrimaryKey(BsNiurenNow record);
}
