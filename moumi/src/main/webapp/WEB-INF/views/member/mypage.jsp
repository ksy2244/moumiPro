﻿﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	max-height: 600px;
	margin-top: 100px;
	margin-bottom: 200px;
}
.title {
	font-weight: bold;
}
.card-img-top {
	width: 90px;
	margin-left: 17px;
	margin-top: 15px;
}
.row {
	width: 920px;
	height: 200px;
	margin-bottom: 10px;
}
.lbox {
	width: 600px;
	margin-right: 10px;
	background-color: #ECF4EB;
	border-radius: 8px;
}
.sbox {
	width: 295px;
	background-color: #ECF4EB;
	border-radius: 8px;
	margin-right: 10px;
}
.stitle {
	margin-top: 30px;
	margin-left: 20px;
	font-weight: 900;
	font-size: 17px;
	letter-spacing: -2px;
}
.scontent{
	margin-top: 10px;
	margin-left: 22px;
	font-weight: 500;
	font-size: 15px;
	letter-spacing: -1px;
}
.shortcut{
	margin-top: 30px;
	margin-left: 10px;
	font-size: 13px;
	color: gray;
}
.line {
	border: 0;
	background: #198754;
	height: 3px;
	margin: 3px;
}
table{
	width:560px; 
}
.logoimg{
	width: 130px;
}
.shortcutp{
	color: gray;
	font-weight: 900;
	border: none;
	background: none;
}
.welcome{
	font-size: 20px;
	font-weight: 900;
	letter-spacing: -1px;
}
.id {
	font-size: 17px;
	font-weight: 400;
	padding-left: 3px;
}
</style>





<div class="container">
	<div class="body-container">
		<h5 class="title"> MY PAGE </h5>
		
		<div class="body-main">
			
			<div class="container">
				<div class="row">
					<div class="lbox">
						<table>
							<tbody>
								<tr><td rowspan="5" class="logoimg"><img src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png"  class="card-img-top"></td><td>&nbsp;</td></tr>
								<tr><td style="text-align: right;"><button type="button"  class="shortcutp" onclick="location.href='${pageContext.request.contextPath}/member/pwd';">회원정보 수정 ></button></td></tr>
						        <tr><td class="welcome"><span style="color: #198754"> ${dto.nickName}</span>님 환영합니다.</td></tr>
						        <tr><td class="id">ID ${dto.email}</td></tr>
								<tr><td>&nbsp;</td></tr>
							</tbody>
						</table>	
							<hr class="line">
							<div class="scontent">
								${dto.nickName} 회원님은 MOUMI의 <span style="color: #FFC107; font-weight: bold;">
								<c:choose>
									<c:when test="${sessionScope.member.userType==3}">
										기업회원
									</c:when>
									<c:when test="${sessionScope.member.userType==1}">
										일반회원
									</c:when>
									<c:when test="${sessionScope.member.userType==2}">
										유료회원
									</c:when>
									<c:otherwise>
										관리자
									</c:otherwise>
								</c:choose>
								</span>입니다.
							</div>
					</div>
				
					<div class="sbox">
						<div class="stitle">
							이용권 상세 내역
						</div>
						<div class="scontent">
							MOUMI에 보유한 <br> 이용권 내역을 확인할 수 있습니다. 
						</div>
						<button type="button" class="btn shortcut" onclick="location.href='${pageContext.request.contextPath}/mypage/mypayment/main';">
							바로가기 >
						</button>
					</div>
				</div>	
	
				<div class="row">
					<div class="sbox">
						<div class="stitle">
							나의 쿠폰
						</div>
						<div class="scontent">
							MOUMI 이벤트를 통해 얻은 쿠폰을 <br>확인할 수 있습니다.<br> &nbsp;
						</div>
						<button type="button" class="btn shortcut" onclick="location.href='${pageContext.request.contextPath}/mypage/mycoupon/mycoupon';">
							바로가기 >
						</button>
					</div>
					
					<div class="sbox">
						<div class="stitle">
							나의 활동 내역
						</div>
						<div class="scontent">
							MOUMI에서 작성한 글과 댓글을 <br>확인, 삭제할 수 있습니다.<br> &nbsp;
						</div>
						<button type="button" class="btn shortcut" onclick="location.href='${pageContext.request.contextPath}/mypage/myhistory/main';">
							바로가기 >
						</button>
					</div>	
				
					<div class="sbox">
						<div class="stitle">
							관심 글
						</div>
						<div class="scontent">
							MOUMI에서 좋아요한 글과 <br> 찜한 채용공고를 확인할 수 있습니다.
						</div>
						<button type="button" class="btn shortcut" onclick="location.href='${pageContext.request.contextPath}/mypage/mypick/main';">
							바로가기 >
						</button>
					</div>
				</div>	
			</div>	
			
		</div>
	</div>
</div>

