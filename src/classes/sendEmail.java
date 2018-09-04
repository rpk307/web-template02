package classes;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class sendEmail {

    public static void main (String args[]){
        sendConfirmation("r.khosla307@gmail.com", "www.google.com");
    }
    public static boolean sendConfirmation (String email, String link){

        final String username = "r.khosla307@gmail.com";
        final String password = "r0h19@n98";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("r.khosla307@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("Test Account Confirmation");
            message.setContent("<a href = \""+ link +"\"> Click here to activate your account</a>", "text/html;");

            Transport.send(message);

            System.out.println("Done");

            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
