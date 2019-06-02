public class CreateCaseEmailUtil
{
    
    public static case CreateCase(Messaging.inboundEmail email,String AccId,String ConId,String CCAppId)
    {
        Id CCRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Credit Card').getRecordTypeId();
        system.debug('@@@rec name'+CCRecordTypeId);
        Case cs = new Case();
        cs.RecordTypeId=CCRecordTypeId;
        cs.status='New';
        cs.origin='Email';
        cs.Subject=email.subject;
        cs.Description=email.plainTextBody;
        cs.OwnerId=label.PBU_CC_Support;
        if(AccId!='')
        cs.AccountId=AccId;
        if(ConId!='')
        cs.ContactId=ConId;
        if(CCAppId!='')
        cs.Credit_Card_Application__c=CCAppId;
        try{
           insert cs;
            }catch(exception e){}
            
            return cs;
    }
    
    public static EmailMessage createEmailMessage(Case cs,Messaging.inboundEmail email)
    {
                        EmailMessage em = new EmailMessage();
                        em.Subject=email.subject;
                        em.TextBody=email.plainTextBody;
                        em.HtmlBody=email.plainTextBody;
                        if(!Test.isRunningTest())
                        em.ToAddress=email.toAddresses[0];
                        em.status='0';
                        em.ParentId=cs.Id;
                        em.FromAddress=email.fromAddress;
                        em.Incoming=true;
                        try{
                        insert em;}catch(exception e){}
                        
                        return em;
    }
    
    
    public static void textAttachmentsInsert(Messaging.inboundEmail email,EmailMessage em)
    {
        List<Attachment> Atts = new List<Attachment>();
        if(email.textAttachments!=null)
        {
            Atts = new List<Attachment>();
            for (Messaging.Inboundemail.textAttachment tAttachment : email.textAttachments) 
            {
    
                Attachment attachment = new Attachment();
                            
                attachment.ParentId = em.Id;
                attachment.Name = tAttachment.filename;
                attachment.Body = blob.valueof(tAttachment.body);
                Atts.add(attachment);
            }
                               
                        
        }
                 try{
                                insert Atts;}catch(exception e){}        
                        
    }
    
    public static void BinaryAttachmentsInsert(Messaging.inboundEmail email,EmailMessage em)
    {
        List<Attachment> bAtts = new List<Attachment>();
        if(email.binaryAttachments!=null)
        {
            bAtts = new List<Attachment>();
            for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) 
            {
    
                Attachment attachment = new Attachment();
                attachment.ParentId = em.Id;
                attachment.Name = bAttachment.filename;
                attachment.Body = bAttachment.body;
                bAtts.add(attachment);
            }
            
        }
        
        try{
                                insert bAtts;}catch(exception e){}  
    }
    
}