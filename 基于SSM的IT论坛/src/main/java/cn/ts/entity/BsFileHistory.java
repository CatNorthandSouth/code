package cn.ts.entity;

import java.util.Date;

public class BsFileHistory {
    private Integer downId;

    private Integer fileId;

    private String fileName;

    private String filePath;

    private Date fileCreateTime;

    private String fileUpAdmin;

    private Integer fileUpId;

    private Integer fileLoadCount;

    private Double fileSize;

    private Integer fileType;

    private String fileDes;

    private String filePicture;

    public Integer getDownId() {
        return downId;
    }

    public void setDownId(Integer downId) {
        this.downId = downId;
    }

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public Date getFileCreateTime() {
        return fileCreateTime;
    }

    public void setFileCreateTime(Date fileCreateTime) {
        this.fileCreateTime = fileCreateTime;
    }

    public String getFileUpAdmin() {
        return fileUpAdmin;
    }

    public void setFileUpAdmin(String fileUpAdmin) {
        this.fileUpAdmin = fileUpAdmin == null ? null : fileUpAdmin.trim();
    }

    public Integer getFileUpId() {
        return fileUpId;
    }

    public void setFileUpId(Integer fileUpId) {
        this.fileUpId = fileUpId;
    }

    public Integer getFileLoadCount() {
        return fileLoadCount;
    }

    public void setFileLoadCount(Integer fileLoadCount) {
        this.fileLoadCount = fileLoadCount;
    }

    public Double getFileSize() {
        return fileSize;
    }

    public void setFileSize(Double fileSize) {
        this.fileSize = fileSize;
    }

    public Integer getFileType() {
        return fileType;
    }

    public void setFileType(Integer fileType) {
        this.fileType = fileType;
    }

    public String getFileDes() {
        return fileDes;
    }

    public void setFileDes(String fileDes) {
        this.fileDes = fileDes == null ? null : fileDes.trim();
    }

    public String getFilePicture() {
        return filePicture;
    }

    public void setFilePicture(String filePicture) {
        this.filePicture = filePicture == null ? null : filePicture.trim();
    }
}