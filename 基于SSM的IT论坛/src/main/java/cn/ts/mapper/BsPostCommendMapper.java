package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsPostCommend;

public interface BsPostCommendMapper {
    int deleteByPrimaryKey(Integer pocoId);

    int insert(BsPostCommend record);

    int insertSelective(BsPostCommend record);

    List<BsPostCommend> selectByPostId();

    int updateByPrimaryKeySelective(BsPostCommend record);

    int updateByPrimaryKey(BsPostCommend record);
    
    BsPostCommend selectBypocoPostId(int postid);
}