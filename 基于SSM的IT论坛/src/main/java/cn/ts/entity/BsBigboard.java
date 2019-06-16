package cn.ts.entity;

public class BsBigboard {
    private Integer biboId;

    private String biboTitle;

    private String biboAdmin;

    public Integer getBiboId() {
        return biboId;
    }

    public void setBiboId(Integer biboId) {
        this.biboId = biboId;
    }

    public String getBiboTitle() {
        return biboTitle;
    }

    public void setBiboTitle(String biboTitle) {
        this.biboTitle = biboTitle == null ? null : biboTitle.trim();
    }

    public String getBiboAdmin() {
        return biboAdmin;
    }

    public void setBiboAdmin(String biboAdmin) {
        this.biboAdmin = biboAdmin == null ? null : biboAdmin.trim();
    }

	@Override
	public String toString() {
		return "BsBigboard [biboId=" + biboId + ", biboTitle=" + biboTitle + ", biboAdmin=" + biboAdmin + "]";
	}
    
}