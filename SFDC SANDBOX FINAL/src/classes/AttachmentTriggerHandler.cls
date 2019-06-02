/* 

    *******************************************************************************************************************************
    *******************************************************************************************************************************
    Apex Class Name: AttachmentTriggerHandler
    Created By: Vanasvi Kilari
    Created On: 12/13/2018
    Purpose: This Apex class is a handler class for the apex trigger "AttachmentTrigger".
    
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    
*/

public class AttachmentTriggerHandler
{
    public static set<Id> AccIds = new set<Id>();
    public static list<Credit_Card_Applications__c> CCsToUpdate = new list<Credit_Card_Applications__c>(); 
    public static list<Funding_Agreement__c> FAsToUpdate = new list<Funding_Agreement__c>();
    public static void afterInsertMeth(list<Attachment> Atts)
    {
        for(Attachment a:Atts)
        {
            
            AccIds.add(a.ParentId);
        }
        
        // Update Credit Card Application records for the account collected in above logic.
        
        for(Credit_Card_Applications__c cc:[Select Id,New_Docs__c from Credit_Card_Applications__c where (Account__c IN :AccIds OR Id IN :AccIds)])
        {
            cc.New_Docs__c =true;
            CCsToUpdate.add(cc);
        }
        
        if(!CCsToUpdate.isempty())
        {
            try{
            Update CCsToUpdate;}catch(exception e){}
        }
        
        
        // Update Funding Agreements under the accounts collected above.
        
        for(Funding_Agreement__c fa:[select New_Docs__c from Funding_Agreement__c where Upstart__c In :AccIds])
        {
            fa.New_Docs__c =true;
            fa.Items_to_Review__c =true;
            FAsToUpdate.add(fa);
        }
        
        if(!FAsToUpdate.isempty())
        {
            try{
            update FAsToUpdate;} catch(exception e){}
        }
    }
}