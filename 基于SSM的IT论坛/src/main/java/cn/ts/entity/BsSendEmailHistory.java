package cn.ts.entity;

import java.util.Date;

public class BsSendEmailHistory {
    private Integer id;

    private String sendEmailAccount;

    private String sender;

    private String receiveEmailAccount;

    private String sendEmailPassword;

    private String receiveder;

    private String emailTheme;

    private String emailContent;

    private Date sendDate;

    private Integer emailType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSendEmailAccount() {
        return sendEmailAccount;
    }

    public void setSendEmailAccount(String sendEmailAccount) {
        this.sendEmailAccount = sendEmailAccount == null ? null : sendEmailAccount.trim();
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender == null ? null : sender.trim();
    }

    public String getReceiveEmailAccount() {
        return receiveEmailAccount;
    }

    public void setReceiveEmailAccount(String receiveEmailAccount) {
        this.receiveEmailAccount = receiveEmailAccount == null ? null : receiveEmailAccount.trim();
    }

    public String getSendEmailPassword() {
        return sendEmailPassword;
    }

    public void setSendEmailPassword(String sendEmailPassword) {
        this.sendEmailPassword = sendEmailPassword == null ? null : sendEmailPassword.trim();
    }

    public String getReceiveder() {
        return receiveder;
    }

    public void setReceiveder(String receiveder) {
        this.receiveder = receiveder == null ? null : receiveder.trim();
    }

    public String getEmailTheme() {
        return emailTheme;
    }

    public void setEmailTheme(String emailTheme) {
        this.emailTheme = emailTheme == null ? null : emailTheme.trim();
    }

    public String getEmailContent() {
        return emailContent;
    }

    public void setEmailContent(String emailContent) {
        this.emailContent = emailContent == null ? null : emailContent.trim();
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public Integer getEmailType() {
        return emailType;
    }

    public void setEmailType(Integer emailType) {
        this.emailType = emailType;
    }
}