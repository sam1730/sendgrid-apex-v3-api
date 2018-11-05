# sendgrid-apex-v3-api

This Apex Toolkit allows you to quickly and easily send emails through [SendGrid](http://sendgrid.com) using [Salesforce Apex](https://developer.salesforce.com/page/Apex).

### Example
```java
SendGridv3 sendgrid = new SendGrid();

Attachment attach = new Attachment();
    attach.Name='Unit Test Attachment';
    Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
    attach.body=bodyBlob;
    attach.ContentType = 'text/plain';

Email email = new Email();
    email.addTo('example@to.com');
    email.setFrom('example@from.com');
    email.addBcc('example@bcc.com');
    email.addCC('example@cc.com');
    email.setSubject('Hello World! SendGrid API v3');
    email.setHtml('<h1>Hello World!</h1><br/><h2>This is a test email sent using SendGridAPIv3</h2>');
    email.addAttachment(attach);

SendGridv3.SendGridResponse response = sendgrid.send(email);
```

## Installation

To start using the SendGrid Apex Toolkit in your Salesforce Org, install the unmanaged package of the library with the following URL:

1.1: <https://login.salesforce.com/packaging/installPackage.apexp?p0=04t6A0000038Hk0>

Click Continue -> Next -> Next -> Install.

## Sendgrid
Create a account with SendGrid and create an API Key.

*Note it down somewhere else to use in the next step*

## Configuration
Go to custom setting and click on manage for SendGridv3.
Create new record with name of *SendGridTesting*

API Key = API KEY
EndPoint URL = V3 URL

*Note : This toolkit willonly work with v3 API*

## Usage

To begin using this library, initialize the SendGrid object with your SendGrid credentials.


```java
SendGridv3 sendgrid = new SendGrid();
```

Add your message details.

```java
Email email = new SendGrid.Email();
    email.addTo('example@to.com');
    email.setFrom('example@from.com');
    email.addBcc('example@bcc.com');
    email.addCC('example@cc.com');
    email.setSubject('Hello World! SendGrid API v3');
    email.setHtml('<h1>Hello World!</h1><br/><h2>This is a test email sent using SendGridAPIv3</h2>');
    email.addAttachment(attach);
```

Send it.

```java
SendGridv3.SendGridResponse response = sendgrid.send(email);
```

### addTo

```java
Email email = new Email();
	email.addTo('example@example.com');
```

### addTo (List of email)

```java
Email email = new Email();
	email.addTo(new List<String> {'example@example.com'});
```

### setFrom

```java
Email email = new Email();
	email.setFrom('example@example.com');
```

### setFromName

```java
Email email = new Email();
	email.setFromName('Example');
```

### setReplyTo

```java
Email email = new Email();
	email.setReplyTo('example@example.com');
```

### Bcc

```java
Email email = new Email();
	email.addBcc('example@example.com');
```

### Bcc (List of emails)

```java
Email email = new Email();
	email.addBcc(new List<String> {'example@example.com'});
```

### Cc

```java
Email email = new Email();
	email.addCc('example@example.com');
```

### Cc (List of emails)

```java
Email email = new Email();
	email.addCc(new List<String> {'example@example.com'});
```

### setSubject

```java
Email email = new Email();
	email.setSubject('Hello World! From SendGrid v3 API');
```

### setText

```java
Email email = new Email();
	email.setText('Hello World! From SendGrid v3 API');
```

### setHtml

```java
Email email = new Email();
	email.setHtml('<h1>Hello World! From SendGrid v3 API</h1>');
```

### setCustomArguments

```java
Map<String, String> customArgs = new Map<String, String>();
	customArgs.put('FirstName','FName');
	customArgs.put('LastName','LName');

	Email email = new Email();
    email.setCustomArguments(customArgs);
```


### addAttachment

```java
Attachment attach = new Attachment();   	
    attach.Name='Unit Test Attachment';
    Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
    attach.body=bodyBlob;
    attach.ContentType = 'text/plain';

Email email = new Email();
	email.addAttachment(attach);
```

### addAttachment (List of Attachments)
```java
Attachment attach = new Attachment();   	
    attach.Name='Unit Test Attachment';
    Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
    attach.body=bodyBlob;
    attach.ContentType = 'text/plain';

Email email = new Email();
	email.addAttachment(new List<Attachment> {attach});
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
