package cn.ts.service;

import cn.ts.entity.BsPostZan;

public interface BsPostZanService {
    int insert(BsPostZan record);

    int insertSelective(BsPostZan record);
    
    int selectPostZanGoogCount(BsPostZan record);
    
    int selectPostZanBadCount(BsPostZan record);
    
    BsPostZan selectPostZan(BsPostZan record);
    
    int deletePostcount(BsPostZan record);
}
