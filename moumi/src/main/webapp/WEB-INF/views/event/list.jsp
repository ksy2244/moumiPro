<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="container">
		<div class="body-container">
			<div class="body-title">

				<h2 style="margin-top: 10px;">
					<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;MOUMI 이벤트 
				</h2>
			</div>

			<div class="body-main">
				<form name="listForm" method="post">
					<div class="row board-list-header"></div>
					<div class="row">
						<c:forEach var="dto" items="${list}" varStatus="status">
							<div class="col-lg-3 col-sm-3">
								<div class="card" style="width: 18rem;" onclick="location.href='${pageContext.request.contextPath}/event/article?&eventNum=${dto.eventNum}'">
									<img style="height: 280px; width: 285px;" src="${pageContext.request.contextPath}/uploads/event/${dto.thumbnail}"/>
									<div class="card-body">
										<p class="card-text">${dto.subject}<br>${dto.startDate} ~ ${dto.endDate}</p>
										
									</div>
								</div>
								<br>
							</div>
						</c:forEach>
					</div>
				</form>
			</div>
		</div>
	</div>