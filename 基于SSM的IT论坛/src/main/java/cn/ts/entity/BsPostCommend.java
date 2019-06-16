package cn.ts.entity;

import java.util.Date;

public class BsPostCommend {
    private Integer pocoId;

    private Integer pocoCommendType;

    private Date pocoCommendTime;

    private String pocoCommendPerson;

    private String pocoCommendReason;

    private Integer pocoPostId;

    public Integer getPocoId() {
        return pocoId;
    }

    public void setPocoId(Integer pocoId) {
        this.pocoId = pocoId;
    }

    public Integer getPocoCommendType() {
        return pocoCommendType;
    }

    public void setPocoCommendType(Integer pocoCommendType) {
        this.pocoCommendType = pocoCommendType;
    }

    public Date getPocoCommendTime() {
        return pocoCommendTime;
    }

    public void setPocoCommendTime(Date pocoCommendTime) {
        this.pocoCommendTime = pocoCommendTime;
    }

    public String getPocoCommendPerson() {
        return pocoCommendPerson;
    }

    public void setPocoCommendPerson(String pocoCommendPerson) {
        this.pocoCommendPerson = pocoCommendPerson == null ? null : pocoCommendPerson.trim();
    }

    public String getPocoCommendReason() {
        return pocoCommendReason;
    }

    public void setPocoCommendReason(String pocoCommendReason) {
        this.pocoCommendReason = pocoCommendReason == null ? null : pocoCommendReason.trim();
    }

    public Integer getPocoPostId() {
        return pocoPostId;
    }

    public void setPocoPostId(Integer pocoPostId) {
        this.pocoPostId = pocoPostId;
    }

	@Override
	public String toString() {
		return "BsPostCommend [pocoId=" + pocoId + ", pocoCommendType=" + pocoCommendType + ", pocoCommendTime="
				+ pocoCommendTime + ", pocoCommendPerson=" + pocoCommendPerson + ", pocoCommendReason="
				+ pocoCommendReason + ", pocoPostId=" + pocoPostId + "]";
	}
}