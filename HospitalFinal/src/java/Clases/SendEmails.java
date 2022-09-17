package Clases;

import java.util.Properties;
import javax.mail.Session;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;

public class SendEmails {
//    public void sendMail(String recepian)  throws Exception{
//        Properties prop = new Properties();
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.starttls.enable","true");
//        prop.put("mail.smtp.host","smtp.gmail.com");
//        prop.put("mail.smtp.port", "587");
//        
//        String myAccount = "vimansatharasinghe@gmail.com";
//        String password = "heatnation";
//        Session session = Session.getInstance(prop, new Authenticator(){ 
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication(){
//                return new PasswordAuthentication(myAccount,password);
//            }
//        });
//        Message msg = prepareMessage(session,myAccount,recepian);  
//        Transport.send(msg);
//    }
//    public Message prepareMessage(Session session,String myAccount,String recepian){
//        try{
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(myAccount));
//            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepian));
//            message.setSubject("MY Email send from java");
//            message.setText("Heyyyyy wz uppp");
//            return  message;
//            
//        }catch(Exception e){}
//        return null;
//    }

    public static void send(String to, String subject, String msg) {

        final String user = "vimansatharasinghe@gmail.com";//change accordingly  
        final String pass = "heatnation";

//1st step) Get the session object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "mail.javatpoint.com");//change accordingly  
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
//2nd step)compose message  
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(msg);

            //3rd step)send message  
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
