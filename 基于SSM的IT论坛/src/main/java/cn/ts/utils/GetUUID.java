package cn.ts.utils;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;

public class GetUUID {

	public static String getUUID(){
		String uuid=UUID.randomUUID().toString();
		uuid=uuid.replace("-", "");
		return uuid;
	}
}
