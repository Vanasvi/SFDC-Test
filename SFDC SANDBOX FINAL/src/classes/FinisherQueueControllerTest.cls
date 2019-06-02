@isTest(SeeallData=true)
public class FinisherQueueControllerTest
{
    public static testmethod void testm()
    {
        FinisherQueueController fqc = new FinisherQueueController();
        integer g=fqc.getMyTodayTouchCount();
        fqc.takeApp();
        fqc.takeFinisher2App();
        fqc.takeFraudApp();
        list<Funding_Agreement__c> fas = new list<Funding_Agreement__c>();
        fas=fqc.getMyTodayTouches();
    }
}