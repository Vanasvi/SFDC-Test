trigger BorrowerAccountUpdatedTrigger on Account (after update) {
   /* for (Account a : Trigger.new) {
        Account aold = Trigger.oldMap.get(a.ID);

        // basic null test
        if (a == null || aold == null) return;

        // Check for new verification call status
        if (a.Verification_Call__c != aold.Verification_Call__c &&
            a.Most_Recent_Funding_Agreement__c != null) { 
                Funding_Agreement__c fa = [SELECT Items_to_Review__c, Verification_call_owner__c, Last_OB_Call_Timestamp__c,
                                           Outbound_Call_Owner__c, X2nd_outbound_owner__c, X3rd_outbound_call_owner__c, Ops_status__c
                                           FROM Funding_Agreement__c WHERE Id = :a.Most_Recent_Funding_Agreement__c LIMIT 1];
                if (fa == null) return; // there is nothing to update if there is no FA
                // Checking for new values that indicate finisher activity required
                if (a.Verification_Call__c == 'Successful' ||
                    a.Verification_Call__c == 'Failed' ||
                    a.Verification_Call__c == 'Needs follow up (unsure)' ) {
                        if (a.Verification_Call__c != 'Successful' || fa.Ops_Status__c == 'Verified') {
                            fa.Items_to_Review__c = True;
                        }
                        fa.Verification_call_owner__c = UserInfo.getUserId();
                        fa.Last_OB_Call_Timestamp__c = System.today();
                        update(fa);
                }
                if (a.Verification_Call__c.startsWith('Trying to')) {
                    fa.Last_OB_Call_Timestamp__c = System.today();
                    if (fa.Outbound_Call_Owner__c == null) { fa.Outbound_Call_Owner__c = UserInfo.getUserId(); }
                    else if (fa.X2nd_outbound_owner__c == null) { fa.X2nd_outbound_owner__c = UserInfo.getUserId(); }
                    else if (fa.X3rd_outbound_call_owner__c == null) { fa.X3rd_outbound_call_owner__c = UserInfo.getUserId(); }
                    update(fa);
                }     
        }
    }*/
}