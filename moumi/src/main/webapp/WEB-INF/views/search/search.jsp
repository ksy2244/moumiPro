<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.marginBox {
	width: 100%;
	height: 20px;
	background: #ECF4EB;
}


.analyzeLayout {
	width: 90%;
	height: 2000px;
	margin: auto;
}

.searchBackGround {
	background: #ECF4EB;
}

.searchMainLayout {
	width: 100%;
	height: 2200px;
	background: #ECF4EB;
}

.chooseInfoBox {
	width: 100%;
	height: 60px;
}

.chooseDate {
	padding: 20px;
	margin-left: 40px;
}

.chooseSNS {
	width: 600px;
	height: 60px;
	padding: 20px;
	margin: 0 auto;
	font-size: 16px;
}

.layoutSNS {
	width: 600px;;
	height: 400px;
	background: white;
	border-radius: 15px;
	margin: 4px;
	padding: 10px;
	border-radius: 15px;
	overflow: scroll;
}

.layoutChannel {
	width: 500px;
	height: 120px;
	border-radius: 15px;
	background: white;
	padding: 5px;
	background: white;
	background: white;
}

.channelContent {
	width: 300px;
	height: 100px;
	margin: 0 auto;
	justify-content: center;
	font-size: 16px;
	font-weight: 700;
}

.channelImg {
	margin-left: 19px;
}

.analyzeLayoutContent {
	width: 1100px;
	height: 500px;
	border-radius: 15px;
	margin-bottom: 5px;
	padding: 50px;
	background: white;
	margin-bottom: 15px
}

.layoutYoutube {
	width: 1100px;
	height: 400px;
	border-radius: 15px;
	background: white;
}

.customInputDate {
	border: 1px solid #198754;
	width: 150px;
	height: 30px;
	border-radius: 30px;
	padding: 12px;
}

.snsContent {
	width: 480px;
	height: 80px;
	border-radius: 15px;
	padding: 17px;
	background: #f8f9fa;
	float: right;
	margin-bottom: 1px;
}

.snsInfo {
	width: 490px;
	height: 100px;
	border: 1px solid red;
	border-radius: 15px;
}

.snsImg {
	width: 35px;
	height: 30px;
	margin: 0 auto;
}

.menuTitle {
	font-size: 17px;
	padding: 20px;
	margin: 18px;
	font-weight: 600;
	margin: 18px;
}

.wordCloudLayout {
	font-weight: 300px;
	width: 600px;
	height: 550px;
	background: white;
	border-radius: 15px;
	height: 500px;
	overflow: hidden;
	text-align: center;
}

.wordCloudImg {
	width: 800px;
	height: 800px;
	margin: auto;
	overflow: hidden;
}
</style>


<div class="chooseInfoBox">
	<div class="container">
		<div class="row">
			<div class="col">

				<div class="chooseDate">
					시작일&nbsp;<input type="date" class="customInputDate">&nbsp;종료일&nbsp;<input
						type="date" class="customInputDate">
				</div>
			</div>

			<div class="col">
				<div class="chooseSNS">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="form-check form-switch ">
									<input class="form-check-input btn btn-outline-danger"
										type="checkbox" role="switch" id="flexSwitchCheckDefault">
									<div class="row">
										<label class="form-check-label labelSNS"
											for="flexSwitchCheckDefault">유튜브</label>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-warning"
										type="checkbox" role="switch" id="flexSwitchCheckChecked"
										checked>
									<div class="row">
										<label class="form-check-label" for="flexSwitchCheckChecked">인스타</label>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-success"
										type="checkbox" role="switch" id="flexSwitchCheckDisabled">
									<div class="row">
										<label class="form-check-label" for="flexSwitchCheckChecked">블로그</label>
									</div>
								</div>


							</div>

							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-info"
										type="checkbox" role="switch"
										id="flexSwitchCheckCheckedDisabled" checked>
									<div class="row">
										<label class="form-check-label" for="flexSwitchCheckChecked">트위터</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</div>

<div class="marginBox"></div>


<div class="searchMainLayout">
	<div class="analyzeLayout ">
		<div class="inner-page">
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="row">
							<div class="col-5">
								<div class="layoutChannel">
									<p class="channelContent">
										언급량이 가장 많았던 채널 <img alt="채널 이미지" class="channelImg"
											src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								</div>
							</div>
							<div class="col-1">
								
							</div>
							<div class="col-5">
								<div class="layoutChannel">
									<p class="channelContent">
										언급량이 가장 많았던 채널 <img alt="채널 이미지" class="channelImg"
											src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								</div>
							</div>
							
							<div class="marginBox"></div>



							<div class="row">
								<div class="layoutYoutube">
									<p class="menuTitle">그래프</p>
								</div>
							</div>
							<div class="marginBox"></div>


						</div>
						<div class="row">
							<div class="layoutYoutube">
								<p class="menuTitle">유튜브 반응 확인하기</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col">
					<div class="row">
						<div class="layoutSNS">
							<c:forEach var="dto" items="${list}" varStatus="status">
								<div class="row" style="margin: 2px;">
									<div class="col ms-auto me-auto">
										<img alt="채널 이미지" class="snsImg"
											style="margin-left: 2px; margin-top: 5px;"
											src="${pageContext.request.contextPath}/resources/images/moumi/sns/twitter.png">
									</div>
									<div class="col">

										<div class="snsContent" onclick="location.href='${dto.url}'">
											<p class="term">${dto.date}</p>
											<div class="col-20 text-truncate">${dto.content}</div>
										</div>

									</div>

								</div>
							</c:forEach>

						</div>
					</div>
					<div class="marginBox"></div>

					<div class="row">
						<div class="wordCloudLayout">
							<img alt="채널 이미지" class="wordCloudImg"
								src="${pageContext.request.contextPath}/resources/images/moumi/wordcloud.png">
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</div>