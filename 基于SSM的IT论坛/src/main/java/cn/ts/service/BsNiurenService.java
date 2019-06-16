package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsNiuren;

public interface BsNiurenService {

    int insertNiuRen(BsNiuren record);

    List<BsNiuren> selectAllNiuRen();
    
    List<BsNiuren> selectByWeekScore();
    
    List<BsNiuren> selectByMonthScore();
    
    List<BsNiuren> selectByYearScore();
    
    BsNiuren selectByUser_id(int userid);
    
    int updateByPrimaryKey(BsNiuren record);
}
