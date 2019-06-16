package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsSystemLog;

public interface BsSystemLogService {
    int deleteByPrimaryKey(Integer id);

    int insert(BsSystemLog record);

    BsSystemLog selectByPrimaryKey(Integer id);
    
    List<BsSystemLog> selectByAll();
    
    List<BsSystemLog> selectByUserId(int userid);
}
