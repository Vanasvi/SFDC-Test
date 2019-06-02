/* 

	*******************************************************************************************************************************
	*******************************************************************************************************************************
	Apex Trigger Name: AttachmentTrigger
	Created By: Vanasvi Kilari
	Created On: 12/13/2018
	Purpose: This trigger is created on Attachment object and this will get triggered when a new attachment record is created/updated.
	
	
	
	********************************************************************************************************************************
	********************************************************************************************************************************
	
*/

Trigger AttachmentTrigger on Attachment(after insert)
{
	
	if(trigger.isafter && trigger.isinsert)
	AttachmentTriggerHandler.afterInsertMeth(trigger.new);
	
}