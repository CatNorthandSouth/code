package cn.ts.entity;

public class BsRole {
    private Integer roleId;

    private String roleName;

    private String roleGuize;

    private String roleDescript;

    private Integer roleState;

  

    public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleGuize() {
        return roleGuize;
    }

    public void setRoleGuize(String roleGuize) {
        this.roleGuize = roleGuize == null ? null : roleGuize.trim();
    }

    public String getRoleDescript() {
        return roleDescript;
    }

    public void setRoleDescript(String roleDescript) {
        this.roleDescript = roleDescript == null ? null : roleDescript.trim();
    }

    public Integer getRoleState() {
        return roleState;
    }

    public void setRoleState(Integer roleState) {
        this.roleState = roleState;
    }
}