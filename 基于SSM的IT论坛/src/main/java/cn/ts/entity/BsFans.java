package cn.ts.entity;

public class BsFans {
    private Integer fansId;

    private String myFansAdmin;

    private String myFansPhoto;

    private Integer myFansId;

    private Integer userId;

    public Integer getFansId() {
        return fansId;
    }

    public void setFansId(Integer fansId) {
        this.fansId = fansId;
    }

    public String getMyFansAdmin() {
        return myFansAdmin;
    }

    public void setMyFansAdmin(String myFansAdmin) {
        this.myFansAdmin = myFansAdmin == null ? null : myFansAdmin.trim();
    }

    public String getMyFansPhoto() {
        return myFansPhoto;
    }

    public void setMyFansPhoto(String myFansPhoto) {
        this.myFansPhoto = myFansPhoto == null ? null : myFansPhoto.trim();
    }

    public Integer getMyFansId() {
        return myFansId;
    }

    public void setMyFansId(Integer myFansId) {
        this.myFansId = myFansId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}