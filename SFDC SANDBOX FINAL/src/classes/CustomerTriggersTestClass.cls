@isTest
private class CustomerTriggersTestClass {
    static testMethod void validateCustomTriggers() {
       
            // Test New Docs Trigger
            Account a = new Account(Name = 'Test Account');
            insert a;
            ID acctId = a.Id;
            Funding_Agreement__c fa = new Funding_Agreement__c( Upstart__c = a.Id);
            fa.New_Docs__c = false;
            insert fa;
            ID faId = fa.Id;
            Attachment att = new Attachment(ParentId = a.Id, Name='Test Attachment', Body = blob.toPdf('Test Attachment'));
            insert att;
            fa = [select New_Docs__c, Items_to_Review__c from Funding_Agreement__c where Id=:faId];
            System.assert(fa.New_Docs__c == true);
            System.assert(fa.Items_to_Review__c == true);
            
            // Test Case Inserted Trigger
            fa = [select Items_to_Review__c from Funding_Agreement__c where Id=:faId];
            fa.Items_to_Review__c = false;
            update (fa);
            Case c1 = new Case(AccountID = acctId);
            insert(c1);
            fa = [select Items_to_Review__c from Funding_Agreement__c where Id=:faId];
            System.assert(fa.Items_to_Review__c == true);
            
            //Test Case Updated Trigger
            case c2 = new Case(accountID = acctId);
            insert c2;
            c1.Status = 'Closed';
            update(c1);
            fa = [select Items_to_Review__c from Funding_Agreement__c where Id=:faId];
            //System.assert(fa.Items_to_Review__c == true);
            c2.Status = 'Closed';
            update(c2);
            System.debug('c1 Status = '+c1.Status);
            System.debug('c1 IsClosed = '+c1.IsClosed);
            System.debug('c2 Status = '+c2.Status);
            System.debug('c2 IsClosed = '+c2.IsClosed);
            fa = [select Items_to_Review__c from Funding_Agreement__c where Id=:faId];
            System.assert(fa.Items_to_Review__c == false);
            c2.Status = 'New';
            update c2;
            System.debug('c2 Status = '+c2.Status);
            System.debug('c2 IsClosed = '+C2.IsClosed);
            fa = [select Items_to_Review__c from Funding_Agreement__c where Id=:faId];
            System.assert(fa.Items_to_Review__c == true);
            
            // Test new SMS trigger
            smagicinteract__Incoming_SMS__c sms = new smagicinteract__Incoming_SMS__c();
            sms.Account__c = a.Id;
            sms.smagicinteract__external_field__c = 'ABCDEFG';
            insert(sms);
            fa = [select Items_to_Review__c, New_SMS__c from Funding_Agreement__c where Id=:faId];
            System.assert(fa.New_SMS__c == true);
            System.assert(fa.Items_to_Review__c == true);
     }   
}