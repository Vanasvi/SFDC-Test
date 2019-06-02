global class SlackMessageBatch implements Database.Batchable<sObject>,Database.Stateful
{
    public decimal yesterdayDollar=0.0;
    public decimal WeekToDateDollar=0.0;
    public decimal ThisMonthToDateDollar =0.0;
    public Map<String,decimal> LendingProgramNameValue = new Map<String,decimal>();
    public Integer YesterdayDayofDate;
    public date thisWeekStartDate;
    public date thisMonthStartDate;
    public string query='';
    public string Message='';
    public SlackMessageBatch()
    {
        Integer month = Date.today().month();
        Integer year=Date.today().year();
        query='select Id, Publish_Datetime__c,Lending_Program__c,Target_Amount__c from Funding_Agreement__c where Publish_Datetime__c = LAST_N_DAYS:31 and Publish_Datetime__c!=null and Target_Amount__c!=null and Lending_Program__c!=null';
        YesterdayDayofDate=(date.today()-1).day();
        thisMonthStartDate=date.newInstance(system.today().year(),month,1);
        thisWeekStartDate=system.today().toStartOfWeek();
        system.debug('@@@thisweekStartDate'+thisWeekStartDate);
        system.debug('@@@query'+query);
        system.debug('@@@YesterdayDayofDate'+YesterdayDayofDate);
        // system.debug('@@@@@thisWeekStartDayOfDate'+thisWeekStartDayOfDate);
        
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
      return Database.getQueryLocator(query);
    }
   
   global void execute(Database.BatchableContext BC, List<sObject> scope)
   {
      for(sObject s : scope)
      {
         Funding_Agreement__c fa= new Funding_Agreement__c();
         fa=(Funding_Agreement__c)s;
         system.debug('@@@@fa'+fa);
          
           // Below logic is for yesterday fudning agreements calculations
         
            // if(fa.Publish_Datetime__c ==system.today()-1)
            if(date.newinstance(fa.Publish_Datetime__c.year(), fa.Publish_Datetime__c.month(), fa.Publish_Datetime__c.day()) == system.today()-1)
            {
                string str= fa.Lending_Program__c+'Yesterday';
                decimal d=0.0;
                if(LendingProgramNameValue.keyset().contains(str))
                {
                    d= LendingProgramNameValue.get(str);
                    if(fa.Target_Amount__c!=null)
                    d=d+fa.Target_Amount__c;
                }
                else
                {
                    if(fa.Target_Amount__c!=null)
                    d=fa.Target_Amount__c;
                }
                LendingProgramNameValue.put(str,d);
            }
            
            // Below logic is for this week to date fudning agreements calculations
            
            if(fa.Publish_Datetime__c >=thisWeekStartDate && fa.Publish_Datetime__c <=system.now())
            {
                string str=fa.Lending_Program__c+'Week';
                decimal d=0.0;
                if(LendingProgramNameValue.keyset().contains(str))
                {
                    d=LendingProgramNameValue.get(str);
                    if(fa.Target_Amount__c!=null)
                    d=d+fa.Target_Amount__c;
                }
                else
                {
                    if(fa.Target_Amount__c!=null)
                    d=fa.Target_Amount__c;
                }
                LendingProgramNameValue.put(str,d);
            }
            
            // Below logic is for Month to date funding agreemtns calculations 
            system.debug('@@@@system.today'+system.today().month());
            system.debug('@@@@@fa origniatl'+fa.Publish_Datetime__c.month());
            system.debug('@@@today'+system.today());
            system.debug('@@@fa.Publish_Datetime__c'+fa.Publish_Datetime__c);
            if(fa.Publish_Datetime__c.Month()==system.now().Month() && fa.Publish_Datetime__c <=system.now())
            {
                string str=fa.Lending_Program__c+'Month';
                decimal d=0.0;
                if(LendingProgramNameValue.keyset().contains(str))
                {
                    d=LendingProgramNameValue.get(str);
                    if(fa.Target_Amount__c!=null)
                    d=d+fa.Target_Amount__c;
                }
                else
                {
                    if(fa.Target_Amount__c!=null)
                    d=fa.Target_Amount__c;
                }
                LendingProgramNameValue.put(str,d);
            }
         
         
      }
   }

    global void finish(Database.BatchableContext BC)
    {
        system.debug('@@@@@@@LendingProgramNameValue'+LendingProgramNameValue);
        system.debug('@@@ Message before assign'+Message);
        Message='Funding Agreement Calculations:';
        
        List<Slack_Message_Queue__c> smq = new list<Slack_Message_Queue__c>();
        smq=[SELECT Id from Slack_Message_Queue__c];
        delete smq;
        smq.clear();
        for(Lending_Program__c lp:[Select Id,Name from Lending_Program__c])
        {
            
                if(LendingProgramNameValue.keyset().contains(lp.Name+'Yesterday'))
                {
                    Message=Message+' Yesterday: '+LendingProgramNameValue.get(lp.Name+'Yesterday');
                }
                else
                Message=Message+' Yesterday: '+0.0;
            
                if(LendingProgramNameValue.keyset().contains(lp.Name+'Week'))
                {
                    Message=Message+' This Week : '+LendingProgramNameValue.get(lp.Name+'Week');
                }
                else
                 Message=Message+' This Week : '+0.0;
             
                if(LendingProgramNameValue.keyset().contains(lp.Name+'Month'))
                {
                   Message=Message+' This Month : '+LendingProgramNameValue.get(lp.Name+'Month'); 
                }
                else
                Message=Message+' This Month : '+0.0;
            
                if(LendingProgramNameValue.keyset().contains(lp.Name+'Yesterday'))
                smq.add(new Slack_Message_Queue__c(Name=lp.Name+'Yesterday',Sum_Amount__c=LendingProgramNameValue.get(lp.Name+'Yesterday'),Refreshed_Date_Time__c=system.now(),Lending_Program__c=lp.Id));
                else
                smq.add(new Slack_Message_Queue__c(Name=lp.Name+'Yesterday',Sum_Amount__c=0.0,Refreshed_Date_Time__c=system.now(),Lending_Program__c=lp.Id));
                
                if(LendingProgramNameValue.keyset().contains(lp.Name+'Week'))
                smq.add(new Slack_Message_Queue__c(Name=lp.Name+'Week',Sum_Amount__c=LendingProgramNameValue.get(lp.Name+'Week'),Refreshed_Date_Time__c=system.now(),Lending_Program__c=lp.Id));
                else
                smq.add(new Slack_Message_Queue__c(Name=lp.Name+'Week',Sum_Amount__c=0.0,Refreshed_Date_Time__c=system.now(),Lending_Program__c=lp.Id));
                
                if(LendingProgramNameValue.keyset().contains(lp.Name+'Month'))
                smq.add(new Slack_Message_Queue__c(Name=lp.Name+'Month',Sum_Amount__c=LendingProgramNameValue.get(lp.Name+'Month'),Refreshed_Date_Time__c=system.now(),Lending_Program__c=lp.Id));
                else
                smq.add(new Slack_Message_Queue__c(Name=lp.Name+'Month',Sum_Amount__c=0.0,Refreshed_Date_Time__c=system.now(),Lending_Program__c=lp.Id));
                
                
                
            }
            
            insert smq;
            
        }
        
    
}