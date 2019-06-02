public with sharing class SendEmailToCustomerController
{
    public string AccountId {get;set;}
    public Account acc {get;set;}
    public SendEmailToCustomerController(ApexPages.standardcontroller sc)
    {
        AccountId='';
        AccountId=ApexPages.currentPage().getParameters().get('Id');
        system.debug('@@@@@AccountId---->'+ AccountId);
        
        if(AccountId!=null && AccountId!='')
        {
            Acc=[select Id,personEmail,firstname,lastname from Account where Id=:AccountId limit 1];
            
        }
        
        
        
    }
    
    public PageReference sendEmail()
    {
        
        list<string> emails = new list<string>();
        if(Acc!=null && acc.personEmail!='')
        {
          
          emails.add(Acc.personEmail);
        }
        
        if(!emails.isempty())
        {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            OrgWideEmailAddress[] owea = [select Id from OrgWideEmailAddress where Address = 'invest@upstart.com'];
            string receivername='';
            if(acc.firstname!=null)
            receivername=acc.FirstName;
            receivername=receivername+' '+acc.Lastname;
            
            message.toAddresses = emails;
            message.optOutPolicy = 'FILTER';
            message.subject = 'Upstart 2018 1099-INT Tax Information Required';
            message.setOrgWideEmailAddressId(owea[0].Id);
            message.plainTextBody = 'Hi' + receivername+',\n\nWe hope you are well!\n\nYou are receiving this email because Upstart is unable to generate your 2018 1099-INT form without having your full social security number on file to submit to the IRS.\n\nThe government shutdown, which ended on January 25th 2019, closed the part of the IRS that assigns bulk EINs, which has impacted our efforts.\n\nWe have been working diligently with the IRS to furnish the needed EINs; however, we were recently informed that 1099-INT forms could not be created for a small number of accounts including yours.\n\nWe take customer data security very seriously,and have created an encrypted link below through which this information can safely be submitted directly to Upstart. We need all 9 digits of your SSN.\n\nhttps://upstart.secure.force.com/PersonAccountUpdateForm.\n\nPlease do not hesitate to reach out with any questions. Our team can be reached at (650) 204-1000, taxes@upstart.com, or at invest@upstart.com.\n\nRegards,\nThe Upstart Team ' ;
            Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            
            
            if (results[0].success) {
            System.debug('The email was sent successfully.');
            } else {
            System.debug('The email failed to send: '
          + results[0].errors[0].message);
            }
            
            PageReference pg = new PageReference('/'+AccountId);
            
            return pg;
        }
        
        
        
        return null;
    }
}