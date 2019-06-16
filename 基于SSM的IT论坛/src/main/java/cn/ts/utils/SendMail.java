package cn.ts.utils;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public String sendEmailAccount="apachecntribune@163.com";
	//public String sendEmailPassword="ykavpuqzsqckbdgi";
	public String sendEmailPassword="163wangyi";
	public String sendEmailSMTPHost="smtp.163.com";
	public String receiveMailAccount="920846625@qq.com";
	public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String mailContent) throws UnsupportedEncodingException, MessagingException{
		System.out.println("执行createMimeMessage前。。。。。。。。。");
		MimeMessage message=new MimeMessage(session);
		message.setFrom(new InternetAddress(sendMail, "apacheCN", "UTF-8"));
		message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress(sendMail));
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "尊敬的用户", "UTF-8"));
		message.setSubject("找回密码提醒", "UTF-8");
		message.setContent(mailContent, "text/html;charset=UTF-8");
		message.setSentDate(new Date());
		message.saveChanges();
		System.out.println("执行createMimeMessage后。。。。。。。。。");
		return message;
	}
	public void sendMail(String receiveMailAccount, String mailContent){
		System.out.println("执行sendMail前。。。。。。。。。");
		Properties props=new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", sendEmailSMTPHost);
		props.setProperty("mail.smtp.auth", "true");
		Session session=Session.getInstance(props);
		session.setDebug(true);
		
			MimeMessage message;
			try {
				message = createMimeMessage(session, sendEmailAccount, receiveMailAccount, mailContent);
				Transport transport=session.getTransport();
				transport.connect(sendEmailAccount, sendEmailPassword);
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();
			} catch (UnsupportedEncodingException | MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
	}
	public static void main(String[] args) {
		SendMail send=new SendMail();
		send.sendMail(send.receiveMailAccount,"欢迎您加入apacheCN！！！");
	}
}
