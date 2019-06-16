package cn.ts.mapper;

import cn.ts.entity.BsPostZan;

public interface BsPostZanMapper {
    int insert(BsPostZan record);

    int insertSelective(BsPostZan record);
    
    int selectPostZanGoogCount(BsPostZan record);
    
    int selectPostZanBadCount(BsPostZan record);
    
    BsPostZan selectPostZan(BsPostZan record);
    
    int deletePostcount(BsPostZan record);
}