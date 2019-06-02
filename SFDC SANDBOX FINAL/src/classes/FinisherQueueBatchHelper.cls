public class FinisherQueueBatchHelper {

    public Id takeApp(Id Uid) {
        // Pull any apps with priority 1,2 or 3
        List <Funding_Agreement__c> apps = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                                            Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                                            FROM Funding_Agreement__c WHERE Finisher_Ready__c = 'Yes' AND
                                            Finisher_Priority__c < 4
                                            ORDER BY Finisher_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return assignApp(apps.get(0),UId); }
        
        // next, pull ANY app where the current user is in ANY finisher role
        apps = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                FROM Funding_Agreement__c WHERE Finisher_Ready__c = 'Yes' AND
                ((Finisher__c = :Uid) or
                  (Finisher_2__c = :Uid) or
                  (Finisher_3__c = :Uid) or
                  (Finisher_4__c = :Uid) or
                  (Finisher_5__c = :Uid) or
                  (Finisher_6__c = :Uid) or
                  (Finisher_7__c = :Uid) or
                  (Finisher_8__c = :Uid) or
                  (Finisher_9__c = :Uid ) or
                  (Finisher_10__c = :Uid)
                 ) 
                ORDER BY Finisher_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return assignApp(apps.get(0),Uid); }
        apps = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                FROM Funding_Agreement__c WHERE Finisher_Ready__c = 'Yes'
                ORDER BY Finisher_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return assignApp(apps.get(0),Uid); }
        return null;
    }
    
    
    public Id takeFinisher2App(Id Uid) {
        List <Funding_Agreement__c> apps = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                                    Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                                    FROM Funding_Agreement__c WHERE Finisher_Unchecked_Ready__c = 'Yes'
                                    ORDER BY Finisher_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() == 0) { return null; }
        else { return assignApp(apps.get(0),Uid); }
    }
    
    public Id takeFraudApp(Id Uid) {
        // Pull any apps with priority 1,2 or 3
        List <Funding_Agreement__c> apps = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                                            Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                                            FROM Funding_Agreement__c WHERE Fraud_Ready__c = 'Yes' AND
                                            Fraud_Priority__c < 4 AND Income_Verification_Owner__c != NULL
                                            ORDER BY Fraud_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return assignApp(apps.get(0),Uid); }
        
        // next, pull ANY app where the current user is in ANY finisher role
        apps = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                FROM Funding_Agreement__c WHERE Fraud_Ready__c = 'Yes' AND
                ((Finisher__c = :Uid) or
                  (Finisher_2__c = :Uid) or
                  (Finisher_3__c = :Uid) or
                  (Finisher_4__c = :Uid) or
                  (Finisher_5__c = :Uid) or
                  (Finisher_6__c = :Uid) or
                  (Finisher_7__c = :Uid) or
                  (Finisher_8__c = :Uid) or
                  (Finisher_9__c = :Uid ) or
                  (Finisher_10__c = :Uid)
                 ) 
                ORDER BY Fraud_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return assignApp(apps.get(0),Uid); }
        apps = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                FROM Funding_Agreement__c WHERE Fraud_Ready__c = 'Yes'
                ORDER BY Fraud_Priority__c ASC, Target_Amount__c DESC LIMIT 1];
        if (apps.size() > 0) { return assignApp(apps.get(0),Uid); }
        return null;
    }
    
    public List<Funding_Agreement__c> getMyTodayTouches(Id Uid) {
        return [SELECT Id, Upstart__c, Status__c, Ops_Status__c FROM Funding_Agreement__c WHERE
                 ((Finisher__c = :Uid and Finisher_1_Assigned__c = TODAY) or
                  (Finisher_2__c = :Uid and Finisher_2_Assigned__c = TODAY) or
                  (Finisher_3__c = :Uid and Finisher_3_Assigned__c = TODAY) or
                  (Finisher_4__c = :Uid and Finisher_4_Assigned__c = TODAY) or
                  (Finisher_5__c = :Uid and Finisher_5_Assigned__c = TODAY) or
                  (Finisher_6__c = :Uid and Finisher_6_Assigned__c = TODAY) or
                  (Finisher_7__c = :Uid and Finisher_7_Assigned__c = TODAY) or
                  (Finisher_8__c = :Uid and Finisher_8_Assigned__c = TODAY) or
                  (Finisher_9__c = :Uid and Finisher_9_Assigned__c = TODAY) or
                  (Finisher_10__c = :Uid and Finisher_10_Assigned__c = TODAY)
                 )];
    }
    
    public static Id assignApp(Funding_Agreement__c app,Id Ui) {
        Funding_Agreement__c appLocked = [SELECT Id, Finisher__c, Finisher_2__c, Finisher_3__c, Finisher_4__c, Finisher_5__c, 
                                           Finisher_6__c, Finisher_7__c, Finisher_8__c, Finisher_9__c, Finisher_10__c 
                                              FROM Funding_Agreement__c WHERE Id =: app.Id LIMIT 1];
            if (appLocked.Finisher__c == null) { appLocked.Finisher__c = Ui;
            } else if (appLocked.Finisher_2__c == null) { appLocked.Finisher_2__c = Ui;
            } else if (appLocked.Finisher_3__c == null) { appLocked.Finisher_3__c = Ui;
            } else if (appLocked.Finisher_4__c == null) { appLocked.Finisher_4__c = Ui;
            } else if (appLocked.Finisher_5__c == null) { appLocked.Finisher_5__c = Ui;
            } else if (appLocked.Finisher_6__c == null) { appLocked.Finisher_6__c = Ui;
            } else if (appLocked.Finisher_7__c == null) { appLocked.Finisher_7__c = Ui;
            } else if (appLocked.Finisher_8__c == null) { appLocked.Finisher_8__c = Ui;
            } else if (appLocked.Finisher_9__c == null) { appLocked.Finisher_9__c = Ui;
            } else { appLocked.Finisher_10__c = Ui; }
            
            appLocked.Items_to_Review__c = false;
            appLocked.New_Docs__c = false;
            appLocked.New_SMS__c = false;
            update(appLocked);
            return appLocked.Id;
            // return new PageReference('/'+appLocked.Id);
    }
    
    public Integer getMyTodayTouchCount(Id Uid) {
        return [SELECT count() FROM Funding_Agreement__c WHERE Finisher__c = :Uid and Finisher_1_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_2__c = :Uid and Finisher_2_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_3__c = :Uid and Finisher_3_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_4__c = :Uid and Finisher_4_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_5__c = :Uid and Finisher_5_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_6__c = :Uid and Finisher_6_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_7__c = :Uid and Finisher_7_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_8__c = :Uid and Finisher_8_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_9__c = :Uid and Finisher_9_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE Finisher_10__c = :Uid and Finisher_10_Assigned__c = TODAY];
    }
}