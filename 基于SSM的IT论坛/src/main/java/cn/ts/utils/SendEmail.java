package cn.ts.utils;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import cn.ts.entity.BsSendEmailHistory;

public class SendEmail {

	private String sendEmailAccount;//发件人账户
	private String sendEmailPassword;//发件人网易授权密码
	private String sendEmailSMTPHost="smtp.163.com";//发件人邮箱的SMTP服务器地址
	private String receiveEmailAccount;//收件人账户
	
	public MimeMessage createMimeMessage(Session session,BsSendEmailHistory BsSendEmailHistory) throws UnsupportedEncodingException, MessagingException{
		
		System.out.println("执行createMimeMessage前。。。。。。。。。");
		MimeMessage message=new MimeMessage(session);
		message.setFrom(new InternetAddress(BsSendEmailHistory.getSendEmailAccount(), BsSendEmailHistory.getSender(), "utf-8"));
		message.addRecipient(MimeMessage.RecipientType.CC, new InternetAddress(BsSendEmailHistory.getSendEmailAccount()));
		message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(BsSendEmailHistory.getReceiveEmailAccount(), BsSendEmailHistory.getReceiveder(), "utf-8"));
		message.setSubject(BsSendEmailHistory.getEmailTheme(), "utf-8");
		message.setContent(BsSendEmailHistory.getEmailContent(), "text/html;charset=UTF-8");
		message.setSentDate(BsSendEmailHistory.getSendDate());
		message.saveChanges();
		System.out.println("执行createMimeMessage后。。。。。。。。。");
		return message;
		
	}
	public void sendEmail(BsSendEmailHistory bsSendEmailHistory){
		System.out.println("执行sendEmail前。。。。。。。。。");
		Properties properties=new Properties();
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.smtp.host", sendEmailSMTPHost);
		properties.setProperty("mail.smtp.auth", "true");
		Session session=Session.getInstance(properties);
		session.setDebug(true);
		MimeMessage message;
		
		try {
			message=createMimeMessage(session,bsSendEmailHistory);
			Transport transport=session.getTransport();
			transport.connect(bsSendEmailHistory.getSendEmailAccount(), bsSendEmailHistory.getSendEmailPassword());
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (UnsupportedEncodingException | MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("执行sendEmail后。。。。。。。。。");
	}
	
}
