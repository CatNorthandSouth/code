package cn.ts.entity;

public class BsPostCommendType {
    private Integer id;

    private String commSummary;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCommSummary() {
        return commSummary;
    }

    public void setCommSummary(String commSummary) {
        this.commSummary = commSummary == null ? null : commSummary.trim();
    }
}