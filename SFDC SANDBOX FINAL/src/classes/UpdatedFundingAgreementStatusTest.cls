@IsTest
public class UpdatedFundingAgreementStatusTest{
    static testMethod void validateUpdateFundingAgreementStatus() {
        Test.setMock(HTTPCalloutMock.class, new SlackMessageMock());
        Account a = new Account(Name='Test Account');
        RecordType recType = [select id,name,sobjectType,ispersontype from recordType where ispersontype=true and sobjectType='account' limit 1];
        a.RecordType = recType;
        insert(a);
        Id aid = a.id;
        Funding_Agreement__c fa = new Funding_Agreement__c(Name='TEST AGREEMENT', Upstart__c=a.Id);
        fa.Status__c = 'Funding Offer Given';
        fa.Target_Amount__c = 10000;
        fa.APR__c = .05;
        insert(fa);
        Id faid = fa.id;
        fa.Status__c = 'Rate Accepted';
        update(fa);
        a = [select Most_Recent_Funding_Agreement__c from Account where Id=:aid];
        fa.Status__c = 'Profile Submitted';
        update(fa);
        //System.debug(LoggingLevel.Error, 'Most Recent FA: '+a.Most_Recent_Funding_Agreement__c);
        //System.assert(a.Most_Recent_Funding_Agreement__c == fa.Id);
        fa.Bank_account_verified__c = 'Yes';
        update(fa);
        fa = [select Items_to_Review__c from Funding_Agreement__c where Id=:faId];
        System.assert(fa.Items_to_Review__c == true);
        
        
        fa = [select Status__c,Income_Verification_Owner__c from Funding_Agreement__c where Id=:faId];
        fa.Status__c = 'In Repayment';
        fa.Income_Verification_Owner__c = System.UserInfo.getUserId();
        update fa;
        
        //Test remove Income Verification Owner on reset to Funding Offer Given
        fa = [select Status__c,Income_Verification_Owner__c from Funding_Agreement__c where Id=:faId];
        fa.Status__c = 'Funding Offer Given';
        update fa;
        fa = [select Status__c,Income_Verification_Owner__c from Funding_Agreement__c where Id=:faId];
        // System.assert(fa.Income_Verification_Owner__c == null);
        fa.Status__c = 'In Repayment';
        update fa;
    }
}