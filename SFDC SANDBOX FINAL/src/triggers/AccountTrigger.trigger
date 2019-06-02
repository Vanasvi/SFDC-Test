Trigger AccountTrigger on Account (before insert,after update,before update)
{
    if(trigger.isupdate && trigger.isafter)
    {
        AccountTriggerHandler.BorrowerAccountUpdatedTrigger(trigger.oldMap,trigger.newMap);
    }
    
    if(trigger.isbefore && trigger.isupdate)
    {
        AccountTriggerHandler.UpdatedInvestorAccount(trigger.oldMap,trigger.newMap);
    }
    
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate))
    {
        AccountTriggerHandler.LendingProgramCheck(trigger.new);
    }
}