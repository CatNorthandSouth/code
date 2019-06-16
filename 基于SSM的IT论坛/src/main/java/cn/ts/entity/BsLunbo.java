package cn.ts.entity;

public class BsLunbo {
    private Integer lunboId;

    private String lunboPath;

    private Integer lunboState;

    public Integer getLunboId() {
        return lunboId;
    }

    public void setLunboId(Integer lunboId) {
        this.lunboId = lunboId;
    }

    public String getLunboPath() {
        return lunboPath;
    }

    public void setLunboPath(String lunboPath) {
        this.lunboPath = lunboPath == null ? null : lunboPath.trim();
    }

    public Integer getLunboState() {
        return lunboState;
    }

    public void setLunboState(Integer lunboState) {
        this.lunboState = lunboState;
    }
}