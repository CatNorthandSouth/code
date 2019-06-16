package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsSmallboard;

public interface BsSmallboardService {

    int insertinsertBsSmallboard(BsSmallboard record);
    
    List<BsSmallboard> selectBsSmallboardByKey(Integer smboBiboId);
    
    BsSmallboard selectsmboIdByKey(Integer smboId);
    
    List<BsSmallboard> selectAll();
}
