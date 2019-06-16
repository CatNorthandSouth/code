package cn.ts.entity;

import java.util.Date;

public class BsPosts {
    private Integer postId;

    private String postTitle;

    private Integer postBiboId;

    private Integer postSmboId;

    private Integer postAdminId;

    private String postAdmin;

    private Date postCreateTime;

    private Date postUpdateTime;

    private String postContent;

    private Integer postGoodCount;

    private Integer postBadCount;

    private Integer postReward;

    private Integer postScore;

    private Integer postIspay;

    private Integer postIslocked;

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle == null ? null : postTitle.trim();
    }

    public Integer getPostBiboId() {
        return postBiboId;
    }

    public void setPostBiboId(Integer postBiboId) {
        this.postBiboId = postBiboId;
    }

    public Integer getPostSmboId() {
        return postSmboId;
    }

    public void setPostSmboId(Integer postSmboId) {
        this.postSmboId = postSmboId;
    }

    public Integer getPostAdminId() {
        return postAdminId;
    }

    public void setPostAdminId(Integer postAdminId) {
        this.postAdminId = postAdminId;
    }

    public String getPostAdmin() {
        return postAdmin;
    }

    public void setPostAdmin(String postAdmin) {
        this.postAdmin = postAdmin == null ? null : postAdmin.trim();
    }

    public Date getPostCreateTime() {
        return postCreateTime;
    }

    public void setPostCreateTime(Date postCreateTime) {
        this.postCreateTime = postCreateTime;
    }

    public Date getPostUpdateTime() {
        return postUpdateTime;
    }

    public void setPostUpdateTime(Date postUpdateTime) {
        this.postUpdateTime = postUpdateTime;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent == null ? null : postContent.trim();
    }

    public Integer getPostGoodCount() {
        return postGoodCount;
    }

    public void setPostGoodCount(Integer postGoodCount) {
        this.postGoodCount = postGoodCount;
    }

    public Integer getPostBadCount() {
        return postBadCount;
    }

    public void setPostBadCount(Integer postBadCount) {
        this.postBadCount = postBadCount;
    }

    public Integer getPostReward() {
        return postReward;
    }

    public void setPostReward(Integer postReward) {
        this.postReward = postReward;
    }

    public Integer getPostScore() {
        return postScore;
    }

    public void setPostScore(Integer postScore) {
        this.postScore = postScore;
    }

    public Integer getPostIspay() {
        return postIspay;
    }

    public void setPostIspay(Integer postIspay) {
        this.postIspay = postIspay;
    }

    public Integer getPostIslocked() {
        return postIslocked;
    }

    public void setPostIslocked(Integer postIslocked) {
        this.postIslocked = postIslocked;
    }

	@Override
	public String toString() {
		return "BsPosts [postId=" + postId + ", postTitle=" + postTitle + ", postBiboId=" + postBiboId + ", postSmboId="
				+ postSmboId + ", postAdminId=" + postAdminId + ", postAdmin=" + postAdmin + ", postCreateTime="
				+ postCreateTime + ", postUpdateTime=" + postUpdateTime + ", postContent=" + postContent
				+ ", postGoodCount=" + postGoodCount + ", postBadCount=" + postBadCount + ", postReward=" + postReward
				+ ", postScore=" + postScore + ", postIspay=" + postIspay + ", postIslocked=" + postIslocked + "]";
	}
}