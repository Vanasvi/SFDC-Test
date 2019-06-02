@IsTest
public class TestSFMCTrigger {
   	static testMethod void validateFAUpdateValues() {
		Account a = new Account(Name='Test Account');
   	 	insert(a);
  	  	Id aid = a.id;
    	a = [SELECT Id, PersonContactId FROM Account WHERE Id =: aid];
		Funding_Agreement__c fa = new Funding_Agreement__c(Name='TEST AGREEMENT', Upstart__c=a.Id);
    	insert(fa);
    	ID faid = fa.id;
    	fa = [SELECT Person_Contact_SFMC__c FROM Funding_Agreement__c where Id =: faid];
    	System.assert(fa.Person_Contact_SFMC__c == a.PersonContactId);
    }
}