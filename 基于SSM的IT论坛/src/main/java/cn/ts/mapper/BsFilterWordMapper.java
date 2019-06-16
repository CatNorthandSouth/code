package cn.ts.mapper;

import cn.ts.entity.BsFilterWord;
import cn.ts.entity.BsFilterWordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BsFilterWordMapper {

    int deleteByExample();

    int insert(BsFilterWord record);

    List<BsFilterWord> selectByExample();

}