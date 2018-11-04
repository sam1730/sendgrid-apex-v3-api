global class SendGridv3 {

	private static SendGridv3__c sendGridSetting {
        get{
            if (sendGridSetting == null) {
                sendGridSetting = SendGridv3__c.getInstance('SendGridTesting');
            }
            return sendGridSetting;
        }
        set;
    }
	
	// API header params
    private static final String SG_HEADER_AUTHORIZATION = 'Authorization';
    private static final String SG_HEADER_AUTHORIZATION_TYPE = 'Bearer ';
    private static final String SG_HEADER_CONTENT = 'Content-Type';
    private static final String SG_HEADER_CONTENT_TYPE = 'application/json';
	private static final String SG_HTTP_METHOD = 'POST';		

	public SendGridv3() {}

	public SendGridResponse send(Email emailMessage) {
		SendGridResponse returnVal = new SendGridResponse(null, null);
		if ( emailMessage != null){

			String body = JSONBody.generateJSONEmailBody(emailMessage);

			HttpRequest req = new HttpRequest();
			Http http = new Http();

			req.setEndpoint(sendGridSetting.Endpoint_URL__c);
			req.setMethod(SG_HTTP_METHOD);
			req.setHeader(SG_HEADER_CONTENT,SG_HEADER_CONTENT_TYPE);
			req.setHeader(SG_HEADER_AUTHORIZATION,SG_HEADER_AUTHORIZATION_TYPE + sendGridSetting.API_Key__c);
			req.setBody(body);			

			try {
				HttpResponse res = http.send(req);
				returnVal = new SendGridResponse(res.getStatusCode(), res.getBody());

				return returnVal; 

			} catch (Exception e) {
				throw new SendGridv3Exception(e);
			}
		}

		return returnVal;
	}

	public class SendGridv3Exception extends Exception {}

	public class SendGridResponse {
    public Integer code { get; private set; }
    public Boolean success { get; private set; }
    public String message { get; private set; }

    public SendGridResponse(Integer code, String body) {
      this.code = code;
      this.success = code == 200;
      this.message = body;
    }
  }
}