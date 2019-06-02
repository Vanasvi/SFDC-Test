.start-timeremain-div {
    width: 100%;
    text-align: center;
    color: #247ece;
    font-size: 20px;
    font-weight: 600;
}
.start-timeremain-div-off {
	style=display:none;
}
.start-timerheding-div {
	width: 100%;
	margin-top: -1%;
	text-align: center;
	color: #797979;
	font-size: 20px;
	font-weight: bold;
	padding: 5px;
}
.del-all-btn {
    color: #fff !important;
    text-decoration: none!important;
    display: inline;
    background: #e88712;
    padding: 5px 10px 3px 2px;
    font-size: 12px;
    font-weight: 600;
    float: right;
    margin-right: 49px;
    position: absolute;
    right: 0px;
}

.tabs-button li {
    float: left;
    list-style: none;
    margin-left: 2px;
    background: #1797c0;
    padding: 7px 15px;
    min-width: 120px;
    text-align: center;
    font-size: 14px;
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
}

.tabs-button{
    margin:0;
    padding:0;
}

.tabs-button a {
    color: #fff !important;
    font-weight: 600;
    display: block;
    text-decoration:none !important;
}
.del-all-btn:hover{
    background:#1797c0;
}

.table-btns{
    font-weight: bold;
    /* background: #1797c0; */
    text-decoration: none !important;
    color: #fff !important;
    padding: 4px 8px 4px 7px;
    font-size: 12px;
    float: left;
	border-radius: 2px;
}

.table-btns-on{
    background: rgb(34, 230, 34);
}

.table-btns-off{
    background: #1797c0;
}

.table-btns:hover{
    background:#e88712;
}
.table-btns-on:hover{
    background:#e88712;
}
.table-btns-off:hover{
    background:#e88712;
}

    .recordTable{
        background: #1797c0;
    }
    
    .recordTable tbody{
        display:block;
        max-height:350px;
        overflow:auto;
        line-height:0;
        overflow-x:hidden;
    }
    
    .recordTable thead, tbody tr{
        display:table;
        width:100%;
        table-layout:fixed; 
    }
    
    .recordTable thead{
        width:100%;
       /* width: calc(100% - 1.5em); */
    }
    
    .recordTable th{
        background: #1797c0;
        color: #fff;
        padding: 5px 5px 5px 5px;
        font-size: 12px;
        white-space: pre-wrap;
        overflow-wrap: break-word;
    }
    
    .recordTable tbody tr{
        height: 38px;
        font-size: 12px;
    }
    
    .recordTable tbody tr:nth-child(odd) {
        background: #fafafa;
    }
    
    .recordTable tbody tr:nth-child(even) {
        background: #f0f0f0;
    }
    
    .recordTable td{
        white-space: pre-wrap;
        overflow-wrap: break-word;
        padding: 5px 5px 5px 5px;
    }
    
    .popup-heading{
            background: #7c7c7c;
            color: #fff;
            font-size: 17px;
            text-transform: uppercase;
            text-align: center;
        }
        
        .config-panel-monthly{
            height: auto;
            display: block;
            text-align: center;
            margin-top: 2%;
        }
        
        .config-panel-monthly input{
            width: 8%;
            padding: 2px 4px 2px 4px;
            margin-left: 1%;
            color: #636363;
            margin-right: 1%;
            font-size: 14px;
        }
        
        .config-panel-monthly span{
			color: #7c7c7c;
			font-size: 13px;
			font-weight: 600;
			text-transform: uppercase;
        }
        
        .sch-btns{
            background: #7c7c7c;
            color: #fff !important;
            text-decoration: none !important;
            padding: 10px;
            text-transform: uppercase;
            font-size: 11px;
            min-width: 102px;
            font-weight: 600;
        }
        
        .sch-btns:hover{
            background: #f7941d;
        }
        
        .start-time-div{
			width: 100%;
			margin-top: 4%;
			text-align: center;
			padding-bottom: 11px;
        }
        
        .start-time-div span{
            color: #7c7c7c;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
        }
        
        .start-time-div select{
            padding: 3px;
            margin-left: 3%;
            color: #7c7c7c;
            font-size: 14px;
        }
        
        .bottom-div{
            margin-top: 2%;
            border-top: solid #f2f2f2;
            width: 100%;
            text-align: center;
            float: left;
            padding-bottom: 10px;
            padding-top: 10px; 
        }
        .popup {
            /*
			position: absolute;
            display: block;
            left: 30%;
            width: 35%;
            height: 278px;
            background-color: #ffffff;
            padding: 0;
            border-radius: 5px;
            bottom: 4%;
            display: none;
            z-index: 999999; */
			position: absolute;
			display: block;
			left: 30%;
			width: 35%;
			height: 278px;
			background-color: #ffffff;
			padding: 0;
			border-radius: 5px;
			display: none;
			z-index: 999999;
			top: 4%;
			position: fixed;
			}
        .popup-header{
            width: 100%;
            height: 20%;
            background: #7c7c7c;
            text-align: center;
            color: #fff;
            font-size: 17px;
            text-transform: uppercase;
            padding: 13px;
            font-weight: 600;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
        }
        
        .popup-content{
            height: auto;
            width: 100%;
            font-size: 14px;
            font-weight: 600;
            color: #7c7c7c;
        }
        
        .popup-content div{
            height: 50%;
            padding: 10px 15px 0px 15px;
            text-transform: uppercase;
        }
        
        .popup-footer{
            width: 100%;
            height: 20%;
            background: #ffffff;
            padding: 13px;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
            text-align: center;
            border-top: 1px solid #e5e5e5;
        }
        
        .popup-footer a{
            text-decoration: none!important;
            background: #7c7c7c;
            color: #fff !important;
            padding: 8px 23px;
			font-size: 14px;
        }
        
        .popup-footer a:hover{
            background: #f7941d;
        }
        
        .overlay {
            position:fixed;
            display:none; 
            background-color: rgba(0, 0, 0, 0.7); /* 0.7 = 70% opacity */
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: 9999;
        }
        
        .error-edit-popup{
            font-size: 11px;
            display: none;
            position: absolute;
            text-transform: none !important;
            color: orangered;
            border-radius: 5px;
            padding: 0px !important;
            top: 75px;
            right: 26px;
        }
        
        .input-error{
            border: solid red;
        }
        
        .error-sch-popup{
            text-align: center;
			color: red;
			padding: 0px 2px 0px 21px;
			font-size: 14px;
			width: 100%;
        }
		.scheduler-notify{
			background: #f7941d;
			margin-top: 14px;
			width: 80%;
			margin-left: 12%;
			padding: 4px;
			font-size: 14px;
			text-align: center;
			border-radius: 5px;
			color: #fff;
			font-weight: 600;
			margin-bottom: -22px;
			display: none;
		