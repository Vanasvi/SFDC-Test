trigger UpdatedItemsToReviewForCaseTrigger on Case (after update) {
    /* Variable Declaration*/
    /*
    Map<id,Case> newlyClosedCasesMap = new Map<id,Case>();//newlyClosedCasesMap > A map to capture all the Closed Cases
    Set<id> notClosedCasesAccountSet = new Set<id>();//notClosedCasesAccountSet > A map to capture all the NON-Closed Cases
    Set<id> relFundingAgreementAccountIdSet = new Set<id>();//To Capture the related Funding Agreemnet Account ID
    Map<id,Funding_Agreement__c> fundingAgreementMaptoUpdate = new Map<id,Funding_Agreement__c>();//FA Map to Update
    Map<id,Case> closedCasesMap = new Map<id,Case>();//Closed Cases Map
    Set<id> closedCasesAccountSet = new Set<id>();//Non- Closed Cases Map
    Set<String> ownerNameSet = new Set<String>{'Investors','Internal','Escalations','PBU Support','PBU Servicing','PBU Complaints','Payments BK', 'Payments Disputes', 'Payments DSC', 'Payments Escalation', 'Payments Fees & Refund Requests', 'Payments Hardship', 'PBU CC Support'};//To Declare the Owner Name Set of cases.
    
    //Trigger to run on all the cases and with Closed and Non Closed Cases
    for(Case c: Trigger.new){
        if(Trigger.newMap.get(c.Id).isclosed){
            //To get all the Cases which are closed Currently
            newlyClosedCasesMap.put(c.id,c);
            notClosedCasesAccountSet.add(c.accountId);
        }else if(Trigger.oldMap.get(c.Id).isclosed){
            //To get all the Cases which are closed Previously
            closedCasesMap.put(c.id,c);
            closedCasesAccountSet.add(c.accountId);
        }       
    }
    //Enters the Loop if there are records in the "newlyClosedCasesMap".
    if(!newlyClosedCasesMap.isEmpty()){
        //To Query the Accounts along with their related Contacts. Which account ids are formed by the "notClosedCasesAccountSet" Map
        List<account> accLst = [select id,(select id,status from cases where status != 'Closed') from account where id IN:notClosedCasesAccountSet];
        if(!accLst.isEmpty()){
            for(account acc : accLst){
                 if(acc.cases != null){
                    List<case> relCases = acc.cases;
                    //If the Account had related contacts then only collect the Account Id such that we can Query the FA object.
                    if(relCases != null){
                        if(relCases.size() == 0){
                            relFundingAgreementAccountIdSet.add(acc.id);
                        }   
                    }       
                } 
            }   
        }
        if(!relFundingAgreementAccountIdSet.isEmpty()){
            //To Get all the related FA records
            List<Funding_Agreement__c> fundingAgreementLst = [select id,Items_to_Review__c from Funding_Agreement__c where Upstart__c IN:relFundingAgreementAccountIdSet];
            if(!fundingAgreementLst.isEmpty()){
                for(Funding_Agreement__c fa : fundingAgreementLst){
                    //Update the Related FA records with "Items_to_Review__c" as False.
                    fa.Items_to_Review__c = false;
                    fundingAgreementMaptoUpdate.put(fa.id,fa);
                }
                if(!fundingAgreementMaptoUpdate.isEmpty()){
                    update fundingAgreementMaptoUpdate.values();
                }       
            }   
        }       
    }
    if(!closedCasesMap.isEmpty()){
        //Get the related case along with the owners Name for all the previously closed Cases.
        Map<id,Case> caseToVerifyMap = new Map<id,Case>([SELECT Id, OwnerID, Owner.Type, Owner.Name,Owner.Profile.Name FROM Case WHERE id IN:closedCasesMap.keySet()]);
        Map<id,case> caseToUpdateMap = new Map<id,case>();  
        Map<id,user> userIdMap  = new Map<id,user>();   
        if(!caseToVerifyMap.isEmpty()){
            set<id> ownerIdSet = new Set<id>();
            for(case cs : caseToVerifyMap.values()){
                if(cs.OwnerId != null){
                    ownerIdSet.add(cs.OwnerId);
                }   
            }
            if(!ownerIdSet.isEmpty()){
                for(user u :[select id,Name,Profile.Name from user where id IN:ownerIdSet]){
                    userIdMap.put(u.id,u);

                }   
            }       
            if(!userIdMap.isEmpty()){
                for(case cs : caseToVerifyMap.values()){
                    if(userIdMap.containskey(cs.OwnerId)){
                        //Verify that the Case owners donstnt Fall in to the above defined Set "ownerNameSet"
                        system.debug('cs .isClosed+++'+Trigger.oldMap.get(cs.Id).isclosed+'cs.OwnerId+++'+cs.OwnerId+' cs.Owner.Name'+userIdMap.get(cs.OwnerId).Name+' +ownerNameSet++++'+ownerNameSet+' cs.Owner.Profile.Name'+userIdMap.get(cs.OwnerId).Profile.Name);
                        if(!ownerNameSet.contains(userIdMap.get(cs.OwnerId).Name)&& (!userIdMap.get(cs.OwnerId).Profile.Name.contains('Collections'))){

                            caseToUpdateMap.put(cs.id,cs);  
                        }  
                    }         
                }
            }   
            if(!caseToUpdateMap.isEmpty()){
                //If the Cases doesnt belong to the owners mentioned in the set "ownerNameSet", we need to reassign it to "Genral Support"
                List<Group>queues = [SELECT Id,Name FROM Group WHERE Name = 'General Support'];
                Map<Id,case> casesMapToUpdateOwner = new Map<Id,case>();
                for(case cs:caseToUpdateMap.values()){
                    cs.OwnerId = queues[0].Id;
                    casesMapToUpdateOwner.put(cs.Id,cs);
                }
                if(!casesMapToUpdateOwner.isEmpty()){
                    update casesMapToUpdateOwner.values();
                }
            }
            //Update all the FA records to "Items_to_Review__c" to "True" for all the cases which are previously closed.

            List<Funding_Agreement__c> fundingAgreementLst = [select id,Items_to_Review__c from Funding_Agreement__c where Upstart__c IN:closedCasesAccountSet];
                if(!fundingAgreementLst.isEmpty()){
                    for(Funding_Agreement__c fa : fundingAgreementLst){
                        fa.Items_to_Review__c = true;
                        fundingAgreementMaptoUpdate.put(fa.id,fa);
                    }
                    if(!fundingAgreementMaptoUpdate.isEmpty()){
                        update fundingAgreementMaptoUpdate.values();
                    }       
                }           
        }       
    }  */ 
}