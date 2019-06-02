@isTest(seeAlldata=true)
public class CaseAnalyticsBatchScheduleTest
{
    public static testmethod void tesm()
    {  string RecTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Loans').getRecordTypeId();
        List<Case> cases = new list<case>();
cases.add(new Case(subject='Test',status='New',RecordTypeId=RecTypeId));
cases.add(new Case(subject='Test2',status='New',RecordTypeId=RecTypeId));
cases.add(new Case(subject='Test3',status='New',RecordTypeId=RecTypeId));


insert cases;
        Test.startTest();
        String sch = '0 0 23 * * ?'; 
        system.schedule('Test Territory Check', sch, new CaseAnalyticsBatchSchedule()); 
        Test.stopTest(); 
    }
}