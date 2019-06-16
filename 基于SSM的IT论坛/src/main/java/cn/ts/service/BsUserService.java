package cn.ts.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.ts.entity.BsUser;
@Repository
public interface BsUserService {

	List<BsUser> selectByuserAllmarks(int marks);
	List<BsUser> selectAll();
    //通过用户名查询用户是否存在 
    boolean selectByAccount(@Param("userName")String username);
    BsUser selectByUserAccount(@Param("userAccount")String Account);
    //查询邮箱是否已经注册 
    boolean selectByEmail(@Param("userEmail")String email);
    /*通过用户名密码查询用户名是否存在
     * */
    BsUser selectByAccountAndPassword(String username,String password);
    /*通过邮箱密码查询用户名是否存在
     * */
    BsUser selectByEmailAndPassword(String email,String password); 
	   //通过主键查询用户信息
    BsUser selectByPrimaryKey(int userId);    
	// 注册
	boolean insertRegister(BsUser bsUser);

	// 有选择的插入用户信息
	int insertSelective(BsUser bsUser);

	// 有选择地更新用户信息
	int updateByPrimaryKeySelective(BsUser bsUser);
	//通过昵称查询用户信息
	BsUser selectByUserName(String username);
	//通过昵称查询用户信息
	BsUser selectByReplyAdmin(String username);
	
	 int deleteByPrimaryKey(int userid);
		List<BsUser> selectByTimeANDName (@Param("starttime") Date start,@Param("endtime") Date end,@Param("fileName") String fileName);
		List<BsUser> selectByTime (@Param("starttime") Date start,@Param("endtime") Date end);
		List<BsUser> selectByFileTitle (BsUser record);
}
