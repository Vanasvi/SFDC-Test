global class CreateCaseEmail implements Messaging.InboundEmailHandler 
{
 
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env)
    {
    
        // Create an InboundEmailResult object for returning the result of the Apex Email Service
        
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
    
    system.debug('@@@@Email Subject'+email.subject);
    system.debug('@@@@Email Body'+email.plainTextBody);
    
    String myPlainText= email.plainTextBody;
    String emailsubject=email.subject;
    
    System.debug('@@@@myPlainText'+myPlainText);
    system.debug('@@@@emailsubject'+emailsubject);
    
    boolean success=false;
    
    List<Account> PersonAccs  = new List<Account>();
    PersonAccs=[select Id,PersonEmail from account where PersonEmail=:email.fromAddress and RecordType.Name='Credit Card'];
    system.debug('@@@@email.fromAddress'+email.fromAddress);
    system.debug('@@@@@PersonAccs'+PersonAccs);
    List<contact> Cons = new List<Contact>();
    Cons=[select Id,email from Contact where Email=:email.fromAddress and Account.RecordType.Name='Credit Card'];
    List<Attachment> Atts = new list<Attachment>();
    EmailMessage em = new EmailMessage();
    
    if(!PersonAccs.isempty())
    {
        List<Credit_Card_Applications__c> LatestCreditCardApplication = new List<Credit_Card_Applications__c>();
        LatestCreditCardApplication=[Select Id,Email__c from Credit_Card_Applications__c where Account__c=:PersonAccs[0].Id order by CreatedDate desc limit 1];
        if(LatestCreditCardApplication.isempty())
        {
    
                // Create a new case if there is no existing personal account/contact.
                
                        Case cs = new case();
                        cs=CreateCaseEmailUtil.CreateCase(email,'','','');
                        em=CreateCaseEmailUtil.createEmailMessage(cs,email);
                        system.debug('@@@New case created id'+cs.Id);
                        
                        if(email.binaryAttachments!=null)
                        CreateCaseEmailUtil.BinaryAttachmentsInsert(email,em);
                       
                        if(email.textAttachments!=null)
                        CreateCaseEmailUtil.textAttachmentsInsert(email,em);
        }
        else
        {
                // Send reply to the customer that we have received your email and will get back soon with the response.
        
                 List<Case> ExistingOpenCases = new list<Case>();
                 ExistingOpenCases=[select id,CaseNumber,Credit_Card_Application__c from Case where Credit_Card_Application__c=:LatestCreditCardApplication[0].Id];
                 
                 
                 
                 if(ExistingOpenCases.isempty())
                 {
                        String ConId='';
                        if(!cons.isempty())
                        Conid=cons[0].Id;
                        Case cs = new case();
                        cs=CreateCaseEmailUtil.CreateCase(email,PersonAccs[0].Id,Conid,LatestCreditCardApplication[0].Id);
                        em=CreateCaseEmailUtil.createEmailMessage(cs,email);
                        system.debug('@@@New case created id'+cs.Id);
                        success=true;
                        if(email.binaryAttachments!=null)
                        CreateCaseEmailUtil.BinaryAttachmentsInsert(email,em);
                       
                        if(email.textAttachments!=null)
                         CreateCaseEmailUtil.textAttachmentsInsert(email,em);
                        
                }
                else
                {
                        system.debug('@@@@existin case attached is'+ExistingOpenCases[0].Id);
                        em=CreateCaseEmailUtil.createEmailMessage(ExistingOpenCases[0],email);
                        success=true;
                        
                        if(email.binaryAttachments!=null)
                        CreateCaseEmailUtil.BinaryAttachmentsInsert(email,em);
                       
                        if(email.textAttachments!=null)
                         CreateCaseEmailUtil.textAttachmentsInsert(email,em);
        
                }
                
                // Send reply to the customer that we have received your email and will get back soon with the response.
        
        // Update Items to Review checkbox to true on latest applicaiton under which the email/case is getting created
        
         if(success==true)
         {
          LatestCreditCardApplication[0].Items_to_Review__c=true;
          try
          {
              update LatestCreditCardApplication[0];
          }catch(exception e){}
         }
        
        
        }
        
     }
     
     else
     {
         // Create a case with no account/contact and assign it to PBU_CC_Support
         
                        Case cs = new case();
                        cs=CreateCaseEmailUtil.CreateCase(email,'','','');
                        em=CreateCaseEmailUtil.createEmailMessage(cs,email);
                        system.debug('@@@New case created id'+cs.Id);
                        
                        
                        if(email.binaryAttachments!=null)
                        CreateCaseEmailUtil.BinaryAttachmentsInsert(email,em);
                       
                        if(email.textAttachments!=null)
                         CreateCaseEmailUtil.textAttachmentsInsert(email,em);
     }
    
    
   // Set the result to true. No need to send an email back to the user 
   // with an error message
   result.success = true;
   
   // Return the result for the Apex Email Service
   return result;
  }
}