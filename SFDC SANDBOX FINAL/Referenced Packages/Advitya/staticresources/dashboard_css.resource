    body{
        margin: 5px;
    }
    
    .auditDiv{
        background: #fff;
        width: 32.333333%; 
        padding-left:0 !important;
        margin-left: 13px;
    }
   
    .auditTable{
        width: 100%;
    }
    .auditTable table{
        width: 100%;
        position: relative;
        overflow-y: scroll;
        overflow-x: hidden;
    }
    .auditTable thead {
        background: #1797c0;
        color: #fff;
    }
    .auditTable th {
        text-align: left;
        padding: 8px;
        font-size: 14px;
        font-weight: 500;
    }
    .auditTable  td{
        color: #666;
        font-size: 12px;
        font-weight: 400;
        text-align: left;
        padding: 5px 5px 5px 10px;
		white-space: nowrap;
    }
    .auditTable  tr:nth-child(odd) {
        background: #fafafa;
    }
    
    .auditTable  tr:nth-child(even) {
        background: #f0f0f0;
    }
   
    .auditHeaderDiv {
        background: #7c7c7c;
        width: 100%;
        font-size: 13px;
        font-weight: 600;
        color: white;
        padding: 8px;
        text-transform: uppercase;
        text-align: left;
        border-bottom: solid 1px #fff;
    }
    
    .tableDiv{
        overflow-y: scroll;
		margin-bottom: 1px;
		overflow-x: hidden;
		max-height: 450px;
		overflow: auto;
		height: 450px;
    }
    
    .popuptext{
        font-size: 12px;
        color: white;
        font-weight: 200;
    }
    
    .popupfields{
        float: left;
        font-weight: 600;
        margin-right: 10px;
        margin-left: 10px;
        min-width: 95px;
        text-align: left;   
    }
    
    .popupvalues{
        float: left;
        width: 190px;
		word-wrap: break-word;
    }
    
    .filterDiv{
        background: #549cdc;
        margin-left: 83.5%;
        position: absolute;
        width: 16%;
        height: 223px;
        margin-top: -38%;
    }
    
    .filterHeader{
        height: 7%;
        font-size: 16px;
        padding-top: 11px;
        color: white;
        border-bottom: solid;
        font-weight: 700;
        padding-bottom: 8px;
        text-align: center;
    }
    
    .searchFilterWrapper {
        position: relative;
    }
    .searchFilter {
        width: 42%;
        background: #eff0f2;
        padding: 5px;
        border: solid 1px #f7941d;
        font-size: 14px;
        color: #949494;
        position: relative;
        outline: none;
		padding-right: 38px !important;
    }
        
    .searchList{
        width: 42%;
        font-size: 14px;
        background: #eff0f2;
        height: auto;
        overflow: hidden;
        display: none; 
        position: absolute;
        z-index: 9999;
        margin-left: 0!important;
        padding-left: 0px!important;
        margin-right: 0!important;
    }
    
    .searchList li {
        margin: 0;
        list-style: none;
        display: inline-block;
        width: 100%;
        padding: 6px;
        color: #666;
    }
    .searchList li:hover{
        background: #1797c0;
        color: #fff;
    }
    .searchListChild{
        list-style: none;    
    }
    
    .runButton{
		font-size: 12px;
		background: #7c7c7c;
		text-decoration: none !important;
		font-weight: bold;
		padding: 7.5px;
		text-align: center;
		text-transform: uppercase;
		position: absolute;
		color: #fff!important;
    }
    
    .runButton:hover{
        background: #f7941d;
        text-decoration: none !important;
        color: #fff!important;
    }
        
    .tab{
        width: 56px;
        position: fixed;
        top: 51px;
        height: 29px;
        font-size: 16px;
        background: azure;
        border: none;
        border-top: solid;
    }
    
    .healthDiv{
        padding-left: 0;
        width: 65.666667%;
    }
    
    .usersTable{
        background: #f1f1f1;
        width: 97%;
        margin-left: 11px;
        font-size:13px;
    }
    .audit-popup{
        background: #f7941d;
        width: 24%;
        min-height: 100px;
        position: absolute;
        color: #ffffff;
        border: none;
        z-index: 999999;
        height: auto;
        padding: 5px;
        top: 12.5%;
        left: 32.2%;
        display:none;
    }
    .tabs-button li {
        float: left;
        list-style: none;
        margin-left: 2px;
        background: #eff0f2;
        padding: 15px 38px;
        min-width: 120px;
        text-align: center;
        font-size: 11px;
        text-transform: uppercase;
    }

    .tabs-button li a{
        color:#666;
        font-weight: 600;
        display: block;
        text-decoration:none !important;
    }

    .tabs-button{
        margin:0;
        padding:0;
        margin-top: 3.2%;
    }
   
    .usersTable-body-div{
        width: 96.8%;
        border-top: solid 1px silver;
        overflow-x: hidden;
        overflow-y: scroll;
        margin-left: 11px;
        background: #fff;
        margin-bottom: 10px;
        height: 271px;
    }
    .record-div-title{
        color: white;
        font-weight: bold;
        text-align: center;
        margin-left: 47%;
        font-size: 16px;
        top: 3px;
    }
    .audit-table-header{
        width: 100%;
    }
    .audit-table-header th{
        text-align: left;
        background: #1797c0;
        color: #fff;
        padding: 5px 5px 5px 10px;
        font-size:12px;
    }
    .show-more-btn{
        background: #666;
        display: block;
        padding: 10px;
        color: #fff;
        text-align: center;
        font-size: 12px;
        text-transform: uppercase;
        font-weight: 600;
    }
    .show-more-btn:hover{
        background: #f7941d;
        color: #fff;
        text-decoration: none!important;
    }
    .popup-header{
        display: block;
        font-size: 13px;
        padding: 3px 1px;
        border-bottom: solid 1px #fff;
        margin-bottom: 5px;
        font-weight: 600;
    }
    .recordTable{
        background: #1797c0;
    }
    
    .recordTable tbody{
        display:block;
        height:150px;
        overflow:auto;
    }
    
    .recordTable thead, tbody tr{
        display:table;
        width:100%;
        table-layout:fixed; 
    }
    
    .recordTable thead{
        width:100%;
        width: calc(100% - 1.5em);
    }
    
    .recordTable th{
        background: #1797c0;
        color: #fff;
        padding: 5px 0px 5px 3px;
        font-size: 12px;
        white-space: pre-wrap;
        overflow-wrap: break-word;
    }
    
    .recordTable tbody tr{
        height: 26px;
        font-size: 12px;
    }
    
    .recordTable tbody tr:nth-child(odd) {
        background: #fafafa;
    }
    
    .recordTable tbody tr:nth-child(even) {
        background: #f0f0f0;
    }
    
    .recordTable td{
        white-space: nowrap;
        overflow: hidden;
        padding: 5px 0px 5px 3px;
		text-overflow: ellipsis;
    }
    .table-btn {
        text-decoration: none !important;
		font-size: 9px;
		background: #1696bf;
		padding: 5px 4px;
		color: white;
		font-weight: 600;
		border-radius: 3px;
		box-shadow: 1px 2px 1px #999;
		letter-spacing: 1px;
		min-width: 51px;
		float: right;
		text-align: center;
		text-transform: uppercase;
		margin-right: 9px;
    }
    .table-btn:hover{
        text-decoration: none !important;
        background: #f7941d;
        color: #fff;
    }
	
	.db-error{
		float: right;
		font-size: 14px;
		font-weight: 600;
		color: red;
		width: 54%;
	}
	
	.popupBg{
		/*background-color: #e8e8e8; */
		background-color: #fff;
		/*opacity: 0.8; */
		opacity: 0.96;
		filter: alpha(opacity = 10);
		position: absolute;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		z-index: 9;
		overflow: hidden;
    }
	
	.div-wrap{
        background: #f0f0f0;
        border: solid 1px #f2f3f3;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        border-top: solid #1797bf;
        margin-top: 3px;
        padding-left: 17px !important;
        width: 66%;
        padding-right: 0!important;
        position: absolute;
        bottom: 12px;
        left: 33%;
        padding-top: 9px;
        padding-bottom: 9px;
    }
    
	.inner-value-wrap{
        float: left;
        width: 49%;
        padding: 6px;
    }
    
	.div-label{
        display: block;
        font-weight: 600;
        text-transform: uppercase;
        color: #7c7c7c; 
		font-size: 14px;
    }
    
	.value{
        float: left;
        text-overflow: ellipsis;
        overflow: hidden;
        width: 100%;
        white-space: nowrap;
        background: #99a5ab;
        padding: 8px;
        border-radius: 2px;
		font-size: 14px;
    }  
    
	.value a{
        text-decoration: none!important;
        color: #fff !important;
    }  
    
	.page-size{
        height: 21px;
        font-size: 12px !important;
        border-radius: 3px;
    }
    
	.view-records-button{
        font-size: 12px;
        background: #7c7c7c;
        text-decoration: none !important;
        font-weight: 600;
        padding: 11px 16px;
        text-align: center;
        color: #fff!important;
        border-radius: 2px;
        line-height: 23px;
    }
            
    
    .view-records-button:hover{
        background: #f7941d;
        text-decoration: none !important;
        color: #fff!important;
    } 
	
	.more-records-notify{
		position: absolute;
		display: none;
		z-index: 9;
		background: #f7941d;
		width: 74%;
		text-align: center;
		padding: 16px;
		font-size: 14px;
		font-weight: 600;
		color: #fff;
		border-radius: 3px;
		left: 15%;
		top: 7px;
	}