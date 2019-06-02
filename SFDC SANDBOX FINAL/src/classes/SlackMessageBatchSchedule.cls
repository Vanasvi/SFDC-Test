global class SlackMessageBatchSchedule implements schedulable
{
    global void execute(Schedulablecontext sc)
    {
        Id job=database.executeBatch(new SlackMessageBatch());
    }
}