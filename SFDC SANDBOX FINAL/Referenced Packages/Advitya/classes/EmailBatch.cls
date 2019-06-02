/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class EmailBatch implements Database.Batchable<SObject>, Database.Stateful, System.Schedulable {
    global String csvString;
    global String head;
    global Set<Id> idSet;
    global List<String> ll;
    global String objectName;
    global Map<Id,List<Id>> recordMap;
    global Map<Id,List<SObject>> recordMapTemp;
    global String showCriteria;
    global List<String> tempFieldList;
    global List<String> updateableFields;
    global EmailBatch() {

    }
    global EmailBatch(Map<Id,List<Id>> m, String s, List<String> sss, Map<Id,List<SObject>> tm) {

    }
    global EmailBatch(Map<Id,List<Id>> m, String s, List<String> sss, Map<Id,List<SObject>> tm, List<String> vals, Boolean valuedCheck) {

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
