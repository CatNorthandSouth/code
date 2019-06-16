package cn.ts.entity;

import java.util.Date;

public class BsPostCollect {
    private Integer collectId;

    private String collectPostTitle;

    private String collectPostAdmin;

    private Date collectPostTime;

    private Integer collectPostId;

    private Integer collectAdminId;

    public Integer getCollectId() {
        return collectId;
    }

    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
    }

    public String getCollectPostTitle() {
        return collectPostTitle;
    }

    public void setCollectPostTitle(String collectPostTitle) {
        this.collectPostTitle = collectPostTitle == null ? null : collectPostTitle.trim();
    }

    public String getCollectPostAdmin() {
        return collectPostAdmin;
    }

    public void setCollectPostAdmin(String collectPostAdmin) {
        this.collectPostAdmin = collectPostAdmin == null ? null : collectPostAdmin.trim();
    }

    public Date getCollectPostTime() {
        return collectPostTime;
    }

    public void setCollectPostTime(Date collectPostTime) {
        this.collectPostTime = collectPostTime;
    }

    public Integer getCollectPostId() {
        return collectPostId;
    }

    public void setCollectPostId(Integer collectPostId) {
        this.collectPostId = collectPostId;
    }

    public Integer getCollectAdminId() {
        return collectAdminId;
    }

    public void setCollectAdminId(Integer collectAdminId) {
        this.collectAdminId = collectAdminId;
    }

	@Override
	public String toString() {
		return "BsPostCollect [collectId=" + collectId + ", collectPostTitle=" + collectPostTitle
				+ ", collectPostAdmin=" + collectPostAdmin + ", collectPostTime=" + collectPostTime + ", collectPostId="
				+ collectPostId + ", collectAdminId=" + collectAdminId + "]";
	}
    
}