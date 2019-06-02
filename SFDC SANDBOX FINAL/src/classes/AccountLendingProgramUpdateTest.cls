@isTest
public class AccountLendingProgramUpdateTest {

    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        Lending_Program__c lp = new Lending_Program__c();

        lp.Name = 'upstart';

        Insert lp;
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            accounts.add(new Account(name='Account '+i,Lending_Program_Name__c = 'upstart'));
     }
        insert accounts;
    }

    static testmethod void test() {        
        Test.startTest();
        AccountLendingProgramUpdate updater = new AccountLendingProgramUpdate();
        Id batchId = Database.executeBatch(updater);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from Account where Lending_Program_Name__c = 'upstart']);
    }
}