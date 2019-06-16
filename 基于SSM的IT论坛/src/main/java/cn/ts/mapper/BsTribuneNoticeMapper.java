package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsTribuneNotice;

public interface BsTribuneNoticeMapper {
    int deleteTribuneNotice(Integer tribuneNoticeId);

    int insertTribuneNotice(BsTribuneNotice record);

    List<BsTribuneNotice> selectBsTribuneNotice();

}