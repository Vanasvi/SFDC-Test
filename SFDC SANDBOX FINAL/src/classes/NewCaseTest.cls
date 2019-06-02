@IsTest
public class NewCaseTest {
    static testMethod void validateRandomCode() {
        Account a = new Account(Name='Test Account',
                               NSC_Trans_ops__c = '1234',
                               NSC_Trans__c = '2345');
        insert(a);
        Case c1 = new Case(Subject='Verification Services Trans. #1234:');
        insert(c1);
        ID c1id = c1.Id;
        c1 = [select Id, AccountId from Case where Id = :c1id];
        System.assertEquals(c1.AccountId, a.Id);
        a.NSC_Trans_ops__c = '';
        update(a);
        Case c2 = new Case(Subject='Verification Services Trans. #2345:');
        insert(c2);
        ID c2id = c2.Id;
        c2 = [select Id, AccountId from Case where Id = :c2id];
        System.assertEquals(c2.AccountId, a.Id);
    }
    static testMethod void newCaseInsertionMethod1() {
        UserRole r = new UserRole(name = 'TEST ROLE');
        Database.insert(r);
      Profile p = [SELECT Id FROM Profile WHERE Name = 'Support Manager' LIMIT 1];
        User userWithRole = new User(alias = 'hasrole', email='userwithrole@roletest.com', userroleid = r.id,
                                     emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
                                     localesidkey='en_US', profileid = p.ID, 
                                     timezonesidkey='America/Los_Angeles', username='userwithrole1@testorg.com');
        Account a;
        System.runAs(userWithRole){
            String recordTypeId = Schema.getGlobalDescribe().get('Account').getDescribe().getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
            a = new Account(RecordTypeId = recordTypeId, FirstName = 'TestPersonAccountFirst', LastName = 'TestPersonAccountLast', PersonEmail = 'test@user.com');
            insert a;
            Account acc = [Select PersonContactId From Account Where Id = :a.Id];
            Case c1 = new Case(Subject='test Case',SuppliedEmail = 'test@user.com');
            insert(c1);
        }
   }
   static testMethod void newCaseInsertionMethod2() {
        UserRole r = new UserRole(name = 'TEST ROLE');
        Database.insert(r);
      Profile p = [SELECT Id FROM Profile WHERE Name = 'Support Manager' LIMIT 1];
        User userWithRole = new User(alias = 'hasrole', email='userwithrole@roletest.com', userroleid = r.id,
                                     emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
                                     localesidkey='en_US', profileid = p.ID, 
                                     timezonesidkey='America/Los_Angeles', username='userwithrole12@testorg.com');
        Account a;
        System.runAs(userWithRole){
            String recordTypeId = Schema.getGlobalDescribe().get('Account').getDescribe().getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
            a = new Account(RecordTypeId = recordTypeId, FirstName = 'TestPersonAccountFirst', LastName = 'TestPersonAccountLast', PersonEmail = 'test@user.com',Lending_Program_Name__c='upstart');
            insert a;
            Account acc = [Select PersonContactId From Account Where Id = :a.Id];
            Case c1 = new Case(Subject='test Case',SuppliedEmail = 'test@user.com',Origin = 'Phone');
            insert(c1);
        }
   }
   static testMethod void newCaseInsertionMethod3() {
        UserRole r = new UserRole(name = 'TEST ROLE');
        Database.insert(r);
      Profile p = [SELECT Id FROM Profile WHERE Name = 'Support Manager' LIMIT 1];
        User userWithRole = new User(alias = 'hasrole', email='userwithrole@roletest.com', userroleid = r.id,
                                     emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
                                     localesidkey='en_US', profileid = p.ID, 
                                     timezonesidkey='America/Los_Angeles', username='userwithrole123@testorg.com');
        Account a;
        System.runAs(userWithRole){
            String recordTypeId = Schema.getGlobalDescribe().get('Account').getDescribe().getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
            a = new Account(RecordTypeId = recordTypeId, FirstName = 'TestPersonAccountFirst', LastName = 'TestPersonAccountLast', PersonEmail = 'test@user.com',Lending_Program_Name__c='upstart');
            insert a;
            Account acc = [Select PersonContactId From Account Where Id = :a.Id];
            Case c1 = new Case(Subject='test Case',SuppliedEmail = 'test12234234@user.com',Origin = 'test Origin');
            insert(c1);
        }
   } 
}