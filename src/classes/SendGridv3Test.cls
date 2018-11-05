@isTest
private class SendGridv3Test {
	
	@isTest static void testEmailSend() {
		
		insert new SendGridv3__c(
			Name = 'SendGridTesting',
			Endpoint_URL__c = 'https://api.sendgrid.com/v3/mail/send',
			API_Key__c='cv38yfQrRHGh55zr10FaBw'
		);

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
		
		Test.startTest();
			Test.setMock(HttpCalloutMock.class, new SendGridResponseMock());
			SendGridv3.SendGridResponse response = sendgrid.send(email);
		Test.stopTest();
	}	
}