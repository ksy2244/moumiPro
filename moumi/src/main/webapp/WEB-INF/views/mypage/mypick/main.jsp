<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	
<style>
.body-container {
	max-width: 800px;
}

tbody tr:hover {
	box-shadow: 1px 1px 5px -5px;
}

.side {
	list-style: none;
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 16px;
}

.side-menu1 {
	position: absolute;
	top: 10rem;
	left: 15rem;
	background: #198754;
	width: 9rem;
	height: 3rem;
	text-align: center;
	color: white;
	padding-top: 0.5rem;
}

.side-menu2 {
	position: absolute;
	top: 14rem;
	left: 15rem;
}

.side-menu2 a {
	text-decoration: none;
	color: gray;
}

.side-menu3 {
	position: absolute;
	top: 17rem;
	left: 15rem;
}

.side-menu3 a {
	text-decoration: none;
	color: gray;
}

.side-menu4 {
	position: absolute;
	top: 20rem;
	left: 15rem;
}

.side-menu4 a {
	color: #198754;
	font-weight: bold;
	text-decoration: none;
}

.side-menu5 {
	position: absolute;
	top: 23rem;
	left: 15rem;
}

.side-menu5 a {
	text-decoration: none;
	color: gray;
}
</style>	
		
<script type="text/javascript">
	function login() {
		location.href = "${pageContext.request.contextPath}/member/login";
	}

	function ajaxFun(url, method, query, dataType, fn) {
		$.ajax({
			type : method,
			url : url,
			data : query,
			dataType : dataType,
			success : function(data) {
				fn(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error : function(jqXHR) {
				if (jqXHR.status === 403) {
					login();
					return false;
				} else if (jqXHR.status === 400) {
					alert("요청 처리가 실패했습니다.");
					return false;
				}

				console.log(jqXHR.responseText);
			}
		});
	}

	$(function() {
		scrap();

		$("button[role='tab']").on("click", function(e) {
			let tab = $(this).attr("aria-controls");

			if (tab === "1") {
				scrap();
			} else if (tab === "2") {
				recruit()
			}
		});
	});

	//글리스트 및 페이징 처리
	function scrap() {
		const $tab = $("button[role='tab'].active");

		div = $tab.attr("data-div");

		let url = "${pageContext.request.contextPath}/mypage/mypick/scrap";
		let query = "div=" + div;

		let selector = "#panel-" + div;

		const fn = function(data) {
			$(selector).html(data);
		};
		ajaxFun(url, "get", query, "html", fn);
	}

	function recruit() {
		const $tab = $("button[role='tab'].active");

		div = $tab.attr("data-div");

		let url = "${pageContext.request.contextPath}/mypage/mypick/recruit";
		let query = "div=" + div;

		let selector = "#panel-" + div;

		const fn = function(data) {
			$(selector).html(data);
		};
		ajaxFun(url, "get", query, "html", fn);
	}
</script>
<nav>
	<ul class="side">
		<li class="side-menu1">마이페이지</li>
		<li class="side-menu2"><a
			href="${pageContext.request.contextPath}/member/pwd">회원 정보 수정</a></li>
		<li class="side-menu3"><a
			href="${pageContext.request.contextPath}/mypage/mypayment/main">이용권
				상세 내역</a></li>
		<li class="side-menu4"><a
			href="${pageContext.request.contextPath}/mypage/mypick/main">관심 글</a>
		</li>
		<li class="side-menu5"><a
			href="${pageContext.request.contextPath}/mypage/myhistory/main">나의
				활동 내역</a></li>
	</ul>
</nav>
<div class="container body-container">
	<div class="body-main mx-auto">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab"
					data-bs-target="#panel-1" type="button" role="tab" data-div="1"
					aria-controls="1" aria-selected="true">좋아요한 글</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab"
					data-bs-target="#panel-2" type="button" role="tab" data-div="2"
					aria-controls="2" aria-selected="true">찜한 채용공고</button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade show active" id="panel-1" role="tabpanel"
				aria-labelledby="tab-1"></div>
		</div>

		<div class="tab-content pt-2" id="nav-tabContent2">
			<div class="tab-pane fade show active" id="panel-2" role="tabpanel"
				aria-labelledby="tab-2"></div>
		</div>


	</div>
</div>
