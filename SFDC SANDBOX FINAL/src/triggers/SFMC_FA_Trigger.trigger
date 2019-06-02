trigger SFMC_FA_Trigger on Funding_Agreement__c (before insert) {

    for (Funding_Agreement__c agmt : Trigger.new) {
        List<Account> account_list = [SELECT PersonContactId from Account where Id =: agmt.Upstart__c LIMIT 1];
        if (account_list.size() == 0) return; // return nothing if you can't find the Account
        Account account = account_list.get(0);
        agmt.Person_Contact_SFMC__c = account.PersonContactId;
    } 
}