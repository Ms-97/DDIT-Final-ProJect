<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.noStyle.js"></script>
 <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/styles/ag-grid.css"/>
 <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/styles/ag-theme-alpine.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<c:set var="drugInfoList" value="${dataMap.drugInfoList}" />

<style>

.ag-theme-alpine{
	--ag-header-background-color: #333258;
	--ag-header-foreground-color: white;
	--ag-font-size: 11px;
}

.ag-theme-alpine .ag-icon-menu {
	color : white;
}

#mainFrame {
	overflow: hidden; 
	height:100vh; 
	width:100vw; 
	align-items: center;
}

#mainFrame_top{
	background-color: #333258; 
	height: 12vh; 
	align-items:center; 
	display: flex; 
	justify-content:center;

}

#bigTitle{ 
	margin-top: 12px; 
	margin-bottom: 12px;
}

#bigTitle > h1{
	font-weight:bold; ; 
	text-align: center;
	font-size: 35px;
	
}

#detailFrame{
	height: 60vh; 
	width: 97vw; 
	margin: 10px;
}

#detailFrameLeft{
	float: left; 
	height: 62vh; 
	width: 50vw; 
}

#detailFrameLeftImg{
	height: 55vh; 
	width: 50vw; 
	align-items:center; 
	display: flex; 
	justify-content:center; 
	border:1px black solid;
}

#detailFrameLeftButton{
	padding: 10px; 
	border-radius : 10px;
	color: white; 
	background-color: gray; 
	font-weight: bolder
}

#detailFrameRight{
	float: right; 
	height: 55vh; 
	width: 45vw; 
	right: 50%
}

#detailFrameRightUp {
	border: solid black 1px; 
	height: 100%; 
	text-align: center; 
	padding-top: 10px;
	
}

#detailFrameRightUp > h2{
	padding: 5px; 
	font-weight: 600; 
	color: #333258;
}

#detailFrameRightUpContent{
	height: 100%; 
	width: 90%; 
	text-align: center;
	margin-left: 8%; 
	margin-top : 5%;
	float: left; 
	font-size: 15px;

}

#detailListRow{
	margin-bottom: 1px;
}

#detailListRow > div{
	float: left; 
	width: 120px; 
	text-align: center; 
	padding: 5px;
	font-weight: bolder;
	background-color : #333258;
	color: white; 
	font-size: 13px;
}

#detailListRow > input {
	width: 30vw; 
	margin-left: 10px;
	border : 0px;
	border-bottom: 2px solid #333258;
	background: none;
	
}

#newEqAddButton{
	color: white;
	background: #333258;
	padding: 7px 5px;
	margin: 3px;
	width: 100px;
	border-radius: 5px;
	font-weight: bolder;

}

#EraseButton{
	color: white;
	background: #961E1E;
	padding: 7px 5px;
	margin: 3px;
	width: 100px;
	border-radius: 5px;
	font-size: 11px;
	border: 1px solid;
	font-weight: bolder;
}
#underBar{
	background-color: #333258; 
	height: 8vh; 
	text-align: center ;
}

#underBar > div {
	text-align: center; 
	padding-top: 15px;
}

#underBar > div > a{
	padding: 5px; 
	border-radius : 5px; 
	color : black;
	background-color: white; 
	font-weight: bolder;

}

textarea::placeholder {
	color: #ccc;
}

</style>



<div id="mainFrame">
	<div id="mainFrame_top">
		<img src="<%=request.getContextPath()%>/resources/images/logo-full.png" 
			 style="width: 25vw; height: 9vh;">
	</div>
	
	<div id="bigTitle">
		<h1>?????? ????????? ??????</h1>
	</div>
	
	<hr>
	
	<div id="detailFrame" class = "content" >
		<div id="detailFrameLeft" >
			
			<div id="myGrid" class="ag-theme-alpine" style="width: 48vw; height: 60vh;">
			<!-- <div style="text-align: center; padding: 13px;">
				<a id="detailFrameLeftButton">
				????????? ?????????
				</a>
			</div> -->
			</div>
		</div>
	
		<div id="detailFrameRight">
			<div id="detailFrameRightUp">
				<h2>??????????????????</h2>
					<div style="width: 100%; height: 80%; background-color: white;">
						<form role="form" class="form-horizontal" action="/equip/newAddsucces" method="post">
							<div id="detailFrameRightUpContent">
								<div class="row" id="detailListRow" >
									<div>
										?????????
									</div>
									<input type="text" name="dstName" placeholder="???????????? ???????????????" 
									 	   class="input-text" maxlength="100" value="">
								</div>
							
								<div class="row" id="detailListRow">
									<div>
										????????????????????????
									</div>
									<input type="text" placeholder="????????????" class="input-text"
										    name="drugNo" value="">
								</div>
							
							<div class="row" id="detailListRow">
								<div>
									????????????
								</div>
								<input type="text" placeholder="??????????????? ???????????????" class="input-text" maxlength="100"
									  name="dstNo" value="">
							</div>
							
							<div class="row" id="detailListRow">
								<div>
									?????????
								</div>
								<input type="text" placeholder="???????????? ???????????????"class="input-text" maxlength="300"
									    name="dstElement" value="">
							</div>
							
							<div class="row" id="detailListRow">
								<div>
									??????
								</div>
								<input type="text" placeholder="????????? ???????????????"class="input-text" maxlength="15"
									    name="dstUnit" value="">
							</div>
							
							<div class="row" id="detailListRow">
								<div>
									?????????
								</div>
								<input type="text" placeholder="???????????? ???????????????"class="input-text" maxlength="300"
									    name="dstMaker" value="">
							</div>
							
							<div class="row" id="detailListRow">
								<div>
									??????
								</div>
								<input type="text"  placeholder="ex) 100000???" class="input-text" maxlength="12"
									    name="dstPrice" value="">
							</div>
							</div>
						</form>
						<div class="row" style="padding-top: 32px;">
     						<div class="col-4"></div>
     						<div class="col-4" style="text-align: center;">
     							<div id="newEqAddButton" onclick="orderRQ()">
     								????????????
     							</div>
     						
     						</div>
     						<div class="col-4" style="text-align: center;">
     							<button class = "erase" onclick="clearInput()" id="EraseButton">
     								?????? ?????????
     							</button>
     						</div >
						</div>
					</div>
			</div>
		</div>
	</div>
	
	<hr>

	<div id = "underBar">
		<div onclick="window.close()">
				<a>
				  ????????????
				</a>
		</div>
	</div>

</div>


<script type="text/javascript">

var columnDefs = [
	{ headerName:"???????????????", field: "name", sortable : true, filter : true, width : 120},
	{ headerName:"????????????????????????", field: "drugInfoNo", sortable : true, filter : true, width : 120},
	{ headerName:"?????????????????????", field: "drugInfoPnum", sortable : true, filter : true, width : 120},
	{ headerName:"?????????", field: "ingredient" , sortable : true, filter : true, width : 182},
	{ headerName:"??????????????????", field: "maker" , sortable : true, filter : true, width : 120}
];

//????????? ??????
var rowData = [
	<c:forEach items="${drugInfoList}" var="drugInfo">
		{ 
			
	  		name: "${drugInfo.drug_name}",
	 	 	drugInfoNo: "${drugInfo.drug_no}",
	  		drugInfoPnum: "${drugInfo.drug_pnum}",
	 		ingredient: "${drugInfo.drug_ingredient}",
	  		maker: "${drugInfo.drug_maker}",
	  		
		},
	</c:forEach>

];


//????????? ?????? ??????
var gridOptions = {
columnDefs: columnDefs,
rowData: rowData,
rowSelection: 'single',
getSelectedRows: 'getSelectedRows'
}

var eGridDiv = document.querySelector('#myGrid');

new agGrid.Grid(eGridDiv, gridOptions);


</script>

<script type="text/javascript">


function clearInput()
{
	var el = document.getElementsByClassName('input-text');
	
	for(var i=0; i<el.length; i++)
	{
		el[i].value = '';
	}
}

function orderRQ(){
	if(!$('input[name="dstName"]').val()){
		swal ( "??????" ,  "??????????????? ???????????????." ,  "error" );  	
	  return;
	}
    
    if(!$('input[name="dstUnit"]').val()){
    	swal ( "??????" ,  "????????? ???????????????." ,  "error" );
	  return;
    }
    if(!$('input[name="dstMaker"]').val()){
    	swal ( "??????" ,  "???????????? ???????????????." ,  "error" );
	  return;
	}
    if(!$('input[name="dstNo"]').val()){
    	swal ( "??????" ,  "??????????????? ???????????????." ,  "error" );
	  return;
	}
    if(!$('input[name="dstPrice"]').val()){
    	swal ( "??????" ,  "????????? ???????????????." ,  "error" );
	  return;
	}
    if(!$('input[name="dstElement"]').val()){
    	swal ( "??????" ,  "???????????? ???????????????." ,  "error" );
	  return;
	}
    if(!$('input[name="drugNo"]').val()){
    	swal ( "??????" ,  "???????????? ???????????????." ,  "error" );
	  return;
	}
    
    
    var form = $('form[role="form"]');
	form.attr({"method":"post",
	     	   "action":"newAddsucces"
	   		  });	
	
	form.submit();
}

</script>
