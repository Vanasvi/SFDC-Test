Trigger FundingAgreementTrigger on Funding_Agreement__c (before insert,before update)
{
    if(trigger.isbefore && trigger.isinsert)
    {
        FundingAgreementTriggerHandler.SFMC_FA_Trigger(trigger.new);
    }
    if(FundingAgreementTriggerRecursive.isexecuted==false)
    if(trigger.isbefore && trigger.isupdate)
    {
        FundingAgreementTriggerHandler.UpdatedFundingAgreementStatus(trigger.oldmap,trigger.new);
    }
}