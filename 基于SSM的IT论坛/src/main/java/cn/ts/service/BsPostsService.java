package cn.ts.service;

import java.util.List;

import cn.ts.entity.BsPosts;

public interface BsPostsService {
	int insertPosts(BsPosts record);
	
	List<BsPosts> SelectAll();
	
	List<BsPosts> selectPosts();
	
    List<BsPosts> selectMyFaBu(BsPosts record);
	
	List<BsPosts> selectPostsbyCommend();
	
	BsPosts selectPostsByPostId(int postid);
	
    BsPosts selectPostsByNotice(int postid);
    
    List<BsPosts> selectPostsByBoardzero(BsPosts bsPosts);

    List<BsPosts> selectPostsByBoardNotzero(BsPosts bsPosts);
    
    List<BsPosts> selectSearchPosts(BsPosts BsPosts);
    
    int deleteByPrimaryKey(Integer postId);
    List<BsPosts> selectPostsByNoticeList();
    List<BsPosts> findHpost(BsPosts bsPosts);
    List<BsPosts> findHpost1(BsPosts bsPosts);
    List<BsPosts> findHpost2(BsPosts bsPosts);
    int updateByPrimaryKeySelective(BsPosts record);
 
    List<BsPosts> findHGongGao(BsPosts bsPosts);
    List<BsPosts> findHGongGao1(BsPosts bsPosts);
    List<BsPosts> findHGongGao2(BsPosts bsPosts);    
    List<BsPosts> selectGongGao(); 
}
