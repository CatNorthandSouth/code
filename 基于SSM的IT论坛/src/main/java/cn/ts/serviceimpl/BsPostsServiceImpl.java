package cn.ts.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsPosts;
import cn.ts.mapper.BsPostsMapper;
import cn.ts.service.BsPostsService;
@Service
public class BsPostsServiceImpl implements BsPostsService {

	@Autowired
	BsPostsMapper BsPostsMapper; 
	@Override
	public int insertPosts(BsPosts record) {
		// TODO Auto-generated method stub
		return BsPostsMapper.insertPosts(record);
	}
	@Override
	public List<BsPosts> selectPosts() {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectPosts();
	}
	@Override
	public List<BsPosts> selectPostsbyCommend() {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectPostsbyCommend();
	}
	@Override
	public BsPosts selectPostsByPostId(int postid) {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectPostsByPostId(postid);
	}
	@Override
	public BsPosts selectPostsByNotice(int postid) {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectPostsByNotice(postid);
	}
	@Override
	public List<BsPosts> selectPostsByBoardzero(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		List<BsPosts> list=BsPostsMapper.selectPostsByBoardzero(bsPosts);
		return list;
	}
	@Override
	public List<BsPosts> selectPostsByBoardNotzero(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		List<BsPosts> list=BsPostsMapper.selectPostsByBoardNotzero(bsPosts);
		return list;
	}
	@Override
	public List<BsPosts> selectSearchPosts(BsPosts BsPosts) {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectSearchPosts(BsPosts);
	}
	@Override
	public int deleteByPrimaryKey(Integer postId) {
		// TODO Auto-generated method stub
		return BsPostsMapper.deleteByPrimaryKey(postId);
	}
	@Override
	public List<BsPosts> findHpost(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		return BsPostsMapper.findHpost(bsPosts);
	}
	@Override
	public List<BsPosts> findHpost1(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		return BsPostsMapper.findHpost1(bsPosts);
	}
	@Override
	public List<BsPosts> findHpost2(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		return BsPostsMapper.findHpost2(bsPosts);
	}
	@Override
	public int updateByPrimaryKeySelective(BsPosts record) {
		// TODO Auto-generated method stub
		return BsPostsMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public List<BsPosts> findHGongGao(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		return BsPostsMapper.findHGongGao(bsPosts);
	}
	@Override
	public List<BsPosts> findHGongGao1(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		return BsPostsMapper.findHGongGao1(bsPosts);
	}
	@Override
	public List<BsPosts> findHGongGao2(BsPosts bsPosts) {
		// TODO Auto-generated method stub
		return BsPostsMapper.findHGongGao2(bsPosts);
	}
	@Override
	public List<BsPosts> selectGongGao() {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectGongGao();
	}
	@Override
	public List<BsPosts> selectPostsByNoticeList() {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectPostsByNoticeList();
	}
	@Override
	public List<BsPosts> selectMyFaBu(BsPosts record) {
		// TODO Auto-generated method stub
		return BsPostsMapper.selectMyFaBu(record);
	}
	@Override
	public List<BsPosts> SelectAll() {
		// TODO Auto-generated method stub
		return BsPostsMapper.SelectAll();
	}


}
