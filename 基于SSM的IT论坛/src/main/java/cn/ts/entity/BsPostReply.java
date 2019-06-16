package cn.ts.entity;

import java.util.Date;

public class BsPostReply {
    private Integer replyId;

    private String replyAdmin;

    private Integer replyPostId;

    private Integer replySmboId;

    private Integer replyBiboId;

    private String replyContent;

    private Date replyCreateTime;

    private Integer replyGoodCount;

    private Integer replyBadCount;

    private Integer replyScore;

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public String getReplyAdmin() {
        return replyAdmin;
    }

    public void setReplyAdmin(String replyAdmin) {
        this.replyAdmin = replyAdmin == null ? null : replyAdmin.trim();
    }

    public Integer getReplyPostId() {
        return replyPostId;
    }

    public void setReplyPostId(Integer replyPostId) {
        this.replyPostId = replyPostId;
    }

    public Integer getReplySmboId() {
        return replySmboId;
    }

    public void setReplySmboId(Integer replySmboId) {
        this.replySmboId = replySmboId;
    }

    public Integer getReplyBiboId() {
        return replyBiboId;
    }

    public void setReplyBiboId(Integer replyBiboId) {
        this.replyBiboId = replyBiboId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent == null ? null : replyContent.trim();
    }

    public Date getReplyCreateTime() {
        return replyCreateTime;
    }

    public void setReplyCreateTime(Date replyCreateTime) {
        this.replyCreateTime = replyCreateTime;
    }

    public Integer getReplyGoodCount() {
        return replyGoodCount;
    }

    public void setReplyGoodCount(Integer replyGoodCount) {
        this.replyGoodCount = replyGoodCount;
    }

    public Integer getReplyBadCount() {
        return replyBadCount;
    }

    public void setReplyBadCount(Integer replyBadCount) {
        this.replyBadCount = replyBadCount;
    }

    public Integer getReplyScore() {
        return replyScore;
    }

    public void setReplyScore(Integer replyScore) {
        this.replyScore = replyScore;
    }

	@Override
	public String toString() {
		return "BsPostReply [replyId=" + replyId + ", replyAdmin=" + replyAdmin + ", replyPostId=" + replyPostId
				+ ", replySmboId=" + replySmboId + ", replyBiboId=" + replyBiboId + ", replyContent=" + replyContent
				+ ", replyCreateTime=" + replyCreateTime + ", replyGoodCount=" + replyGoodCount + ", replyBadCount="
				+ replyBadCount + ", replyScore=" + replyScore + "]";
	}
    
}