/**
 * Email.cls
 *
 * @description: Represents a single Email message.
 *
 * @author: Prateek Kumar
 */
global class Email {	
    
    public String fromm {
        get { return ( !String.isEmpty( this.fromm) ? this.fromm : ''); }
        set { this.fromm = value; }
    }
    
    public String fromName {
        get { return ( !String.isEmpty( this.fromName) ? this.fromName : ''); }
        set { this.fromName = value; }
    }
    
    public String replyTo {
        get { return ( !String.isEmpty( this.replyTo) ? this.replyTo : ''); }
        set { this.replyTo = value; }
    }
    
    public String subject {
        get { return ( !String.isEmpty( this.subject) ? this.subject : ''); }
        set { this.subject = value; }
    }
    public String text {
        get { return ( !String.isEmpty( this.text) ? this.text : ''); }
        set { this.text = value; }
    }

    public String html {
        get { return ( !String.isEmpty( this.html) ? this.html : ''); }
        set { this.html = value; }
    }

    public List<String> toList {
        get { return ( this.toList == null ? this.toList = new List<String>() : this.toList); }
        set { this.toList = value; }
    }

    public List<String> bccList {
        get { return ( this.bccList == null ? this.bccList = new List<String>() : this.bccList); }
        set { this.bccList = value; }
    }

    public List<String> ccList {
        get { return ( this.ccList == null ? this.ccList = new List<String>() : this.ccList); }
        set { this.ccList = value; }
    }

    public Map<String, String> customArguments {
        get { return ( this.customArguments == null ? this.customArguments = new Map<String, String>() : this.customArguments); }
        set { this.customArguments = value; }
    }

    public List<Attachment> attachmentList {
        get { return ( this.attachmentList == null ? this.attachmentList = new List<Attachment>() : this.attachmentList); }
        set { this.attachmentList = value; }
    }
    
    public Email() {}
    
    public Email(String to, String fromm, String subject, String body) {      

        this.toList = ( to != null ? new List<String> {to} : this.toList);
        this.fromm = ( fromm != null ? fromm : '');
        this.subject = ( subject != null ? subject : '');
        this.html = ( body != null ? body : '');
        
    }
    
    public Email(List<String> to, String fromm, String subject, String body) {
        
        this.toList = ( to != null && !to.isEmpty() ? to : this.toList);
        this.fromm = ( fromm != null ? fromm : '');
        this.subject = ( subject != null ? subject : '');
        this.html = ( body != null ? body : '');
        
    }
    
    public Email addTo(String value) {
        this.toList.add(value);
        return this;
    }
    
    public Email addTo(List<String> value) {
        this.toList = value;
        return this;
    }
    
    public Email setFrom(String value) {
        this.fromm = value;
        return this;
    }
    
    public Email setFromName(String value) {
        this.fromName = value;
        return this;       
    }
    
    public Email setReplyTo(String value) {
        this.replyTo = value;
        return this;
    }
    
    public Email addBcc(String value) {
        this.bccList.add(value);
        return this;
    }
    
    public Email addBcc(List<String> value) {
        this.bccList = value;
        return this;
    }
    
    public Email addCC(String value) {
        this.ccList.add(value);
        return this;
    }
    
    public Email addCC(List<String> value) {
        this.ccList = value;
        return this;
    }
    
    public Email setSubject(String value) {
        this.subject = value;
        return this;
    }
    
    public Email setText(String value) {
        this.text = value;
        return this;
    }
    
    public Email setHtml(String value) {
        this.html = value;
        return this;
    }
    
    public Email addAttachment(Attachment value) {
        this.attachmentList.add(value);
        return this;
    }
    
    public Email addAttachment(List<Attachment> value) {
        this.attachmentList = value;
        return this;
    }
    
    public Email setCustomArguments(Map<String, String> value) {
        this.customArguments = value;
        return this;
    }    
}