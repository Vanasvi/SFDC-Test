@IsTest
public class FinisherQueueTests {
    static testMethod void validateFinisherQueue() {
        Account a = new Account(Name='Test Account');
        RecordType recType = [select id,name,sobjectType,ispersontype from recordType where ispersontype=true and sobjectType='account' limit 1];
        a.RecordType = recType;
        insert(a);
        Id aid = a.id;
        Funding_Agreement__c fa = new Funding_Agreement__c(Name='TEST AGREEMENT', Upstart__c=a.Id);
        insert(fa);
        Id faid = fa.id;
        fa.Ops_Status__c = 'Verified';
        fa.Status__c = 'Documents submitted- please review';
        fa.Items_to_Review__c = true;
        update(fa);
        fa = [select Ops_Status__c, Status__c, Finisher_Ready__c, New_Docs__c, Items_to_Review__c from Funding_Agreement__c where Id=:faId];
        System.debug('Ops Status: '+fa.Ops_Status__c);
        System.debug('Status: '+fa.Status__c);
        System.debug('Items Review Status: '+fa.Items_to_Review__c);
        System.debug('Finisher Ready Status: '+fa.Finisher_Ready__c);
        FinisherQueue fq = new FinisherQueue();
        fq.getMyTodayTouchCount();
        fq.getMyTodayTouches();
        fq.takeFraudApp();
        fq.takeFinisher2App();
        for (Integer j=0; j<5; j++) {
            fq.takeApp();
            fa = [select Items_to_Review__c from Funding_Agreement__c where Id=:faId];
            fa.Items_to_Review__c = true;
            update(fa);
            System.debug('Finishing another...');
        }        
    }
}