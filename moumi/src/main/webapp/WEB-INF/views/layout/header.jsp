﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<nav class="navbar navbar-expand-lg navbar-green">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
				<img style ="height:35px; width:160px;"src="${pageContext.request.contextPath}/resources/moumi/logo/white.png"/></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
				
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto flex-nowrap">
				
					<li class="nav-item">
						<a class="nav-link" href="#">채널별 분석</a>
					</li>

					<li class="nav-item">
						<a class="nav-link" style="color:#fff" href="#">자유게시판</a>
					</li>
	
					<li class="nav-item">
						<a class="nav-link" style="color:#fff"  href="#">이용권</a>
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" style="color:#fff" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							고객센터
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">공지사항</a></li>
							<li><a class="dropdown-item" href="#">자주 묻는 질문</a></li>
						</ul>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" style="color:#fff"  href="${pageContext.request.contextPath}/recruit/main">채용</a>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" style="color:#fff" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							마이페이지
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">나의 이용 내역</a></li>
							<li><a class="dropdown-item" href="#">개인 정보 관리</a></li>
							<li><a class="dropdown-item" href="#">관심 질문</a></li>
						</ul>
					</li>
					
				</ul>
				
				
			</div>
			
		</div>
	</nav>
	
