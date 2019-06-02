@isTest
public class SlackMessageTest
{
    public static testmethod void testm()
    {
        Test.startTest();
        SlackMessage.send('#','hellow how are you?');
        Test.stopTest();
    }
}