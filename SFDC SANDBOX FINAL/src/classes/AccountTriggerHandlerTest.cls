@isTest
public class AccountTriggerHandlerTest
{
    public static testmethod void testm()
    {
        // Create Lending program
        
        Lending_Program__c lp = new Lending_Program__c ();
        lp.Name='Test100';
        insert lp;
        
        // Create Account 
        
        Account acc = new Account();
        
        RecordType recType = [select id,name,sobjectType,ispersontype from recordType where ispersontype=true and sobjectType='account' limit 1];
        acc.RecordType = recType;
        acc.Lending_Program_Name__c='Test100';
        acc.LastName='Test';
        acc.Verification_Call__c='Failed';
        acc.Lifetime_Deposits__c=0;
        insert acc;
        
        // Create funding agreement 
        Id FundRecordTypeId = Schema.SObjectType.Funding_Agreement__c.getRecordTypeInfosByName().get('Funded Loan').getRecordTypeId();
        Funding_Agreement__c f = new Funding_Agreement__c();
        f.RecordTypeId=FundRecordTypeId;
        f.Upstart__c=acc.Id;
        insert f;
        acc.Most_Recent_Funding_Agreement__c =f.Id;
        acc.Lifetime_Deposits__c =100;
        acc.Lifetime_Withdrawals__c=200;
        acc.Is_Fund__c=false;
        acc.External_Whole_Loan__c=false;
        acc.FirstName='Ts';
        acc.Backer_ID__c=123;
        
        update acc;
        acc.Lifetime_Deposits__c =100;
        update acc;
        f.Status__c ='Profile Submitted';
       // f.Verification_Call__c ='Ready to call';
        f.Target_Amount__c =200;
        f.APR__c =10;
        update f;
        
        
        
        
        
        
        
        
    }
}