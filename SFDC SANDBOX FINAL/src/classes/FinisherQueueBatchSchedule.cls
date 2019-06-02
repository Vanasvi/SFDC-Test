global class FinisherQueueBatchSchedule implements Schedulable 
{
    global void execute(SchedulableContext SC)
    {
        if(test.isrunningtest())
        Id i=database.executeBatch(new FinisherQueueBatch());
        
        Id i=database.executeBatch(new FinisherQueueBatch(),1);
    }
}