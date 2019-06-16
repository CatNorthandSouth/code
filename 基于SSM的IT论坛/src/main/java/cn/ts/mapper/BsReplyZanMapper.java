package cn.ts.mapper;

import cn.ts.entity.BsReplyZan;

public interface BsReplyZanMapper {
    int deleteReplyZan(BsReplyZan record);
    int selectReplyGoogZan(BsReplyZan record);
    int selectReplyBadZan(BsReplyZan record);
    int insert(BsReplyZan record);
    BsReplyZan selectReplyZan(BsReplyZan record);
}