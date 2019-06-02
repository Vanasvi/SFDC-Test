@IsTest
public class QueuePageTests {
	static testMethod void validateRandomCode() {
        Account a = new Account(Name='Test Account');
        RecordType recType = [select id,name,sobjectType,ispersontype from recordType where ispersontype=true and sobjectType='account' limit 1];
        a.RecordType = recType;
        insert(a);
        Id aid = a.id;
        Funding_Agreement__c fa = new Funding_Agreement__c(Name='TEST AGREEMENT', Upstart__c=a.Id);
        insert(fa);
        Id faid = fa.id;
        fa.Status__c = 'Documents submitted- please review';
        fa.Ops_status__c = 'Unassigned';
        update(fa);
        IncomeVerificationQueue ivq = new IncomeVerificationQueue();
        for (Integer i=0; i<10; i++) {
            ivq.takeApplication();
            ivq.takeApplication2();
        }
        ivq.getTodayAppsCount();
    }
}