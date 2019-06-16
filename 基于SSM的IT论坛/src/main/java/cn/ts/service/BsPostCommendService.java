package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsPostCommend;

public interface BsPostCommendService {
	
    List<BsPostCommend> selectByPostId();
    BsPostCommend selectBypocoPostId(int postid);
    int deleteByPrimaryKey(Integer pocoId);
    int insert(BsPostCommend record);
}
