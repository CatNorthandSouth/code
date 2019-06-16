package cn.ts.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.ts.entity.BsFileHistory;


public interface BsFileHistoryService {
    int deleteByPrimaryKey(Integer downId);

    int insert(BsFileHistory record);

    int insertSelective(BsFileHistory record);

    BsFileHistory selectByPrimaryKey(Integer downId);
    
    List<BsFileHistory> selectByfileAdminId(int fileAdminId);
    
    List<BsFileHistory> selectfiletimesortByfileType(BsFileHistory bsFileHistory);
    
    List<BsFileHistory> selectBySearchTimeSortNo(BsFileHistory bsFileHistory);
    
    List<BsFileHistory> selectBySearchTimeSort(BsFileHistory bsFileHistory);
}
