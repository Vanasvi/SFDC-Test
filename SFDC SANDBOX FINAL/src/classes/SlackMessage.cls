global class SlackMessage {
   
    @future (callout=true)
    public static void send(String channel, String message) {
    
        string OrgId=Label.SlackMessageOrgId;
       //  if(!UserInfo.getOrganizationId().startsWith('00D170000001Aah')) { channel = '#sandbox'; }
       if(!UserInfo.getOrganizationId().startsWith(OrgId)) { channel = '#sandbox'; }
        if (channel == '' || channel == null) { channel = '#sandbox'; }
        if (!channel.startsWith('#')) { channel = '#'+channel; }
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://upstart.slack.com/services/hooks/incoming-webhook?token=TUKE7zmSAHkV9j5dT1CsxTXX');
        req.setMethod('POST');
        String payload = '{"channel":"'+channel+'", "text":"'+message+'"}';
        req.setBody(payload);
        if(!Test.isRunningTest())
        HTTPResponse res = h.send(req);
    }
}