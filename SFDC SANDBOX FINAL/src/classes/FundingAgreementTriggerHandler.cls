/* 

    *******************************************************************************************************************************
    *******************************************************************************************************************************
    Apex Class Name: FundingAgreementTriggerHandler
    Created By: Vanasvi Kilari
    Created On: 01/05/2019
    Purpose: This Apex class is a handler class for the apex trigger "FundingAgreementTrigger".
    
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    
*/


public class FundingAgreementTriggerHandler
{
    public static Set<Id> AccIds = new set<Id>();
    public static Map<Id,Account> AccMap = new Map<Id,Account>();
    public static set<Id> AccIds1 = new set<Id>();
    public static list<Account> AccsToUpdate = new list<Account>();
    public static Map<Id,Funding_Agreement__c> AccountIdFundingAgreementMap = new Map<Id,Funding_Agreement__c>();
    public static Map<Id,Account> AccountMap = new Map<Id,Account>();
    public static Set<String> PersonContactIds = new Set<string>();
    public static set<string> existingCmpMemberswithContactIdSet = new set<string>();
    public static list<CampaignMember> CamMembersToInsert = new List<CampaignMember>();
    
    
    public static  void SFMC_FA_Trigger(List<Funding_Agreement__c> newRecs)
    {
        for(Funding_Agreement__c fa:newRecs)
        {
            if(fa.Upstart__c !=null)
            AccIds.add(fa.Upstart__c);
        }
        
        system.debug('@@@@@AccIds'+AccIds);
        
        for(Account acc:[select Id,PersonContactId from Account where Id IN :AccIds])
        {
            AccMap.put(acc.Id,acc);
        }
        
        for(Funding_Agreement__c f:newRecs)
        {
            if(AccMap.keyset().contains(f.Upstart__c))
            f.Person_Contact_SFMC__c =AccMap.get(f.Upstart__c).PersonContactId;
        }
    }
    
    public static void UpdatedFundingAgreementStatus(Map<Id,Funding_Agreement__c> oldRecsMap,list<Funding_Agreement__c> newRecs)
    {
        system.debug('@@@entering into UpdatedFundingAgreementStatus');
        for(Funding_Agreement__c fa:newRecs)
        {
            if(fa.Upstart__c!=null)
            {
                AccIds1.add(fa.Upstart__c);
                AccountIdFundingAgreementMap.put(fa.Upstart__c,fa);     
            }
        
        }
        system.debug('@@@@@AccIds1'+AccIds1);
        for(Account acc:[Select Id,Most_Recent_Funding_Agreement__c,PersonContactId,Verb_Use_of_Funds__c,UTM_Source_Medium__c from Account where Id IN :AccIds1])
        {
            if(acc.PersonContactId!=null)
            PersonContactIds.add(acc.PersonContactId);
        
            if(AccountIdFundingAgreementMap.keyset().contains(acc.Id))
            {
                // acc.Most_Recent_Funding_Agreement__c=AccountIdFundingAgreementMap.get(acc.Id).Id;
                AccountMap.put(acc.Id,acc);
                // AccsToUpdate.add(acc);
            }
        }
        
        for(Account a:[Select Id,Most_Recent_Funding_Agreement__c from Account where Id IN :AccountMap.keyset()])
        {
            if(a.Most_Recent_Funding_Agreement__c!=AccountIdFundingAgreementMap.get(a.Id).Id)
            a.Most_Recent_Funding_Agreement__c= AccountIdFundingAgreementMap.get(a.Id).Id;
            AccsToUpdate.add(a);
        }
    
        if(!AccsToUpdate.isempty())
        {
           FundingAgreementTriggerRecursive.isexecuted=true;
           update AccsToUpdate;
            
        }
        system.debug('@@@ AccsToUpdate');
        for(CampaignMember cmp:[Select Id,ContactId from CampaignMember where contactId IN :PersonContactIds])
        {
            existingCmpMemberswithContactIdSet.add(cmp.ContactId);
        }
    
        for(Funding_Agreement__c fas:newRecs)
        {
            system.debug('@@@entering slack message');
            if(fas.Status__c != oldRecsMap.get(fas.Id).Status__c)
            {
                if(fas.Status__c=='Profile Submitted' || fas.Status__c=='Rate Accepted')
                {
                    
                    if (fas.Verification_Call__c == 'Ready for call' && fas.Target_Amount__c != null && fas.APR__c != null )
                    {
                        SlackMessage.send('#rate_accepts', 'Rate Accept: $'+fas.Target_Amount__c.setScale(0).format() + ' at '+fas.APR__c.setScale(2) +'% to '+AccountMap.get(fas.Upstart__c).Verb_Use_of_Funds__c + ' from '+AccountMap.get(fas.Upstart__c).UTM_Source_Medium__c);
                    }
                    String campid = '70170000000ZmwH';  
                if(!existingCmpMemberswithContactIdSet.contains(AccountMap.get(fas.Upstart__c).PersonContactId))
                {
                    CamMembersToInsert.add(new CampaignMember(CampaignId=campid,ContactId=AccountMap.get(fas.Upstart__c).PersonContactId,Status='Sent'));
                }
               }   
                else
                if(fas.Status__c == 'Funding Offer Given' && oldRecsMap.get(fas.Id).Status__c!='')
                {
                    fas.Income_Verification_Owner__c = null;
                    fas.Income_verified_date_time__c = null;
                    
                }
                else
                if((fas.Status__c == 'Funded' || fas.Status__c == 'In Repayment') &&
                      (oldRecsMap.get(fas.Id).Status__c != 'Funded' && oldRecsMap.get(fas.Id).Status__c != 'In Repayment') &&
                     fas.Target_Amount__c != null && fas.APR__c != null)
                {
                    system.debug('@@entring slack2');
                    SlackMessage.send('#loans', 'New Loan: $'+fas.Target_Amount__c.setScale(0).format() + ' at '+fas.APR__c.setScale(2) +'% to '+AccountMap.get(fas.Upstart__c).Verb_Use_of_Funds__c + ' from '+AccountMap.get(fas.Upstart__c).UTM_Source_Medium__c);
                }
                
                
            }
        }
    
    if(!CamMembersToInsert.isempty())
    insert CamMembersToInsert;
    
    }
    
    
    
    
}