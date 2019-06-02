global class SlackMessageQueueProcessControllerScdl implements schedulable
{
    global void execute(schedulablecontext sc)
    {
        list<Slack_Message_Queue__c> ss = new list<Slack_Message_Queue__c>();
        SlackMessageQueueProcessController s = new SlackMessageQueueProcessController();
        ss=s.processQueue();
        update ss;
        
        list<Slack_Message_Queue__c> SMQs = new list<Slack_Message_Queue__c>();
        SMQs=[select Id,Message_Sent__c from Slack_Message_Queue__c where Message_Sent__c=false];
        
        if(SMQs.size()>0)
        {
            SlackMessageQueueProcessControllerScdl scc = new SlackMessageQueueProcessControllerScdl();
            scc.execute(null);
        }
    }
}