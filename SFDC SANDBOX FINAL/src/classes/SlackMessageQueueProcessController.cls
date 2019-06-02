global class SlackMessageQueueProcessController
{
    public list<Slack_Message_Queue__c> slqs = new list<Slack_Message_Queue__c>();
    public string Message='';
    public string channel='';
    
    public list<Slack_Message_Queue__c> processQueue()
    {
        boolean istoexecute=false;
        for(Lending_Program__c lp:[select Id,Name from Lending_Program__c])
        {
                system.debug('@@Entering into lp'); 
                for(Slack_Message_Queue__c sm:[select Id,Name,Sum_Amount__c,Message_Sent__c from Slack_Message_Queue__c where Lending_Program__c=:lp.Id and Message_Sent__c=false])
                {
                    system.debug('@@@@@entingin into slack message que');
                    if(sm.Name==lp.Name+'Yesterday')
                    Message=Message+'Yesterday  :'+CurrencyReadableFormat.convertToReadableFormat(sm.Sum_Amount__c);
                    if(sm.Name==lp.Name+'Week')
                    Message=Message+'\n Week-to-Date :'+ CurrencyReadableFormat.convertToReadableFormat(sm.Sum_Amount__c);
                    if(sm.Name==lp.Name+'Month')
                    Message=Message+'\n Month-to-Date :'+CurrencyReadableFormat.convertToReadableFormat(sm.Sum_Amount__c);
                    system.debug('@@@message'+message);
                    
                    
                      
                    slqs.add(new Slack_Message_Queue__c(Id=sm.Id,Message_Sent__c=true));  
                    // return slqs;
                    
                    istoexecute=true;
                }
            string dash='';  
            if(lp.Name=='bankmobile'){
            dash='\n View the Dashboard:https://www.upstart.com/admin/site_statistics/bankmobile_customers';
            channel='#bankmobile';}
            else
            if(lp.Name=='customersbank'){
            dash='\n View the Dashboard:https://www.upstart.com/admin/site_statistics/customersbank';
            channel='#customersbank';
            }
            else
            if(lp.Name=='ffbkc')
            {
                dash='\n View the Dashboard:https://www.upstart.com/admin/site_statistics/ffbkc';
                channel='#firstfederalbankofkc';
            }
            else
            channel='#Sandbox'; 
               
           
            if(istoexecute==true)
            {
                //Message=Message+'\n View the Dashboard:https://www.upstart.com/admin/site_statistics/bankmobile';
                Message=Message+dash;
                SlackMessage.send(channel,Message);
                return slqs;
            }
            
            
        }
        
        return slqs;
    }
}