<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.container {
	min-height: 800px;
}
main {
	position: relative;
	top: -55px;
	background: white;
}

.btn{
	background-color: #ECF4EB;
	color: #198754;
}
.form-select.change {
	-webkit-appearance:none;
	moz-appearance:none;
	appearance:none;
	background:#fff;
	text-align-last: center;
}
select::-ms-expand {opacity:0;}

.body-container {
	max-width: 1200px;
	margin: auto;
	padding-top: 90px;
	padding-left: inherit;
	padding-right: inherit;
	
}

tr {
	font-size: 15px;
}

.tr1:hover {
	background: #fff;
	box-shadow: 0px 0px 4px rgb(72, 92, 161, 0.4);
}

.trN{
	pointer-events: none;
}

.sort {
	font-size: 10px;
	border: 1px solid #e2e2e2;
	width: 50px;
	height: 20px;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sort-td {
	width: 80px;
}

.date-th {
	width: 100px;
}

.date-div {
	text-align: center;
}

.container {
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	margin: 100px auto;
}

.btn:active, .btn:focus, .btn:hover {
	color: #eee;
}

#tablec{
	background-color: #ECF4EB;
}

#tabled{
	background-color: #ECF4EB;
}

#tablee{
	background-color: #ECF4EB;
}
td{
	vertical-align: middle;
}
</style>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("?????? ????????? ??????????????????.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList() {
	const f = document.searchForm;
	f.enabled.value=$("#selectEnabled").val();
	f.action = "${pageContext.request.contextPath}/admin/memberManage/list";
	f.submit();
}

function searchList2() {
	const f = document.searchForm;
	f.userType.value=$("#selectEnabled2").val();
	f.action = "${pageContext.request.contextPath}/admin/memberManage/list";
	f.submit();
}

function detailedMember(userCode){
	let dlg = $("#member-dialog").dialog({
		autoOpen: false,
		model: true,
		buttons: {
			" ?????? " : function() {
				updateOk();
			},
			" ?????? " : function() {
				$(this).dialog("close");
			}
		},
		height: 550,
		width: 800,
		title: "??????????????????",
		close: function(event, ui) {
		}
	});
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/detaile";
	let query = "userCode="+userCode;
	
	const fn = function(data) {
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function updateOk() {
	const f = document.deteailedMemberForm;
	
	if(! f.stateCode.value){
		f.stateCode.focus();
		return;
	}
	if(!$.trim(f.memo.value)){
		f.memo.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateMemberState";
	let query = $("#deteailedMemberForm").serialize();
	
	const fn = function(data) {
		$("form input[name=page]").val("${page}");
		searchList();
		searchList2();
	};
	ajaxFun(url, "post", query, "json", fn);
	
	$('#member-dialog').dialog("close");
}

function deleteOk(userCode) {
	if(confirm("????????? ????????? ?????? ?????????????????? ?")) {

	}
	
	$('#member-dialog').dialog("close");
}

function memberStateDetaileView() {
	$('#memberStateDetaile').dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '???????????? ??????',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); // ?????? ??????????????? ?????? ???????????? ??????
		  }
	  });	
}

function memberStateDetaileView2() {
	$('#memberSubDetaile').dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '?????? ??????',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); // ?????? ??????????????? ?????? ???????????? ??????
		  }
	  });	
}

function selectStateChange() {
	const f = document.deteailedMemberForm;
	
	let s = f.stateCode.value;
	let txt = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! s) {
		return;
	}

	if(s!=="0" && s!=="6") {
		f.memo.value = txt;
	}
	
	f.memo.focus();
}
</script>
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				????????????
			</h2>
		</div>

		<div class="body-main">
			
			<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
		
			<table class="table">
				<tr>
					<td align="left" width="50%">
						${dataCount}???(${page}/${total_page} ?????????)
					</td>
					<td align="right">
						<select id="selectEnabled" class="form-select" onchange="searchList();" style="width: auto; float: right;">
							<option value="" ${enabled=="" ? "selected='selected'":""}>????????????</option>
							<option value="0" ${enabled=="0" ? "selected='selected'":""}>?????? ??????</option>
							<option value="1" ${enabled=="1" ? "selected='selected'":""}>?????? ??????</option>
						</select>
						<select id="selectEnabled2" class="form-select" onchange="searchList2();" style="width: auto;">
							<option value=-1 ${userType== -1 ? "selected='selected'":""}>????????????</option>
							<option value=0 ${userType==0 ? "selected='selected'":""}>?????????</option>
							<option value=1 ${userType==1 ? "selected='selected'":""}>????????????</option>
							<option value=2 ${userType==2 ? "selected='selected'":""}>????????????</option>
							<option value=3 ${userType==3 ? "selected='selected'":""}>????????????</option>
						</select>
					</td>
				</tr>
			</table>
				
			<table class="table table-border table-list">
				<thead>
					<tr id="tablec" class="trN"> 
						<th class="wx-60">??????</th>
						<th class="wx-120">????????????</th>
						<th class="wx-100">?????????(?????????)</th>
						<th class="wx-100">??????</th>
						<th class="wx-60">?????? ??????</th>
						<th class="wx-100">?????????</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr class="hover tr1" onclick="detailedMember('${dto.userCode}');"> 
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td> 
								<c:if test="${dto.userType == 0}">
									?????????
								</c:if>
								<c:if test="${dto.userType == 1}">
									????????????
								</c:if> 
								<c:if test="${dto.userType == 2}">
									????????????
								</c:if>
								<c:if test="${dto.userType == 3}">
									????????????
								</c:if>  
							</td>
							<td>${dto.email}</td>
							<td>${dto.userName}</td>
							<c:if test="${dto.enabled == 0}">
								<td style="color: red;">
									??????
								</td>						
							</c:if>
							<c:if test="${dto.enabled == 1}">
								<td>
									??????
								</td>						
							</c:if>
							<td>${dto.regDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
					 
			<div class="page-navigation">
				${dataCount == 0 ? "????????? ???????????? ????????????." : paging}
			</div>
					
			<table class="table">
				<tr>
					<td align="right" width="350">&nbsp;</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list" method="post">
							<select name="condition" class="form-select" style="width: auto; float: left;">
								<option value="email"     ${condition=="email" ? "selected='selected'":""}>?????????</option>
								<option value="userName"  ${condition=="userName" ? "selected='selected'":""}>??????</option>
								<option value="nickName"  ${condition=="nickName" ? "selected='selected'":""}>?????????</option>
								<option value="userType"  ${condition=="userType" ? "selected='selected'":""}>????????????</option>
							</select>
							<input type="text" name="keyword" class="form-control" value="${keyword}" style="width: auto; float: left;">
								<input type="hidden" name="enabled" value="${enabled}">
								<input type="hidden" name="userType" value="${userType}">
								<input type="hidden" name="page" value="1">
							<button type="button" class="btn" onclick="searchList()" style="float: left;">??????</button>
						</form>
					</td>
				</tr>
			</table>
		
		</div>
		</div>
	</div>
</div>

<div id="member-dialog" style="display: none;"></div>