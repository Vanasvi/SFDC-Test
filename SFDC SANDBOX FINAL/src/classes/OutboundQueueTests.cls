@IsTest
public class OutboundQueueTests {
	static testMethod void validateOutboundQueue() {
        OutboundQueue oq = new OutboundQueue();
        oq.getMyTodayOutboundTouches();
        oq.getMyTodayOutboundCount();
        oq.getOutboundQueueTotal();
    }
}