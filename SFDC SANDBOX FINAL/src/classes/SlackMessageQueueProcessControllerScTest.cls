@isTest 
public class SlackMessageQueueProcessControllerScTest
{
    public static testmethod void testm()
    {
      test.starttest();  
        // Create a lending program for bankmobile, customersbank and test 
        list<Lending_Program__c> lp = new list<Lending_Program__c>();
        lp.add(new Lending_Program__c(Name='bankmobile'));
        lp.add(new Lending_Program__c(Name='customersbank'));
        lp.add(new Lending_Program__c(Name='Test'));
        insert lp;
        
       
        
        // Create Slack_Message_Queue__c 
        
        list<Slack_Message_Queue__c> smq = new list<Slack_Message_Queue__c>();
        smq.add(new Slack_Message_Queue__c(Name='bankmobileMonth',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[0].Id));
        smq.add(new Slack_Message_Queue__c(Name='bankmobileWeek',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[0].Id));
        smq.add(new Slack_Message_Queue__c(Name='bankmobileYesterday',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[0].Id));
        smq.add(new Slack_Message_Queue__c(Name='customersbankMonth',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[1].Id));
        smq.add(new Slack_Message_Queue__c(Name='customersbankWeek',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[1].Id));
        smq.add(new Slack_Message_Queue__c(Name='customersbankYesterday',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[1].Id));
        smq.add(new Slack_Message_Queue__c(Name='TestMonth',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[2].Id));
        smq.add(new Slack_Message_Queue__c(Name='TestWeek',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[2].Id));
        smq.add(new Slack_Message_Queue__c(Name='TestYesterday',Sum_Amount__c=1000,Refreshed_Date_Time__c=system.now(),Message_Sent__c=false,Lending_Program__c=lp[2].Id));
        
        
        insert smq;
       
        
        
        
        SlackMessageQueueProcessControllerScdl s1 = new SlackMessageQueueProcessControllerScdl();
        s1.execute(null); 
        Test.stopTest();
        
        
    }
}