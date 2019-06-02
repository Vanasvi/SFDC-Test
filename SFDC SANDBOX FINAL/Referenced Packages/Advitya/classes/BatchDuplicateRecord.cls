/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchDuplicateRecord implements Database.Batchable<SObject>, Database.Stateful, System.Schedulable {
    global String addonFieldString;
    global String addons;
    global Map<Id,List<Id>> batchMap {
        get;
        set;
    }
    global String commaSepratedFields;
    global String email;
    global List<String> fieldList {
        get;
        set;
    }
    global String fieldName;
    global String finalQueryFields;
    global String keypair;
    global Map<String,List<SObject>> MapOfDuplicateRecords {
        get;
        set;
    }
    global String masterField;
    global String masterValue;
    global List<String> objectfields {
        get;
        set;
    }
    global String queryName;
    global String sObjectApiName;
    global String whereclause;
    global BatchDuplicateRecord() {

    }
    global BatchDuplicateRecord(String qName) {

    }
    global void execute(System.SchedulableContext sc) {

    }
    global void execute(Database.BatchableContext BC, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return null;
    }
}
