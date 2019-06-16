package cn.ts.entity;

public class BsRank {
    private Integer id;

    private Integer userId;

    private Integer preRank;

    private Integer nowRank;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPreRank() {
        return preRank;
    }

    public void setPreRank(Integer preRank) {
        this.preRank = preRank;
    }

    public Integer getNowRank() {
        return nowRank;
    }

    public void setNowRank(Integer nowRank) {
        this.nowRank = nowRank;
    }
}