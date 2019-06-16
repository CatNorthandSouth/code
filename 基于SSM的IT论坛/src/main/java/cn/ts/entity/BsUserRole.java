package cn.ts.entity;

public class BsUserRole {
    private Integer userRoleId;

    private Integer userId;

    private Integer roleId;

    private Integer state;

	public Integer getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "BsUserRole [userRoleId=" + userRoleId + ", userId=" + userId + ", roleId=" + roleId + ", state=" + state
				+ "]";
	}


    
}