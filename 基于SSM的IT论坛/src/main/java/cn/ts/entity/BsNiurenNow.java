package cn.ts.entity;

public class BsNiurenNow {
    private Integer niurenId;

    private String niurenAdmin;

    private String niurenPhoto;

    private Integer niurenWeekScore;

    private Integer niurenMonthScore;

    private Integer niurenYearScore;

    private Integer userId;

    public Integer getNiurenId() {
        return niurenId;
    }

    public void setNiurenId(Integer niurenId) {
        this.niurenId = niurenId;
    }

    public String getNiurenAdmin() {
        return niurenAdmin;
    }

    public void setNiurenAdmin(String niurenAdmin) {
        this.niurenAdmin = niurenAdmin == null ? null : niurenAdmin.trim();
    }

    public String getNiurenPhoto() {
        return niurenPhoto;
    }

    public void setNiurenPhoto(String niurenPhoto) {
        this.niurenPhoto = niurenPhoto == null ? null : niurenPhoto.trim();
    }

    public Integer getNiurenWeekScore() {
        return niurenWeekScore;
    }

    public void setNiurenWeekScore(Integer niurenWeekScore) {
        this.niurenWeekScore = niurenWeekScore;
    }

    public Integer getNiurenMonthScore() {
        return niurenMonthScore;
    }

    public void setNiurenMonthScore(Integer niurenMonthScore) {
        this.niurenMonthScore = niurenMonthScore;
    }

    public Integer getNiurenYearScore() {
        return niurenYearScore;
    }

    public void setNiurenYearScore(Integer niurenYearScore) {
        this.niurenYearScore = niurenYearScore;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

	@Override
	public String toString() {
		return "BsNiurenNow [niurenId=" + niurenId + ", niurenAdmin=" + niurenAdmin + ", niurenPhoto=" + niurenPhoto
				+ ", niurenWeekScore=" + niurenWeekScore + ", niurenMonthScore=" + niurenMonthScore
				+ ", niurenYearScore=" + niurenYearScore + ", userId=" + userId + "]";
	}
}