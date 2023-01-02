<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
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

.body-container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

.chat-msg-container { display: flex; flex-direction:column; height: 310px; overflow-y: scroll; }
.chat-connection-list { height: 355px; overflow-y: scroll; }
.chat-connection-list span { display: block; cursor: pointer; margin-bottom: 3px; }
.chat-connection-list span:hover { color: #0d6efd }

.user-left {
	color: #0d6efd;
	font-weight: 700;
	font-size: 10px;
	margin-left: 3px;
	margin-bottom: 1px;
}

.chat-info, .msg-left, .msg-right {
	max-width: 350px;
	line-height: 1.5;
	font-size: 13px;
    padding: 0.35em 0.65em;
    border: 1px solid #ccc;
    color: #333;
    white-space: pre-wrap;
    vertical-align: baseline;
    border-radius: 0.5rem;
}

.msg-box {
    background-color: #f8f9fa;
}

.chat-info {
    background: #f8f9fa;
    color: #333;
    margin-right: auto;
    margin-bottom: 7px;

}
.msg-left {
     margin-right: auto;
    margin-bottom: 7px;
    background-color: #f8f9fa;
}
.msg-right {
	margin-left: auto;
    margin-bottom: 7px;
    background-color: #429F6B;
    color: white;
}


tr {
	font-size: 15px;
}

tr:hover {
	background: #fff;
	box-shadow: 0px 0px 4px rgb(72, 92, 161, 0.4);
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

.myDialogList {
    display: flex;
    padding: 16px 0;
    align-items: stretch;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border-bottom: 1px solid #f1f3f5;
}

.myDialogList:hover {
	cursor: pointer;
	background-color: #ECF4EB;
	box-shadow: 2px 2px 2px 0;
	border-radius: 20px;
}

.myDialogListInfo {
	display: flex;
    flex-direction: column;
    width: 90%;
}

.myDialogListDate {
	font-weight: 400;
    line-height: 1.43;
    letter-spacing: -.3px;
    font-size: 14px;
    min-width: 150px;
    text-align: center;
    vertical-align: middle;
}

</style>

<div class="container">
	<div class="body-container">	
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#panel-1" 
					type="button" role="tab" data-div="1" aria-controls="panel-1" aria-selected="true">참여중 채팅</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#panel-2"
					type="button" role="tab" data-div="2" aria-controls="panel-2" aria-selected="true">완료된 채팅</button>
			</li>
		</ul>
		
		
		<div class="tab-content pt-3" id="nav-tabContent">
			<div class="tab-pane fade show active" id="panel-1" role="tabpanel" aria-labelledby="tab-1">
				<div class="myDialogList" onclick="location.href='${pageContext.request.contextPath}/admin/chatting/list';">
					<div class="myDialogImg" style="margin-right: 16px;">
						<img class="m-1 me-2" style="height: 50px; width: 50px;"
						src="${pageContext.request.contextPath}/resources/moumi/logo/callcenter.png">
					</div>
					<div class="myDialogListInfo"> 
						<h5 class="fw-bold">닉네임</h5>
						<div>유료회원이 되고싶어요</div>  
					</div>
					<div class="myDialogListDate align-self-center"> 2022.12.25 16:10 </div>
				</div>
				
				<div class="myDialogList">
					<div class="myDialogImg" style="margin-right: 16px;">
						<img class="m-1 me-2" style="height: 50px; width: 50px;"
						src="${pageContext.request.contextPath}/resources/moumi/logo/callcenter.png">
					</div>
					<div class="myDialogListInfo"> 
						<h5 class="fw-bold">닉네임</h5>
						<div>유료회원이 되고싶어요</div>  
					</div>
					<div class="myDialogListDate align-self-center"> 2022.12.25 16:10 </div>
				</div>

			</div>
		</div>
		
		<div class="tab-content pt-2" id="nav-tabContent2">
			<div class="tab-pane fade show active" id="panel-2" role="tabpanel" aria-labelledby="tab-2">
				
				
				
			</div>
		</div>
		

	</div>
</div>


<!-- 귓속말 Modal -->


<script type="text/javascript">
$(function(){
	var socket = null;
	
	// - 채팅창을 실행할 때 다음과 같이 ip로 실행
	//   http://아이피주소:포트번호/cp/chat/main

	// - 채팅서버
	//   ws://ip주소:포트번호/cp/chat.msg
	var host="${wsURL}";
	// var host='wss://' + window.location.host + '/wchat.msg';  // https
	
	if ('WebSocket' in window) {
		socket = new WebSocket(host);
    } else if ('MozWebSocket' in window) {
    	socket = new MozWebSocket(host);
    } else {
    	writeToScreen("<div class='chat-info'>브라우저의 버전이 낮아 채팅이 불가능 합니다.</div>");
        return false;
    }

	socket.onopen = function(evt) { onOpen(evt) };
	socket.onclose = function(evt) { onClose(evt) };
	socket.onmessage = function(evt) { onMessage(evt) };
	socket.onerror = function(evt) { onError(evt) };
	
	 // 서버 접속이 성공한 경우 호출되는 콜백함수
	function onOpen(evt) {

		let email = "${sessionScope.member.email}";
	    let nickName = "${sessionScope.member.nickName}";
	    if( ! email ) {
	    	location.href="${pageContext.request.contextPath}/member/login";
	    	return;
	    }
	    
	    writeToScreen("<div class='msg-right'> 안녕하세요, MOUMI입니다 :) <br> 어떤 점이 궁금하신가요? </div>");
	    
	    // 서버 접속이 성공 하면 아이디와 이름을 JSON으로 서버에 전송
	    let obj = {};
	    obj.type = "connect";
	    obj.email = email;
	    obj.nickName = nickName;
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
		socket.send(jsonStr); // {"type":"connect","email":"admin","nickName":"관리자"}
	    
	    $("#chatMsg").on("keydown",function(evt) {
	    	let key = evt.key || evt.keyCode;
	        if (key === "Enter" || key === 13) {
	            sendMessage();
	        }
	    });
	}

	// 연결이 끊어진 경우에 호출되는 콜백함수
	function onClose(evt) {
		// 채팅 입력창 이벤트를 제거 한다.
       	$("#chatMsg").off("keydown");
       	writeToScreen("<div class='chat-info'>Info: WebSocket closed.</div>");
	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {
    	// console.log(evt.data);
    	
    	// 전송 받은 JSON 문자열을 자바 객체로 변환
    	let data = JSON.parse(evt.data); // JSON 파싱
    	let cmd = data.type;
    	
    	if(cmd === "userList") { // 처음 접속할때 접속자 리스트를 받는다.
    		let users = data.users;
    		for(let i = 0; i < users.length; i++) {
    			let email = users[i][0];
    			let nickName = users[i][1];
    			
    			let out = "<span id='user-"+email+"' data-email='"+email+"'><i class='bi bi-person-square'></i> "+nickName+"</span>";
        		$(".chat-connection-list").append(out);
    		}
    		
    	} else if(cmd === "userConnect") { // 다른 접속자가 접속했을 때
    		let email = data.email;
    		let nickName = data.nickName;
    		
    		let out = "<div class='chat-info'>"+nickName+"님이 입장하였습니다.</div>";
    		writeToScreen(out);
    		
    		out = "<span id='user-"+email+"' data-email='"+email+"'><i class='bi bi-person-square'></i> "+nickName+"<span>";
    		$(".chat-connection-list").append(out);
    		
    	} else if(cmd === "userDisconnect") { // 접속자가 나갔을 때
    		let email = data.email;
    		let nickName = data.nickName;
    		
    		let out = "<div class='chat-info'>"+nickName+"님이 나갔습니다.</div>";
    		writeToScreen(out);
    		
    		$("#user-"+email).remove();

    	} else if(cmd === "message") { // 메시지를 받은 경우
    		let email = data.email;
    		let nickName = data.nickName;
    		let msg = data.chatMsg;
    		
    		let out = "<div class='user-left'>" + nickName + "</div>";
    		out += "<div class='msg-left'>" + msg + "</div>";
    		writeToScreen(out);
    		
    	} else if(cmd === "whisper") { // 위스퍼
    		let email = data.email;
    		let nickName = data.nickName;
    		let msg = data.chatMsg;
    		
    		let out = "<div class='user-left'>" + nickName + "(귓속)</div>";
    		out += "<div class='msg-left'>" + msg + "</div>";
    		
    		writeToScreen(out);
    	}  else if(cmd === "time") {
    		// console.log(evt.data);
    	}
	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {
		writeToScreen("<div class='chat-info'>Info: WebSocket error.</div>");
	}
	
	// 채팅 메시지 전송
	function sendMessage() {
		let msg = $("#chatMsg").val().trim();
	    if(! msg ) {
	    	$("#chatMsg").focus();
	    	return;
	    }
	    
	    let obj = {};
        obj.type = "message";
        obj.chatMsg = msg;
        
        let jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);

        $("#chatMsg").val("");
        writeToScreen("<div class='msg-right'>" + msg +"<div>");
	}
	
	// -----------------------------------------
	// 채팅 참여자 리스트를 클릭한 경우 위스퍼(귓속말, dm) 대화상자 열기
	$("body").on("click", ".chat-connection-list span", function(){
		let email = $(this).attr("data-email");
		let nickName = $(this).text();
		
		$('#chatOneMsg').attr("data-email", email);
		$('#chatOneMsg').attr("data-nickName", nickName);
		
		$("#myDialogModalLabel").html("귓속말-"+nickName);
		$("#myDialogModal").modal("show");
	});
	
	const modalEl = document.getElementById("myDialogModal");
	modalEl.addEventListener("show.bs.modal", function(){
		// 모달 대화상자가 보일때
		$("#chatOneMsg").on("keydown", function(evt){
			let key = evt.key || evt.keyCode;
			if(key === 'Enter' || key === 13) {
				sendOneMessage();
			}
		});
	});
	modalEl.addEventListener("hidden.bs.modal", function(){
		// 모달 대화상자가 사라질때
		$("#chatOneMsg").off("keydown");
		$("#chatOneMsg").val("");
	});
	
	// -----------------------------------------
	// 귓속말 전송
	function sendOneMessage() {
		let msg = $("#chatOneMsg").val().trim();
		if(! msg) {
			$("#chatOneMsg").focus();
			return;
		}
		
		let email = $('#chatOneMsg').attr("data-email");
		let nickName = $('#chatOneMsg').attr("data-nickName").trim();
		
		let obj = {};
        obj.type = "whisper";
        obj.chatMsg = msg;
        obj.receiver = email;
        
        let jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);
        
        writeToScreen("<div class='msg-right'>"+msg+"("+nickName+")</div>");
        
        $("#chatOneMsg").val("");
        $("#myDialogModal").modal("hide");
	}
	
});

//---------------------------------------------
// 채팅 메시지를 출력하기 위한 함수
function writeToScreen(message) {
    const $msgContainer = $(".chat-msg-container");
    $msgContainer.append(message);

    // 스크롤을 최상단에 있도록 설정함
    $msgContainer.scrollTop($msgContainer.prop("scrollHeight"));
}
</script>
