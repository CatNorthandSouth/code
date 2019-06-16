package cn.ts.entity;

import java.util.Date;

public class BsUser {
    private Integer userId;

    private String userAccount;

    private String userName;

    private String userSex;

    private String userRealName;

    private Integer userMycollect;

    private Integer userMyfans;

    private String userPhoto;

    private Integer userMyfocus;

    private String userPassword;

    private String userTel;

    private String userEmail;

    private String userAddress;

    private String userProvince;

    private String userCity;

    private String userArea;

    private Date userRegisterTime;

    private Integer userUsingState;

    private Integer userDeleteState;

    private String userShow;

    private Date userLoginTime;

    private String userMybirthday;

    private Integer userAllmarks;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount == null ? null : userAccount.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex == null ? null : userSex.trim();
    }

    public String getUserRealName() {
        return userRealName;
    }

    public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public void setUserRealName(String userRealName) {
        this.userRealName = userRealName == null ? null : userRealName.trim();
    }

    public Integer getUserMycollect() {
        return userMycollect;
    }

    public void setUserMycollect(Integer userMycollect) {
        this.userMycollect = userMycollect;
    }

    public Integer getUserMyfans() {
        return userMyfans;
    }

    public void setUserMyfans(Integer userMyfans) {
        this.userMyfans = userMyfans;
    }

    public String getUserPhoto() {
        return userPhoto;
    }

    public void userid(String userPhoto) {
        this.userPhoto = userPhoto == null ? null : userPhoto.trim();
    }

    public Integer getUserMyfocus() {
        return userMyfocus;
    }

    public void setUserMyfocus(Integer userMyfocus) {
        this.userMyfocus = userMyfocus;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel == null ? null : userTel.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserProvince() {
        return userProvince;
    }

    public void setUserProvince(String userProvince) {
        this.userProvince = userProvince == null ? null : userProvince.trim();
    }

    public String getUserCity() {
        return userCity;
    }

    public void setUserCity(String userCity) {
        this.userCity = userCity == null ? null : userCity.trim();
    }

    public String getUserArea() {
        return userArea;
    }

    public void setUserArea(String userArea) {
        this.userArea = userArea == null ? null : userArea.trim();
    }

    public Date getUserRegisterTime() {
        return userRegisterTime;
    }

    public void setUserRegisterTime(Date userRegisterTime) {
        this.userRegisterTime = userRegisterTime;
    }

    public Integer getUserUsingState() {
        return userUsingState;
    }

    public void setUserUsingState(Integer userUsingState) {
        this.userUsingState = userUsingState;
    }

    public Integer getUserDeleteState() {
        return userDeleteState;
    }

    public void setUserDeleteState(Integer userDeleteState) {
        this.userDeleteState = userDeleteState;
    }

    public String getUserShow() {
        return userShow;
    }

    public void setUserShow(String userShow) {
        this.userShow = userShow == null ? null : userShow.trim();
    }

    public Date getUserLoginTime() {
        return userLoginTime;
    }

    public void setUserLoginTime(Date userLoginTime) {
        this.userLoginTime = userLoginTime;
    }

    public String getUserMybirthday() {
        return userMybirthday;
    }

    public void setUserMybirthday(String userMybirthday) {
        this.userMybirthday = userMybirthday == null ? null : userMybirthday.trim();
    }

    public Integer getUserAllmarks() {
        return userAllmarks;
    }

    public void setUserAllmarks(Integer userAllmarks) {
        this.userAllmarks = userAllmarks;
    }

	@Override
	public String toString() {
		return "BsUser [userId=" + userId + ", userAccount=" + userAccount + ", userName=" + userName + ", userSex="
				+ userSex + ", userRealName=" + userRealName + ", userMycollect=" + userMycollect + ", userMyfans="
				+ userMyfans + ", userPhoto=" + userPhoto + ", userMyfocus=" + userMyfocus + ", userPassword="
				+ userPassword + ", userTel=" + userTel + ", userEmail=" + userEmail + ", userAddress=" + userAddress
				+ ", userProvince=" + userProvince + ", userCity=" + userCity + ", userArea=" + userArea
				+ ", userRegisterTime=" + userRegisterTime + ", userUsingState=" + userUsingState + ", userDeleteState="
				+ userDeleteState + ", userShow=" + userShow + ", userLoginTime=" + userLoginTime + ", userMybirthday="
				+ userMybirthday + ", userAllmarks=" + userAllmarks + "]";
	}
    
}