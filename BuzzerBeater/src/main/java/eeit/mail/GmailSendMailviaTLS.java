package eeit.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailSendMailviaTLS {
        
	
	    public void SendEmail(String mail, String messageEmail){
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "javaeeit972017@gmail.com";
		final String password = "javaeeit97";// your password
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			String recepient = mail;
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recepient));
			message.setSubject("Gmail Test");
			message.setText(messageEmail);

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("寄信成功");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	    }
	
//	
//	public static void main(String args[]) {
//		String host = "smtp.gmail.com";
//		int port = 587;
//		final String username = "javaeeit972017@gmail.com";
//		final String password = "javaeeit97";// your password
//		
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.port", port);
//		Session session = Session.getInstance(props, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		});
//
//		try {
//			String recepient = "s988309@gmail.com";
//			
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(username));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recepient));
//			message.setSubject("Gmail Test");
//			message.setText("Dear all, \n\n  This is a test of email function !");
//
//			Transport transport = session.getTransport("smtp");
//			transport.connect(host, port, username, password);
//
//			Transport.send(message);
//
//			System.out.println("成功");
//
//		} catch (MessagingException e) {
//			e.printStackTrace();
//		}
//	}
}