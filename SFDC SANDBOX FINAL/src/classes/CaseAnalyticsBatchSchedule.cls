global class CaseAnalyticsBatchSchedule implements schedulable
{
    global void execute(schedulablecontext sc)
    {
        
     id i=database.executebatch(new CaseAnalyticsBatch());
    }
}