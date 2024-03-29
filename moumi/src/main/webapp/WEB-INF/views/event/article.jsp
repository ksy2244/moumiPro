<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>


<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}


function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

//페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/event/listReply";
	let query = "eventNum=${dto.eventNum}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		let eventNum = "${dto.eventNum}";
		const $tb = $(this).closest("table");

		let content = $tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/event/insertReply";
		let query = "eventNum=" + eventNum + "&content=" + content;
		
		console.log(content)
		
		const fn = function(data){
			$tb.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
			} else if(state === "false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


//삭제 신고메뉴
$(function(){
	$("body").on("click", ".reply-dropdown", function(){
		const $menu = $(this).next(".reply-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".reply-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	$("body").on("click", function() {
		if($(event.target.parentNode).hasClass("reply-dropdown")) {
			return false;
		}
		$(".reply-menu").hide();
	});
});


//댓글 삭제
$(function(){
	$("body").on("click",".deleteReply",function(){
		if(! confirm("댓글을 삭제하시겠습니까?")) {
			return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		console.log(replyNum);
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/event/deleteReply";
		let query = "replyNum="+replyNum+"&mode=reply";
		
		const fn = function(data){
			listPage(page);
		};
		ajaxFun(url,"post",query,"json",fn);
	});
});

</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">


<div class="container">
	<div class="body-container">
	
		<div class="container">
		<div class="body-title">

			<h2>
				<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;MOUMI 이벤트
			</h2>




		</div>


		<div class="body-main">

			<table class="table mb-0" >
				<thead>
					<tr>
						<td colspan="2" align="center">${dto.subject}</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td align="right">등록일 | ${dto.regDate}</td>

					</tr>
					<tr>
						<td align="right">조회수 | ${dto.hitCount}</td>

					</tr>
					<tr>
						<td width="50%">${dto.startDate}~${dto.endDate}</td>
					</tr>

					<tr>
						<td colspan="2" valign="top" height="200"
							style="border-bottom: none;">${dto.content}</td>
					</tr>

				</tbody>

			</table>
			<div class="reply">
				<form name="replyForm" method="post">
					<div class='form-header'>
						<span class="bold">댓글</span> <span> - 타인을 비방하거나 개인정보를 유출하는
							글의 게시를 삼가해 주세요.</span>
					</div>

					<table class="table table-borderless reply-form">
						<tr>
							<td><textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td align='right'>
								<button type='button' class='btn btn-success btnSendReply'>댓글
									등록</button>
							</td>
						</tr>
					</table>
				</form>

				<div id="listReply"></div>
			</div>

		</div>
	</div></div>
</div>