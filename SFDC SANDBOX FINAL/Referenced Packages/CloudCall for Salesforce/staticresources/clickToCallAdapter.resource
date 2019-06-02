var coid = '';
var campId = '';
var PageObject = '';
var PageObjectID = '';
var nameSpace = 'synety.';

function getPageInfoCallback(response)
{
	if(response.result)
	{
		console.log('PageInfo: ' + response.result );	
		var PageInfo = JSON.parse(response.result);
		PageObject = PageInfo.object;
		PageObjectID = PageInfo.objectId;
	}
}

function onFocuscallback(response)
{
	if(response.result)
	{
		console.log('onFocuscallback result## '+ response.result);
		
		var pageInfo = JSON.parse(response.result);			
		PageObject = pageInfo.object;
		PageObjectID = pageInfo.objectId;		
	}
} 	
function click2DiallistenerfromAdapter(response) 
{
	if (response.result) 
	{			
		console.log('User clicked: ' + response.result );		  		
		var phoneInfo = JSON.parse(response.result);
		
		if(PageObject == 'Opportunity')
			coid = PageObjectID;	
			
		else if(phoneInfo.object == 'CampaignMember')
			campId = phoneInfo.objectId;
			
		var JsonParam = '{"ObjectID":"'+phoneInfo.objectId+'","ObjectType":"'+phoneInfo.object+'","PhoneNumber":"'+phoneInfo.number+'"}';
		console.log('JsonParam: ' + JsonParam );	
		sforce.interaction.runApex(nameSpace+"Utility", "GetContactFromObject", 'Param='+JsonParam,click2DiallistenerfromAdapterCallBack);			
	 }
  }
  
 function click2DiallistenerfromAdapterCallBack(response)
 {
	if(response.result)
	{
		console.log('Click call Response: ' + response.result );
		var getResult = JSON.parse(response.result);
		openCallWindowAdapter(getResult.ContactID,getResult.ContactNumber, getResult.CaseId);
	}	
 }
function openCallWindowAdapter(id,pn,caseId) 
{	   		
	var u = '/apex/synety__ContactPhone?id='+id+'&pn='+encodeURIComponent(pn);	
	if(caseId != '' && typeof caseId != "undefined")	
	{u += '&caseId='+caseId;}	
	
	if(coid != '' && typeof coid !="undefined")
	{u += '&coid='+coid;}
	
	if(campId != '' && typeof campId !="undefined")
	{u += '&campId='+campId;}

	console.log('Click Call URL: ' + u);
	var wnd = window.open(u,'Make_Call','scrollbars=0,width=550, height=400,left=370,top=170'); 		
	wnd.focus();	
}