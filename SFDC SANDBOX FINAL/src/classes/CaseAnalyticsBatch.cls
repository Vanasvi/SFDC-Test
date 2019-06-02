global class CaseAnalyticsBatch implements database.batchable<sobject>,database.stateful
{
    public decimal noofopencasesintendays=0;
    public decimal noofopencasesinfourtyfivedays=0;
    public decimal noofopencasesinsixtydays=0;
    public decimal noofclosedcasesintendays=0;
    public decimal noofclosedcasesinfourtyfivedays=0;
    public decimal noofclosedcasesinsixtydays=0;
    public decimal percentofresolvedintendays=0.0;
    public decimal percentofresolvedinfourtyfivedays=0.0;
    public decimal percentofresolvedinsixtydays=0.0;
    public date todaydate;
    public date fourtyfivedaysbeforedate;
    public date sixtydaysbeforedate;
    public date tendaysbeforedate;
    public string query='';
    
    global CaseAnalyticsBatch()
    {
        todaydate=system.today();
        fourtyfivedaysbeforedate=system.today()-45;
        sixtydaysbeforedate=system.today()-60;
        tendaysbeforedate=system.today()-10;
        string RecTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Loans').getRecordTypeId();
        string str='ffbkc';
        string email='ffbkc.support@upstart.com';
query='select Id,status,Case_Assigned_to_Compliance_Team_Date_ti__c,isclosed,Lending_Program__c from case where Case_Assigned_to_Compliance_Team_Date_ti__c =LAST_N_DAYS:60 AND RecordTypeId=\''+RecTypeId+'\''+' AND (Lending_Program__c=\''+str+'\''+' OR Original_To_Address__c=\''+email+'\')';
system.debug('@@@query'+query);

        
        
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
      return Database.getQueryLocator(query);
   }
   
   global void execute(Database.BatchableContext BC, List<sObject> scope)
   {
      for(sObject s : scope)
      {
         case c = new case();
         c=(case)s;
         if(c.Case_Assigned_to_Compliance_Team_Date_ti__c>fourtyfivedaysbeforedate)
         {
            // add sixty , fourty five and ten also
            noofopencasesinsixtydays=noofopencasesinsixtydays+1;
            noofopencasesinfourtyfivedays=noofopencasesinfourtyfivedays+1;
            noofopencasesintendays=noofopencasesintendays+1;
            if(c.status=='Closed with explanation'||c.status=='Closed with Remediation Resolved'||c.status=='Closed with apology'||c.status=='Closed with monetary relief')
            {
                noofclosedcasesinsixtydays=noofclosedcasesinsixtydays+1;
                noofclosedcasesinfourtyfivedays=noofclosedcasesinfourtyfivedays+1;
                noofclosedcasesintendays=noofclosedcasesintendays+1;
            }
            
         }
         else
         if(c.Case_Assigned_to_Compliance_Team_Date_ti__c>tendaysbeforedate && c.Case_Assigned_to_Compliance_Team_Date_ti__c<=fourtyfivedaysbeforedate)
         {
            // add fourty five and ten also
            
            noofopencasesinfourtyfivedays=noofopencasesinfourtyfivedays+1;
            noofopencasesintendays=noofopencasesintendays+1;
            if(c.status=='Closed'||c.status=='Closed with explanation'||c.status=='Closed with Remediation Resolved'||c.status=='Closed with apology'||c.status=='Remediation Needed'||c.status=='Closed with monetary relief'||c.status=='Closed with Remediation'||c.status=='Resolved'||c.status=='Closed (Cases Hold)'||c.status=='Closed with Escalation to PBU')
            {
                noofclosedcasesinfourtyfivedays=noofclosedcasesinfourtyfivedays+1;
                noofclosedcasesintendays=noofclosedcasesintendays+1;
            }
            
            
         }
         else
         {
            // add only ten days
            
            noofopencasesintendays=noofopencasesintendays+1;
            
            if(c.status=='Closed with explanation'||c.status=='Closed with Remediation Resolved'||c.status=='Closed with apology'||c.status=='Closed with monetary relief')
            noofclosedcasesintendays=noofclosedcasesintendays+1;
            
         }
      }
      
        if(noofopencasesintendays!=0)
        percentofresolvedintendays=((noofclosedcasesintendays/noofopencasesintendays)*100);
        if(noofopencasesinfourtyfivedays!=0)
        percentofresolvedinfourtyfivedays=((noofclosedcasesinfourtyfivedays/noofopencasesinfourtyfivedays)*100);
        if(noofopencasesinsixtydays!=0)
        percentofresolvedinsixtydays=((noofclosedcasesinsixtydays/noofopencasesinsixtydays)*100);
        
        system.debug('@@@@@noofopencasesinsixtydays'+noofopencasesinsixtydays);
        system.debug('@@@@@noofclosedcasesinsixtydays'+noofclosedcasesinsixtydays);
        system.debug('@@@@@noofopencasesinfourtyfivedays'+noofopencasesinfourtyfivedays);
        system.debug('@@@@@noofclosedcasesinfourtyfivedays'+noofclosedcasesinfourtyfivedays);
        system.debug('@@@@@noofopencasesintendays'+noofopencasesintendays);
        system.debug('@@@@@noofclosedcasesintendays'+noofclosedcasesintendays);
        system.debug('@@@@@percentofresolvedintendays'+percentofresolvedintendays);
        system.debug('@@@@@percentofresolvedinfourtyfivedays'+percentofresolvedinfourtyfivedays);
        system.debug('@@@@@percentofresolvedinsixtydays'+percentofresolvedinsixtydays);
   }

    global void finish(Database.BatchableContext BC)
    {
        list<CaseAnalyticsObj__c> recstodelete = new list<CaseAnalyticsObj__c>();
        recstodelete=[select Id from CaseAnalyticsObj__c];
        delete recstodelete;
        
        CaseAnalyticsObj__c cao10 = new CaseAnalyticsObj__c();
        cao10.Name='10 Days';
        cao10.No_of_Open_Cases__c=noofopencasesintendays;
        cao10.No_of_Closed_Cases__c=noofclosedcasesintendays;
        cao10.Percentage_of_Resolved_Cases__c=percentofresolvedintendays;
        
        insert cao10;
        
        CaseAnalyticsObj__c cao45 = new CaseAnalyticsObj__c();
        cao45.Name='45 Days';
        cao45.No_of_Open_Cases__c=noofopencasesinfourtyfivedays;
        cao45.No_of_Closed_Cases__c=noofclosedcasesinfourtyfivedays;
        cao45.Percentage_of_Resolved_Cases__c=percentofresolvedinfourtyfivedays;
        
        insert cao45;
        
        CaseAnalyticsObj__c cao60 = new CaseAnalyticsObj__c();
        cao60.Name='60 Days';
        cao60.No_of_Open_Cases__c=noofopencasesinsixtydays;
        cao60.No_of_Closed_Cases__c=noofclosedcasesinsixtydays;
        cao60.Percentage_of_Resolved_Cases__c=percentofresolvedinsixtydays;
        
        insert cao60;
        
    }
   
   
}