@isTest(SeeAllData=false)
public class SlackMessageBatchScheduleTest
{
    public static testmethod void testm()
    {
        // Create Lending Programs 
        
        List<Lending_Program__c> Lendingpgrms = new list<Lending_Program__c>();
        Lendingpgrms.add(new Lending_Program__c(Name='bankmobile1'));
        Lendingpgrms.add(new Lending_Program__c(Name='customersbank1'));
        Lendingpgrms.add(new Lending_Program__c(Name='ffbkc1'));
        insert Lendingpgrms;
        
        
        // Create Accounts for each Lending program
        
           Id PersonAccountRecId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId(); 
           
           List<Account> Accounts = new List<Account>();
           Accounts.add(new Account(RecordTypeId=PersonAccountRecId,LastName='Test Persona Account1',FirstName='Test1',Lending_Program_Name__c='bankmobile',Lending_Program__c=Lendingpgrms[0].Id));
           Accounts.add(new Account(RecordTypeId=PersonAccountRecId,LastName='Test Persona Account2',FirstName='Test1',Lending_Program_Name__c='customersbank',Lending_Program__c=Lendingpgrms[1].Id));
           Accounts.add(new Account(RecordTypeId=PersonAccountRecId,LastName='Test Persona Account3',FirstName='Test1',Lending_Program_Name__c='ffbkc',Lending_Program__c=Lendingpgrms[2].Id));
           
           insert Accounts;
           
           system.debug('@@@accounts[0].Lending_Program__c'+accounts[0].Lending_Program__c);
            system.debug('@@@accounts[1].Lending_Program__c'+accounts[1].Lending_Program__c);
           
           
            
        
        // Create Fudning Agreement for each lending program
        
        list<Funding_Agreement__c> Fas = new list<Funding_Agreement__c>();
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[0].Id,Target_Amount__c=20000,Publish_Datetime__c =system.today()-1,Name='Test fa1'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[0].Id,Target_Amount__c=40000,Publish_Datetime__c =system.today()-10,Name='Test fa2'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[0].Id,Target_Amount__c=60000,Publish_Datetime__c =system.today(),Name='Test fa3'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[0].Id,Target_Amount__c=60000,Publish_Datetime__c =system.today()+2,Name='Test fa4'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[1].Id,Target_Amount__c=80000,Publish_Datetime__c =system.today()-1,Name='Test fa5'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[1].Id,Target_Amount__c=100000,Publish_Datetime__c =system.today()-10,Name='Test fa6'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[1].Id,Target_Amount__c=30000,Publish_Datetime__c =system.today(),Name='Test fa7'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[1].Id,Target_Amount__c=60000,Publish_Datetime__c =system.today()+2,Name='Test fa8'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[2].Id,Target_Amount__c=80000,Publish_Datetime__c =system.today()-1,Name='Test fa9'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[2].Id,Target_Amount__c=100000,Publish_Datetime__c =system.today()-10,Name='Test fa10'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[2].Id,Target_Amount__c=30000,Publish_Datetime__c =system.today(),Name='Test fa11'));
        Fas.add(new Funding_Agreement__c(Upstart__c=Accounts[2].Id,Target_Amount__c=60000,Publish_Datetime__c =system.today()+2,Name='Test fa12'));
        insert Fas;
        
        system.debug('@@@Fas'+Fas);
        Test.startTest();
        // Id job=database.executeBatch(new SlackMessageBatch());
        SlackMessageBatchSchedule s = new SlackMessageBatchSchedule();
        s.execute(null);
       /* SlackMessageQueueProcessControllerScdl s1 = new SlackMessageQueueProcessControllerScdl();
        s1.execute(null); */ 
        test.stoptest(); 
        
    }
    
    
     
}