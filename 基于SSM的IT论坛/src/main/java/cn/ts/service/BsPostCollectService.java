package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsPostCollect;

public interface BsPostCollectService {
	   int deleteBycollectPostId(Integer collectPostId);

	    int insertCollectPost(BsPostCollect record);

	    BsPostCollect selectByCollectPostAdmin(String collectPostAdmin);
	    
	    List<BsPostCollect> selectByAllCollectPostAdmin(String collectPostAdmin);
	    
	    int deleteBycollectId(int collectid);
	    List<BsPostCollect> selectByPostAdminId(int postadminid);
	    BsPostCollect selectByPostAdminIdAndPostid(BsPostCollect bsPostCollect);
}
