/* Description  : 
*                This class will be called by trigger EmailMessageTrigger.
*
* Modification Log
================================================================================
* Ver    Date            Author                User Story        Modification
--------------------------------------------------------------------------------
* 1.0    5/31/2019       Vanasvi Kilari                             Created
*/

public class BusinessHoursCalculation 
{
    public static datetime getSixteenHoursBusinessHOursDateTime(datetime dt)
    {
        BusinessHours bh = [SELECT Id, Name, IsActive, TimeZoneSidKey FROM BusinessHours where Name='Default'];
        Datetime nextSixteenHoursDatetime = BusinessHours.add(bh.id, dt, 57600000);
        return nextSixteenHoursDatetime;
        
    }
    
    
}