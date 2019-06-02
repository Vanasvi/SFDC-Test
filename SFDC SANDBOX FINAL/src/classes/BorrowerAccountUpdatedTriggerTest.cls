@isTest
public class BorrowerAccountUpdatedTriggerTest {
    static testMethod void validateCustomTriggers() {
    /*
        // Setting up the basic test data
        Account a = new Account(Name = 'Test Account', Lending_Program_Name__c = '');
        insert(a);
        Funding_Agreement__c fa = new Funding_Agreement__c( Upstart__c = a.Id);
        insert(fa);
        Id faId = fa.Id;
        
        // TEST the trigger
        a.Verification_Call__c = 'Needs follow up (unsure)';
        update(a);
        fa = [SELECT Items_to_Review__c, Verification_call_owner__c, Last_OB_Call_Timestamp__c
              FROM Funding_Agreement__C WHERE Id = :faId];
        // Test that the right values were updated.
        //System.assert(fa.Items_to_Review__c == true);
        //System.assert(fa.Verification_call_owner__c == UserInfo.getUserId());
        //System.assert(fa.Last_OB_Call_Timestamp__c == System.today());
        
        
        a.Verification_Call__c = 'Trying to 1';
        update(a);
        fa = [SELECT Last_OB_Call_Timestamp__c, Outbound_Call_Owner__c
              FROM Funding_Agreement__C WHERE Id = :faId];
        //System.assert(fa.Last_OB_Call_Timestamp__c == System.today());
        //System.assert(fa.Outbound_Call_Owner__c == UserInfo.getUserId());
        a.Verification_Call__c = 'Trying to 2';
        update(a);
        fa = [SELECT X2nd_outbound_owner__c
              FROM Funding_Agreement__C WHERE Id = :faId];
        //System.assert(fa.X2nd_outbound_owner__c == UserInfo.getUserId());
        a.Verification_Call__c = 'Trying to 3';
        update(a);
        fa = [SELECT X3rd_outbound_call_owner__c
              FROM Funding_Agreement__C WHERE Id = :faId];
        //System.assert(fa.X3rd_outbound_call_owner__c == UserInfo.getUserId()); */
    } 
}