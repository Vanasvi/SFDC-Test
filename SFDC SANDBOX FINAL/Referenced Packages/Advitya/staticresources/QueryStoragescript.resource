var queryToSchedule='';
var checkedSearches='';
var delAll=false;
var count=0;
var searchId='';
var oldName='';
var myVar = 0;
var nexttime = '';
var recordid = '';
var result ='';
var checked1='';
var checked2='';
var allcheckedjob='';
var i = 0;
var j = 0;
//var checked;
//alert('myVar old >'+myVar)
//Added By :Urvashi Shahi
//Use : Method call to show countdown timmer in Shedule Popup
function myTimer(nexttime) {
	var nexttime = nexttime;
	var countDownDate1 = new Date(nexttime).getTime();
	
	var now = new Date().getTime();
			
	// Find the distance between now an the count down date
	var distance = countDownDate1 - now;
	//alert('distance >'+distance);
	
	// Time calculations for days, hours, minutes and seconds
	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	var seconds = Math.floor((distance % (1000 * 60)) / 1000);

	if(days<=0 && hours<=0 && minutes<=0 && seconds <=0)
	{
		var msec = 00;
		//alert('days >'+days);
		document.getElementById("clock1").style.display = "inline";
		document.getElementById("TimeLeft").style.display = "inline";
		document.getElementById("clock1").innerHTML = days + " : " +hours + " : "+ minutes + " : "+msec+" ";
		setSheduletime();
		settingtIME(recordid);
	}
	else if(days>0 || hours>0 || minutes>0 || seconds>0  ) {
	if(days<10)
		days="0"+days;
	if(hours<10)
		hours="0"+hours;
	if(minutes<10)
		minutes="0"+minutes;
	if(seconds<10)
		seconds="0"+seconds;
	document.getElementById("clock1").innerHTML = days + " : " +hours + " : "+ minutes + " : " +seconds + " ";
	//document.getElementById("clock1").innerHTML = days + " : " +hours + " : "+ minutes + " : " +seconds + " ";
	//document.getElementById("clock2").style.display = "inline";
	//document.getElementById("clock2").innerHTML = "days     hours      mins     secs";
	document.getElementById("clock1").style.display = "inline";
	document.getElementById("TimeLeft").style.display = "inline";
	//document.getElementById("TimeLeft").innerHTML = "Time untill next run";
	$("#timer-labels").show();
	$(".start-timerheding-div").show();
	}
}

function myStopFunction() {
	//alert('myVar new >'+myVar)
    clearInterval(myVar);
}

function settingtIME(id){
	//alert('hello Job name : '+id );
	recordid = id;
	var noofrecord = 0;
	var query="select name,advitya__Next_Schedule_Run_time__c from advitya__QueryStorage__c Where Name = '"+id+"' and advitya__JobID__c != null and advitya__Next_Schedule_Run_time__c != Null ";
	var qr = sforce.connection.query(query);
	records = qr.getArray("records");
	noofrecord = records.length;
	previousnexttime = '';
	document.getElementById("clock1").style.display = "none";
	document.getElementById("clock1").innerHTML = '';
	//document.getElementById("TimeLeft").innerHTML = '';
	document.getElementById("TimeLeft").style.display = "none";
	//document.getElementById("clock2").innerHTML = '';
	//document.getElementById("clock2").style.display = "none";
	$("#timer-labels").hide();
	$(".start-timerheding-div").hide();
	var node = document.getElementById("clock1");
		while (node.hasChildNodes()) {
			node.removeChild(node.firstChild);
		}
		clearInterval(myVar);
	if(noofrecord == 1) {		
		nexttime = records[0].advitya__Next_Schedule_Run_time__c;	
		//Use to show the clock on popup : interval time 1000
		myVar = setInterval(function(){ myTimer(nexttime) }, 1000);		    
	}
	else
	{
		//document.getElementById("TimeLeft").innerHTML = "";
		//For Job which are not Schedule : Stop the timmer first.
		myStopFunction(myVar);
	   document.getElementById("clock1").innerHTML = "Job Not Schedule !!";	   
	}
}
//Finish : Urvashi Code
function allCheck(rid){
    if($(rid).is(":checked")){
        $("#bodyDiv").find("input[type='checkbox']").prop('checked',true);
        delAll=true;
        $("#delButton").css('display','inline-block');
    }
    else{
        $("#bodyDiv").find("input[type='checkbox']").prop('checked',false);
        delAll=false;
        $("#delButton").css('display','none');
    }            
}

function uncheck(){
    $('[id*="selectall"]').prop("checked",false);
    delAll=false;
}

function toggleDelAll(){
    var flg=0;
    $("#bodyDiv").find("input[type='checkbox']").each(function(){
        if($(this).is(':checked'))
            flg=1;
    });
    if(flg==1)
        $("#delButton").css('display','inline-block');
    else
        $("#delButton").css('display','none');
}

function saveChecked(cid){
        if($("#"+cid).is(":checked")){
            if(checkedSearches==''){
                checkedSearches=cid;
            }
            else{
                checkedSearches+=','+cid;
            }
        }
        else{
            if(checkedSearches.includes(cid)){
                checkedSearches=checkedSearches.replace(cid,'');
            }
        }
}

function checkDelAll(){
    var flag=0;
    if($('[id*="selectall"]').is(":checked")){
        delAll=true;
    }
    else{
        delAll=false;
    }
    $("#bodyDiv").find("input[type='checkbox']").each(function(){
        if(!($(this).is(":checked"))){
            flag=1;
            return;
        }
    });
    if(flag==0){
        $("[id*='selectall']").prop('checked',true);
    }
    return false;
}

function delSelected(){
    var checked='';
    var allids='';
    var result ='';
    var allShedulejob ='';
    var allNonShedulejob ='';
    
    var delAll=$("[id='selectall']").is(":checked");
    $("#bodyDiv").find("tr").each(function(){
        if($(this).find("input[type='checkbox']").is(':checked')){
            if(checked=='')
            {
                checked=$(this).find("input[type='checkbox']").prop("id");
                var jobid = $(this).find("input[type='checkbox']").prop("id");
                //Added By :Urvashi Shahi
                //Use : Call the method to check which job is shedule or which is non shedule
                var query="select name,advitya__description__c from advitya__QueryStorage__c where id='"+jobid+"' limit 1";
                var qr = sforce.connection.query(query);
                records = qr.getArray("records");
                var queryname=records[0]["Name"];
                if($("[id='"+queryname+"']").css("background-color")=="rgb(34, 230, 34)"){
                    allShedulejob++;
                }
                else{
                    allNonShedulejob++;
                }
                //result = CheckSheduleJob($(this).find("input[type='checkbox']").prop("id"));
            }
            else 
            {
                checked+=","+$(this).find("input[type='checkbox']").prop("id");
                //Added By : Urvashi Shahi
                //Use : Call the method to check which job is shedule or which is non shedule
                var jobid = $(this).find("input[type='checkbox']").prop("id");
                var query="select name,advitya__description__c from advitya__QueryStorage__c where id='"+jobid+"' limit 1";
                var qr = sforce.connection.query(query);
                records = qr.getArray("records");
                var queryname=records[0]["Name"];
                if($("[id='"+queryname+"']").css("background-color")=="rgb(34, 230, 34)"){
                    allShedulejob++;
                }
                else{
                    allNonShedulejob++;
                }
                //result = CheckSheduleJob($(this).find("input[type='checkbox']").prop("id"));
            }
            
        }
        if(allShedulejob !='' && allNonShedulejob !='') {
            allcheckedjob = 'The saved jobs you are trying to delete have one or more scheduled jobs.\n\nAre you sure want to delete ?';
        }
        else if(allShedulejob !='' && allNonShedulejob =='')
        {
            allcheckedjob = 'The saved jobs you are trying to delete have one or more scheduled jobs.\n\nAre you sure want to delete ?';
        }
        else if(allShedulejob =='' && allNonShedulejob !='')
        {
        //allcheckedjob = 'You have Selected Shedule Job.\n Non Shedule Job Name :'+checked2+'.\nAre you sure want to delete ?';
            allcheckedjob = 'Are you sure want to delete the job ?';
        }

    });
    if(window.confirm(allcheckedjob)) {
       
        deleteSelected(delAll,checked);
        $("#delButton").hide();
    }
} 
/*
    //else {
      //  location.reload();
   // }

//Added By : Urvashi Shahi
//Use : Use to show alert to user that which type of job he is selected to delete.
function CheckSheduleJob(id){
     var searchId=id;
    var query="select name,advitya__description__c from advitya__QueryStorage__c where id='"+id+"' limit 1";
    var qr = sforce.connection.query(query);
    $(document).css("opacity",0.4);
    $(document).css("pointer-events","none");
    records = qr.getArray("records");
    var queryname=records[0]["Name"];
    if($("[id='"+queryname+"']").css("background-color")=="rgb(34, 230, 34)"){
        if(checked1=='')
            {
                checked1 = queryname;
                i++;
            }
            else {
                checked1 += ","+queryname;
                i++;
            }
    }
    else{
            if(checked2=='')
            {
                checked2 = queryname;
               j++;
            }
            else {
                checked2 += ","+queryname;
                j++;
            }
    }
   
    if(checked1 !='' && checked2 !='') {
        allcheckedjob = 'You have Selected Shedule and Non Shedule Job.\n\nTotal Number of Shedule Job You have selected : '+ i +'\nTotal Number of Non Shedule Job You have selected : '+ j +'\n\n Are you sure want to delete ?';
    }
    else if(checked1 !='' && checked2 =='')
    {
        allcheckedjob = 'You have Selected Shedule Job.\n\nTotal Number of Shedule Job You have selected : '+ i +'\n\nAre you sure want to delete ?';
    }
    else if(checked1 =='' && checked2 !='')
    {
        //allcheckedjob = 'You have Selected Shedule Job.\n Non Shedule Job Name :'+checked2+'.\nAre you sure want to delete ?';
        allcheckedjob = 'Are you sure want to delete the job ?';
    }
    
    return allcheckedjob;
}
//Finish : Finsh Urvashi Code
*/
function clearScheduler(){
    $("#hour").val("01");
    $("#minute").val("AM");
    $("#otherDate").val("");
    $("#schedule-btn").css("pointer-events","none");
    $(".modal-body").css("pointer-events","all");
    $("#schedule-btn").css("display","inline");
    $("#abort-btn").css("display","none");
}

function checkStatus(id){
    $(".scheduler-notify").hide();
    $("#otherDate").removeClass("input-error");
    $("#hour").removeClass("input-error");
    $("#minute").removeClass("input-error");
    $(".error-sch-popup").hide();
    var addons='';
    var occ="";
    var cronExp="";
    var query="select name,advitya__cron__c, advitya__addonfields__c, advitya__occurence__c, advitya__jobid__c from advitya__QueryStorage__c";
    var qr = sforce.connection.query(query);
    records = qr.getArray("records");
    clearScheduler();
    if($("[id*='"+id+"']").hasClass("table-btns-on")){
        for(x in records){
            if(id==records[x]["Name"]){
                cronExp=records[x]["advitya__Cron__c"];
                break;
            }
        }
        
        var cronList=cronExp.split(" ");
        if(cronList[2]==0){
            $("#hour").val("12");
            $("#minute").val("AM");
        }
        else if(cronList[2]==12){
            $("#hour").val(12);
            $("#minute").val("PM");
        }
        else if(cronList[2]>11){
            var temp=cronList[2]-12;
            if(temp<10)
                temp="0"+temp;
            $("#hour").val(temp);
            $("#minute").val('PM');
        }
        else{
            var temp=cronList[2];
            if(temp<10)
                temp="0"+temp;
            $("#hour").val(cronList[2]);
            $("#minute").val('AM');
        }
        if(cronList[3]=="L")
            $("#otherDate").val(31);
        else
            $("#otherDate").val(cronList[3]);
        $(".modal-body").css("pointer-events","none");
        
        $("#schedule-btn").css("display","none");
        $("#abort-btn").css("display","inline");
    }
    else{
        for(x in records){
            if(id==records[x]["Name"]){
                addons=records[x]["advitya__addonFields__c"];
                break;
            }
        }
        if(addons!="" && addons!=null)
            $(".scheduler-notify").show();
        clearScheduler();
    }
}

function scheduleJob(queryname){
    var cron="";
    var addonPresent=0;
    var hours=$("#hour").val();
    var minutes=$("#minute").val();
    var date=$("#otherDate").val();
    date=date.replace(" ","");
    if(date==""||isNaN(date)||date<1||date>31){
        $("#otherDate").addClass("input-error");
        $(".error-sch-popup").show();
        $(".error-sch-popup").text("Please enter a valid date to proceed!");
        $("#otherDate").val("");
        return false;
    }
    if(minutes=="PM" && hours!=12)
        hours=parseInt(hours)+12;
    if(parseInt(hours)==12 && minutes=="AM")
        hours="00";
    var query="select name, advitya__cron__c,advitya__addonFields__c, advitya__occurence__c from advitya__QueryStorage__c where advitya__cron__c!=null";
    var qr = sforce.connection.query(query);
    records = qr.getArray("records");
    if(date==31){
        cron="0 00 "+hours+" L * ? *";
    }
    else{
        cron="0 00 "+hours+" "+date+" * ?";
    }
    for(r in records){
        if(records[r]['advitya__Cron__c']==cron){
            $("#otherDate").addClass("input-error");
            $("#hour").addClass("input-error");
            $("#minute").addClass("input-error");
            $(".error-sch-popup").show();
            $(".error-sch-popup").text("Job can't be scheduled. Another job already scheduled at selected date-time!");
            return false;    
        }
    }
    if(queryname.trim()==''||cron=='')
        alert("An unexpected error occurred. Unable to schedule!");
    else
        scheduleMerge(queryname,cron);
		$("#schedule-btn").css("pointer-events","none");    
}
function abortShedulejob(queryjob)
{
	if(queryjob.trim()=='')
		alert("An unexpected error occurred. Unable to schedule!");
	else
		abortMerge(queryjob);
		$("#abort-btn").css("pointer-events","none");
}

function scheduleComplete(){
    alert("Your job has been scheduled successfully!");
    $("[id='"+queryToSchedule+"']").addClass("table-btns-on");
    $("[id='"+queryToSchedule+"']").removeClass("table-btns-off");
    $("[id='"+queryToSchedule+"']").prop("title","Scheduled");
    $("#myModal").modal("hide");   
}

function abortComplete(){
		alert("Your job has been aborted successfully!");
		$("[id='"+queryToSchedule+"']").addClass("table-btns-off");
		$("[id='"+queryToSchedule+"']").removeClass("table-btns-on");
		$("[id='"+queryToSchedule+"']").prop("title","Schedule");
		$("#abort-btn").css("pointer-events","all");
		$("#myModal").modal("hide"); 
		myStopFunction(myVar);
}

function openEditPopup(id){
    searchId=id;
    $(".error-edit-popup").hide();
    $("#query-name").removeClass("input-error");
    var query="select name,advitya__description__c from advitya__QueryStorage__c where id='"+id+"' limit 1";
    var qr = sforce.connection.query(query);
    $(document).css("opacity",0.4);
    $(document).css("pointer-events","none");
    records = qr.getArray("records");
    var queryname=records[0]["Name"];
    if($("[id='"+queryname+"']").css("background-color")=="rgb(34, 230, 34)"){
        alert("Please abort the scheduled query before editing it.");
        return false;
    }
    $("#query-name").val(records[0]["Name"]);
    $("#query-desc").val(records[0]["advitya__Description__c"]);
    $(".popup").slideDown(500);
    $(".overlay").fadeIn(500);
    oldName=records[0]["Name"];
}

function closeEditPopup(){
    $(".popup").slideUp(500);
    $(".overlay").fadeOut();
}

function updateQuery(){
    var newName=$("#query-name").val();
    var newDesc=$("#query-desc").val();
    var duplicate=0;
    if(newName.includes(">")||newName.includes("<")||newDesc.includes(">")||newDesc.includes("<")){
        $(".error-edit-popup").show();
        $(".error-edit-popup").text("Please enter a valid name without any special characters!");
        $("#query-name").addClass('input-error');
        return false;   
    }
    if(newName==""||newName==" "){
        $(".error-edit-popup").show();
        $("#query-name").val("");
        $(".error-edit-popup").text("Please enter a name before saving!");
        $("#query-name").addClass('input-error');
        return false;
    }
    $(".recordTable").find(".qryName").each(function(){
        if(newName==$(this).find("a").text() && newName!=oldName){
            $(".error-edit-popup").show();
            $(".error-edit-popup").text("Another query exists under this name already!");
            $("#query-name").addClass('input-error');
            duplicate=1;
            return false;
        }
    });
    if(duplicate==0)
        updateQueryDetails(searchId,newName,newDesc);
}