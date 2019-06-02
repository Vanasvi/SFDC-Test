public class IncomeVerificationQueue {

    public PageReference takeApplication() {
        // Check for an app that has the user as Income Verification Owner and has Items to Review and assign as finisher
        List <Funding_Agreement__c> apps = [SELECT Id
                                    FROM Funding_Agreement__c 
                                    WHERE Income_Verification_Owner__c = :System.UserInfo.getUserId()
                                    AND Items_to_Review__c = True 
                                    AND Status__c = 'In review - Waiting for supporting documents'
                                    AND Ops_Status__c = 'In review - Waiting for supporting documents'
                                    ORDER BY Finisher_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return FinisherQueue.assignApp(apps.get(0)); }
        
        // if nothing, looking for the best app to assign.
        apps = 
            [select Id, Priority__c, Initial_Priority__c, Income_Verification_Owner__c from Funding_Agreement__c where
             Starter_1_Ready__c = 'Yes'
             ORDER BY Priority__c ASC, Target_Amount__c DESC
             LIMIT 1];
        
        if (apps.size() == 0) {
            return null;            
        } 
        Funding_Agreement__c app = apps.get(0);       
        Funding_Agreement__c appLocked = [SELECT Id, Priority__c, Initial_Priority__c, Income_Verification_Owner__c from Funding_Agreement__c where
                                          Id =:apps.get(0).Id LIMIT 1];       
        appLocked.Income_Verification_Owner__c = System.UserInfo.getUserId();       
        appLocked.Initial_Priority__c = appLocked.Priority__c;        
        update(appLocked);        
        return new PageReference('/'+app.Id);       
    }
    
    public PageReference takeApplication2() {
        // Check for an app that has the user as Income Verification Owner and has Items to Review and assign as finisher
        List <Funding_Agreement__c> apps = [SELECT Id
                                    FROM Funding_Agreement__c 
                                    WHERE Income_Verification_Owner__c = :System.UserInfo.getUserId()
                                    AND Items_to_Review__c = True 
                                    AND Status__c = 'In review - Waiting for supporting documents'
                                    AND Ops_Status__c = 'In review - Waiting for supporting documents'
                                    ORDER BY Finisher_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return FinisherQueue.assignApp(apps.get(0)); }        
        // if nothing, looking for the best app to assign.
        apps = 
            [select Id, Priority__c, Initial_Priority__c, Income_Verification_Owner__c from Funding_Agreement__c where
             Starter_2_Ready__c = 'Yes'
             ORDER BY Priority__c ASC, Target_Amount__c DESC
             LIMIT 1];
        if (apps.size() == 0) {
            return null;
        } 
        Funding_Agreement__c app = apps.get(0);        
        Funding_Agreement__c appLocked = [SELECT Id, Priority__c, Initial_Priority__c, Income_Verification_Owner__c from Funding_Agreement__c where
                                          Id =:apps.get(0).Id LIMIT 1];        
        appLocked.Income_Verification_Owner__c = System.UserInfo.getUserId();        
        appLocked.Initial_Priority__c = appLocked.Priority__c;
        update(appLocked);
        return new PageReference('/'+app.Id);
    }

    
    public Integer getTodayAppsCount() {
        return [select count() from Funding_Agreement__c where
                Income_Verification_Owner__c = :System.UserInfo.getUserId() and
                Income_Reviewer_assigned__c = TODAY ];
    }
    
}