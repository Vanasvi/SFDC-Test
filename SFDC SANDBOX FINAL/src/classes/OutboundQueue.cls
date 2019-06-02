public class OutboundQueue {
    
    public PageReference takeOutbound() {
        List <Funding_Agreement__c> apps = [SELECT Id,Outbound_Call_Owner__c,X2nd_outbound_owner__c FROM Funding_Agreement__c 
                                            WHERE Outbound_Call_Ready__c = 'Yes' AND Outbound_Call_Priority__c < 10 AND (Local_Hour__c > 8 OR Local_Hour__c < -4)
                                            ORDER BY Outbound_Call_Priority__c ASC, Updated_Timestamp__c ASC LIMIT 1];
        
        if (apps.size() == 0) { 
           return null;
           } else {
               Funding_Agreement__c app = apps.get(0);
               Funding_Agreement__c appLocked = [SELECT Id,Outbound_Call_Owner__c,X2nd_outbound_owner__c
                                                 FROM Funding_Agreement__c WHERE Id =: app.Id LIMIT 1];
                                              
               if (appLocked.Outbound_Call_Owner__c == null) { appLocked.Outbound_Call_Owner__c = System.UserInfo.getUserId();
               } else { appLocked.X2nd_outbound_owner__c = System.UserInfo.getUserId(); }  
               
               if (appLocked.Last_OB_Call_Timestamp__c == null) {appLocked.Last_OB_Call_Timestamp__c = Date.today();
               } else { appLocked.Last_OB_Call_Timestamp__c = Date.today(); }  
               
               appLocked.Items_to_Review__c = false;
               appLocked.New_Docs__c = false;
               update(appLocked);
               return new PageReference('/'+appLocked.Id);                 
           }                                                                          
      }
      
      public List<Funding_Agreement__c> getMyTodayOutboundTouches() {
        return [SELECT Id, Upstart__c, Status__c, Ops_Status__c, Outbound_Call_Priority__c, Verification_Call__c FROM Funding_Agreement__c WHERE
                 ((Outbound_Call_Owner__c = :System.UserInfo.getUserId() and Outbound_Caller_Assigned__c = TODAY) or
                  (X2nd_outbound_owner__c = :System.UserInfo.getUserId() and X2nd_outbound_assigned__c = TODAY) or
                  (X3rd_outbound_call_owner__c = :System.UserInfo.getUserId() and X3rd_outbound_assigned__c = TODAY)
                  )
                 ];
      }
      
      public Integer getMyTodayOutboundCount() {
        return [SELECT count() FROM Funding_Agreement__c WHERE Outbound_Call_Owner__c = :System.UserInfo.getUserId() and Outbound_Caller_Assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE X2nd_outbound_owner__c = :System.UserInfo.getUserId() and X2nd_outbound_assigned__c = TODAY] +
                     [SELECT count() FROM Funding_Agreement__c WHERE X3rd_outbound_call_owner__c = :System.UserInfo.getUserId() and X3rd_outbound_assigned__c = TODAY];
    }
    
    public Integer getOutboundQueueTotal() {
        return [SELECT count() FROM Funding_Agreement__c WHERE Outbound_Call_Ready__c = 'Yes' AND Outbound_Call_Priority__c < 10];
    }
    
    
 }