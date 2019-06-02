public class FinisherQueueController
{
    string CurrentuserId='';
    Map<string,integer> TodayTouchMap = new map<string,integer>();
    Map<string,Id> TakeAppMap = new Map<String,Id>();
    Map<String,Id> TakeApp2Map = new map<string,Id>();
    Map<string,Id> TakeFraudAppMap = new Map<string,Id>();
    
    public FinisherQueueController()
    {
        CurrentuserId=userinfo.getUserId();
        system.debug('@@@@@CurrentuserId'+CurrentuserId);
        
        for(TodayTouchCount__c ttc:[select Id,Name,TodayTouchCount__c from TodayTouchCount__c])
        {
            TodayTouchMap.put(ttc.Name,(integer)ttc.TodayTouchCount__c);
        } 
        
        for(TakeApp__c ttc:[select Id,Name,Funding_Agreement__c from TakeApp__c])
        {
            TakeAppMap.put(ttc.Name,ttc.Funding_Agreement__c);
        } 
        
        for(TakFinisher2App__c ttc:[select Id,Name,FundId__c from TakFinisher2App__c])
        {
            TakeApp2Map.put(ttc.Name,ttc.FundId__c);
        } 
        
        for(takeFraudApp__c ttc:[select Id,Name,Fund3Id__c from takeFraudApp__c])
        {
            TakeFraudAppMap.put(ttc.Name,ttc.Fund3Id__c);
        } 
    }
    
    public Integer getMyTodayTouchCount() 
    {
        
        return TodayTouchMap.get(CurrentuserId);
        
    }
    
    public PageReference takeApp() 
    {
        Id i=TakeAppMap.get(CurrentuserId);
        if(i!=null)
        return new PageReference('/'+i);
        else
        return null;
    }
    
     public PageReference takeFinisher2App() 
     {
        Id i=TakeApp2Map.get(CurrentuserId);
        if(i!=null)
        return new PageReference('/'+i);
        else
        return null;
     }
     
      public PageReference takeFraudApp() 
      {
          Id i=TakeFraudAppMap.get(CurrentuserId);
          if(i!=null)
          return new PageReference('/'+i);
          else
          return null;
      }
     
      public List<Funding_Agreement__c> getMyTodayTouches() 
      {
        return [SELECT Id, Upstart__c, Status__c, Ops_Status__c FROM Funding_Agreement__c WHERE
                 ((Finisher__c = :System.UserInfo.getUserId() and Finisher_1_Assigned__c = TODAY) or
                  (Finisher_2__c = :System.UserInfo.getUserId() and Finisher_2_Assigned__c = TODAY) or
                  (Finisher_3__c = :System.UserInfo.getUserId() and Finisher_3_Assigned__c = TODAY) or
                  (Finisher_4__c = :System.UserInfo.getUserId() and Finisher_4_Assigned__c = TODAY) or
                  (Finisher_5__c = :System.UserInfo.getUserId() and Finisher_5_Assigned__c = TODAY) or
                  (Finisher_6__c = :System.UserInfo.getUserId() and Finisher_6_Assigned__c = TODAY) or
                  (Finisher_7__c = :System.UserInfo.getUserId() and Finisher_7_Assigned__c = TODAY) or
                  (Finisher_8__c = :System.UserInfo.getUserId() and Finisher_8_Assigned__c = TODAY) or
                  (Finisher_9__c = :System.UserInfo.getUserId() and Finisher_9_Assigned__c = TODAY) or
                  (Finisher_10__c = :System.UserInfo.getUserId() and Finisher_10_Assigned__c = TODAY)
                 )];
    }
     
     
     
     
}