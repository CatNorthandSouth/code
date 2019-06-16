package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsLunbo;

public interface BsLunboService {

    int deleteByPrimaryKey(Integer lunboId);

    int insert(BsLunbo record);
    
    BsLunbo selectByPrimaryKey(Integer lunboId);
    
    List<BsLunbo> selectAll();

    int updateByPrimaryKeySelective(BsLunbo record);
}
