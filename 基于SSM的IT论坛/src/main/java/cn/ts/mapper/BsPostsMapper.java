package cn.ts.mapper;

import java.util.List;

import cn.ts.entity.BsPosts;

public interface BsPostsMapper {
    int deleteByPrimaryKey(Integer postId);

    int insertPosts(BsPosts record);

    int insertSelective(BsPosts record);

    List<BsPosts> selectPosts();
    
    List<BsPosts> SelectAll();
    
    List<BsPosts> selectMyFaBu(BsPosts record);
    
    BsPosts selectPostsByPostId(int postid);
    
    BsPosts selectPostsByNotice(int postid);
    
    List<BsPosts> selectPostsByBoardzero(BsPosts bsPosts);

    List<BsPosts> selectPostsByBoardNotzero(BsPosts bsPosts);
    
    List<BsPosts> selectPostsbyCommend();
    
    List<BsPosts> selectSearchPosts(BsPosts BsPosts);
    
    int updateByPrimaryKeySelective(BsPosts record);

    int updateByPrimaryKey(BsPosts record);
    List<BsPosts> selectPostsByNoticeList();
    List<BsPosts> findHpost(BsPosts bsPosts);
    List<BsPosts> findHpost1(BsPosts bsPosts);
    List<BsPosts> findHpost2(BsPosts bsPosts);
    int deleteByPrimaryKey(int id);
    
    List<BsPosts> findHGongGao(BsPosts bsPosts);
    List<BsPosts> findHGongGao1(BsPosts bsPosts);
    List<BsPosts> findHGongGao2(BsPosts bsPosts);    
    List<BsPosts> selectGongGao();  
}