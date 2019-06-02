/* ****************************************************************************************************************
   ****************************************************************************************************************
   Apex Class: CreateCaseEmailTest
   Created By: Vanasvi Kilari
   Created On: 26th Dec 2018
   Purpose: This is the test class for "CreateCaseEmail" class. This is a email service class for inbound email processing.
   
   ****************************************************************************************************************
   ****************************************************************************************************************
*/

@isTest
private class CreateCaseEmailTest 
{
     static testMethod void myUnitTest() 
     {
            // First Email with new email which is not present in SFDC.
        
            Messaging.InboundEmail email = new Messaging.InboundEmail() ;
            Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
            email.subject = 'Test Credit Card Applicaiton';
            email.fromname = 'FirstName LastName';
            env.fromAddress = 'firstname@lastname.com';
            email.fromAddress='firstname@lastname.com';
            Messaging.InboundEmail.BinaryAttachment binaryAttch = new Messaging.InboundEmail.BinaryAttachment();
            binaryAttch=CreateCaseEmailTestUtil.getBinaryAttachment();
            email.binaryAttachments =new Messaging.inboundEmail.BinaryAttachment[] {binaryAttch};
            Messaging.InboundEmail.textAttachment textAttch= new Messaging.InboundEmail.textAttachment();
            textAttch=CreateCaseEmailTestUtil.getTextAttachment();
            email.textattachments =new Messaging.inboundEmail.TextAttachment[] {textAttch};
            
            CreateCaseEmail emailProcess = new CreateCaseEmail();
            emailProcess.handleInboundEmail(email, env);
            
            
            // Second Email with new email which is present in SFDC with out CCA and Case .
            
            list<RecordType> r = new List<RecordType>();
            r=[select Id,Name from RecordType where Name='Person Account'];
            Account acc = new Account();
            acc=CreateCaseEmailTestUtil.createAccount(r[0].Id,'Last Name Test','lastName@firstName1.com');
        
            Messaging.InboundEmail email1 = new Messaging.InboundEmail() ;
            Messaging.InboundEnvelope env1 = new Messaging.InboundEnvelope();
            email1.subject = 'Test Credit Card Applicaiton';
            email1.fromname = 'FirstName LastName';
            env1.fromAddress = 'firstname@lastname1.com';
            email1.fromAddress='lastName@firstName1.com';
            email1.binaryAttachments =new Messaging.inboundEmail.BinaryAttachment[] {binaryAttch};
            email1.textattachments =new Messaging.inboundEmail.TextAttachment[] {textAttch};
            emailProcess.handleInboundEmail(email1, env1);
            
            
            // Third Email with new email which is present in SFDC with CCA and with out Case .
            
            Credit_Card_Applications__c cca = new Credit_Card_Applications__c();
            cca=CreateCaseEmailTestUtil.ccaCreation(acc.Id,'firstname@lastname1.com');
            Messaging.InboundEmail email2 = new Messaging.InboundEmail() ;
            Messaging.InboundEnvelope env2 = new Messaging.InboundEnvelope();
            email2.subject = 'Test Credit Card Applicaiton';
            email2.fromname = 'FirstName LastName';
            env2.fromAddress = 'firstname@lastname1.com';
            email2.fromAddress='lastName@firstName1.com';
            email2.binaryAttachments =new Messaging.inboundEmail.BinaryAttachment[] {binaryAttch};
            email2.textattachments =new Messaging.inboundEmail.TextAttachment[] {textAttch};
            emailProcess.handleInboundEmail(email2, env2);
            
            //   Fourth Email with email which is present in SFDC with CCA and Case.
            
            CreateCaseEmailTestUtil.createCase(cca.Id);
            
            Messaging.InboundEmail email3 = new Messaging.InboundEmail() ;
            Messaging.InboundEnvelope env3 = new Messaging.InboundEnvelope();
            email3.subject = 'Test Credit Card Applicaiton';
            email3.fromname = 'FirstName LastName';
            env3.fromAddress = 'firstname@lastname1.com';
            email3.fromAddress='lastName@firstName1.com';
            email3.binaryAttachments =new Messaging.inboundEmail.BinaryAttachment[] {binaryAttch};
            email3.textattachments =new Messaging.inboundEmail.TextAttachment[] {textAttch};
            emailProcess.handleInboundEmail(email3, env3);
            
            
            
            
        
     }
}