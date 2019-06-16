package cn.ts.entity;

public class BsSmallboard {
    private Integer smboId;

    private String smboTitle;

    private String smboAdmin;

    private Integer smboBiboId;

    public Integer getSmboId() {
        return smboId;
    }

    public void setSmboId(Integer smboId) {
        this.smboId = smboId;
    }

    public String getSmboTitle() {
        return smboTitle;
    }

    public void setSmboTitle(String smboTitle) {
        this.smboTitle = smboTitle == null ? null : smboTitle.trim();
    }

    public String getSmboAdmin() {
        return smboAdmin;
    }

    public void setSmboAdmin(String smboAdmin) {
        this.smboAdmin = smboAdmin == null ? null : smboAdmin.trim();
    }

    public Integer getSmboBiboId() {
        return smboBiboId;
    }

    public void setSmboBiboId(Integer smboBiboId) {
        this.smboBiboId = smboBiboId;
    }

	@Override
	public String toString() {
		return "BsSmallboard [smboId=" + smboId + ", smboTitle=" + smboTitle + ", smboAdmin=" + smboAdmin
				+ ", smboBiboId=" + smboBiboId + "]";
	}
    
}