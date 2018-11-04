@isTest
private class JSONBodyTest {
	
	@isTest static void testJSONBody() {
		Case cse = new Case();
		insert cse;

		Attachment attach = new Attachment();   	
			attach.Name='Unit Test Attachment';
			Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
			attach.body=bodyBlob;
			attach.ContentType = 'text/plain';
			attach.parentId=cse.id;
		insert attach;

		Map<String, String> customArgs = new Map<String, String>();
		customArgs.put('FirstName','FName');
		customArgs.put('LastName','LName');
		
		SendGridv3 sendgrid = new SendGridv3();

		Email email = new Email();
			email.addTo('example@example.com');
			email.setFrom('example@example.com');
			email.setReplyTo('example@example.com');
			email.addBcc('example@example.com');
			email.addCc('example@example.com');
			email.setSubject('Hello World! From SendGrid v3 API');			
			email.setHtml('<h1>Hello World! From SendGrid v3 API</h1>');			
			email.addAttachment(attach);
			email.setCustomArguments(customArgs);
		
		String jsonBody = JSONBody.generateJSONEmailBody(email);		
	}	
}