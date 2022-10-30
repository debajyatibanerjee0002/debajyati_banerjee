<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Random" %>
<%
	String result;
	String toEmail = request.getParameter("email");
	String subject = request.getParameter("subject");
	String messageContent = request.getParameter("message");
	
	final String from = "testingemail2804@gmail.com";	
	final String pass = "abqewiwokbdxrmjj";
	
	String host = "smtp.gmail.com";	
	Properties props = new Properties();	
	props.put("mail.smtp.host", host);	
	props.put("mail.transport.protocol", "smtp");	
	props.put("mail.smtp.auth", "true");	
	props.put("mail.smtp.starttls.enable", "true");	
	props.put("mail.user", from);	
	props.put("mail.password", pass);	
	props.put("mail.smtp.port", "587");
	
	
	
	// Authorized the Session object.
	
	Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {	
	    @Override	
	    protected PasswordAuthentication getPasswordAuthentication() {	
	        return new PasswordAuthentication(from, pass);	
	    }	
	});
	
	
	
	try {	
	    MimeMessage message = new MimeMessage(mailSession);	
	    message.setFrom(new InternetAddress(from));	
	    message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));	
	    message.setSubject(subject);	
	    message.setText(messageContent);	
	    Transport.send(message);	
	    result = "Your mail sent successfully....";
	
	} catch (MessagingException mex) {	
	    mex.printStackTrace();	
	    result = "Error: unable to send mail....";	
	}


%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><h1><%=result %> </h1></center>
</body>
</html>