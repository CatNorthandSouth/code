package cn.ts.entity;

public class BsPostZan {
    private Integer postId;

    private Integer userId;

    private Integer state;

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

	@Override
	public String toString() {
		return "BsPostZan [postId=" + postId + ", userId=" + userId + ", state=" + state + "]";
	}
    
}