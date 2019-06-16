package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsFilterWord;

public interface BsFilterWordService {


    int deleteByExample();

    int insert(BsFilterWord record);

    List<BsFilterWord> selectByExample();
}
