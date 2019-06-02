@isTest
public class IncomeVerificationQueueTest
{
    public static testmethod void testm()
    {
        Account acc = new Account();
        Id devRecordTypeId = Schema.SObjectType.Funding_Agreement__c.getRecordTypeInfosByName().get('Funded Loan').getRecordTypeId();
        Id AccRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        acc=CaseTriggerTestUtil.createPesonAccount(AccRecordTypeId );
        
        Funding_Agreement__c fa = new Funding_Agreement__c();
        fa.RecordTypeId=devRecordTypeId;
        fa.Income_Verification_Owner__c =System.UserInfo.getUserId();
        fa.Items_to_Review__c=true;
        fa.Status__c = 'In review - Waiting for supporting documents';
        fa.Ops_Status__c = 'In review - Waiting for supporting documents';
        fa.Name='Test';
        fa.upstart__c=acc.Id;
        insert fa;
        
        IncomeVerificationQueue ivq = new IncomeVerificationQueue();
        ivq.takeApplication();
        ivq.takeApplication2();
        integer i=ivq.getTodayAppsCount();
    }
    
    public static testmethod void testm1()
    {
        Id devRecordTypeId = Schema.SObjectType.Funding_Agreement__c.getRecordTypeInfosByName().get('Funded Loan').getRecordTypeId();
        Id AccRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        Account acc = new Account();
        acc=CaseTriggerTestUtil.createPesonAccount(AccRecordTypeId );
        Funding_Agreement__c fa1 = new Funding_Agreement__c();
        fa1.RecordTypeId=devRecordTypeId;
        fa1.Items_to_Review__c=true;
        fa1.Name='Test';
        fa1.Type_of_Income_Product__c='Employed - Hourly';
        fa1.upstart__c=acc.Id;
        fa1.Type_of_Income_Product__c='Employed - Hourly';
        // fa1.Lending_Program__c='Upstart';
        fa1.Ops_Status__c='Unassigned';
        fa1.Fraud_Risk__c='Low';
        fa1.Escalation_Reason__c='unanswered phone question';
        fa1.Status__c='Documents submitted- please review';
        insert fa1;
        system.debug('@@@@fa1.Lending_Program__c'+fa1.Lending_Program__c);
        system.debug('@@@fa1.Starter_1_Ready__c'+fa1.Starter_1_Ready__c);
        system.debug('@@@fa1.Income_Verification_Owner__c '+fa1.Income_Verification_Owner__c);
         IncomeVerificationQueue ivq1 = new IncomeVerificationQueue();
        ivq1.takeApplication();
        ivq1.takeApplication2();
        
    }
}