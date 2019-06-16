package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsSystemLog;

public interface BsSystemLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BsSystemLog record);
    
    List<BsSystemLog> selectByUserId(int userid);

    int insertSelective(BsSystemLog record);

    BsSystemLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BsSystemLog record);

    int updateByPrimaryKey(BsSystemLog record);
    
    List<BsSystemLog> selectByAll();
}