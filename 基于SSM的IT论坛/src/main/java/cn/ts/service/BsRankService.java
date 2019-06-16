package cn.ts.service;

import cn.ts.entity.BsRank;

public interface BsRankService {
    int deleteByUserId(Integer userid);

    int insert(BsRank record);

    BsRank selectByPrimaryKey(Integer id);
    
    BsRank selectByUserId(int userid);

    int updateByPrimaryKeySelective(BsRank record);

    int updateByPrimaryKey(BsRank record);
}
