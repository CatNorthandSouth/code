package cn.ts.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ts.entity.BsFile;
import cn.ts.entity.BsUser;

public interface BsUserMapper {
	
	   List<BsUser> selectByuserAllmarks(int marks);
	   List<BsUser> selectAll();
	   //<!-- 通过用户名查询用户是否存在 -->
	   BsUser selectByAccount(@Param("userAccount")String Account);
	   BsUser selectByUserAccount(@Param("userAccount")String Account);
	    //<!-- 通过邮箱查用户是否存在 -->
	   BsUser selectByEmail(@Param("userEmail")String email);
	   
	   //<!-- 通过用户名，密码查询用户是否存在
	   BsUser selectByAccountAndPassword(@Param("userAccount")String account,@Param("userPassword")String password);
	   
	   //<!-- 通过邮箱，密码查询用户是否存在 -->
	   BsUser selectByEmailAndPassword(@Param("userEmail")String email,@Param("userPassword")String password);
	   //通过主键查询用户信息
	   BsUser selectByPrimaryKey(int userId);
	   //注册
	   int insertRegister(BsUser bsUser);
	   //有选择的插入用户信息
	   int insertSelective(BsUser bsUser);
	   //有选择地更新用户信息
	   int updateByPrimaryKeySelective(BsUser bsUser);
	   //通过昵称查询用户信息
	   BsUser selectByUserName(String username);
	 //通过昵称查询用户信息
	   BsUser selectByReplyAdmin(String username);
	   //删除用户
	   int deleteByPrimaryKey(int userid);
		List<BsUser> selectByTimeANDName (@Param("starttime") Date start,@Param("endtime") Date end,@Param("fileName") String fileName);
		List<BsUser> selectByTime (@Param("starttime") Date start,@Param("endtime") Date end);
		List<BsUser> selectByFileTitle (BsUser record);
}