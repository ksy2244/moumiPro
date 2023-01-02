<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<style type="text/css">
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

.keywordDiv {
	height: 100px;
	width: 800px;
	margin: auto;
	padding: 20px;
	margin-top: 160px;
}

.keyword {
	height: 40px;
	width: 90px;
	background: #66A889;
	border-radius: 35px;
	float: left;
	margin-left: 10px;
	padding: 5px;
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

.title {
	color: #198754;
	font-size: 20px;
}

.mainText {
	font-size: 40px;
	text-align: center;
	padding-top: 80px;
	margin-top: 50px;
	color: white;
	text-weight: bold;
}

.customInput{
	position: relative;
    width: 100%;
    height: 48px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    border-radius: 24px;
    border: 0.3px solid white;
    background-color: white;
	

}

.inputSearch{
	border: none;	

}

.btnSearch{
	background: white;
	width: 60px;
	heigth: 20px;
	border-radius: 90px;
	padding: 10px;
	border:none; 
}
.pay {
	display: flex;
}
.paybox{
	display: flex;
	margin-left: 10rem;
}
.paylist {
	width: 20rem;
	height: 15rem;
	background: #FFFFFF;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
	border-radius: 50px;
	margin-right: 2rem;
}
.paycontent {
	width: 64rem;
	height: 50rem;
	background: #FFFFFF;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
	border-radius: 50px;
	margin-top: 7rem;
	margin-left: 10rem;
	padding-left: 1rem;
	padding-right: 1rem;
}
.content .f-content-h {
	color: #313842;
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	font-size: 1.5rem;
	margin-top: 2rem;
}
.content h4 {
	display: flex;
}
.content h4 b{
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 0.5rem;

}
.content h4 span {
	font-size: 1rem;
	line-height: 1;
	display: block;
	letter-spacing: -.07em;
	margin-left: 0.5rem;
	margin-top: 0.2rem;
	
}
.content button {
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	background: #198754;
	color: white;
	text-align: center;
	transition: background .3s,transform .3s;
	width: 15rem;
	height: 2.5rem;
	border-radius: 0.5rem;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.2rem;
	border: none;
	font-weight: bold;
}

.content .f-contentp {
	margin-left: 2rem;
	line-height: 1;
	font-size: 1rem;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}
.content .s-content-h {
	color: #87CEEB;
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	font-size: 1.5rem;
	margin-top: 2rem;
}
.content .s-content {
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	background: #87CEEB;
	color: white;
	text-align: center;
	transition: background .3s,transform .3s;
	width: 15rem;
	height: 2.5rem;
	border-radius: 0.5rem;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.2rem;
	border: none;
	font-weight: bold;
}
.content .t-content-h {
	color: #5845ea;
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	font-size: 1.5rem;
	margin-top: 2rem;
}
.content .t-content {
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	background: #5845ea;
	color: white;
	text-align: center;
	transition: background .3s,transform .3s;
	width: 15rem;
	height: 2.5rem;
	border-radius: 0.5rem;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.2rem;
	border: none;
	font-weight: bold;
}
.primium {
	border: 1px solid #5845ea;
}
.pay-detail-head {
	padding-left: 30rem;
}
.pay-detail-head>ul {
    padding: 1rem 0;
}
.pay-detail-list {
    align-items: center;
    display: flex;
}
.pay-detail-list >li {
    width: 10rem;
}
.pay-detail-head>ul>li {
    font-size: 1.467rem;
    font-weight: 500;
    line-height: 1.5;
}
.pay-detail-list>li.type-basic {
    color: #00b6de;
}
.pay-detail-list>li.type-premium {
    color: #5845ea;
}
.pay-detail-subject {
	height:2rem;
    background: #ECF4EB;
    border-radius: 0.7rem;
    padding: 0.3rem 1rem;
    margin: 0 2rem;
    margin-bottom: 1rem;
}
.pay-detail-subject p {
    font-size: 1rem;
    font-weight: bold;
    text-align: left;
    margin-bottom: 1rem;
}
.pay-detail-desc-row {
    display: flex;
}
.pay-detail-desc-tit {
    align-items: center;
    display: flex;
    flex: 0 0 25rem;
    width: 16rem;
    margin-left: 3.5rem;
}
.pay-detail-list .second {
	width: 12rem;
}
.pay-detail-desc .line {
	border-bottom: 1px solid #f1f2f4;
	
}
</style>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<div class="mainBox">
	<h3 class="mainText">MOUMI 분석 서비스</h3>
	<form class="d-flex searchBox" role="search">
	<div class="customInput">
		<input class="form-control mx-3 inputSearch" type="search"
			placeholder="궁금한 분석 단어를 입력하세요." aria-label="Search">
		<button class="btn btnSearch " type="submit">
			<i class="fa-solid fa-magnifying-glass"></i>검색
		</button>
		</div>

	</form>

	<div class="keywordDiv">
		<c:forEach var="item" begin="0" end="12" step="1" varStatus="status">
			<ul>
				<li><p class="keyword">키워드</p></li>
			</ul>
		</c:forEach>
	</div>
</div>
<div class="container body-container" style="margin-left:15rem;">
	<div class="pay">
		<div class="paybox">
			<div class="paylist">
				<div class="content">
					<h6 class="f-content-h">free</h6>
					<h4>
						<b>무료</b>
						<span>/무제한</span>
					</h4>
					<button>가입하기</button>
					<p class="f-contentp">회원가입하고 다양한 <br>정보를 볼 수 있어요!</p>
				</div>
			</div>
			<div class="paylist">
				<div class="content">
					<h6 class="s-content-h">Basic</h6>
					<h4>
						<b>15,000</b>
						<span>/30일</span>
					</h4>
					<button class="s-content">시작하기</button>
					<p class="f-contentp">데이터를 파일로 다운 받을 수 있고<br>마음껏 분석할 수 있어요!</p>
				</div>
			</div>
			<div class="paylist primium">
				<div class="content">
					<h6 class="t-content-h">Premium</h6>
					<h4>
						<b>25,000</b>
						<span>/50일</span>
					</h4>
					<button class="t-content">시작하기</button>
					<p class="f-contentp">많은 기간 데이터를<br>마음껏 분석할 수 있어요!</p>
				</div>
			</div>
		</div>
	</div>
	<div class="pay-detail">
		<div class="paycontent">
			<div class="pay-detail-head">
				<ul class="pay-detail-list">
					<li>Free</li>
					<li class="type-basic">Basic</li>
					<li class="type-premium">Premium</li>
				</ul>
			</div>
			<div class="pay-detail-body">
				<div class="pay-detail-content">
					<div class="pay-detail-subject">
						<p>이용안내</p>
					</div>
					<div class="pay-detail-desc">
						<div class="pay-detail-desc-row">
							<div class="pay-detail-desc-tit">
								<h6>이용 기간</h6>
							</div>
						
							<ul class="pay-detail-list">
								<li>무제한</li>
								<li class="second">30일</li>
								<li>50일</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="pay-detail-content">
					<div class="pay-detail-subject">
						<p>분석조건</p>
					</div>
					<div class="pay-detail-desc">
						<div class="pay-detail-desc-row line">
							<div class="pay-detail-desc-tit">
								<h6>기간별검색</h6>
							</div>
							<ul class="pay-detail-list">
								<li>1개월</li>
								<li class="second">3개월</li>
								<li>3개월</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>