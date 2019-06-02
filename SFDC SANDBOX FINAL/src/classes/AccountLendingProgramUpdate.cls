global class AccountLendingProgramUpdate implements 
    Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, Lending_Program_Name__c FROM Account WHERE Lending_Program_Name__c = null');
    }

    global void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        for (Account account : scope) {
            account.Lending_Program_Name__c = 'upstart';
            recordsProcessed = recordsProcessed + 1;
        }
        update scope;
    }    

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' Accounts assigned to Upstart program.');
    }
}