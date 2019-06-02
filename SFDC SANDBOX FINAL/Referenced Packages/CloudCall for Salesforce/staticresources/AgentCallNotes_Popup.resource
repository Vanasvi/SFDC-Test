var ConferenceRelatedToIDs = '';
var ConferenceRelatedToCount = '0';
var ConferenceCount = '0'; 
var CaseContactAccountID = '';
var CasTaskID = '';
//Shumaila For Related To
var RelatedToList = null;
var RelatedToId = '';
var RelatedToName = '';
//Shumaila for add new Case
var CatList = null; 
var CLI = '';
var CLD = '';
var callLastSession = '';
 
function processCLISearch(_contactInfo)
{	
	document.getElementById('divSelectContact').style.display="none";
	var limit = 5;

	if (_contactInfo.searchResult.length < limit) 
	{
		limit = _contactInfo.searchResult.length;
	}
	 
	//***************    
	for (var i = 0; i < limit; i++) 
	{
		var recName = _contactInfo.searchResult[i].Name;
		var recId = _contactInfo.searchResult[i].Id;
		var recType = _contactInfo.searchResult[i].ObjectType;
		var recObject = _contactInfo.searchResult[i].Object;

		//document.getElementById('recName').innerHTML = recName;
		debugLog("\t ObjId: " + recId + "; Name: " + recName + "; object: " + recType);
		
		//addAccordion(recName, recId, recType);
		if(_contactInfo.searchResult.length == 1)
			addAccordion(_contactInfo.searchResult[i],true);
		else
			addAccordion(_contactInfo.searchResult[i],false);
		//Shumaila Related To
		//Shumaila RelatedTo Free
		IsRelatedToObject = false;
		IsInLookupEntities(recObject);
		
		if(limit == 1 && IsRelatedToObject)
		{
			document.getElementById('divRelatedToPopUp').style.display = 'block';
			CurrentContact = 'defualt';
			//JIRA Issue SFC-219
			if(FromConference)
			{
				ConferenceCount = "0"; 
				ConferenceRelatedToCount = "0"
				ConferenceRelatedToIDs = '';
				SetConferenceRelatedTo(sessionId);
			}				
			else
				AppendRelatedTo();
				
			GetDropDownValues();
			if(recObject.toLowerCase() == 'contact')
				document.getElementById('cmdSaveNote_Case').style.display = 'block'; 
		}
		//**************

	}
	
	$("#accordion h3 span, #accordion h3 a").unbind("click");
	$("#accordion input").bind("click");
	
	$("#accordion h3 span, #accordion h3 a, #accordion h3 input").bind("click", function() {
		
		$(this).parent().next().slideToggle(100);
		$(this).parent().toggleClass("expanded");
		
		if(accordion.childElementCount > 1) //JIRA Issue SFC-195
		{
			//Shumaila related to
			var attrVal = $(this).attr('value');
			if(attrVal != undefined)
			{
				debugLog('attrVal## '+ attrVal);
				//var attrValIndex = attrVal.indexOf('contact');						
				var classVal = $('.'+attrVal).text();
				debugLog('classVal## '+ classVal);
				//Shumaila RelatedTo Free
				var selectObject = attrVal.split('-')
				IsRelatedToObject = false;
				IsInLookupEntities(selectObject[0]);					
				if(IsRelatedToObject)
				{
					document.getElementById('divRelatedToPopUp').style.display = 'block';
					CurrentContact = selectObject[0]+'_'+selectObject[1]; //Shumaila CRM Sync v2 JIRA Issue SFC-149
					//JIRA Issue SFC-219
					if(FromConference)
					{
						ConferenceCount = "0"; 
						ConferenceRelatedToCount = "0"
						ConferenceRelatedToIDs = '';
						SetConferenceRelatedTo(sessionId);
					}
					else
						AppendRelatedTo();
						
					if(attrVal.indexOf('contact') == 0)
						document.getElementById('cmdSaveNote_Case').style.display = 'block'; 
					else
						document.getElementById('cmdSaveNote_Case').style.display = 'none'; 
				}
				else
				{
					document.getElementById('divRelatedToPopUp').style.display = 'none';
					document.getElementById('cmdSaveNote_Case').style.display = 'none'; //Shumaila For add new Case
				}
			}					
		}					
	});

	
	$("#accordion input").bind("click", function() {

	});
}

function initAccordion(){
}  

//function addAccordion(contactName, contactId, objectType)
function addAccordion(recordInfo, doPreselect)
{
	//Shumaila CRM Sync JIRA Issue SFC-47/ SFC-46
	var recType = recordInfo.Object.toLowerCase();
	var recName = recType == 'case'?recordInfo.CaseNumber:recType =='task'?recordInfo.Subject:recType =='contract'?recordInfo.ContractNumber:recType =='order'?recordInfo.OrderNumber:recordInfo.Name;
	var recId = recordInfo.Id;
	var sBody = '';

	//Shumaila CRM Sync v2
	var Company = recordInfo.Company == undefined?'':recordInfo.Company ;
	var Country = recordInfo.Country == undefined?'':recordInfo.Country;
	var Email = recordInfo.Email == undefined?'':recordInfo.Email;
	var Title = recordInfo.Title == undefined?'':recordInfo.Title;
	var City = recordInfo.City == undefined?'':recordInfo.City;
	if(recType == 'contact')
	{
		sBody += '<b>Company</b>: <h7>' + AdjustSpecialCharacters(Company) +'</h7><br />';
		sBody += '<b>Email</b>: ' + Email +'<br />';
		sBody += '<b>Title</b>: <h7>' + AdjustSpecialCharacters(Title) +'</h7><br />';//JIRA Issue SFC-182
		sBody += '<b>Owner</b>: ' + recordInfo.Owner+'<br />';
		sBody += '<b>Last Modified</b>: ' + recordInfo.LastModified+'<br />';
	}
	else if(recType == 'account')
	{
		sBody += '<b>City</b>: ' + City +'<br />';
		sBody += '<b>Country</b>: ' + Country +'<br />';
		sBody += '<b>Owner</b>: ' + recordInfo.Owner+'<br />';
		sBody += '<b>Last Modified</b>: ' + recordInfo.LastModified+'<br />';
	}
	else if(recType == 'lead')
	{
		sBody += '<b>Company</b>: <h7>' + AdjustSpecialCharacters(Company) +'</h7><br />';
		sBody += '<b>Email</b>: ' + Email +'<br />';
		sBody += '<b>City</b>: ' + City +'<br />';
		sBody += '<b>Country</b>: ' + Country +'<br />';
		sBody += '<b>Owner</b>: ' + recordInfo.Owner+'<br />';
		sBody += '<b>Last Modified</b>: ' + recordInfo.LastModified+'<br />';
	}
	else 
	{
		sBody += '<b>Name</b>: <h7>' + AdjustSpecialCharacters(recName)+'</h7><br />';//JIRA Issue SFC-182
		sBody += '<b>Owner</b>: ' + recordInfo.Owner+'<br />';
		sBody += '<b>Last Modified</b>: ' + recordInfo.LastModified+'<br />';
	}
	
	var selected='';
	if(doPreselect)
		selected='checked';
	//Shumaila related to and hyperlink funcitonality
	var value = recType+'-'+recId;//Shumaila CRM Sync v2//Shumaila CRM Sync Object lable name issue
	debugLog('##Value## '+ value);
	
	var header = '<li><h3><input '+selected+' type="radio" name="callContact" value="'+value+'"><span class="type">'+ recordInfo.ObjectType +'</span >:&nbsp;<a href="javascript:openRecordWindow(\''+recId+'\');" class="'+value+'">'+AdjustSpecialCharacters(recName)+'</a></h3><div class="contact">'+sBody+'</div></li>';

	var newDiv = header;
	$('#accordion').append(newDiv);	
	
}
//Shumaia for hyperlink functionality
function openRecordWindow(recordId)
{
	var url = "/"+recordId;
	
	url += '?isdtp=vw';
	
	window.open(url,"recordWindow","width=600,height=500");
}		
//*********************
function removeAllAccordion()
{
	$("#accordion").empty();
	
	initAccordion();
}

//cli search - no result functions
function typeChanged(lstType)
{
	//Shumaila CRM Sync v2			
	if(lstType != "")
	{
		document.getElementById("txtSearchRecord").value = '';
		document.getElementById("hiddenSelectId").value = '';
		SelectType = lstType.selectedOptions[0].innerHTML;
		document.getElementById('divSearchRecord').style.display="block";
		document.getElementById('divRelatedToPopUp').style.display = 'none';
		document.getElementById('cmdSaveNote_Case').style.display = 'none'; //Shumaila For add new Case
		IsRelatedToObject = false;
		IsInLookupEntities(lstType.selectedOptions[0].value);
		//Shumaila JIRA SFC-18
		if(IsRelatedToObject)//Shumaila CRM Sync v2 Lable name issue
		{
			document.getElementById('divRelatedToPopUp').style.display = 'block';
			$('#ddl_RelatedToPopUp').empty();
			if(lstType.selectedOptions[0].value.toLowerCase() =="contact")
				document.getElementById('cmdSaveNote_Case').style.display = 'block'; //Shumaila For add new Case
			
			var ListValue =  document.getElementById('ddl_RelatedToPopUp').value;
			if(ListValue.length == 0)
				$('#ddl_RelatedToPopUp').append('<option value="Select">Select Related To...</option>');				
		}	
	}			
	//*********************				
}


//shumaila CRM Sync v2 JIRA Issue SFC-125
function OpenWindowForCase(HaveRecordType)
{
	var saveURL = encodeURIComponent("/apex/synety__GetStarted");
		
	var CatName = CatList.options[CatList.selectedIndex].innerHTML;
	
	GetCLICLD ();//Shumaila CRM Sync v2 Call subject field mapping
	
	var subject = 'Synety Call '+CatName + ' FROM:'+ encodeURIComponent(CLI) + ' TO:'+encodeURIComponent(CLD);
	debugLog('CaseCall subject '+ subject); 
	var URL = '';
	if(CaseContactAccountID != "null")
		URL = '&def_account_id='+CaseContactAccountID;
	
	URL += '&cas14='+subject;         
	URL += '&isdtp=lt&nooverride=1&retURL='+saveURL+'&saveURL='+saveURL;//Shumaila CRM Sync v2 JIRA Issue SFC-89
	URL += '?TaskId='+CasTaskID;
	URL = encodeURIComponent(URL);
	
	debugLog('urlToOpen$$ '+ URL);
	
	if(HaveRecordType)
	{
		getURL = "/setup/ui/recordtypeselect.jsp?isdtp=mn&ent=Case&retURL="+saveURL;		
	}
	else
		getURL = urlToOpen;	
		
	getURL += "&save_new_url="+urlToOpen + URL;
	
	document.getElementById('cmdSaveNote_Case').style.display = 'none';
	debugLog('getURL$$ '+ getURL);
	CaseContactAccountID = '';
	CasTaskID = '';
	urlToOpen = '';	
}
//**************************************
function getSelectedRecord()
{
	var selRecord = {};
	selRecord[1] = '';
	selRecord[0] = '';
	
	if((clickCallRecord != ''))
	{
		selRecord[1] = clickCallRecord.object;
		selRecord[0] = clickCallRecord.objectId;				
	}
	else
	{
		if(document.getElementById('divSelectContact').style.display == 'none')
		{
			//get id from cli search results
			var x=document.getElementsByTagName("input");
			for(var a=0; a<x.length; a++)
			{
				if(x[a].type == 'radio' && x[a].checked)
				{
					var selVal = x[a].value;
					//var selVals = selVal.split("_"); //previously it was 
					var selVals = selVal.split("-"); //Shumaila crm sync v2
					selRecord[1] = selVals[0];
					selRecord[0] = selVals[1];
				}
			}  
		}
		else
		{
			//get id from lookup
			//Shumaila CRM Sync v2
			//selRecord[1] = document.getElementById('pg:frm:lstContactType').value;
			selRecord[1] = document.getElementById('lstContactType').value; 
			selRecord[0] = document.getElementById('hiddenSelectId').value;
			//if(document.getElementById("pg:frm:"+selRecord[1]+"_lkid"))
				//selRecord[0] = document.getElementById("pg:frm:"+selRecord[1]+"_lkid").value;
		   //***********************************
		}
	}
	
	return selRecord;
}
	                         
//save notes
function saveNotes(followupAction)
{
	//Shumaila For Related to and New Case
	if(document.getElementById('divRelatedToPopUp').style.display == 'block')
	{
		RelatedToList = document.getElementById('ddl_RelatedToPopUp');
		RelatedToId = RelatedToList.value;
		RelatedToName = RelatedToList.options[RelatedToList.selectedIndex].innerHTML;
	}
	CatList = document.getElementById('pg:frm:lstCat');//Shumaila for add new Case
	var CatId = CatList.value;
	var notes = document.getElementById('pg:frm:txtNote').value;
	
	if(CatId == '' && hideCategory_Subject == false && isCallCatRequired == true)
	{
		alert('Please select call category');
		CatList.focus();
		return;	
	}
	
	if(notes == '' && isNoteRequired == true)
	{
		alert('Please enter call notes');
		document.getElementById('pg:frm:txtNote').focus();
		return;	
	}
	
	var selRecord = getSelectedRecord();
	if(selRecord[0] == '' || 
	(document.getElementById('divSearchRecord').style.display == 'block' 
		&& (document.getElementById('txtSearchRecord').value.trim() == '' 
			|| document.getElementById('hiddenSelectId').value.trim() == '')
	)) //Shumaila CRM Sync v2 JIRA Issue SFC-146
	{
		alert('Please select a record to link these call notes to.');
		document.getElementById('hiddenSelectId').value = '';
		return;
	}
	//Shumaila for add new Case
	if(RelatedToId != 'Select' && followupAction == 'create case')
	{
		alert('Cannot create a Case as "Related to" is already selected');  
		return;     
	}
	
	 //JIRA Issue SFC-288
	if(document.getElementById('txtCallSubject').value.trim() =='' &&  IsSubjectRequired && IsDetailSubjectEnable)
	{
		alert('Please enter call Subject');	
		return;		
	}
	
	if(IsDetailCust1Enable && IsDetailcust1Required)
	{
		var IsEmpty1 = false;		
		var ErrorMsg1 = 'Please enter '+Detailcust1Label;
		
		if(localStorage.getItem('CallDetailsCust1_'+sessionId) == 'Cust1SingleText' && document.getElementById('txtDetailCust1').value.trim() == '')
			IsEmpty1 = true;
		else if(localStorage.getItem('CallDetailsCust1_'+sessionId) == 'Cust1MultiText' && document.getElementById('pg:frm:txtMultiDetailCust1').value.trim() == '')
			IsEmpty1 = true;
		else if(localStorage.getItem('CallDetailsCustDD1_'+sessionId,'Cust1DropDown') && document.getElementById('pg:frm:lsDetailcust1').value == '')
			IsEmpty1 = true;
		
		if(IsEmpty1)
		{
			alert(ErrorMsg1);
			return;
		}
				
	}
	
	if(IsDetailCust2Enable && IsDetailcust2Required)
	{
		var IsEmpty2 = false;
		var ErrorMsg2 = 'Please enter '+Detailcust2Label;
		
		if(localStorage.getItem('CallDetailsCust2_'+sessionId) == 'Cust2SingleText' && document.getElementById('txtDetailCust2').value.trim() == '')
			IsEmpty2 = true;
		else if(localStorage.getItem('CallDetailsCust2_'+sessionId) == 'Cust2MultiText' && document.getElementById('pg:frm:txtMultiDetailCust2').value.trime() == '')
			IsEmpty2 = true;
		else if(localStorage.getItem('CallDetailsCustDD2_'+sessionId,'Cust2DropDown') && document.getElementById('pg:frm:lsDetailcust2').value == '')
			IsEmpty2 = true;
		
		if(IsEmpty2)
		{
			alert(ErrorMsg2);	
			return;
		}
				
	}
	//********************
	
	
	//wrapupEnds(true);
	SaveCallNotes(followupAction);
	
}


//Shumaila CRM Sync v2 Call subject field mapping
function GetCLICLD ()
{
	if(callType =='Inbound' && campName != '')
	{
		CLI = phNum;
		CLD = campAccountNumber;
	}
	else if(callType =='Outbound' && campName != '')
	{
		CLI = campAccountNumber;
		CLD = phNum;
	}
	else if(callType=='Inbound') 
	{
		CLI = phNum;
		CLD = sDDINumb;
	}
	else
	{
		CLI = sDDINumb;
		CLD = phNum;
	}
	  
}

// CRM Sync v2 JIRA Issue SFC-154	
function sanitizeJSON(unsanitized){ 
	return unsanitized.replace(/\\/g, "\\\\").replace(/"/g,"\\\"").replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\t/g, "\\t");//.replace(/'/g,"\\\'");
}


 //Shumaila Related To
//Remove all the data from Local Storages
function RemoveLocalStorage()
{	
	var localStorageValue = localStorage.getItem("RelatedToCallValue_"+CallSessionID);			
	if(localStorageValue != null)
	{
		var jsonString = '[' + localStorageValue + ']';
		var obj = JSON.parse(jsonString);		
		$.each(obj, function(key,value) 
		{			
			localStorage.removeItem('RelatedToCallValue_'+value.Data+"_"+CallSessionID);
		} );	
		localStorage.removeItem('RelatedToValues_'+CallSessionID);					
	}		
}

//This method is used to fill the Drop down list with the values from Local Storage
function AppendRelatedTo()
{
	$('#ddl_RelatedToPopUp').empty();
	$('#ddl_RelatedToPopUp').append('<option value="Select">Select Related To...</option>');
	
	debugLog('CurrentContact## ' + CurrentContact);
	debugLog('LocalStorage## ' + "RelatedToCallValue_"+CurrentContact+"_"+CallSessionID);
	var MergeItem = localStorage.getItem("RelatedToCallValue_"+CurrentContact+"_"+CallSessionID);
	debugLog('MergeItem## ' + MergeItem);
	//Shumaila CRM Sync v2 JIRA Issue SFC-145
	var doAppend = true;
	if(document.getElementById('divSearchRecord').style.display == 'block' && document.getElementById('txtSearchRecord').value == '')
		doAppend = false;
		
	if (MergeItem != null && doAppend)
	{
		var jsonString = '[' + MergeItem + ']';								
		var obj = JSON.parse(jsonString);
		debugLog('jsonString## ' + jsonString);		
		$.each(obj, function(key,value) 
		{
			debugLog('value.ObjectID## ' + value.ObjectID + ' : value.ObjectName '+ value.ObjectName);		
			$('#ddl_RelatedToPopUp').append('<option value="'+value.ObjectID+'">'+value.ObjectName+'</option>');					
		} );
	}
		
}
//Shumaila JIRA SFC-2
function GetDropDownValues()
{
	var dropDownValues = JSON.parse(sDropDownRecord);
	debugLog('dropDownValues## '+ dropDownValues);
	selCat = dropDownValues.Category;
	document.getElementById('pg:frm:lstCat').value = dropDownValues.Category;	
	$('#ddl_RelatedToPopUp').val(dropDownValues.RelatedTo);		

	//JIRA Issue SFC-223*********
	if(IsJSONEnable)
	{
		JSONCallDetailsEnable(); 
		Detailcust1 = dropDownValues.Cust1DropDown;
		document.getElementById('pg:frm:lsDetailcust1').value = dropDownValues.Cust1DropDown;
		Detailcust2 = dropDownValues.Cust2DropDown;
		document.getElementById('pg:frm:lsDetailcust2').value = dropDownValues.Cust2DropDown;
	}	
	//***************************	
}
 //Shumaila JIRA SFC-18
 //Shumaila CRM Sync v2
function LoadNewRecordValues()
{
	debugLog('sNewCallRecord:: '+ sNewCallRecord);
	
	var newRecord = JSON.parse(sNewCallRecord);			
	document.getElementById('divSelectContact').style.display = 'block';
	debugLog('lstContactType:: '+ newRecord.SelectValue.toLowerCase());
	document.getElementById('lstContactType').value = newRecord.SelectValue;
	
	document.getElementById('divSearchRecord').style.display = 'block';
	document.getElementById("txtSearchRecord").value = newRecord.SelectRecordName;
	document.getElementById("hiddenSelectId").value = newRecord.SelectedRecordId;
	//Shumaila RelatedTo Free
	IsRelatedToObject = false;
	IsInLookupEntities(newRecord.SelectValue); 
	
	if(IsRelatedToObject)
	{
		document.getElementById('divRelatedToPopUp').style.display = 'block';
		CurrentContact = newRecord.SelectedRecordId != ''?newRecord.SelectedRecordId:'defualt';//Shumaila CRM Sync v2 JIRA Issue SFC-103
		//JIRA Issue SFC-219
		if(FromConference)
		{
			ConferenceCount = "0"; 
			ConferenceRelatedToCount = "0"
			ConferenceRelatedToIDs = '';
			SetConferenceRelatedTo(sessionId);
		}			
		else
			AppendRelatedTo();	
		if(newRecord.SelectValue.toLowerCase() == 'contact')			
			document.getElementById('cmdSaveNote_Case').style.display = 'block'; //Shumaila For add new Case
	}
	else
	{
		document.getElementById('cmdSaveNote_Case').style.display = 'none'; //Shumaila For add new Case
		document.getElementById('divRelatedToPopUp').style.display = 'none';
	}	
	
}

//Shumaila RelatedTo Free
function IsInLookupEntities(SearchObject)
{				
	if(SearchObject != undefined && SearchObject != '')
	{
		if(lstLookupEntities != '')
		{
			var obj = JSON.parse(lstLookupEntities);
			
			$.each(obj, function(key,value) 
			{		
				debugLog('lstLookupEntities$$ '+value.Name);
				if(value.Name.toLowerCase() == SearchObject.toLowerCase())
				{
					IsRelatedToObject = true;			
				}								
			});		
		}
		else if(SearchObject.toLowerCase() == 'contact')
		{
			IsRelatedToObject = true;
		}
	}	
}

//JIRA Issue SFC-182
function AdjustSpecialCharacters(Value)
{
	return Value.replace(/\\/g, "&bsol;").replace(/</g, "&#60;").replace(/>/g, "&#62;").replace(/'/g, "&#39;").replace(/"/g, "&quot;").replace(/:/g, "&#58;").replace(/,/g, "&#44;").replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\t/g, "\\t");
}

function DecodeSpecialCharacters(Value)
{
	return Value.replace(/&bsol;/g,'\\').replace(/&#60;/g,'<').replace(/&#62;/g,'>').replace(/&#39;/g,'\'').replace(/&quot;/g,'"').replace(/&#58;/g,':').replace(/&#44;/g,',').replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g,'&').replace(/&#34;/g,'"').replace(/\\n/g, "\n").replace(/\\r/g, "\r").replace(/\\t/g, "\t");  
}

function SetHiddenValue(val)
{
	 //JIRA Issue SFC-158
	if(val != null)
	{			
		if(val.oldvalue != undefined && document.getElementById('hiddenSelectId').value.trim() !='' && val.value != val.oldvalue)
		{
			document.getElementById('hiddenSelectId').value = '';				
		}
			
	}
}
//JIRA Issue SFC-219
function getRelatedTo(val)
{	
	$('#ddl_RelatedToPopUp').empty();
	$('#ddl_RelatedToPopUp').append('<option value="Select">Select Related To...</option>');
	
	if( document.getElementById('hiddenSelectId').value != '')
	{
		if(FromConference)
		{
			ConferenceCount = "0"; 
			ConferenceRelatedToCount = "0"
			ConferenceRelatedToIDs = '';
			SetConferenceRelatedTo(sessionId);
		}
		else
			AppendRelatedTo();
	}	
}

function SetConferenceRelatedTo(sessionId)
{	
	var ConferenceValue = localStorage.getItem("ConferenceRelatedTo_"+sessionId);
	
	if(ConferenceValue != null)
	{
		var MainValue = JSON.parse('['+ConferenceValue+']');
		if(ConferenceRelatedToCount < MainValue.length)
		{
			var selRecord = getSelectedRecord();
			var	sRecordType = selRecord[1];
			var RecordId = selRecord[0];
			$.each(MainValue, function(key,value) 
			{
				debugLog(value.ObjectName + " @@@:: "+ value.ObjectID);	
				if(ConferenceCount == ConferenceRelatedToCount && ConferenceRelatedToIDs.indexOf(value.ObjectID) == -1)
				{
					ConferenceRelatedToCount++;
					ConferenceRelatedToIDs += value.ObjectID+',';					
					var ObjectValueFromConference = value.ObjectName.split(':');					
					ObjectName = ObjectValueFromConference[0].trim();
					ObjectValue =  ObjectValueFromConference[1].trim();
					ObjectID = value.ObjectID
					
					IsRelatedToObject = false;
					IsInLookupEntities(sRecordType);
					
					if(IsRelatedToObject)
					{
						callLastSession = sessionId;
						if (ObjectName != sRecordType)
						{
							var JSonParam = '{"ObjectName":"'+ObjectName+'","ObjectID":"'+ObjectID+'","SelectObject":"'+sRecordType+'","SelectObjectID":"'+RecordId+'"}';
							debugLog('JSonfromRelatedTo## '+ JSonParam );
							
							synety.AgentPanelController.GetRelatedTo_remote(JSonParam, 
										GetRelatedToCallBack, 
										{escape: false} );
						}
					}						
					else
						ConferenceCount++;
				}				
			} );
		}				
	}
}

function GetReltedToSelected()
{
	var ListValue = $('#ddl_RelatedToPopUp').children("option").text();
	//JIRA Issue SFC-190
	if(ListValue.indexOf('Select') == -1)
	{
		var x = document.getElementById("ddl_RelatedToPopUp");
		var option = document.createElement("option");
		option.text = "Select Related to...";
		option.value = "Select"
		x.add(option, x[0]);
	}
}

//If the response is true, that means the object is related to select object then fill the list value in LocalStorage 
//in order to fill the Drop down with the values.
var ReturnedValue = '';
function GetRelatedToCallBack(result, event)
{	
	if (event.status || lstRelationshipEntities != '') 
	{
		if (result != '' || lstRelationshipEntities != '') //Shumaila CRM Sync v2
		{
			ReturnedValue = ''; //JIRA Issue SFC-205	
			if(lstRelationshipEntities != '')
			{
				//Shumaila CRM Sync v2 JIRA Issue SFC-145
				var DoSearch = true;
				if(document.getElementById('divSearchRecord').style.display == 'block' && document.getElementById('txtSearchRecord').value == '')
					DoSearch = false;
					
				if(DoSearch)
				{
					//Shumaila CRM Sync v2 JIRA Issue SFC-152
					var selRecord = getSelectedRecord();
					var	sRecordType = selRecord[1];				
					
					if(sRecordType.toLowerCase() == 'campaignmember')
					{
						if(result != '')
						{
							var TempVal = JSON.parse(result);
							ObjectName = sRecordType.toLowerCase() == 'campaignmember'?'Campaign':TempVal.ObjectName;
							ObjectID = TempVal.ID;
							ObjectValue = TempVal.Name;//JIRA Issue SFC-182
						}
					}
									
					//*****************************
					var obj = JSON.parse(lstRelationshipEntities);			
					$.each(obj, function(key,value) 
					{		
						debugLog('lstRelationshipEntities$$ '+value.Name);
						if(value.Name.toLowerCase() == ObjectName.toLowerCase() 
							&& (sRecordType.toLowerCase() != value.Name.toLowerCase()) 
							&& sRecordType != '' //Shumaila CRM Sync v2 JIRA Issue SFC-152
							) //Shumaial To avoid Lead if the Task is destination for notes
						{
							if(lstLookupEntities == '' && value.Name.toLowerCase() == 'lead')
								debugLog('Lead record for Standard funcitonlity');
							else
								ReturnedValue = '{"Name":"'+ObjectValue+'","ID":"'+ObjectID+'"}';					
						}								
					});		
				}			   
			}
			else 	
			 ReturnedValue = result;
				
			if(result == '' && ReturnedValue == '')
				ReturnedValue = result;
				
			if(ReturnedValue != null && ReturnedValue != '')
			{	
				synety.AgentPanelController.getObjectLabel_remote(ObjectName, 
											getObjectLabelCallBack, 
											{escape: false} );
			}//Shumaila CRM Sync v2 Conference RelatedTo
			else 
			{
				ConferenceCount++;
				SetConferenceRelatedTo(sessionId);			
			}
			
			//Shumaila CRM Sync v2 JIRA Issue SFC-84/61
			GetDropDownValues();		
		}
		else
		{
			debugLog('ErrorInRelatedTo: '+response.error);
			//Shumaila CRM Sync v2 JIRA Issue SFC-61
			if(document.getElementById('divRelatedToPopUp').style.display == 'block')
			{
				AppendRelatedTo();
				GetDropDownValues();
			}
				
			//Shumaila CRM Sync v2 Conference RelatedTo		
			ConferenceCount++;
			SetConferenceRelatedTo(sessionId);	
		}
	}
	else
	{
		debugLog('GetRelatedToCallBack exception: '+event.message);
		//Shumaila CRM Sync v2 JIRA Issue SFC-61
		if(document.getElementById('divRelatedToPopUp').style.display == 'block')
		{
			AppendRelatedTo();
			GetDropDownValues();
		}
		//Shumaila CRM Sync v2 Conference RelatedTo		
		ConferenceCount++;
		SetConferenceRelatedTo(sessionId);	
	}  
}

function getObjectLabelCallBack(result, event)
{
	if (event.status) 
	{
		if(result != '')
		{
			var jsonItem = '';
			//Shumaila Fro Related to - Add value from comapiagnMember	
			var returnValue = JSON.parse(ReturnedValue);//Shumaila CRM Sync v2
			if(ObjectName.toLowerCase() == 'campaignmember')
			{
				ObjectName = 'Campaign';
				ObjectID = returnValue.ID;
			}
		
			var value = localStorage.getItem("RelatedToCallValue_"+CurrentContact+"_"+callLastSession);
			debugLog('RelatedToCallValue## '+ value );
			
			var ObjectNameVal = result  + ' : ' + AdjustSpecialCharacters(returnValue.Name);//JIRA Issue SFC-182
			//Shumaila CRM Sync v2 JIRA Issue SFC-66			
			debugLog('responseValue#### '+ ObjectNameVal);		
			
			//*************************
			
			item = {}
			item ["ObjectName"] = ObjectNameVal;
			item ["ObjectID"] = ObjectID;
			
			jsonItem = JSON.stringify(item);			
			//If the local storage got the value the create nested JSon
			var MergeItem ;
			if(value == null){MergeItem = jsonItem;} 
			else 
			{		
				//Remove the multiples values in Local Storage
				//JIRA issue SFC-14			
				if(value.indexOf(ObjectID) == -1) 
				{MergeItem = value +','+ jsonItem;}
				else if(value.indexOf(ObjectID) > -1 )			
				{
					var isMatched = false;
					var MainValue = JSON.parse('['+value+']');			
					$.each(MainValue, function(key,value) 
					{
						if(value.ObjectName == ObjectNameVal)
							isMatched = true;
						debugLog(value.ObjectName + " @@@:: "+ value.ObjectID);
					} );
					if(isMatched)
						MergeItem = value;
					else					
						MergeItem = jsonItem;
				}
			}			
			localStorage.setItem("RelatedToCallValue_"+CurrentContact+"_"+callLastSession,MergeItem);	
			
			debugLog('localStorageGet## '+localStorage.getItem("RelatedToCallValue_"+CurrentContact+"_"+callLastSession));
			//For the multiple CLI the data should be specific and all data from local storage should be removed when the call is refresh
			//For this we need to manage all CLI. For this Save the CLI values in temp Local Storage.
			var localStrorageVal = localStorage.getItem("RelatedToCallValue_"+callLastSession);
			debugLog('localStrorageVal$$ '+ localStrorageVal);
			var LocalStoage;
			if(localStrorageVal == null)
			{LocalStoage = '{"Data":"'+CurrentContact+'"}';}
			else
			{ 
				//Remove the multiples values in Local Storage
				if(localStrorageVal.indexOf(CurrentContact) == -1)
				{LocalStoage = localStrorageVal + ',{"Data":"'+CurrentContact+'"}';}
				else
				{LocalStoage = localStrorageVal;}
			}
			
			localStorage.setItem("RelatedToCallValue_"+callLastSession,LocalStoage);
			debugLog('localStorageVal$$ '+ localStorage.getItem("RelatedToCallValue_"+callLastSession));
			
			AppendRelatedTo();
			//Shumaila CRM Sync v2 JIRA Issue SFC-84/61
			GetDropDownValues();
			
			//Shumaila CRM Sync v2 Conference RelatedTo
			ConferenceCount++;
			SetConferenceRelatedTo(sessionId);
			
			//*****************************		
		}
		else
		{
			ConferenceCount++;
			SetConferenceRelatedTo(sessionId);		
		}
	}
	else
	{
		ConferenceCount++;
		SetConferenceRelatedTo(sessionId);		
	}	
} 

//JIRA Issue SFC-177
function GetNumber(Number)
{
	Number = Number.replace(/<[^>]*>/g, "").trim();
	var Multiple = Number.split('+');
	if(Multiple.length >1)
	{
		var numb = '';
		for (i = 0; i < Multiple.length; i++) 
		{
			numb = Multiple[i]
        }
		return '+'+numb
	}
	else
		return Number
}
//**************************
//JIRA Issue SFC-219***********************************


//JIRA Issue SFC-223**********************************
function JSONCallDetailsEnable()
{
	if(IsDetailNotesEnable)
		document.getElementById('divtxtNote').style.display = "block";
	else
		document.getElementById('divtxtNote').style.display = "none";
		
	if(IsDetailCategoryEnable)
		document.getElementById('divlstCat').style.display = "block";
	else
		document.getElementById('divlstCat').style.display = "none";
	
	if(IsDetailSubjectEnable)
		document.getElementById('divCallSubject').style.display = "block";
	else
		document.getElementById('divCallSubject').style.display = "none";
		
	if(IsDetailCust1Enable)
	{
		document.getElementById('divDetailCust1').style.display = "block";
		//document.getElementById('divDetailCust1label').innerHTML = Detailcust1Label;
		
		document.getElementById('divDetailCust1DropDown').style.display = "none";
		document.getElementById('divDetailCust1SingleText').style.display = "none";
		document.getElementById('divDetailCust1MultiText').style.display = "none";

		if(DetailCust1Type.toLowerCase() == 'singletext')
			document.getElementById('divDetailCust1SingleText').style.display = "block";					
		else if(DetailCust1Type.toLowerCase() == 'multitext')
			document.getElementById('divDetailCust1MultiText').style.display = "block";
		else if(DetailCust1Type.toLowerCase() == 'dropdown')
			document.getElementById('divDetailCust1DropDown').style.display = "block";					
	}		
	else
		document.getElementById('divDetailCust1').style.display = "none";
		
	if(IsDetailCust2Enable)
	{
		document.getElementById('divDetailCust2').style.display = "block";
		//document.getElementById('divDetailCust2label').innerHTML = Detailcust2Label;
		
		document.getElementById('divDetailCust2DropDown').style.display = "none";
		document.getElementById('divDetailCust2SingleText').style.display = "none";
		document.getElementById('divDetailCust2MultiText').style.display = "none";
		
		if(DetailCust2Type.toLowerCase() == 'singletext')
			document.getElementById('divDetailCust2SingleText').style.display = "block";
		else if(DetailCust2Type.toLowerCase() == 'multitext')
			document.getElementById('divDetailCust2MultiText').style.display = "block";
		else if(DetailCust2Type.toLowerCase() == 'dropdown')
			document.getElementById('divDetailCust2DropDown').style.display = "block";
	}		
	else
		document.getElementById('divDetailCust2').style.display = "none";
}


//JIRA Issue SFC-223**********************************

function info_pop_fail(msg) 
{

	$("#info_pop_box").removeAttr("class");
	$("#info_pop_box").html(msg).addClass("info_pop_red").fadeIn("slow");
	
	setTimeout(function(){
		$("#info_pop_box").fadeOut("slow");
	}, 10000);
	
}
		
		