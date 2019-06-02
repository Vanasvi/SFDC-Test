@IsTest
public class InvestorsSlackTest {
    static testMethod void validateSlackMassages() {
        Test.setMock(HTTPCalloutMock.class, new SlackMessageMock());
        Account a = new Account(Name='Test Investor');
        RecordType recType = [select id,name,sobjectType,ispersontype from recordType where ispersontype=true and sobjectType='account' limit 1];
        a.Backer_ID__c = 1234;
        a.RecordType = recType;
        a.Lifetime_Deposits__c = null;
        a.Lifetime_Withdrawals__c = null;
        a.Recurring_Investments__c = null;
        insert(a);
        a.Lifetime_Deposits__c = 100;
        a.Lifetime_Withdrawals__c = 100;
        a.Recurring_Investments__c = '$500 monthly';
        update(a);
        a.Lifetime_Deposits__c = 200;
        a.Lifetime_Withdrawals__c = 200;
        a.Recurring_Investments__c = '$1500 monthly';
        update(a);
        
    }
}