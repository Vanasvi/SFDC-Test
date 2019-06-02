@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800);

/*
@font-face {
font-family: 'Roboto';
src: local('Roboto'), local('Roboto-Regular'), url(/resource/Roboto/Roboto-Regular.woff2) format('woff2'),
url(/resource/Roboto/Roboto-Regular.ttf) format('ttf');
}
@font-face {
font-family: 'Roboto-Bold';
src: local('Roboto'), local('Roboto-Bold'), url(/resource/Roboto/Roboto-Bold.woff2) format('woff2'),url(/resource/Roboto/Roboto-Bold.ttf) format('ttf');
}
*/
@font-face {
    font-family: 'Roboto';
    src: local('PT Sans'), local('PT_Sans-Web-Regular'), 
    url(/resource/PTSans/PT_Sans-Web-Regular.ttf) format('ttf');
}
@font-face {
    font-family: 'Roboto-Bold';
    src: local('PT Sans'), local('PT_Sans-Web-Bold'), url(/resource/PTSans/PT_Sans-Web-Bold.ttf) format('ttf');
}

html, body{font-family: 'Roboto', sans-serif !important;}
.blueColor{    color: #1797c0}
.font15{    font-size: 15px;}
button, input, optgroup, select, textarea{font-family: 'Roboto', sans-serif !important;}
.custom-col{
    background: rgb(114,114,163); /* Old browsers */
    background: -moz-linear-gradient(top,  rgba(114,114,163,1) 0%, rgba(62,62,152,1) 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(114,114,163,1)), color-stop(100%,rgba(62,62,152,1))); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  rgba(114,114,163,1) 0%,rgba(62,62,152,1) 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  rgba(114,114,163,1) 0%,rgba(62,62,152,1) 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  rgba(114,114,163,1) 0%,rgba(62,62,152,1) 100%); /* IE10+ */
    background: linear-gradient(to bottom,  rgba(114,114,163,1) 0%,rgba(62,62,152,1) 100%); /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#7272a3', endColorstr='#3e3e98',GradientType=0 ); /* IE6-9 */
    padding: 10px 5px;
    display: block;
    border-radius: 5px;
    border-bottom: 3px solid #323279;
    font-size: 16px;
    font-weight: 600;
    font-family: 'Roboto', sans-serif;
    color: #fff;
    margin-top: 2%;
    margin-bottom: 1%;	
}
.custom-col-grey{
    background: rgb(242,242,242); /* Old browsers */
    background: -moz-linear-gradient(top,  rgba(242,242,242,1) 0%, rgba(231,231,231,1) 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(242,242,242,1)), color-stop(100%,rgba(231,231,231,1))); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  rgba(242,242,242,1) 0%,rgba(231,231,231,1) 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  rgba(242,242,242,1) 0%,rgba(231,231,231,1) 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  rgba(242,242,242,1) 0%,rgba(231,231,231,1) 100%); /* IE10+ */
    background: linear-gradient(to bottom,  rgba(242,242,242,1) 0%,rgba(231,231,231,1) 100%); /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f2f2', endColorstr='#e7e7e7',GradientType=0 ); /* IE6-9 */
    padding: 3% 5px 1%;
    display: block;
    border-radius: 5px;
    font-family: 'Roboto', sans-serif;
    color: #565555;
    margin-bottom: 0.8%;	
}
.custom-row{
    margin-top: 1%;
}
.container h1{
    color: #236fbd; 
    font-size: 24px;
    font-family: 'Roboto', sans-serif;
}
.container p{
    color: #5b5b5b;
    font-size: 16px;
    font-weight:600;	
}
.action{
    font-size: 12px;
    font-family: 'Roboto', sans-serif;
    font-weight: 600;
    padding: 2px 11px;	
}
.action2{
    font-size: 16px;
    font-family: 'Roboto', sans-serif;
    font-weight: 600;
    background: #9a9ad6;
    border: 1px solid #8080ba;	
}
.btn-title{
    text-align:right; 
    padding-right:0.5%;	
}
.action-wrapper{
    float: right;
    width: auto;	
}
.lableName{
    color: #505050;
    font-weight: 600;
}
.newSelect {
    font-size: 14px!important;
    height: 40px!important;
    line-height: 1!important;
}
.tableTitleWrapper{
    border-bottom: 2px solid #236fbd;
    float: left;
    margin-top: 2%;
    padding-bottom: 0.8%;
    width: 100%;
    font-size: 18px;
    color: #236fbd;
    font-weight: 400;	
}
.viewDetail{
    float: left;
    margin-left: 1.5%;	
}
.mergeAll{
    float:left; 
    font-size: 15px;
    font-weight: 600;
    color: #787878;
}
.recordsWrapper{
    float:left;
    width: 400px; 
    margin-left: 5%;
}
.recordsLabel{
    float:left; 
    font-size: 15px;
    font-weight: 600;
    margin-left: 4%;
}
.recordNo{
    color: #f7941d;
    font-size: 15px;
    font-weight: 600;
    padding: 5px 18px;
    margin-left: 2%;
    border: #f7941d solid 1px;	
}
.paginationWrapper{
    float: left;
    margin-bottom: 0%;
    width: 100%;
    font-size: 18px;
    color: #236fbd;
    font-weight: 400;
    background: #f4f4f4;
    padding-top: 8px;
    box-shadow: 1px 2px 2px rgba(148, 148, 148, 0.58);	
}
.pagerNew.pager > li {
    margin-left: 1em;
}
.goToPage{
    float: left;
    margin-left: 2%;
    margin-top: 0.5%;
    width: 40%;	
}
.paginationInner{
    float: right;
    margin-right: 2%;
    margin-bottom: -0.5%;	
    margin-top: -0.5%;
}
.pagination .leftMargin ul li, ol li{
    margin-left: 0.5em;
    padding-left: 0;
}
.paginationInner .pagination ul li, ol li{
    margin-left: 0.2em;
    padding-left: 0;	
}
.goTo{
    float: left;
    font-size: 14px;
    line-height: 16px;
    font-weight: 600;
    color: #6f6f6f;	
}
.showRows{
    float: left;
    font-size: 14px;
    font-weight: 600;
    color: #6f6f6f;
    margin-left: 5%;	
}
.showRowsInput, .showRowsInput2, .showRowsInput3{
    font-size: 14px;
    padding: 10px;
    width: 45px;	
}
.showRowsInput2{
    width: 72px; 
    height: 38px; 
    font-size: 15px; 
    border: 1px solid #dddddd; 
    padding-left: 9px;	
}

.showRowsInput3{
    width: 77px; 
    height: 38px; 
    font-size: 15px; 
    border: 1px solid #dddddd; 
    padding-left: 9px;
}


.pager li > a, .pager li > span {
    background-color: #ffffff;
    border: 1px solid #dddddd;
    border-radius: 15px;
    display: inline-block;
    font-size: 14px;
    padding: 0 12px;
}
ul li, ol li{
    margin-left: 0;
}

/****************table with fixed header start here*************/
.TFtable  {
    width: 100%;
    margin-bottom: 10px;
}
.TFtable table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
}

.TFtable thead, tbody, tr, td, th { box-sizing: border-box; }

.TFtable tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
}
.TFtable tr:nth-child(odd){ 
    background: #f4f4f4;
}
.TFtable tr:nth-child(even){
    background: #e7e7e7;
}
.TFtable thead th { 
    height: 36px;
    background: #7c7c7c; 
    color: #fff;
}
/*
.TFtable tbody {
height: 200px;
overflow-y: auto;
color: #515151;
}
*/
.TFtable thead {
    /* fallback */
    width: 97%;
    /* minus scroll bar width */
    width: calc(100% - 0px);  
}

.TFtable tbody { 
    border-color: #ffffff #cccccc #cccccc;
    border-style: solid;
    border-width: 1px;
}

.TFtable tbody td, thead th {
    width: 20%;
    float: left;
    padding: 7px;
    padding-left:0px;
    color:#595959;
}
.TFtable tbody td:last-child, thead th:last-child {
    border-right: none;
}
.TFtable tbody td {
    padding-left: 13px;
}
/****************table with fixed header end here*************/




.cssload-wrap{
    padding-top:70px;
}	

.cssload-wrap > div {
    left: calc(50% - 87px);
    position: relative;
    background-color: rgb(255,255,255);
    width: 175px;
    height: 175px;
    border-radius: 100%;
    -o-border-radius: 100%;
    -ms-border-radius: 100%;
    -webkit-border-radius: 100%;
    -moz-border-radius: 100%;
    overflow: hidden;
    color:rgb(0,0,0);
}
.cssload-wrap > div:nth-child(2) {
    width: 157px;
    height: 157px;
    top: -166px;
    left: calc(50% - 79px);
    line-height: 157px;
    text-align: center;
}
.cssload-wrap > div div {
    width: 131px;
    height: 131px;
    border-radius: 100%;
    -o-border-radius: 100%;
    -ms-border-radius: 100%;
    -webkit-border-radius: 100%;
    -moz-border-radius: 100%;
    filter: blur(26px);
    -o-filter: blur(26px);
    -ms-filter: blur(26px);
    -webkit-filter: blur(26px);
    -moz-filter: blur(26px);
    position: absolute;
}
.cssload-wrap > div div:nth-child(1) {
    background-color: red;
    animation: cssload-move 4s;
    -o-animation: cssload-move 4s;
    -ms-animation: cssload-move 4s;
    -webkit-animation: cssload-move 4s;
    -moz-animation: cssload-move 4s;
    animation-delay: 4.8s;
    -o-animation-delay: 4.8s;
    -ms-animation-delay: 4.8s;
    -webkit-animation-delay: 4.8s;
    -moz-animation-delay: 4.8s;
    animation-iteration-count: infinite;
    -o-animation-iteration-count: infinite;
    -ms-animation-iteration-count: infinite;
    -webkit-animation-iteration-count: infinite;
    -moz-animation-iteration-count: infinite;
    animation-timing-function: linear;
    -o-animation-timing-function: linear;
    -ms-animation-timing-function: linear;
    -webkit-animation-timing-function: linear;
    -moz-animation-timing-function: linear;
}
.cssload-wrap > div div:nth-child(2) {
    background-color: green;
    animation: cssload-move 3s;
    -o-animation: cssload-move 3s;
    -ms-animation: cssload-move 3s;
    -webkit-animation: cssload-move 3s;
    -moz-animation: cssload-move 3s;
    animation-delay: 0s;
    -o-animation-delay: 0s;
    -ms-animation-delay: 0s;
    -webkit-animation-delay: 0s;
    -moz-animation-delay: 0s;
    animation-iteration-count: infinite;
    -o-animation-iteration-count: infinite;
    -ms-animation-iteration-count: infinite;
    -webkit-animation-iteration-count: infinite;
    -moz-animation-iteration-count: infinite;
    animation-timing-function: linear;
    -o-animation-timing-function: linear;
    -ms-animation-timing-function: linear;
    -webkit-animation-timing-function: linear;
    -moz-animation-timing-function: linear;
}
.cssload-wrap > div div:nth-child(3) {
    background-color: blue;
    animation: cssload-move 6s;
    -o-animation: cssload-move 6s;
    -ms-animation: cssload-move 6s;
    -webkit-animation: cssload-move 6s;
    -moz-animation: cssload-move 6s;
    animation-delay: 3.2s;
    -o-animation-delay: 3.2s;
    -ms-animation-delay: 3.2s;
    -webkit-animation-delay: 3.2s;
    -moz-animation-delay: 3.2s;
    animation-iteration-count: infinite;
    -o-animation-iteration-count: infinite;
    -ms-animation-iteration-count: infinite;
    -webkit-animation-iteration-count: infinite;
    -moz-animation-iteration-count: infinite;
    animation-timing-function: linear;
    -o-animation-timing-function: linear;
    -ms-animation-timing-function: linear;
    -webkit-animation-timing-function: linear;
    -moz-animation-timing-function: linear;
}
.cssload-wrap > div div:nth-child(4) {
    background-color: yellow;
    animation: cssload-move 5s;
    -o-animation: cssload-move 5s;
    -ms-animation: cssload-move 5s;
    -webkit-animation: cssload-move 5s;
    -moz-animation: cssload-move 5s;
    animation-delay: 1.6s;
    -o-animation-delay: 1.6s;
    -ms-animation-delay: 1.6s;
    -webkit-animation-delay: 1.6s;
    -moz-animation-delay: 1.6s;
    animation-iteration-count: infinite;
    -o-animation-iteration-count: infinite;
    -ms-animation-iteration-count: infinite;
    -webkit-animation-iteration-count: infinite;
    -moz-animation-iteration-count: infinite;
    animation-timing-function: linear;
    -o-animation-timing-function: linear;
    -ms-animation-timing-function: linear;
    -webkit-animation-timing-function: linear;
    -moz-animation-timing-function: linear;
}




@keyframes cssload-move {
    0%, 100% {
        top: 0%;
        left: 0%;
    }
    25% {
        top: 0%;
        left: 50%;
    }
    50% {
        top: 50%;
        left: 50%;
    }
    75% {
        top: 50%;
        left: 0%;
    }
}

@-o-keyframes cssload-move {
    0%, 100% {
        top: 0%;
        left: 0%;
    }
    25% {
        top: 0%;
        left: 50%;
    }
    50% {
        top: 50%;
        left: 50%;
    }
    75% {
        top: 50%;
        left: 0%;
    }
}

@-ms-keyframes cssload-move {
    0%, 100% {
        top: 0%;
        left: 0%;
    }
    25% {
        top: 0%;
        left: 50%;
    }
    50% {
        top: 50%;
        left: 50%;
    }
    75% {
        top: 50%;
        left: 0%;
    }
}

@-webkit-keyframes cssload-move {
    0%, 100% {
        top: 0%;
        left: 0%;
    }
    25% {
        top: 0%;
        left: 50%;
    }
    50% {
        top: 50%;
        left: 50%;
    }
    75% {
        top: 50%;
        left: 0%;
    }
}

@-moz-keyframes cssload-move {
    0%, 100% {
        top: 0%;
        left: 0%;
    }
    25% {
        top: 0%;
        left: 50%;
    }
    50% {
        top: 50%;
        left: 50%;
    }
    75% {
        top: 50%;
        left: 0%;
    }
}

.glyphicon-menu-right::before {
    content: "\003e";
}
.glyphicon-menu-left::before {
    content: "\003c";
}
.popup
{
    z-index: 99999;
    padding: 10px;
    position: fixed;
    width: Auto;
    top: 40%;
    opacity: 1;
    left: 40%;
    width: 293px;
    display: table-cell;
    vertical-align: middle;
    color: #000;
    font-size: 18px;
    text-align: center;
}


.popupBg{
    /*background-color: #e8e8e8; */
    background-color: #fff;
    /*opacity: 0.8; */
    opacity: 0.96;
    filter: alpha(opacity = 10);
    position: fixed;
    width: 100%;
    height: 120%;
    top: 0;
    left: 0;
    z-index: 999999999999999999;
    overflow: hidden;
}




.closeButton {
    float: right;
}


/*****************steps css start here************/
.custom-col-green{
    background: #ffffff;
    color: #565555;
    display: inline-block;
    font-family: ;
    margin-bottom: 0.8%;
    padding: 1% 5px 1%;
    box-shadow: 0px 1px 3px #666;
    width: 100%;
    margin-left: 0 !important;
    border: solid 1px #1797c0;
}
.steps-circle{
    border: 2px solid #ffffff;
    border-radius: 200px;
    color: #ffffff;
    float: left;
    font-size: 63px;
    height: 230px;
    margin-left: 2%;
    padding-top: 62px;
    text-align: center;
    width: 230px;
} 
.custom-col-green p {
    color: #5d5d5d;
    font-size: 14px;
    font-weight: 600;
    margin-top: 15px;
    margin-bottom: 2px;
}
.select-object {
    color: #ffffff;
    font-size: 16px;
    font-weight: 600;
}   
/*****************steps css end here************/

/*****select drop down css start here **********/
.select-menu {
    padding:3px;
    margin: 0;
    font-size: 16px !important;
    height: 40px !important;
    -webkit-border-radius:5px;
    -moz-border-radius:5px;
    border-radius:5px;
    -webkit-box-shadow: 0 2px 0 #ccc, 0 -1px #fff inset;
    -moz-box-shadow: 0 2px 0 #ccc, 0 -1px #fff inset;
    box-shadow: 0 2px 0 #ccc, 0 -1px #fff inset;
    background: #f8f8f8;
    color:#4c4c4c;
    border:none;
    outline:none;
    display: inline-block;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    cursor:pointer;
    width: 99%;
}
.select-menu option{
    padding-left: 5px;
    border: none;
}
/* Targetting Webkit browsers only. FF will show the dropdown arrow with so much padding. */
@media screen and (-webkit-min-device-pixel-ratio:0) {
    .select-menu {padding-right:56px}
}
.menu {position:relative}
.menu:after {
    content:'>';
    font:38px "Consolas", monospace;
    color:#aaa;
    -webkit-transform:rotate(90deg);
    -moz-transform:rotate(90deg);
    -ms-transform:rotate(90deg);
    transform:rotate(90deg);
    right:15px; top:-14px;
    padding:0 0 2px;
    border-bottom:1px solid #ddd;
    position:absolute;
    pointer-events:none;
}
.menu:before {
    content:'';
    right:10px; top:0px;
    width:20px; height:10px;
    background:#f8f8f8;
    position:absolute;
    pointer-events:none;
    display:block;
}
/*****select drop down css endhere **********/
.pagerNew li {
    margin-right: 1em;
    list-style: none;
} 
.pagerNewPrev li{
    margin-left: 1em;
    list-style: none;
}
.pagerNew li > a, .pagerNew li > span{
    background-color: #636363;
    display: inline-block;
    padding: 0px 15px;
    color: #fff;
    font-size: 16px;
    line-height: 33px;
    text-transform: none;
    font-weight: 600;
}

.pagerNew li > a:hover, .pagerNewPrev li a:hover{
    text-decoration: none !important;
    background: #f7941d;
}
.pagerNewPrev li > a, .pagerNewPrev li > span{
    background-color: #a0a0a0;
    border-radius: 5px;
    display: inline-block;
    padding: 5px 14px;
    color: #fff;
    font-size: 28px;
    line-height: 40px;
}

/*************top steps start here************/
.steps_wrapper {
    background: #a0a0a0 none repeat scroll 0 0;
    height: 5px;
    margin: 4% auto 4%;
    width: 735px;
}
.step_1, .step_2, .step_3, .step_4, .step_5, .step_active {
    background: #099ad6 none repeat scroll 0 0;
    border-radius: 100px;
    color: #ffffff;
    float: left;
    font-family: open sans;
    font-weight: 600;
    height: 74px;
    margin-left: -10px;
    margin-top: -36px;
    padding-top: 26px;
    text-align: center;
    width: 78px;
    font-size: 14px;
}
.step_2{
    margin-left: 12%;   
}
.step_3{
    margin-left: 12%;   
}
.step_4{
    margin-left: 12%;   
}
.step_5{
    float: right;
    margin-right: -5px; 
}
.step_active {
    background: #f7941d;
}


/*************top steps end here************/

.message {    
    width: 350px;
    height: 100px;
}
.extra-row   {
    border: solid 1px #f6f6f6;
    border-radius: 5px;
    padding: 10px; 
    margin-bottom: 20px; 
    background: #fcfcfc;
    font-size: 14px;
}
.extra-button{
    background: #6c6969;
    padding: 12px;
    color: #fff;
    border: none;
    font-size: 17px;
    font-weight: 400;
} 
.desc{
    margin: 0px;
    width: 100%;
    height: 49px;
    resize: none;
    border: solid 1px #ccc;
    padding-top: 6px;
    padding-bottom: 6px;
    outline: none;
}
.name-area{
    padding: 4px;
    border: solid 1px #ccc;
    height: 49px;
    outline: none;
}
.desc-output {
    margin: 0px;
    width: 99%;
    height: auto;
    resize: vertical;
    background: #f8f8f8;
    padding: 5px;
    min-height: 40px;
    padding-top: 9px;
    font-size: 14px;
    padding-left: 7px;
    overflow-wrap: break-word;
}
.v-line{
    height: 208px; 
    width: 2px; 
    background: -webkit-linear-gradient(top, rgba(9,154,214,1) 0%, rgba(255,255,255,1) 50%, rgba(9,154,214,1) 100%);
    background: -moz-linear-gradient(top, rgba(9,154,214,1) 0%, rgba(255,255,255,1) 50%, rgba(9,154,214,1) 100%);
    background: linear-gradient(top, rgba(9,154,214,1) 0%, rgba(255,255,255,1) 50%, rgba(9,154,214,1) 100%);
    position: relative;
    margin-top: 15px;
}
.or-icon{
    width: 40px;
    height: 40px;
    border-radius: 100%;
    background: #f7941d;
    position: absolute;
    top: 85px;
    color: #FFF;
    padding: 10px 7px;
    line-height: 22px;
    font-size: 12px;
    left: -18px;
    text-align: center;
}
.helpIcon{
    text-align: right; 
    width:18px;
    height:18px;
    padding:5px;
    border-radius:100%; 
    background:#F7941D; 
    color:#fff; 
    font-size:12px;
    float: right;
    line-height: 1;
    font-weight: 600;
    margin-left: 5px;
}
/****help text css***/
.wrapper {
    color: #555;
    cursor: pointer;
    font-family: 'Roboto', sans-serif;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 5px;
    margin-right: 0;
    position: relative;
    z-index: 4;
    text-align: right;
    -webkit-transform: translateZ(0);
    -webkit-font-smoothing: antialiased;
    float: right;
}

.wrapper .tooltip {
    background: #fff;
    border: solid 1px #747e96;
    font-family: Roboto;
    font-size: 14px;
    font-weight: normal;
    line-height: 18px;
    text-align: left;
    text-transform: none;
    color: #999;
    display: block;
    width: 200px;
    right: 0%;
    top: 25px;
    margin-bottom: 10px;
    opacity: 0;
    padding: 20px;
    pointer-events: none;
    border-radius: 5px;
    position: absolute;
    -webkit-transform: translateY(10px);
    -moz-transform: translateY(10px);
    -ms-transform: translateY(10px);
    -o-transform: translateY(10px);
    transform: translateY(10px);
    -webkit-transition: all .25s ease-out;
    -moz-transition: all .25s ease-out;
    -ms-transition: all .25s ease-out;
    -o-transition: all .25s ease-out;
    transition: all .25s ease-out;
    -webkit-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -moz-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -ms-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -o-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
}

/* This bridges the gap so you can mouse into the tooltip without it disappearing */
.wrapper .tooltip:before {
    content: '';
    display: block;  
    position: absolute;
    right: 10px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 10px solid transparent;
    border-bottom-color: #747e96;
}  

.wrapper .tooltip:after {
    content: '';
    display: block;  
    position: absolute;
    right: 11px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 9px solid transparent;
    border-bottom-color: white;
}

.wrapper:hover .tooltip {
    opacity: 1;
    pointer-events: auto;
    -webkit-transform: translateY(0px);
    -moz-transform: translateY(0px);
    -ms-transform: translateY(0px);
    -o-transform: translateY(0px);
    transform: translateY(0px);
}

/* IE can just show/hide with no transition */
.lte8 .wrapper .tooltip {
    display: none;
}

.lte8 .wrapper:hover .tooltip {
    display: block;
}
.errorMessage{
    width: 99.5%;
    background-color: #ef403d;
    padding: 8px;
    color: #fff !important;
    border-radius: 5px;
    border: solid 1px #ef403d;
    font-size: 14px;
    font-weight: 600;
    display: none;
    margin-top: 5px;
    font-family:'Roboto', sans-serif;
}
.notificationMessage {
    width: 100%;
    background-color: #77d07b;
    padding: 8px;
    border-color: black;
    border-radius: 5px;
    border: solid 1px #39b73e;
    font-size: 14px;
    color: #561f1f;
    display: block;
    margin-top: 5px;
}
.radioText{
    display: block; 
    font-size: 16px; 
    border-bottom: solid 1px #ececec;
    font-weight: 600;
}
.paginationWrapper2 {
    float: left;
    margin-bottom: 0%;
    width: 100%;
    font-size: 18px;
    color: #236fbd;
    font-weight: 400;
    background: #f4f4f4;
    padding-top: 8px;
    box-shadow: 1px 2px 2px rgba(148, 148, 148, 0.58);
}
.glyphicon {
    //top: 4px!important;
}

.preLoader-text{
    font-size: 14px;
    width: 400px;
    float: left;
    text-align: center; 
    color:#281694;
    padding-right: 22px; 
}
.expand-collapse {
    text-decoration: none;
    background: #9E9E9E;
    width: 16px;
    float: left;
    height: 16px;
    text-align: center;
    color: #fff;
    padding: 0;
    line-height: 1;
    font-size: 14px;
    font-weight: 800;
    font-family: serif;
    border-radius: 2px;
}
.TFtable tbody td {
    padding-left: 0px;
}

.pop-up-table{
    border: solid 1px #ccc;
    width: 100%;
    margin-top: 44px;
}
.pop-up-table th{
    background: rgb(139, 152, 158);
    float: none;
    font-size: 12px;
    padding: 6px 20px;
    color: #fff;
    text-align: left;
}
.pop-up-table td{
    padding: 5px;
    border-bottom: solid 1px #ccc;
    font-size:12px;
    border: solid 1px rgba(249, 238, 238, 0.23);
}
.popup-button{
    float: right;
    border-radius: 1px;
    margin-bottom: 3px;
    color: white !important;
    text-align: center;
    text-decoration: none !important;
    background: rgba(255, 61, 0, 0.88);
    margin-right: -2px;
    font-size: 17px;
    font-weight: 900;
    padding: 5px 6px 6px 6px;
    margin-top: 3px;
    font-family: cursive;
}

.popupBgPrev{
    background: rgba(0, 0, 0, 0.8);
    opacity: 1;
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 99999;
    overflow: hidden;
    min-height: 1200px;    
}
.popupPrev
{       padding: 10px;
    width: 95%;
    color: #000;
    font-size: 18px;
    text-align: center;
    margin: 1% auto;
    z-index: 999999;
    position: relative;
    border-radius: 5px;
    box-shadow: 0px 0px 8px #000;
    overflow: scroll;
    //overflow-y: hidden;
    //min-height: 200px;
    //max-height: 600px;
    height:600px;
    //width:900px;
    background: #fff;
}


.dropExpBtn{
    border: none !important;
    font-size: 16px !important;
    font-weight: bold !important;
    text-decoration: none !important;
    width: 75px;
    background: #636363 !important;
    color: white !important;
    padding-right: 9px !important;
    text-align: right !important;
    border-radius: 0 !important;
    display: block;
    padding: 4px;
}


.download-img{
    width: 14px;
    position: absolute;
    padding-top: 10px;
    margin-left: 0;
    height: 24px;
    margin-top: 0px;
    right: 6%;
}

.dropExpBtn:hover{
    background: #f7941d !important;
    box-shadow: none!important;
    border: none!important;
}

#hTable th{
    width:244px;
}
#bTable td{
    width:244px;
}

/*#####NEW TABLE######*/


::-webkit-scrollbar {
    width: 12px;
    height: 12px;
}

::-webkit-scrollbar-thumb {
    background-color:darkgray;
}


.table-div {
    max-width:99.5%;
    overflow-x:auto;
    border:1px solid black;
    background-color:lightgray;
    margin-top: 60px;
    margin-left: 3px;
    border-radius: 3px;
    height:480px;
}

.Table {
    background-color:transparent;
    min-width:100%;
}

.Table thead,
.Table tbody {
    display:block;
}

.Table thead {
    
    /*border-bottom:1px solid black; */
    
}

.Table thead > tr {
    /* width:calc(100% - 12px);*/
}

.Table tbody {
    max-height:386px;;
    /* max-height:506px; */
    overflow-x:hidden;
}

.Table tr {
    display:flex;
}

.Table td, 
.Table th {
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    padding:6px 20px;
    width:260px;
    background-color:white;
    font-size:12px;
    border-right: solid 1px #ccc;
}

.Table th {
    text-align: left;
    width: 260px;
    background: rgb(139, 152, 158);;
    color: #fff;
    
}

.Table td{
    border-bottom:solid 1px #ccc;
    /*height: 50px; */
    /*overflow: auto; */
    
}

.Table th:first-child {
    border-left:0;
}

.header-div{
    position: fixed;
    background: #636363;
    width: 99.5%;
    border-radius: 5px 5px 0 0;
    z-index: 9999999;
    padding: 6px 10px;
    line-height: 19px;
    margin-top:12px;
    margin-left:3px;
    text-align: center;
    font-size: large;
}

.table-btn{
    text-decoration: none !important;
    font-size: 10px;
    background: #1696bf;
    padding: 5px 10px;
    color: white;
    font-weight: 600;
    border-radius: 0;
    box-shadow: 1px 2px 1px #999;
    margin-left: 5px;
    letter-spacing: 1px;
    min-width: 68px;
    float: left;
    text-align: center;
    text-transform: uppercase;
}
.table-btn:hover{
    text-decoration: none !important;
    background: #f7941d;
    color: #fff;
}
.arrow-right {
    width: 0; 
    height: 0; 
    border-top: 8px solid transparent;
    border-bottom: 8px solid transparent;
    border-left: 8px solid #f7941d;
    display: block;
}
.arrow-down {
    width: 0; 
    height: 0; 
    border-left: 8px solid transparent;
    border-right: 8px solid transparent;
    border-top: 8px solid #f7941d;
    display: block;
    margin-top:7px;
}

.step-circle-box {
    width: 85px;
    height: 85px;
    background: #f7941d;
    border-radius: 100%;
    float: left;
    box-shadow: inset 2px 1px 5px #989898, -1px 1px 5px rgb(138, 138, 138);
    margin-left: -4%;
    margin-top: -6px;
}

.steps-wrapper{
    background: #5f5f5f;
    display: inline-block;
    width: 96.5%;
    margin-left: 3.5% !important;
    margin-bottom: 15px;
    height: 74px;
    box-shadow: 1px 2px 2px rgba(148, 148, 148, 0.58);
    margin-top: 12px;
}
.text-wrpper{
    margin-left: 4%;
    margin-top: 1%;
    float: left;
    width: 80%;
    font-family: 'Roboto', sans-serif;
}
.text-wrpper h3{
    margin-top: 0px;
    margin-bottom: 0;
    font-size: 15px;
    font-weight: 600;
    color: #fff;
}
.text-wrpper p{
    margin-top: 0px;
    font-size: 14px;
    font-weight: 400;
    color: #fff;
}
.arrow-wrap{
    width: 83%;
    background: #f7941d;
    float: left;
    border-radius: 2px;
    margin-top: 18px;
    font-family: 'Roboto', sans-serif;
    margin-left: 21px;
}
.arrow-wrap h2{
    font-size: 20px;
    font-weight: 700;
    text-align: right;
    float: left;
    color: #ffffff;
    margin-top: 14px;
    text-transform: uppercase;
}
.step-arrow {
    width: 0;
    height: 0;
    border-top: 25px solid transparent;
    border-bottom: 25px solid transparent;
    border-left: 16px solid #f7941d;
    display: block;
    float: right;
    margin-top: 0px;
    margin-right: -16px;
    
}
.queryText{
    font-size: 16px;
    margin-bottom: 10px;
    color: #5d5d5d;
    font-weight: 600;
    text-align:center;
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
.query-save-btn{
    background: #636363;
    padding: 14px;
    color: rgb(255, 255, 255) !important;
    border: none;
    font-size: 17px;
    font-weight: 400;
    text-decoration: none !important;
}
.query-save-btn:hover{
    background:#f7941d;
}
.step-5-merge-btn{
    background: #636363;
    border-radius: 0;
    display: inline-block;
    border: none;
    font-size: 14px;
    font-weight: 600;
    text-decoration: none !important;
}
.step-5-merge-btn:hover{
    background: #f7941d;
    text-decoration: none!important;
}

.update-btn{
    text-decoration: none !important;
    font-size: 11px;
    background: #fff;
    padding: 7px 16px;
    color: rgb(247, 148, 29);
    font-weight: 600;
    border-radius: 0;
    box-shadow: 1px 2px 1px #999;
    margin-left: 5px;
    letter-spacing: 1px;
    min-width: 68px;
    text-align: center;
    text-transform: uppercase;
    position: absolute;
    right: 5%;
}

.copy-btn{
    width: 33px;
    float: right;
    background: #000;
    border: none;
    color: #fff;
    font-size: 10px;
    padding: 3px;
    font-weight: 600;
}

.copy-btn:hover{
    background: rgb(255, 47, 0);
}

.update-btn:hover{
    background:  rgba(255, 254, 254, 0.96);
    /* color: #fff; */
}

textarea{
    resize: none;
    height: 33px;
    outline: none;
}

.optt{
    pointer-events: all !important;
    text-decoration:none !important;
    color: #000;
}

.optt span{
    float: left;
    width: 177px;
    text-overflow: ellipsis;
    overflow: hidden;	
}

.Table tbody tr td a{
    pointer-events: none;
    float: left;
    width: 177px;
    text-overflow: ellipsis;
    overflow: hidden;
    color: #000;
}

.enableaddoncheck{
    position: absolute;
    right: 35.5%;
    top: 164px;
    z-index: 999999;
}

.mandatory-icon{
    background: red;
    padding: 20px 2px;
    position: absolute;
    left: 11px;
    top: 0;
}

.step5-error-text{
    float: right;
    color: red;
    font-size: 14px;
    font-weight: 600;
}

.error-border{
    border: solid red;
}

.pagination-error{
    width: 25%;
    position: absolute;
    left: 64%;
    padding: 12px;
    color: red;
    font-size: 15px;
    font-weight: 600;
    display: none;
    text-align: right;
}

.modify-notification{
    display: none; 
    position: fixed;
    width: 22%;
    z-index: 9999999;
    font-size: 14px;
    text-transform: uppercase;
    font-weight: 600;
    border-radius: 5px;
    border: solid 1px darkseagreen;
    text-align: center;
    padding: 17px 8px 17px 7px;
    top: 15px;
    color: #fff;
    right: 67px;
}

.step-4-notify-addons{
    position: absolute;
    display: none;
    width: 76.5%;
    background: #f7941d;
    left: 14%;
    top: 93px;
    height: 38px;
    font-size: 14px;
    color: #fff;
    z-index: 9999;
    text-align: center;
    padding: 8px;
    border-radius: 5px;
    font-weight: 600;
}

.no-dups-message{
    background: #ef403d;
    margin-bottom: 5px;
    text-align: center;
    padding: 13px 5px;
    width: 72%;
    color: #fff;
    margin-left: 14%;
    font-size: 14px;
    font-weight: 600;
    border-radius: 5px;
}

.email-notify{
    position: absolute;
    font-size: 14px;
    background: #099ad6;
    color: #ffffff;
    padding: 11px;
    border-radius: 4px;
    top: 49%;
    font-weight: 600;
    z-index: 999999999999999999999999;
    right: 0;
    display: none;
}

.disable-np-btn{
    background: rgb(247, 148, 29)!important;
    pointer-events: none;
}

.disable-component{
    pointer-events: none !important;
    background: rgb(223, 223, 223) !important;
}

.modify-popup-person-notification{
    color: #FFC107;
    font-size: 13px;
    position: absolute;
    bottom: 0;
    left: 28%;
}

.wrapper-modify .tooltip-modify{
    background: #fff;
    border: solid 1px #747e96;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 18px;
    text-align: left;
    text-transform: none;
    color: #999;
    display: block;
    width: 200px;
    left: 0%;
    top: 25px;
    margin-bottom: 10px;
    opacity: 0;
    padding: 20px;
    pointer-events: none;
    border-radius: 5px;
    position: absolute;
    -webkit-transform: translateY(10px);
    -moz-transform: translateY(10px);
    -ms-transform: translateY(10px);
    -o-transform: translateY(10px);
    transform: translateY(2px);
    -webkit-transition: all .25s ease-out;
    -moz-transition: all .25s ease-out;
    -ms-transition: all .25s ease-out;
    -o-transition: all .25s ease-out;
    transition: all .25s ease-out;
    -webkit-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -moz-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -ms-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -o-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
}

.wrapper-modify .tooltip-modify:before{
    content: '';
    display: block;
    position: absolute;
    left: 10px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 10px solid transparent;
    border-bottom-color: #747e96;
}

.wrapper-modify .tooltip-modify:after{
    content: '';
    display: block;
    position: absolute;
    left: 11px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 9px solid transparent;
    border-bottom-color: white;
}

.tooltip-modify{
    position: absolute;
    z-index: 1070;
    display: block;
    font-family: 'Roboto', sans-serif;
    font-size: 12px;
    font-style: normal;
    font-weight: normal;
    line-height: 1.42857;
    text-align: start;
    text-shadow: none;
    text-transform: none;
    letter-spacing: normal;
    word-break: normal;
    word-spacing: normal;
    word-wrap: normal;
    white-space: normal;
    opacity: 0;
    -webkit-line-break: auto;
    text-decoration: none;
}

.wrapper-modify{
    color: #555;
    cursor: pointer;
    font-family: 'Roboto', sans-serif;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 5px;
    margin-right: 0;
    position: relative;
    z-index: 4;
    text-align: right;
    -webkit-transform: translateZ(0);
    -webkit-font-smoothing: antialiased;
    float: left;	
}

.wrapper-modify:hover .tooltip-modify {
    opacity: 1;
    pointer-events: auto;
    -webkit-transform: translateY(0px);
    -moz-transform: translateY(0px);
    -ms-transform: translateY(0px);
    -o-transform: translateY(0px);
    transform: translateY(0px);
}

.select-option-div{
    width: 100%;
    padding-left: 0px;
    margin-bottom: 10px;
}

.select-value-text{
    margin-bottom: 8px;
    padding: 10px;
    border-radius: 3px;
    border: 1px solid #aaa;
    width: 100%;
    color: #6d6d6d;
    outline: none !important;
}

.disable-div{
    opacity: 0.4;
    pointer-events: none;
}

.step-2-arrow{
    width: 17px;
    height: 17px;
    display: block;
    margin-bottom: 31px;
    margin-top: 9px;
}

.wrapperHeader {
    cursor: pointer;
    font-family: 'Roboto', sans-serif;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 5px;
    margin-right: 0;
    position: relative;
    z-index: 4;
    text-align: right;
    -webkit-transform: translateZ(0);
    -webkit-font-smoothing: antialiased;
    
}

.wrapperHeader .tooltipHeader {
    word-break: break-all;    white-space: normal;
    background: #fff;
    border: solid 1px #747e96;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: normal;
    line-height: 18px;
    text-align: left;
    text-transform: none;
    color: #999;
    display: block;
    width: 200px;
    right: 0%;
    top: 25px;
    margin-bottom: 10px;
    /*-- opacity: 0; --*/
    display: none;
    padding: 20px;
    pointer-events: none;
    border-radius: 5px;
    position: absolute;
    -webkit-transform: translateY(10px);
    -moz-transform: translateY(10px);
    -ms-transform: translateY(10px);
    -o-transform: translateY(10px);
    transform: translateY(10px);
    -webkit-transition: all .25s ease-out;
    -moz-transition: all .25s ease-out;
    -ms-transition: all .25s ease-out;
    -o-transition: all .25s ease-out;
    transition: all .25s ease-out;
    -webkit-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -moz-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -ms-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -o-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
}

/* This bridges the gap so you can mouse into the tooltip without it disappearing */
.wrapperHeader .tooltipHeader:before {
    content: '';
    display: block;  
    position: absolute;
    right: 10px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 10px solid transparent;
    border-bottom-color: #747e96;
}  

.wrapperHeader .tooltipHeader:after {
    content: '';
    display: block;  
    position: absolute;
    right: 11px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 9px solid transparent;
    border-bottom-color: white;
}

.wrapperHeader:hover .tooltipHeader {
    /*--  opacity: 1; --*/
    display: block;
    pointer-events: auto;
    -webkit-transform: translateY(0px);
    -moz-transform: translateY(0px);
    -ms-transform: translateY(0px);
    -o-transform: translateY(0px);
    transform: translateY(0px);
}

/* IE can just show/hide with no transition */
.lte8 .wrapperHeader .tooltipHeader {
    display: none;
}

.lte8 .wrapperHeader:hover .tooltipHeader {
    display: block;
}


.tooltipSavedSearch {
    cursor: pointer;
    font-family: 'Roboto', sans-serif;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 5px;
    margin-right: 0;
    text-align: right;
    position: relative;
    display: inline-block;
}

.tooltipSavedSearch .tooltiptext {
    visibility: hidden;
    /* Position the tooltip */
    position: absolute;
    z-index: 1;
 word-break: break-all;    white-space: normal;
    background: #fff;
    border: solid 1px #747e96;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: normal;
    line-height: 18px;
    text-align: left;
    text-transform: none;
    color: #999;
    display: block;
    width: 200px;
    right: 0%;
    top: 16px;
    margin-bottom: 10px;
    padding: 20px;
    pointer-events: none;
    border-radius: 5px;
    -webkit-transform: translateY(10px);
    -moz-transform: translateY(10px);
    -ms-transform: translateY(10px);
    -o-transform: translateY(10px);
    transform: translateY(10px);
    -webkit-transition: all .25s ease-out;
    -moz-transition: all .25s ease-out;
    -ms-transition: all .25s ease-out;
    -o-transition: all .25s ease-out;
    transition: all .25s ease-out;
    -webkit-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -moz-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -ms-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    -o-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);    
}
.tooltipSavedSearch .tooltiptext:before {
    content: '';
    display: block;  
    position: absolute;
    right: 10px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 10px solid transparent;
    border-bottom-color: #747e96;
}  

.tooltipSavedSearch .tooltiptext:after {
    content: '';
    display: block;  
    position: absolute;
    right: 11px;
    bottom: 100%;
    width: 0;
    height: 0;
    border: 9px solid transparent;
    border-bottom-color: white;
}

.tooltipSavedSearch:hover .tooltiptext {
    visibility: visible;
}