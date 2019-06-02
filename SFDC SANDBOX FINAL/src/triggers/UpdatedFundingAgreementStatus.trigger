trigger UpdatedFundingAgreementStatus on Funding_Agreement__c (before update) {

    //Check for change in the Status field    
    for (Funding_Agreement__c agmt : Trigger.new) {
        Funding_Agreement__c oldAgmt = Trigger.oldMap.get(agmt.ID);
        Account acct = [select Id, Verification_Call__c, PersonContactId, UTM_Source_Medium__c,Verb_Use_of_Funds__c  from Account where Id = :agmt.Upstart__c];
        if (acct == null) {
            return;
        }
        // Update the "Most Recent FA" value on the Funding Agreement
        acct.Most_Recent_Funding_Agreement__c = agmt.Id;
        AccountTriggerRecursive.isexecuted=true;
        update(acct);
        acct = [select Id, PersonContactId, UTM_Source_Medium__c,Verb_Use_of_Funds__c  from Account where Id = :agmt.Upstart__c];
        if (acct == null) {
            return;
        }
        // Actions based on a change in the Status field
        if (agmt.Status__c != oldAgmt.Status__c) {
            // If the user has accepted their rate, add them to our verification call list
            if (agmt.Status__c == 'Profile Submitted' || agmt.Status__c == 'Rate Accepted') {
                if (agmt.Verification_Call__c == 'Ready to call' && agmt.Target_Amount__c != null && agmt.APR__c != null ) {
                    system.debug('@@@@@rateaccespts');
                    SlackMessage.send('#rate_accepts', 'Rate Accept: $'+agmt.Target_Amount__c.setScale(0).format() + ' at '+agmt.APR__c.setScale(2) +'% to '+acct.Verb_Use_of_Funds__c + ' from '+acct.UTM_Source_Medium__c);
                }
                String campid = '70170000000ZmwH';             
                if ([select count() from Campaign where Id=:campid] == 0) { return; }
                if ([select count() from CampaignMember where CampaignId=:campid and ContactId= :acct.PersonContactId] == 0) {
                    CampaignMember cm = new CampaignMember(CampaignId=campid, ContactId= acct.PersonContactId, Status='Sent');
                    insert cm;              
              } 
            } else if (agmt.Status__c == 'Funding Offer Given' 
                       && oldAgmt.Status__c != '') {
                agmt.Income_Verification_Owner__c = null;
                agmt.Income_verified_date_time__c = null;
            } else if((agmt.Status__c == 'Funded' || agmt.Status__c == 'In Repayment') &&
                      (oldAgmt.Status__c != 'Funded' && oldAgmt.Status__c != 'In Repayment') &&
                     agmt.Target_Amount__c != null && agmt.APR__c != null) {
                SlackMessage.send('#loans', 'New Loan: $'+agmt.Target_Amount__c.setScale(0).format() + ' at '+agmt.APR__c.setScale(2) +'% to '+acct.Verb_Use_of_Funds__c + ' from '+acct.UTM_Source_Medium__c);
            }
        }
    } 
}