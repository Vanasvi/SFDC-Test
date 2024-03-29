/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MergeBatch1 implements Database.Batchable<SObject>, Database.Stateful, System.Schedulable {
    global String accountType;
    global List<String> cList;
    global String commaSepratedFields;
    global String criteriaForMail;
    global SObject masterRecord {
        get;
        set;
    }
    global Boolean mergeFailed;
    global Id mID {
        get;
        set;
    }
    global List<String> objectfields {
        get;
        set;
    }
    global String query;
    global List<Id> recordsIdsToMerge;
    global SObject secondaryRecord {
        get;
        set;
    }
    global String sObjectName;
    global Integer test;
    global List<String> updateableFields;
    global String whereclause;
    global MergeBatch1() {

    }
    global MergeBatch1(Map<Id,List<Id>> m, String s, List<String> sss) {

    }
    global MergeBatch1(Map<Id,List<Id>> m, String s, List<String> sss, List<String> vals, Boolean valuedCheck) {

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
