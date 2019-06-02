/* 

    *******************************************************************************************************************************
    *******************************************************************************************************************************
    Apex Class Name: CaseTriggerHandler
    Created By: Vanasvi Kilari
    Created On: 12/17/2018
    Purpose: This Apex class is a handler class for the apex trigger "CaseTrigger".
    
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    
*/

public class CaseTriggerHandler
{
    public static set<string> txnIds = new set<String>();
    public static Map<String,Account> TxnIdAccountMap = new Map<String,Account>();
    public static Map<String,Account> TxnIdContactMap = new Map<String,Account>();
    public static Set<String> EmailsSetOrigin = new set<String>();
    public static Set<String> EmailsSet = new set<String>();
    public static Map<string,Account> AccountsOriginMap = new Map<string,Account>();
    public static Map<string,Account> AccountsMap = new Map<string,Account>();
    public static List<Funding_Agreement__c> FAsToUpdate = new list<Funding_Agreement__c>();
    public static List<Credit_Card_Applications__c> CCsToUpdate = new List<Credit_Card_Applications__c>();
    public static set<Id> AccIds = new Set<Id>();
    public static set<Id> newlyClosedCasesAccountIdSet = new set<Id>();  
    public static Map<Id,case> newClosedCaseMap = new Map<Id,case>();
    public static set<Id> oldClosedCasesAccountIdSet = new set<Id>();
    public static Map<Id,case> oldClosedCaseMap = new Map<Id,case>();
    public static Set<id> relFundingAgreementAccountIdSet = new Set<id>(); //To Capture the related Funding Agreemnet Account ID
    public static Map<id,Funding_Agreement__c> fundingAgreementMaptoUpdate = new Map<id,Funding_Agreement__c>();//FA Map to Update
    public static Set<String> ownerNameSet = new Set<String>{'Investors','Internal','Escalations','PBU Support','PBU Servicing','PBU Complaints','Payments','Payments BK', 'Payments Disputes', 'Payments DSC', 'Payments Escalation', 'Payments Fees & Refund Requests', 'Payments Hardship', 'PBU CC Support'};
    public static Map<id,case> caseToUpdateMap = new Map<id,case>();

    
    public static void AccountContactMappingToCase(list<case> newCases)
    {
    
        for(Case c:newCases)
        {
              c.Sixteen_Hours_Date_Time__c=BusinessHoursCalculation.getSixteenHoursBusinessHOursDateTime(system.now());
             
             if (c.Subject!= null && c.Subject.startsWith('Verification Services Trans. #'))
             {
                String txn_id = c.Subject.substringBetween('#', ':');
                system.debug('@@@inside'+txn_id);
                if(txn_id!=null)
                txnIds.add(txn_id);
             }
             else
             {
                if(c.Origin == '' || c.Origin == 'Email' || c.Origin == 'Phone' || c.Origin == 'Web' || c.Origin == 'Email (info@)' || c.Origin == 'Email (support@)' || c.Origin == 'Email (invest@)' ||c.Origin == 'Physical Mail' || c.Origin == 'Email (servicing@)')
                {
                    if(c.SuppliedEmail !=null)
                    EmailsSetOrigin.add(c.SuppliedEmail);
                }
                else
                {
                    if(c.SuppliedEmail !=null)
                    EmailsSet.add(c.SuppliedEmail);
                    
                }
             }
        }
        system.debug('@@@@txnIds'+txnIds);
        system.debug('@@@@EmailsSetOrigin'+EmailsSetOrigin);
        system.debug('@@@@EmailsSet'+EmailsSet);
        
        
        for(Account a:[select Id, personContactId,PersonEmail FROM Account WHERE (Lending_Program_Name__c = 'upstart' OR Lending_Program_Name__c = 'upstartreferral') AND PersonEmail IN :EmailsSetOrigin])
        {
            AccountsOriginMap.put(a.PersonEmail,a);
        }
        for(Account a:[select Id, personContactId,PersonEmail FROM Account WHERE PersonEmail IN :EmailsSet])
        {
            AccountsMap.put(a.PersonEmail,a);
        }
        
        system.debug('@@@AccountsOriginMap'+AccountsOriginMap);
        system.debug('@@@@AccountsMap'+AccountsMap);
        
        system.debug('@@@@@txnIds'+txnIds);
        if(!txnIds.isempty() && txnIds!=null)
        for(Account a:[select Id, personContactId,NSC_Trans_ops__c from Account where NSC_Trans_ops__c IN :txnIds])
        {
            TxnIdAccountMap.put(a.NSC_Trans_ops__c,a);
        }
        
        for(Account a:[select Id, personContactId,NSC_Trans__c from Account where NSC_Trans__c  IN :txnIds])
        {
            TxnIdContactMap.put(a.NSC_Trans__c,a);
        }
        system.debug('@@@@@TxnIdAccountMap'+TxnIdAccountMap);
        system.debug('@@@@@TxnIdContactMap'+TxnIdContactMap);
        
        for(Case c:newCases)
        {
            if (c.Subject!= null && c.Subject.startsWith('Verification Services Trans. #'))
             {
                String txn_id = c.Subject.substringBetween('#', ':');
                
                if(TxnIdAccountMap.keyset().contains(txn_id))
                {
                    c.AccountId=TxnIdAccountMap.get(txn_id).Id;
                    c.ContactId =TxnIdAccountMap.get(txn_id).personContactId;
                }
                else
                {
                    if(TxnIdContactMap.keyset().contains(txn_id))
                    {
                        c.AccountId=TxnIdContactMap.get(txn_id).Id;
                        c.ContactId=TxnIdContactMap.get(txn_id).personContactId;
                    }
                }
             }
             
             else if(c.SuppliedEmail != null)
             {
                if(c.Origin == '' || c.Origin == 'Email' || c.Origin == 'Phone' || c.Origin == 'Web' || c.Origin == 'Email (info@)' || c.Origin == 'Email (support@)' || c.Origin == 'Email (invest@)' ||c.Origin == 'Physical Mail' || c.Origin == 'Email (servicing@)')
                {
                    if(AccountsOriginMap.keyset().contains(c.SuppliedEmail))
                    {
                        c.AccountId=AccountsOriginMap.get(c.SuppliedEmail).Id;
                        c.ContactId=AccountsOriginMap.get(c.SuppliedEmail).personContactId;
                    }
                    else
                    {
                        c.AccountId=null;
                        c.ContactId=null;
                    }
                }
                else
                {
                    if(AccountsMap.keyset().contains(c.SuppliedEmail))
                    {
                        c.AccountId=AccountsMap.get(c.SuppliedEmail).Id;
                        c.ContactId=AccountsMap.get(c.SuppliedEmail).personContactId;
                    }
                    else
                    {
                        c.AccountId=null;
                        c.ContactId=null;
                    }
                }
             }
            
        }
        
    }   
        
        
        public static void UpdatedItemsToReviewForNewCaseTrigger(list<Case> NewRecs)
        {
            for(Case c:NewRecs)
            {
                 if(c.AccountId!=null)
                 {
                    AccIds.add(c.AccountId); 
                 }
            }
            
            for(Funding_Agreement__c fa :[select Id,Items_to_Review__c from Funding_Agreement__c where Upstart__c IN :AccIds])
            {
                fa.Items_to_Review__c =true;
                FAsToUpdate.add(fa);
            }
            
            for(Credit_Card_Applications__c cc:[SELECT Items_to_Review__c from Credit_Card_Applications__c where Account__c In :AccIds])
            {
                cc.Items_to_Review__c =true;
                CCsToUpdate.add(cc);
            }
            
            try{
            if(!FAsToUpdate.isempty())
            update FAsToUpdate;
            if(!CCsToUpdate.isempty())
            update CCsToUpdate;
            
            }catch(exception e){}
            
        }
        
        public static void UpdatedItemsToReviewForCaseTrigger(Map<Id,Case> oldRecs,Map<Id,case> newRecs)
        {

            for(case cs:newRecs.values())
            {
                if(cs.isclosed && oldRecs.get(cs.Id).isclosed==false)
                {
                    newlyClosedCasesAccountIdSet.add(cs.AccountId);
                    newClosedCaseMap.put(cs.Id,cs);
                }
        
                if(cs.isclosed==false && oldRecs.get(cs.Id).isclosed==true)
                {
                    oldClosedCasesAccountIdSet.add(cs.AccountId);
                    oldClosedCaseMap.put(cs.Id,cs);
                }
            }
    
            for(Account acc:[Select Id,(select id,status from cases where status != 'Closed') from account where id IN :newlyClosedCasesAccountIdSet])
            {
                if(acc.cases.size()==0)
                relFundingAgreementAccountIdSet.add(acc.Id);
            }
    
            for(Funding_Agreement__c fa:[select id,Items_to_Review__c from Funding_Agreement__c where Upstart__c IN:relFundingAgreementAccountIdSet])
            {
                fa.Items_to_Review__c=false;
                fundingAgreementMaptoUpdate.put(fa.Id,fa);
            }
    
            for(Funding_Agreement__c fa:[select id,Items_to_Review__c from Funding_Agreement__c where Upstart__c IN:oldClosedCasesAccountIdSet])
            {
                fa.Items_to_Review__c=true;
                fundingAgreementMaptoUpdate.put(fa.Id,fa);
            }
    
            if(!fundingAgreementMaptoUpdate.isempty())
            update fundingAgreementMaptoUpdate.values();
    
            List<Group>queues = [SELECT Id,Name FROM Group WHERE Name = 'General Support'];
            
            
            for(Case c:[select Id,OwnerId,Owner.Name,Owner.Profile.Id,Owner.Profile.Name from case where Id IN :oldClosedCaseMap.keyset()])
            {
                if(!ownerNameSet.contains(c.Owner.Name) && !(c.Owner.Profile.Name=='Collections'))
                {
                    system.debug('@@@@entering');
                    c.OwnerId = queues[0].Id;
                    caseToUpdateMap.put(c.Id,c);
                    
                    
                }
            }
    
            
            if(!caseToUpdateMap.isempty())
            {
                CaseTriggerRecursive.isexecuted=true;
                update caseToUpdateMap.values();
                
            }
    
        }
        
}