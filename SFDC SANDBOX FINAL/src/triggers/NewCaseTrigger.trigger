trigger NewCaseTrigger on Case (before insert) {
    /*
    Id pId;
    System.debug('Caught the new case...');
    for(Case c: Trigger.new){
        // Catch NSC Transactions and update the case with the Account ID.
        if (c.Subject!= null && c.Subject.startsWith('Verification Services Trans. #')) {
            String txn_id = c.Subject.substringBetween('#', ':');
            Account[] accts = [select Id, personContactId from Account where NSC_Trans_ops__c = :txn_id ];
            if (accts.size() == 0) { 
                accts = [select Id, personContactId from Account where NSC_Trans__c = :txn_id limit 1]; 
            }
            if (accts.size() > 0 ) {
                c.AccountId = accts[0].Id;
                c.ContactId = accts[0].personContactId;
            }
        }
        else if(c.SuppliedEmail != null) {
            // code to ensure we match the Account object to the right one based on Lending Program for new Cases        
          Account[] accounts;
          if (c.Origin == '' || c.Origin == 'Email' || c.Origin == 'Phone' || c.Origin == 'Web' ||
                c.Origin == 'Email (info@)' || c.Origin == 'Email (support@)' || c.Origin == 'Email (invest@)' ||
                c.Origin == 'Physical Mail' || c.Origin == 'Email (servicing@)') {
                    accounts = [SELECT Id, personContactId FROM Account WHERE PersonEmail = :c.SuppliedEmail AND (Lending_Program_Name__c = 'upstart' OR Lending_Program_Name__c = 'upstartreferral')];
            } else {
                accounts = [SELECT Id, personContactId FROM Account WHERE PersonEmail = :c.SuppliedEmail];
            }
            if (accounts.size() > 0) {
                c.AccountId = accounts[0].Id;
                c.ContactId = accounts[0].personContactId;
            } else { // if no Accounts match, make sure we don't attach one
                c.AccountId = null;
                c.ContactId = null;
            }
        }
       
    } */
}