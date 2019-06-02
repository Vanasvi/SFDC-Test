public class CreateCaseEmailTestUtil
{
    
    
    public static Messaging.InboundEmail.BinaryAttachment getBinaryAttachment()
    {
            Messaging.InboundEmail.BinaryAttachment binaryAttachment = new Messaging.InboundEmail.BinaryAttachment();
            binaryAttachment.body = blob.valueOf('my attachment text');
            binaryAttachment.fileName = 'textfile.txt';
            binaryAttachment.mimeTypeSubType = 'text/plain';
            return BinaryAttachment;
    }
    
    public static Messaging.InboundEmail.textAttachment getTextAttachment()
    {
             Messaging.InboundEmail.textAttachment textAttachment = new  Messaging.InboundEmail.textAttachment();
             textAttachment.FileName = 'Test';
             textAttachment.Body = 'test';
             return textAttachment;
    }
    
    public static Account createAccount(Id RecordTypeId,string LastName,string PersonEmail)
    {
            Account acc = new Account();
            acc.RecordTypeId=RecordTypeId;
            acc.LastName=LastName;
            acc.PersonEmail=PersonEmail;
            insert acc;
            return acc;
    }
    
    public static Credit_Card_Applications__c ccaCreation(String AccId,string Email)
    {
        
        Credit_Card_Applications__c cca = new Credit_Card_Applications__c();
        cca.Name__c='Test';
        cca.Account__c=AccId;
        cca.Email__c=Email;
        insert cca;
        return cca;
    }
    
    public static void createCase(string ccaId)
    {
            Case cs = new Case();
            cs.status='New';
            cs.Credit_Card_Application__c=ccaId;
            insert cs;
            
    }
    
    
}