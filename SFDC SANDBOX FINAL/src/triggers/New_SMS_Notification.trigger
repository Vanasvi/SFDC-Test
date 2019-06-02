trigger New_SMS_Notification on smagicinteract__Incoming_SMS__c (before insert) {
	Id pId;
    
    for(smagicinteract__Incoming_SMS__c sms: Trigger.new){
		pId = sms.Account__c;
        List<Account> accts =[select Id from Account where id=:pId];
        if (accts.size() > 0) {
            List<Funding_Agreement__c> fas = [select New_SMS__c from Funding_Agreement__c where Upstart__c=:accts[0].Id];
            for (Funding_Agreement__c fa : fas) {
                fa.New_SMS__c = true;
                fa.Items_to_Review__c = true;
                update fa;
            }
        }
	}
}