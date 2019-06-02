trigger New_Docs_Notification on Attachment (after insert) {
    /*
    Id pId;
    
    for(Attachment att: Trigger.new){
        pId=att.ParentId;
         List<Account> accts =[select Id from Account where id=:pId];
        if (accts.size() > 0) {
            List<Funding_Agreement__c> fas = [select New_Docs__c from Funding_Agreement__c where Upstart__c=:accts[0].Id];
            for (Funding_Agreement__c fa : fas) {
                fa.New_Docs__c = true;
                fa.Items_to_Review__c = true;
                update fa;
            }
        }
    } */
    
   
}