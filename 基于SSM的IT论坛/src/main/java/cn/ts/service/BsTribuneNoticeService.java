package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsTribuneNotice;

public interface BsTribuneNoticeService {

    int deleteTribuneNotice(Integer tribuneNoticeId);

    int insertTribuneNotice(BsTribuneNotice record);

    List<BsTribuneNotice> selectBsTribuneNotice();
}
