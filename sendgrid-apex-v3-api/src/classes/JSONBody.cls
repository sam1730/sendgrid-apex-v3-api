global class JSONBody {

    /* class constants */    
    private static final String ENCODING_TYPE = 'UTF-8';        

    // API params
    private static final String SG_PARAM_PERSONALIZATIONS = 'personalizations';
    private static final String SG_PARAM_TO = 'to';
    private static final String SG_PARAM_CC = 'cc';
    private static final String SG_PARAM_BCC = 'bcc';
    private static final String SG_PARAM_EMAIL = 'email';
    private static final String SG_PARAM_NAME = 'name';
    private static final String SG_PARAM_SUBJECT = 'subject';
    private static final String SG_PARAM_FROM = 'from';
    private static final String SG_PARAM_REPLY_TO = 'reply_to';
    private static final String SG_PARAM_ATTACHMENTS = 'attachments';
    private static final String SG_PARAM_CONTENT = 'content';
    private static final String SG_PARAM_FILENAME = 'filename';
    private static final String SG_PARAM_TYPE = 'type';
    private static final String SG_PARAM_VALUE = 'value';
    private static final String SG_PARAM_CONTENT_TYPE_HTML = 'text/html';
    private static final String SG_PARAM_CONTENT_TYPE_TEXT = 'text/plain';
    private static final String SG_PARAM_CUSTOM_ARGS = 'custom_args';

    public JSONBody() {}    

    public static String generateJSONEmailBody( Email e) {
        String returnVal = '';

        if ( e != null) {

            // Create a JSONGenerator instance, disable pretty print
            System.JSONGenerator gen = System.JSON.createGenerator( false);
            try {
                
                gen.writeStartObject();

                // JSON Body: Personalizations Start
                gen.writeFieldName(SG_PARAM_PERSONALIZATIONS);
                gen.writeStartArray();
                    
                    // JSON Body: Recipient Email List
                    gen.writeStartObject();
                        gen.writeFieldName(SG_PARAM_TO);                            
                            gen.writeStartArray();
                            for (String toAddresses : e.toList) {                                
                                gen.writeStartObject();
                                gen.writeStringField(SG_PARAM_EMAIL, toAddresses);
                                gen.writeStringField(SG_PARAM_NAME, toAddresses);
                                gen.writeEndObject();
                            }                                
                            gen.writeEndArray();

                        // JSON Body: CC Email List
                        if (e.ccList != null && !e.ccList.isEmpty())
                        {                        
                            gen.writeFieldName(SG_PARAM_CC);                            
                                gen.writeStartArray();
                                for (String toCcAddresses : e.ccList) {                                
                                    gen.writeStartObject();
                                    gen.writeStringField(SG_PARAM_EMAIL, toCcAddresses);
                                    gen.writeStringField(SG_PARAM_NAME, toCcAddresses);
                                    gen.writeEndObject();
                                }                                
                                gen.writeEndArray();
                        }

                        // JSON Body: BCC Email List
                        if (e.bccList != null && !e.bccList.isEmpty())
                        {
                            gen.writeFieldName(SG_PARAM_BCC);                            
                                gen.writeStartArray();
                                for (String toBccAddresses : e.bccList) {                                
                                    gen.writeStartObject();
                                    gen.writeStringField(SG_PARAM_EMAIL, toBccAddresses);
                                    gen.writeStringField(SG_PARAM_NAME, toBccAddresses);
                                    gen.writeEndObject();
                                }                                
                                gen.writeEndArray();
                        }
                    gen.writeEndObject();                                            

                gen.writeEndArray();
                // JSON Body: Personalizations End

                // JSON Body: Email Custom Arguments
                if ( e.customArguments != null && !e.customArguments.values().isEmpty()) {
                    
                    gen.writeFieldName(SG_PARAM_CUSTOM_ARGS);
                    gen.writeStartObject();
                        for (String customArgs : e.customArguments.keyset())
                        {
                            gen.writeStringField(customArgs, e.customArguments.get(customArgs));
                        }
                    gen.writeEndObject();
                }

                // JSON Body: Email Subject
                if ( e.subject != null) {
                    gen.writeStringField(SG_PARAM_SUBJECT, EncodingUtil.urlDecode( e.subject, ENCODING_TYPE));
                }

                // JSON Body: Sender List
                if ( e.fromm != null) {
                    gen.writeFieldName(SG_PARAM_FROM);
                        gen.writeStartObject();
                            gen.writeStringField(SG_PARAM_EMAIL, e.fromm);
                            gen.writeStringField(SG_PARAM_NAME, e.fromm);
                        gen.writeEndObject();
                }

                // JSON Body: Email Attachment
                if ( e.attachmentList != null && !e.attachmentList.isEmpty()) {
                    gen.writeFieldName(SG_PARAM_ATTACHMENTS);
                    gen.writeStartArray();

                        for (integer i = 0; i < e.attachmentList.size(); i++) {
                            gen.writeStartObject();
                                gen.writeStringField(SG_PARAM_CONTENT, EncodingUtil.base64Encode(e.attachmentList[i].Body));
                                gen.writeStringField(SG_PARAM_FILENAME, e.attachmentList[i].Name);		
                                gen.writeStringField(SG_PARAM_TYPE, e.attachmentList[i].ContentType);
                            gen.writeEndObject();
                        }

                    gen.writeEndArray();
                }

                // JSON Body: HTML Email Body
                if ( e.html != null) {
                    gen.writeFieldName(SG_PARAM_CONTENT);
                    gen.writeStartArray();
                        gen.writeStartObject();
                            gen.writeStringField(SG_PARAM_TYPE, SG_PARAM_CONTENT_TYPE_HTML);
                            gen.writeStringField(SG_PARAM_VALUE, EncodingUtil.urlDecode( e.html, ENCODING_TYPE));
                        gen.writeEndObject();
                    gen.writeEndArray();
                }
                            
                gen.writeEndObject();
                returnVal = gen.getAsString();                                

            } catch ( Exception ex) {

                // log exception and throw to caller for handling
                System.debug( 'DEBUG:::exception in JSONBody.generateJSONEmailBody' + ex.getMessage());

                throw ex;
            } finally {

                // close JSONGenerator regardless
                gen.close();
            }
        }    

        return returnVal;
    }
    
}