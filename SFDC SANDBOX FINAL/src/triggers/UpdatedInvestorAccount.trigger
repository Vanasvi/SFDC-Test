trigger UpdatedInvestorAccount on Account (before update) {
    
    /*for (Account acct : Trigger.new) {
        Account oldAcct = Trigger.oldMap.get(acct.ID);
        if(acct.Is_Fund__c || acct.External_Whole_Loan__c || acct.Backer_ID__c == null || acct.FirstName == null) { return; }
        
        if(acct.Lifetime_Deposits__c != oldAcct.Lifetime_Deposits__c && acct.Lifetime_Deposits__c != null && acct.Lifetime_Deposits__c != null) {
            if ((oldAcct.Lifetime_Deposits__c == null || oldAcct.Lifetime_Deposits__c == 0) && acct.Lifetime_Deposits__c != 0) {
                SlackMessage.send('#investors', 'Investor '+acct.Backer_ID__c.setScale(0) + ' deposited $'+acct.Lifetime_Deposits__c.setScale(0).format()+' <- FIRST DEPOSIT');
            } else if (oldAcct.Lifetime_Deposits__c != null) {
                SlackMessage.send('#investors', 'Investor '+acct.Backer_ID__c.setScale(0) + ' deposited $'+(acct.Lifetime_Deposits__c - oldAcct.Lifetime_Deposits__c).setScale(0).format());
            }
        }
     
        if (acct.Lifetime_Withdrawals__c != oldAcct.Lifetime_Withdrawals__c && 
            acct.Lifetime_Withdrawals__c != null && oldAcct.Lifetime_Withdrawals__c != null) {          
            SlackMessage.send('#investors', 'Investor '+acct.Backer_ID__c.setScale(0) + ' withdrew $'+(acct.Lifetime_Withdrawals__c-oldAcct.Lifetime_Withdrawals__c).setScale(0).format());
        }
        
        if(acct.Recurring_Investments__c != oldAcct.Recurring_Investments__c && acct.Recurring_Investments__c != null) {
            if (oldAcct.Recurring_Investments__c == null) {
                SlackMessage.send('#investors', 'Investor '+acct.Backer_ID__c.setScale(0) + ' set up a recurring deposit: '+acct.Recurring_Investments__c + '<- NEW RECURRING DEBIT');
            } else {
                SlackMessage.send('#investors', 'Investor '+acct.Backer_ID__c.setScale(0) + ' updated recurring deposit: '+acct.Recurring_Investments__c + ' (previously '+oldAcct.Recurring_Investments__c+')');
            }
        }  
    }*/
}