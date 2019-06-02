@isTest
public class CollectionsCallQueueTest
{
    public static testmethod void testm()
    {
        CollectionsCallQueue ccq = new CollectionsCallQueue();
        PageReference pg = new PageReference('/');
        pg=ccq.takeCall();
        integer i=ccq.getMyTodayCallCount();
        List<Funding_Agreement__c> fa = new List<Funding_Agreement__c>();
        fa=ccq.getMyCalls();
        
    }
}