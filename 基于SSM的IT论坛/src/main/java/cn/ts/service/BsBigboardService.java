package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsBigboard;

public interface BsBigboardService {

    int insertBigboardMapper(BsBigboard record);
  
    BsBigboard selectBsBigboardByKey(Integer biboId);
    
    List<BsBigboard> selectBsBigboard();
}
