/* 

    *******************************************************************************************************************************
    *******************************************************************************************************************************
    Apex Trigger Name: CaseTrigger
    Created By: Vanasvi Kilari
    Created On: 12/17/2018
    Purpose: This trigger is created on case object and this will get triggered when a new case record is created/updated.
    
    
    
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    
*/

Trigger CaseTrigger on Case(before insert,after insert,after update)
{
    
    if(trigger.isbefore && trigger.isinsert)
    CaseTriggerHandler.AccountContactMappingToCase(Trigger.new);
    
    if(trigger.isinsert && trigger.isafter)
    CaseTriggerHandler.UpdatedItemsToReviewForNewCaseTrigger(trigger.new);
    if(CaseTriggerRecursive.isexecuted==false)
    if(trigger.isupdate && trigger.isafter)
    CaseTriggerHandler.UpdatedItemsToReviewForCaseTrigger(trigger.oldMap,trigger.newMap);
    
    
}