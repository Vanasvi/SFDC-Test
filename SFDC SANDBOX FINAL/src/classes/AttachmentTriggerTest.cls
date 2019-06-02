/*
    **************************************************************************************************************
    **************************************************************************************************************
    
    **************************************************************************************************************
    **************************************************************************************************************
*/

@isTest
public class AttachmentTriggerTest
{
    public static testmethod void testm()
    {
        // Create Account 
        List<RecordType> r = new List<RecordType>();
        r=[Select Id,Name from RecordType where SobjectType='Account' and Name='Credit Card'];
        Account acc= new Account();
        acc=CreateCaseEmailTestUtil.createAccount(r[0].Id,'test344','ajf@gmail.com');
        
        Credit_Card_Applications__c  cc = new Credit_Card_Applications__c ();
        cc=createCaseEmailTestUtil.ccaCreation(acc.Id,'ajf@gmail.com');
        
        // Funding Agreement Creation
        
        Funding_Agreement__c fa = new Funding_Agreement__c();
        fa.RecordTypeId=Schema.SObjectType.Funding_Agreement__c.getRecordTypeInfosByName().get('Funded Income Share').getRecordTypeId();
        fa.Name='Test';
        fa.Upstart__c=acc.Id;
        insert fa;
        
        Attachment attach1=new Attachment();     
        attach1.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach1.body=bodyBlob;
        attach1.parentId=acc.Id;
        insert attach1;
        
        Attachment attach2=new Attachment();     
        attach2.Name='Unit Test Attachment';
        attach2.body=bodyBlob;
        attach2.parentId=cc.Id;
        insert attach2;
        
        Attachment attach3=new Attachment();     
        attach3.Name='Unit Test Attachment';
        attach3.body=bodyBlob;
        attach3.parentId=fa.Id;
        insert attach3;
        
        
        
        
        
        
     }
   
}