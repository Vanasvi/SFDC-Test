trigger UpdatedItemsToReviewForNewCaseTrigger on Case (after insert) {
   /*
    Id pId;
    System.debug('Caught the new case...');
    for(Case c: Trigger.new){
        pId=c.AccountId;
        List<Account> accts =[select Id from Account where id=:pId];
        System.debug('Found '+accts.size()+' accounts matching the Case');
        if (accts.size() > 0) {
            List<Funding_Agreement__c> fas = [select Items_to_Review__c from Funding_Agreement__c where Upstart__c=:accts[0].Id];
            for (Funding_Agreement__c fa : fas) {
                System.debug('Found the Funding Agreement ... Updating Items_to_Review');
                fa.Items_to_Review__c = true;
                update fa;
            }
        }
    }  */
}