package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsFileHistory;

public interface BsFileHistoryMapper {
    int deleteByPrimaryKey(Integer downId);

    int insert(BsFileHistory record);

    int insertSelective(BsFileHistory record);

    BsFileHistory selectByPrimaryKey(Integer downId);
    
    List<BsFileHistory> selectByfileAdminId(int fileAdminId);
    
    List<BsFileHistory> selectfiletimesortByfileType(BsFileHistory bsFileHistory);
    
    List<BsFileHistory> selectBySearchTimeSortNo(BsFileHistory bsFileHistory);
    
    List<BsFileHistory> selectBySearchTimeSort(BsFileHistory bsFileHistory);
    
  }