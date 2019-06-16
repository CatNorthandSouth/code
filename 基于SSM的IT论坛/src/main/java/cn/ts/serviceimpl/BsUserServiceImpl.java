package cn.ts.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ts.entity.BsUser;
import cn.ts.mapper.BsUserMapper;
import cn.ts.service.BsUserService;
@Service
public class BsUserServiceImpl implements BsUserService{
	@Autowired
	private BsUserMapper bsUserMapper;
	@Override
	public BsUser selectByAccountAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		BsUser bsUser=bsUserMapper.selectByAccountAndPassword(username, password);
		return bsUser;
	}

	@Override
	public BsUser selectByEmailAndPassword(String email, String password) {
		// TODO Auto-generated method stub
		BsUser bsUser=bsUserMapper.selectByEmailAndPassword(email, password);
		return bsUser;
	}

	@Override
	public boolean selectByAccount(String username) {
		// TODO Auto-generated method stub
		BsUser bsUser=bsUserMapper.selectByAccount(username);
		if (bsUser != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean selectByEmail(String email) {
		// TODO Auto-generated method stub
		BsUser bsUser=bsUserMapper.selectByEmail(email);
		if (bsUser != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean insertRegister(BsUser bsUser) {
		// TODO Auto-generated method stub
		int flagRegister=bsUserMapper.insertRegister(bsUser);
		if (flagRegister > 0) {
			return true;
		} else {
			return false;
		}		
	}

	@Override
	public int insertSelective(BsUser bsUser) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(BsUser bsUser) {
		// TODO Auto-generated method stub
		int sum=bsUserMapper.updateByPrimaryKeySelective(bsUser);
		return sum;
	}

	@Override
	public BsUser selectByPrimaryKey(int userId) {
		// TODO Auto-generated method stub
		BsUser bsUser=bsUserMapper.selectByPrimaryKey(userId);
		return bsUser;
	}

	@Override
	public BsUser selectByUserName(String username) {
		// TODO Auto-generated method stub
		return bsUserMapper.selectByUserName(username);
	}

	@Override
	public BsUser selectByReplyAdmin(String username) {
		// TODO Auto-generated method stub
		return bsUserMapper.selectByReplyAdmin(username);
	}

	@Override
	public List<BsUser> selectAll() {
		// TODO Auto-generated method stub
		return bsUserMapper.selectAll();
	}

	@Override
	public int deleteByPrimaryKey(int userid) {
		// TODO Auto-generated method stub
		return bsUserMapper.deleteByPrimaryKey(userid);
	}

	@Override
	public List<BsUser> selectByTimeANDName(Date start, Date end, String fileName) {
		// TODO Auto-generated method stub
		return bsUserMapper.selectByTimeANDName(start, end, fileName);
	}

	@Override
	public List<BsUser> selectByTime(Date start, Date end) {
		// TODO Auto-generated method stub
		return bsUserMapper.selectByTime(start, end);
	}

	@Override
	public List<BsUser> selectByFileTitle(BsUser record) {
		// TODO Auto-generated method stub
		return bsUserMapper.selectByFileTitle(record);
	}

	@Override
	public BsUser selectByUserAccount(String Account) {
		// TODO Auto-generated method stub
		return bsUserMapper.selectByAccount(Account);
	}

	@Override
	public List<BsUser> selectByuserAllmarks(int marks) {
		// TODO Auto-generated method stub
		return bsUserMapper.selectByuserAllmarks(marks);
	}

}
