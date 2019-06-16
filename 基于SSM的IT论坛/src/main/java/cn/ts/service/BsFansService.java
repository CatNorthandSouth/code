package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsFans;

public interface BsFansService {
    int insertBsFans(BsFans record);

    int deleteBsFans(BsFans record);

    List<BsFans> selectByUserId(Integer fansId);
    
    BsFans selectByUserIdAndMyFansId(BsFans record);
    
    List<BsFans> selectByMyFansId(int fansId);
}
