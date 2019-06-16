package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsNiuren;

public interface BsNiurenMapper {
    int deleteByPrimaryKey(Integer niurenId);
    
    BsNiuren selectByUser_id(int userid);

    int insertNiuRen(BsNiuren record);

    int insertSelective(BsNiuren record);

    List<BsNiuren> selectAllNiuRen();
    
    List<BsNiuren> selectByWeekScore();
    
    List<BsNiuren> selectByMonthScore();
    
    List<BsNiuren> selectByYearScore();

    int updateByPrimaryKeySelective(BsNiuren record);

    int updateByPrimaryKey(BsNiuren record);
}