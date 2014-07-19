package daffron.fms.hr

import daffron.fms.hr.util.SmtpAuthenticator

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator
import javax.mail.Message
import javax.mail.MessagingException
import javax.mail.Multipart
import javax.mail.Session
import javax.mail.Transport
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeBodyPart
import javax.mail.internet.MimeMessage
import javax.mail.internet.MimeMultipart
import javax.mail.util.ByteArrayDataSource

import org.codehaus.groovy.grails.commons.GrailsApplication

/*
http://www.kodejava.org/examples/243.html

*/


/* service functions as a DSL so the following will work:
		msMailService.sendAuthenticatedMail {
			to "dondenoncourt@gmail.com"
			from "jobs@daffron.com"
			subject "Test Daffron authenticated email server "
			body "it seems to work"
		}
*/
class MsMailService {
	GrailsApplication grailsApplication
	
	def toAddr = []
	String fromAddr
	String bodyText
	String subjectText
	boolean attachments
	def attachFilename = []
	def attachMime = []
	def attachBytes = []
	
	def sendAuthenticatedMail(Closure clo) {
		attachFilename = []
		attachMime = []
		attachBytes = []
		attachments = false
		clo.delegate = this // so it doesn't use the scope of the defining class
		clo.run() // loads to, from, subject, and body
		
		final String username = grailsApplication.config.grails.mail.user
		final String password = grailsApplication.config.grails.mail.password
		
		Properties properties = new Properties()
		properties.put("mail.smtp.host", grailsApplication.config.grails.mail.host)
		properties.put("mail.smtp.port", grailsApplication.config.grails.mail.port)
		properties.put("mail.user", grailsApplication.config.grails.mail.user)
		grailsApplication.config.grails.mail.props.each {prop ->
			properties.put(prop.key, prop.value);
		}
		
		Transport transport = null
		try {
			Authenticator authenticator = new SmtpAuthenticator(username, password)
			Session session = Session.getInstance(properties, authenticator)
			toAddr.each {addr ->
				MimeMessage mimeMessage = createMimeMessage(session, [addr], fromAddr, bodyText?.replaceAll (/\n/, "<br/>"), subjectText, attachments);
				transport = session.getTransport();
				transport.connect(username, password);
				transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
			}
		} finally {
			if (transport != null) try { transport.close(); } catch (MessagingException logOrIgnore) {println 'oops'}
		}
	}
	private MimeMessage createMimeMessage(Session session, def to, String from, String body, String subject, boolean attachments) {
		println "createMimeMessage(def session, $to, $from, $body, $subject) "
		MimeMessage mmessage = new MimeMessage(session);
		mmessage.setFrom(new InternetAddress(from));
	
		// handle to as either one String or a List
		def recipients = [to]
		recipients = recipients.flatten() 
		
		recipients.each{
			mmessage.addRecipient(Message.RecipientType.TO, new InternetAddress(it))
		}
		
		mmessage.setSubject(subject);
		MimeBodyPart messageBodyPart = new MimeBodyPart();
		messageBodyPart.setContent(body, "text/html");
		Multipart multipart = new MimeMultipart();
		multipart.addBodyPart(messageBodyPart)
	   
		if (attachments) {
			attachFilename.eachWithIndex{filename, i ->
				messageBodyPart = new MimeBodyPart();
				DataSource dataSource = new ByteArrayDataSource(attachBytes[i], attachMime[i])
				messageBodyPart.setDataHandler(new DataHandler(dataSource))
				messageBodyPart.setFileName(filename)
				multipart.addBodyPart(messageBodyPart);
			}
		}
		
		mmessage.setContent(multipart);
		mmessage
	}
	
	private static Object deserialize(byte[] data) {
		ByteArrayInputStream inn = new ByteArrayInputStream(data)
		ObjectInputStream is = new ObjectInputStream(inn)
		return is.readObject()
	}

	def body(def text) {
		println "body(def $text) ran"
		bodyText = text
	}
	def subject(def text) {
		println "subject(def $text) ran"
		subjectText = text
	}
	def multipart(def text) {
		attachments = text
	}
	def to(List names) {
		System.out.println "to(ArrayList $names)"
		toAddr = names
	}
	def to(String name) {
		System.out.println "to(String $name)"
		toAddr = name
	}
	def from(String name) {
		System.out.println "from(String $name)"
		fromAddr = name
	}
	def attachBytes(String filename, String mimeType, byte[] bytes) {
		attachFilename << filename
		attachMime << mimeType
		attachBytes << bytes
	}
	
	// handle no parenthesis with array argument for to 
	def propertyMissing(String name, value) { 
		if (name == 'to') {
			new ToAddressDSLHandler(toAddr)
		} 
	}
}
class ToAddressDSLHandler {
	List toAddr
	ToAddressDSLHandler(List input) { toAddr = input }
	def getAt( arg ){
		if( arg instanceof List ){
			toAddr.clear()
			arg.each{ toAddr << it}
		}
	 }
}


