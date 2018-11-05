@isTest
private class EmailTest {
	
	@isTest static void testAddTo() {
		Email email = new Email();
		email.addTo('example@example.com');

		System.assertEquals('example@example.com', email.toList[0]);

		email.addTo(new List<String> {'example@example.com'});
		System.assertEquals('example@example.com', email.toList[0]);
	}
	
	@isTest static void testSetFrom() {
		Email email = new Email();
		email.setFrom('example@example.com');
		email.setFromName('Example');

		System.assertEquals('example@example.com', email.fromm);
		System.assertEquals('Example', email.fromName);
	}

	@isTest static void testSetReplyTo() {
		Email email = new Email();
		email.setReplyTo('example@example.com');		

		System.assertEquals('example@example.com', email.replyTo);
	}

	@isTest static void testAddBcc() {
		Email email = new Email();
		email.addBcc('example@example.com');

		System.assertEquals('example@example.com', email.bccList[0]);

		email.addBcc(new List<String> {'example@example.com'});
		System.assertEquals('example@example.com', email.bccList[0]);
	} 

	@isTest static void testAddCc() {
		Email email = new Email();
		email.addCc('example@example.com');

		System.assertEquals('example@example.com', email.ccList[0]);

		email.addCc(new List<String> {'example@example.com'});
		System.assertEquals('example@example.com', email.ccList[0]);
	}

	@isTest static void testSetSubject() {
		Email email = new Email();
		email.setSubject('Hello World! From SendGrid v3 API');		

		System.assertEquals('Hello World! From SendGrid v3 API', email.subject);
	}
	
	@isTest static void testSetText() {
		Email email = new Email();
		email.setText('Hello World! From SendGrid v3 API');		

		System.assertEquals('Hello World! From SendGrid v3 API', email.text);
	}

	@isTest static void testSetHtml() {
		Email email = new Email();
		email.setHtml('<h1>Hello World! From SendGrid v3 API</h1>');		

		System.assertEquals('<h1>Hello World! From SendGrid v3 API</h1>', email.html);
	}

	@isTest static void testAddAttachment() {
		Test.startTest();
			Case cse = new Case();
			insert cse;

			Attachment attach = new Attachment();   	
				attach.Name='Unit Test Attachment';
				Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
				attach.body=bodyBlob;
				attach.parentId=cse.id;
			insert attach;
		Test.stopTest();

		Email email = new Email();
		email.addAttachment(attach);		

		System.assertEquals(attach, email.attachmentList[0]);

		email.addAttachment(new List<Attachment> {attach});
		System.assertEquals(attach, email.attachmentList[0]);
	}

	@isTest static void testSetCustomArguments() {
		Map<String, String> customArgs = new Map<String, String>();
		customArgs.put('FirstName','FName');
		customArgs.put('LastName','LName');

		Email email = new Email();
		email.setCustomArguments(customArgs);		

		System.assertEquals(customArgs, email.customArguments);		
	}

	@isTest static void testEmailConstructor() {
		Email email = new Email('example@to.com','example@from.com','Hello World','SendGridAPIv3');

		System.assertEquals('example@to.com', email.toList[0]);	
		System.assertEquals('example@from.com', email.fromm);
		System.assertEquals('Hello World', email.subject);
		System.assertEquals('SendGridAPIv3', email.html);
	}

	@isTest static void testEmailConstructorWithToList() {
		Email email = new Email(new List<String>{'example@to.com'},'example@from.com','Hello World','SendGridAPIv3');

		System.assertEquals('example@to.com', email.toList[0]);	
		System.assertEquals('example@from.com', email.fromm);
		System.assertEquals('Hello World', email.subject);
		System.assertEquals('SendGridAPIv3', email.html);
	}	
}