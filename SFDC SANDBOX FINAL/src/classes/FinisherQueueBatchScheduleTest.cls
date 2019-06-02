@istest (seeAlldata=false)
public class FinisherQueueBatchScheduleTest
{
    public static testmethod void testm()
    {
    
    /*
       // Create one Account 
       
       Account acc = new Account();
       acc.lastname= 'teat';
       acc.PersonEmail='vana@mail.com';
       insert acc; 
       
       // Create one funding agreement with Finisher_Ready__c =true, Finisher_Priority__c <4, target amount is some thing
       Id devRecordTypeId = Schema.SObjectType.Funding_Agreement__c.getRecordTypeInfosByName().get('Pre-Funding Loan').getRecordTypeId();
       
       Funding_Agreement__c f1 = new Funding_Agreement__c ();
       f1=[select Id from Funding_Agreement__c where Finisher_Ready__c='YES'].clone();
       
       insert f1; 
       
       // Create second funding agreemtn with Finisher__c = userinfo.getuserId(), Finisher_Ready__c =true, target amount is some thing
       */
       
       Test.starttest();
       String sch = '0 0 23 * * ?'; 
       system.schedule('Test Territory Check', sch, new FinisherQueueBatchSchedule()); 
       
       
       Test.stopTest(); 
      
     }
       
      
        
    
}