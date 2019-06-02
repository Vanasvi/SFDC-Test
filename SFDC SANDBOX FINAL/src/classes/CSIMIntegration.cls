global with sharing class CSIMIntegration {
    webService static String getCredentials(String objectId, String objectType) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectType);
        if(Contact.sObjectType == targetType) {
            return getContact(objectId);
        } else if(Account.sObjectType == targetType) {
            return getAccount(objectId);
        } else if(targetType != null) {
            String eObjectType = escapeString(objectType);
            String eObjectId = escapeString(objectId);
            Schema.DescribeSObjectResult describe = targetType.getDescribe();
            if(isAccessibleAttribute(objectType, 'ContactId')) {
                List<SObject> result = Database.query('SELECT ContactId FROM ' + eObjectType + ' WHERE Id = \'' + eObjectId + '\'');
                if(!result.isEmpty()) {
                    return getContact(String.valueOf(result.get(0).get('ContactId')));
                }
            } else if(isAccessibleAttribute(objectType, 'AccountId')) {
                List<SObject> result = Database.query('SELECT AccountId FROM ' + eObjectType + ' WHERE Id = \'' + eObjectId + '\'');
                if(!result.isEmpty()) {
                    return getAccount(String.valueOf(result.get(0).get('AccountId')));
                }
            }
        }
        return '{}';
    }
    @TestVisible
    static boolean isAccessibleObject(String objectType) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectType);
        System.debug('isAccessibleObject ' + objectType); 
        return targetType != null && targetType.getDescribe().isAccessible();
    }
    @TestVisible
    static boolean isUpdateableAttribute(String objectType, String attribute) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectType);
        System.debug('isUpdateableAttribute ' + objectType + '.' + attribute); 
        return targetType != null && targetType.getDescribe().fields.getMap().containsKey(attribute) && targetType.getDescribe().fields.getMap().get(attribute).getDescribe().isUpdateable();
    }
    @TestVisible
    static boolean isAccessibleAttribute(String objectType, String attribute) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectType);
        System.debug('isAccessibleAttribute' + objectType + '.' + attribute); 
        return targetType != null && targetType.getDescribe().fields.getMap().containsKey(attribute) && targetType.getDescribe().fields.getMap().get(attribute).getDescribe().isAccessible();
    }
    @TestVisible
    static boolean isCreateableObject(String objectType) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectType);
        System.debug('isCreateableObject ' + objectType); 
        return targetType != null && targetType.getDescribe().isCreateable();
    }

    @TestVisible
    static boolean isWhoId(Schema.SObjectType targetType) {
        return (targetType == Contact.sObjectType && isAccessibleObject('Contact')) || (targetType == Lead.sObjectType && isAccessibleObject('Lead'));
    }

    @TestVisible
    static boolean isWhatId(Schema.SObjectType targetType) {
        return (targetType == Contract.sObjectType && isAccessibleObject('Contract'))  
         || (targetType == Campaign.sObjectType && isAccessibleObject('Campaign'))
         || (targetType == Account.sObjectType && isAccessibleObject('Account'))  
         || (targetType == Asset.sObjectType && isAccessibleObject('Asset')) 
         || (targetType == Case.sObjectType && isAccessibleObject('Case')) 
         || (targetType == Solution.sObjectType && isAccessibleObject('Solution')) 
         || (targetType == Opportunity.sObjectType && isAccessibleObject('Opportunity'));
    }    

    webService static String saveActivityObject(String objectId, String objectType, String description, 
                                                Integer duration, String disposition, String direction, 
                                                String serviceName, String adapterUrl, String recordingUrl) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectType);

          objectId = decodeQueryString(objectId);
            objectType= decodeQueryString(objectType);
            description= decodeQueryString(description);
            disposition= decodeQueryString(disposition);
            direction= decodeQueryString(direction);
            serviceName= decodeQueryString(serviceName);
            adapterUrl= decodeQueryString(adapterUrl);
            recordingUrl= decodeQueryString(recordingUrl);
            
        String contactId = null;
        String whatId = null;
        if(targetType == null) {
            targetType = getObjectType(objectId);
            objectType = getObjectKey(targetType); 
        }

        if(targetType != null) {
            if(isWhoId(targetType)) {
                contactId = objectId;
            } else {
                if(isWhatId(targetType)) {
                    whatId = objectId;
                }
                
                if(isAccessibleAttribute(objectType,'Upstart__c')) {         
                    List<SObject> result = Database.query('Select Upstart__c from ' + escapeString(objectType) + ' where Id = \'' + escapeString(objectId) + '\'');
                    if(!result.isEmpty()) {
                        whatId = String.valueOf(result.get(0).get('Upstart__c'));
                    }
                }
    
                if(isAccessibleAttribute(objectType,'ContactId')) {         
                    List<SObject> result = Database.query('Select ContactId from ' + escapeString(objectType) + ' where Id = \'' + escapeString(objectId) + '\'');
                    if(!result.isEmpty()) {
                        contactId = String.valueOf(result.get(0).get('ContactId'));
                    }
                }
            }
        }
        
       String callObj = null;
       if(isAccessibleAttribute('CallCenter', 'Name')) {
            List<CallCenter> cc = [Select c.Name From CallCenter c WHERE c.AdapterUrl like:('%' + adapterUrl + '%')];
            if(!cc.isEmpty()) {
                callObj = cc.get(0).Name;   
            }
        }
                //check CRUD permission
        if(!isCreateableObject('Task')) {
           return '{\'result\' : \' Insufficient access to create Task object:\'}';
        }
        
        Task task = new Task();
        
        if(isUpdateableAttribute('Task', 'ActivityDate')) {
            task.ActivityDate = date.today();
        }
        
        if(isUpdateableAttribute('Task', 'CallObject')) {
            task.CallObject = callObj;   
        }
        
        if(isUpdateableAttribute('Task', 'CallType')) {
            task.CallType = direction;
        }
        
        if(isUpdateableAttribute('Task', 'CallDisposition')) {
            task.CallDisposition = disposition;
        }
        
        if(isUpdateableAttribute('Task', 'CallDurationInSeconds')) {
            task.CallDurationInSeconds = duration;
        }
        
        if(isUpdateableAttribute('Task', 'Description')) {
            task.Description = description;
        }
        
        if(isUpdateableAttribute('Task', 'WhatId')) {
            task.WhatId = whatId;
        }
        
        if(isUpdateableAttribute('Task', 'WhoId')) {
            task.WhoId = contactId;
        }
        
        if(isUpdateableAttribute('Task', 'Subject')) {
            task.Subject = serviceName;
        }
        
        if(isUpdateableAttribute('Task', 'Status')) {
            task.Status = 'Completed';
        }        
        
        if(isUpdateableAttribute('Task', 'SPRecordingOrTranscriptURL__c')){
            task.put('SPRecordingOrTranscriptURL__c', recordingUrl);
        }
        
        if(isUpdateableAttribute('Task', 'BrightPattern__SPRecordingOrTranscriptURL__c')){
            task.put('BrightPattern__SPRecordingOrTranscriptURL__c', recordingUrl);
        }

        Database.SaveResult sr = Database.insert(task);
        return JSON.serialize(sr);
    }
    
    
    
    webService static String saveActivityAttribute(String objectId, String key, String value) {
        if(isUpdateableAttribute('Task', key)) {
            SObject result = Database.query('SELECT '+ escapeString(key) +' FROM Task where Id = \'' + escapeString(objectId) + '\'');
            result.put(key, value);
            try {
                update result;
                return '{\'result\' : \'success\'}';
            } catch (DmlException e) {
                String message = '';
                for (Integer i = 0; i < e.getNumDml(); i++) {
                    message += e.getDmlMessage(i) + ';'; 
                }
                return '{\'result\' : \'Unable to update task ' + message + '\'}';
            }
        }

        return '{\'result\' : \'field is not updateable ' + key + '\'}';
    }  
    @TestVisible
    private static String escapeString(String value) {
        return String.escapeSingleQuotes(value);
    }
    
    public static String getCustomSettings(String adapterUrl) {
       //check FLS
       if(!isAccessibleAttribute('CallCenter', 'CustomSettings')) {
               return '{\'result\' : \' Insufficient access to access CallCenter.CustomSettings object\'}';
        }
           
        List<CallCenter> result = [Select c.CustomSettings From CallCenter c WHERE c.AdapterUrl like:('%' + adapterUrl + '%')];
        if(result.isEmpty()) {
            return '';
        }
        return result.get(0).CustomSettings;
    }      
    @TestVisible
    private static String getAccount(String accountId) {
           if(!isAccessibleObject('Account')) {
               return '{\'result\' : \' Insufficient access to create Accountobject:\'}';
           }
        List<Account> result = [SELECT Name FROM Account WHERE Id = :accountId];
        if(result.isEmpty()) {
            return '{}';
        }
        return JSON.serialize(result.get(0));
    }

      public static String getObjectKey(Schema.SObjectType type) {
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        for(String key: gd.keySet()) {
            Schema.SObjectType describe = gd.get(key);
            if(type == describe){
                return key; 
            }
        }
        return null;
    } 

    private static String decodeQueryString(String text) {
        if(text != null) {
        return EncodingUtil.urlDecode(text, 'UTF-8');
        }
      return text;
    }
    
    public static Schema.SObjectType getObjectType(id subject) {
        Schema.SObjectType result = null;
        String target = subject;
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        String keyPrefix;
        for(Schema.SObjectType describe: gd.values() ){
            keyPrefix = describe.getDescribe().getKeyPrefix();
            if(keyPrefix != null && target.startsWith(keyPrefix)){
                result = describe;
                break; //no need to keep looking
            }
        }
        return result;
    }

    private static String getContact(String contactId) {
        if(!isAccessibleObject('Contact')) {
             return '{\'result\' : \' Insufficient access to create Task object:\'}';
         }
        List<Contact> result = [SELECT FirstName, LastName FROM Contact where Id = :contactId];
        if(result.isEmpty()) {
            return '{}';
        }
        return JSON.serialize(result.get(0));
    } 
}