package cn.ts.mapper;

import cn.ts.entity.BsSendEmailHistory;

public interface BsSendEmailHistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BsSendEmailHistory record);

    int insertSelective(BsSendEmailHistory record);

    BsSendEmailHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BsSendEmailHistory record);

    int updateByPrimaryKey(BsSendEmailHistory record);
}