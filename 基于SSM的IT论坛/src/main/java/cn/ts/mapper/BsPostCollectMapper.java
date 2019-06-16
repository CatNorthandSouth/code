package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsPostCollect;

public interface BsPostCollectMapper {
	   int deleteBycollectPostId(Integer collectPostId);

	    int insertCollectPost(BsPostCollect record);

	    int deleteBycollectId(int collectid);
	    
	    BsPostCollect selectByCollectPostAdmin(String collectPostAdmin);
	    
	    List<BsPostCollect> selectByAllCollectPostAdmin(String collectPostAdmin);
	    
	    List<BsPostCollect> selectByPostAdminId(int postadminid);
	    
	    BsPostCollect selectByPostAdminIdAndPostid(BsPostCollect bsPostCollect);
}