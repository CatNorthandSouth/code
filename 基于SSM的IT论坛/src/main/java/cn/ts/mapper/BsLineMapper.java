package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsLine;

public interface BsLineMapper {
    int insert(BsLine record);

    int insertSelective(BsLine record);
    
    List<BsLine> selectLine();
}