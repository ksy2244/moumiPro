<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="http://api.nongsaro.go.kr/css/api.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="http://api.nongsaro.go.kr/js/framework.js"></script>
<script type="text/javascript"
	src="http://api.nongsaro.go.kr/js/openapi_nongsaro.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.css" rel="stylesheet"/>
   
<style>
.mainBox {
	margin-top: 25px;
	border: none;
	width: 100%;
	height: 450px;
	/* background: #ECF4EB; */
	background: #198754;
}

.searchBox {
	height: 50px;
	width: 650px;
	position: absolute;
	left: 50%;
	margin-top: 90px;
	transform: translateX(-50%);
}

.searchBtn {
	height: 50px;
	width: 70px;
}

.title {
	color: #198754;
	font-size: 20px;
	font-weight: 700;
}

.keywordDiv {
	height: 100px;
	width: 800px;
	margin: auto;
	margin-top: 200px;
}

.keyword {
	height: 40px;
	width: 90px;
	background: #66A889;
	border-radius: 35px;
	float: left;
	margin-left: 10px;
	color: white;
	font-size: 17px;
	text-align: center;
}

li {
	float: left;
	list-style: none;
	margin: 1px;
}

.more {
	font-size: 18px;
	float: right;
	margin-right: 30px;
}

.mainText {
	font-size: 40px;
	text-align: center;
	margin-top: 50px;
	color: white;
	text-weight: bold;
}
</style>

<script type="text/javascript">
<!--%load_js_plugin("ui")-->

	nongsaroOpenApiRequest.apiKey = "";//농촌진흥청 인증키
	nongsaroOpenApiRequest.serviceName = "areaBrand";
	nongsaroOpenApiRequest.operationName = "selectSclCodeLst";
	nongsaroOpenApiRequest.htmlArea = "nongsaroApiLoadingArea";
	nongsaroOpenApiRequest.callback = "http://localhost:9090/app/call/ajax_local_callback.jsp";
</script>

<script>
	$(document).ready(function() {
		$.ajax({
			//ajax 옵션 설정 
			// 공공데이터 포털 인증키
			url : "https://api.odcloud.kr/api/3060388/v1/uddi:dacd930e-e26e-4f7c-bde7-ce2cfd272e16?page=1&perPage=10&serviceKey=",
			type : "GET",
			dataType : "json",
				// 요청이 성공시 할 일 처리 
			success : function(data) {
				console.log(data, typeof data)
				data = JSON.stringify(data)
				console.log(typeof data)
				data = JSON.parse(data) // String 
				console.log(typeof data) // Object
				// 할 일 처리 
				let apiData = "";
				$.each(data.data, function(key, value) {
					apiData += "<tr>";
					apiData += "<td>" + value.브랜드명+ "</td>";
					apiData += "<td>" + value.소재지주소+ "</td>";
					apiData += "</tr>";
				});
				// 페이지 단에 붙이기 
				$('#brand').append(apiData);
			}
		});
	});
</script>




<div class="mainBox">
	<h3 class="mainText">MOUMI 분석 서비스</h3>
	<form class="d-flex searchBox" role="search">
		<input class="form-control me-2 " type="search"
			placeholder="궁금한 분석 단어를 입력하세요." aria-label="Search">
		<button class="btn btn-light searchBtn" type="submit">검색</button>

	</form>

	<div class="keywordDiv">
		<c:forEach var="item" begin="0" end="12" step="1" varStatus="status">
			<ul>
				<li><p class="keyword">키워드</p></li>
			</ul>
		</c:forEach>
	</div>
</div>

<div class="container body-container">
	<div class="inner-page">
		<br> <br> <br>
		<p class="title">분석 리포트</p>
		<a href="${pageContext.request.contextPath}/report/reportList"
			class="more">더보기</a> <br> <br>
		<div class="container text-center">
			<div class="row">
				<c:forEach var="item" begin="0" end="7" step="1" varStatus="status">
					<div class="col-lg-3 col-md-3">
						<div class="card" style="width: 18rem;">
							<img style="height: 280px; width: 285px;"
								src="${pageContext.request.contextPath}/resources/images/noimage.png" />
							<div class="card-body">
								<p class="card-text">분석 리포트 제목</p>
							</div>
						</div>
						<br>

					</div>
				</c:forEach>

			</div>
		</div>
		<br> <br> <br> <br>

		<p class="title">분석 리포트</p>
		<div class="container text-center">

			<div class="container">
				<p class="title">우리 농가 살리기</p>


				<div id="nongsaroApiLoadingArea"></div>
				<div id="nongsaroApiLoadingAreaResult"></div>

				<br> <br>

				<p class="title">우리 지역 살리기</p>
				<table class="table table-striped table-success text-center" id="brand">
					<thead class="thead-light">
						<tr>
							<th>지역명</th>
							<th>브랜드명</th>
						</tr>
					</thead>

				</table>

			</div>
		</div>
	</div>
</div>
