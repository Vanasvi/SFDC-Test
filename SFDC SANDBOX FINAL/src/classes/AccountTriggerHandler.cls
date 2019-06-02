public class AccountTriggerHandler
{
    public static set<Id> FaIds = new set<Id>();
    public static Map<Id,Funding_Agreement__c> FundAgreemtnMap = new Map<Id,Funding_Agreement__c>();
    public static list<Funding_Agreement__c> FaToUpdate = new List<Funding_Agreement__c>();
    public static set<string> accRelatedLendingProgramNameSet = new set<string>(); 
    public static Map<string,Id> lendingProgramMapwithId = new Map<string,Id>();
    
    public static void BorrowerAccountUpdatedTrigger(Map<Id,Account> oldMapRecs,Map<Id,Account> newMapRecs)
    {
        for(Account a:newMapRecs.values())
        {
            if(a.Verification_Call__c !=oldMapRecs.get(a.Id).Verification_Call__c && a.Most_Recent_Funding_Agreement__c!=null)
            {
                FaIds.add(a.Most_Recent_Funding_Agreement__c);
            }
        }
        
        FundAgreemtnMap=new Map<Id,Funding_Agreement__c>([SELECT Items_to_Review__c, Verification_call_owner__c, Last_OB_Call_Timestamp__c,Outbound_Call_Owner__c, X2nd_outbound_owner__c, X3rd_outbound_call_owner__c, Ops_status__c FROM Funding_Agreement__c WHERE Id IN :FaIds]);
        FaToUpdate = new List<Funding_Agreement__c>();
        for(Account ac:newMapRecs.values())
        {
            if(ac.Verification_Call__c!=null)
            {
            Funding_Agreement__c f = new Funding_Agreement__c();
            f=FundAgreemtnMap.get(ac.Most_Recent_Funding_Agreement__c);
            if(f!=null)
            {
                if(ac.Verification_Call__c =='Successful' || ac.Verification_Call__c =='Failed' || ac.Verification_Call__c =='Needs follow up (unsure)')
                {
                    if(ac.Verification_Call__c!='Successful' || f.Ops_Status__c =='Verified')
                    {
                    
                        f.Items_to_Review__c =true;
                    }
                    f.Verification_call_owner__c =UserInfo.getUserId();
                    f.Last_OB_Call_Timestamp__c =System.today();
                    FaToUpdate.add(f);
                }
            
                if(ac.Verification_Call__c.startsWith('Trying to'))
                {
                    f.Last_OB_Call_Timestamp__c =system.today();
                    if(f.Outbound_Call_Owner__c==null)
                    f.Outbound_Call_Owner__c =UserInfo.getUserId();
                    else
                    if(f.X2nd_outbound_owner__c==null)
                    f.X2nd_outbound_owner__c=UserInfo.getUserId();
                    else
                    if(f.X3rd_outbound_call_owner__c==null)
                    f.X3rd_outbound_call_owner__c=UserInfo.getUserId();
                    FaToUpdate.add(f);
                }
                }
            
            }
        }
        if(!FaToUpdate.isempty() && AccountTriggerRecursive.isexecuted==false)
        update FaToUpdate;
    
    }
    
    
    Public static void UpdatedInvestorAccount(Map<Id,Account> oldMapRecs,Map<Id,Account> newMapRecs)
    {
        
        for(Account a:newMapRecs.values())
        {
            if(a.Is_Fund__c  || a.External_Whole_Loan__c || a.Backer_ID__c ==null || a.FirstName == Null)
            return;
        
            if(a.Lifetime_Deposits__c !=oldMapRecs.get(a.Id).Lifetime_Deposits__c && a.Lifetime_Deposits__c !=null)
            {
                if((oldMapRecs.get(a.Id).Lifetime_Deposits__c==null || oldMapRecs.get(a.Id).Lifetime_Deposits__c==0) && a.Lifetime_Deposits__c!=0)
                SlackMessage.send('#investors', 'Investor '+a.Backer_ID__c.setScale(0) + ' deposited $'+a.Lifetime_Deposits__c.setScale(0).format()+' <- FIRST DEPOSIT');
                else
                if(oldMapRecs.get(a.Id).Lifetime_Deposits__c!=null)
                SlackMessage.send('#investors', 'Investor '+a.Backer_ID__c.setScale(0) + ' deposited $'+(a.Lifetime_Deposits__c - oldMapRecs.get(a.Id).Lifetime_Deposits__c).setScale(0).format());
            }    
    
            if(a.Lifetime_Withdrawals__c !=oldMapRecs.get(a.Id).Lifetime_Withdrawals__c && a.Lifetime_Withdrawals__c!=null && oldMapRecs.get(a.Id).Lifetime_Withdrawals__c!=null)
            SlackMessage.send('#investors', 'Investor '+a.Backer_ID__c.setScale(0) + ' withdrew $'+(a.Lifetime_Withdrawals__c-oldMapRecs.get(a.Id).Lifetime_Withdrawals__c).setScale(0).format());
        
            if(a.Recurring_Investments__c !=oldMapRecs.get(a.Id).Recurring_Investments__c && a.Recurring_Investments__c!=null)
            {
                if(oldMapRecs.get(a.Id).Recurring_Investments__c == null)
                {
                    SlackMessage.send('#investors', 'Investor '+a.Backer_ID__c.setScale(0) + ' set up a recurring deposit: '+a.Recurring_Investments__c + '<- NEW RECURRING DEBIT');
                }
                else
                {
                    SlackMessage.send('#investors', 'Investor '+a.Backer_ID__c.setScale(0) + ' updated recurring deposit: '+a.Recurring_Investments__c + ' (previously '+oldMapRecs.get(a.Id).Recurring_Investments__c+')');
            
                }
            }
        }
    }
    
    public static void LendingProgramCheck(list<Account> newRecs)
    {
        for(Account a:newRecs)
        {
            if(a.Lending_Program__c==null && a.Lending_Program_Name__c!='')
            {
                accRelatedLendingProgramNameSet.add(a.Lending_Program_Name__c);
            }
        }
    
    for(Lending_Program__c lp:[Select id,name from Lending_Program__c where Name IN:accRelatedLendingProgramNameSet])
    {
        lendingProgramMapwithId.put(lp.Name,lp.Id);
    }
    
    for(Account ac:newRecs)
    {
        if(ac.Lending_Program__c ==null && ac.Lending_Program_Name__c!='')
        {
            if(lendingProgramMapwithId.containsKey(ac.Lending_Program_Name__c))
            ac.Lending_Program__c=lendingProgramMapwithId.get(ac.Lending_Program_Name__c);
        }
    }
    }
    
    
    
}