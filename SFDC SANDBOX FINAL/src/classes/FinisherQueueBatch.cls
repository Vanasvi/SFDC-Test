global class FinisherQueueBatch implements Database.Batchable<sObject>, Database.Stateful
{
   global Map<Id,integer> UserIdTouchCount = new Map<Id,integer>();
   global Map<Id,Id> UserIdFundAgId = new map<Id,Id>();
   global Map<Id,Id> UserIdTakeFinisher2AppFundId = new Map<Id,Id>();
   global Map<Id,Id> UserIdTakeFinisher3AppFraudId = new Map<Id,Id>();
   public string currentUser;
   global String Query='';
   
   public FinisherQueueBatch()
   {
       currentUser=userinfo.getUserId();
       if(test.isrunningtest())
       {
           Query='select Id from user where isactive=true and Id=\''+currentUser+'\'';
       }
       else
       Query='Select Id from User where isactive=true';
   } 
  
   global Database.QueryLocator start(Database.BatchableContext BC)
   {
      return Database.getQueryLocator(query);
   }
   
   global void execute(Database.BatchableContext BC, List<sObject> scope)
   {
      FinisherQueueBatchHelper fqh = new FinisherQueueBatchHelper();
      integer count=0;
      
      for(sObject s : scope)
      {
         user us = new user();
         us=(User)s;
         Id Uid=us.Id;
         count=fqh.getMyTodayTouchCount(Uid);
         UserIdTouchCount.put(UId,count);
         string fundId=fqh.takeApp(Uid);
         if(fundId!=null && fundId!='')
         UserIdFundAgId.put(Uid,fundId);
         
         string fundId2=fqh.takeFinisher2App(Uid);
         if(fundId2!=null && fundId2!='')
         UserIdTakeFinisher2AppFundId.put(Uid,fundId2);
         string fundId3=fqh.takeFraudApp(Uid);
         if(fundId3!=null && fundId3!='')
         UserIdTakeFinisher3AppFraudId.put(Uid,fundId3);
         
      }
   }

    global void finish(Database.BatchableContext BC)
    {
    
            List<TodayTouchCount__c> todaycounts = new list<TodayTouchCount__c>();
            todaycounts=[select Id from TodayTouchCount__c];
            delete todaycounts;
            todaycounts.clear();
            
            list<TakeApp__c> TakeApps = new list<TakeApp__c>();
            TakeApps=[Select Id from TakeApp__c];
            delete TakeApps;
            TakeApps.clear();
            
            list<TakFinisher2App__c> TakeApps2 = new list<TakFinisher2App__c>();
            TakeApps2=[select Id from TakFinisher2App__c];
            delete TakeApps2;
            TakeApps2.clear();
            
            list<takeFraudApp__c> FraudApp3 = new list<takeFraudApp__c>();
            FraudApp3 =[select Id from takeFraudApp__c];
            delete FraudApp3;
            FraudApp3.clear();
            
            
            for(Id i:UserIdTouchCount.keyset())
            {
                todaycounts.add(new TodayTouchCount__c(Name=i,TodayTouchCount__c=UserIdTouchCount.get(i),Last_Updated__c=system.now()));
            }
            if(!todaycounts.isempty())
            insert todaycounts;
            
            for(Id i:UserIdFundAgId.keyset())
            {
                TakeApps.add(new TakeApp__c(Name=i,Last_Updated__c=system.now(),Funding_Agreement__c=UserIdFundAgId.get(i)));
            }
            
            if(!TakeApps.isempty())
            insert TakeApps;
            
            
            for(Id i:UserIdTakeFinisher2AppFundId.keyset())
            {
                TakeApps2.add(new TakFinisher2App__c(Name=i,Updated_On__c=system.now(),FundId__c=UserIdTakeFinisher2AppFundId.get(I)));
            }
            
            if(!TakeApps2.isempty())
            insert TakeApps2;
            
            for(Id i:UserIdTakeFinisher3AppFraudId.keyset())
            {
                FraudApp3.add(new takeFraudApp__c(Name=i,Updated_On__c=system.now(),Fund3Id__c=UserIdTakeFinisher3AppFraudId.get(I)));
            }
            
            if(!FraudApp3.isempty())
            insert FraudApp3;
            
    }
}