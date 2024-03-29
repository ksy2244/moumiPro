<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate.js"></script>
<c:url var="listUrl" value="/board/list">
	<c:if test="${not empty keyword}">
		<c:param name="condition" value="${condition}" />
		<c:param name="keyword" value="${keyword}" />
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener("load",function() {
	let page = ${page};
	let pageSize = ${size}
	let dataCount = ${dataCount};
	let url = "${listUrl}";

	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);

	document.querySelector(".dataCount").innerHTML = dataCount
		+ "개(" + page + "/" + total_page + "페이지)";

	document.querySelector(".page-navigation").innerHTML = dataCount === 0 ? "등록된 게시물이 없습니다."
			: paging;
});
</script>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3>
				<i class="bi bi-chat-dots"></i>&nbsp;&nbsp;브랜드 커뮤니티
			</h3>
		</div>

		<div class="body-main">

			<div class="row board-list-header">
				<div class="col-auto me-auto dataCount"></div>
				<div class="col-auto">&nbsp;</div>
			</div>

			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr>
						<th class="bw-60">번호</th>
						<th>제목</th>
						<th class="bw-100">닉네임</th>
						<th class="bw-100">작성일</th>
						<th class="bw-70">조회수</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<c:url var="url" value="/board/article">
							<c:param name="communityNum" value="${dto.communityNum}" />
							<c:param name="page" value="${page}" />
							<c:if test="${not empty keyword}">
								<c:param name="condition" value="${condition}" />
								<c:param name="keyword" value="${keyword}" />
							</c:if>
						</c:url>
						<tr onclick="location.href='${url}'">
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td class="left">${dto.subject} <c:if
									test="${dto.replyCount!=0}">(${dto.replyCount})</c:if>
							</td>
							<td>${dto.nickName}</td>
							<td>${dto.regDate}</td>
							<td>${dto.hitCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="page-navigation"></div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-success"
						onclick="location.href='${pageContext.request.contextPath}/board/list';">새로고침</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm"
						action="${pageContext.request.contextPath}/board/list"
						method="post">
						<div class="col-auto p-1">
							<select name="condition" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
								<option value="userName"
									${condition=="userName"?"selected='selected'":""}>작성자</option>
								<option value="reg_date"
									${condition=="reg_date"?"selected='selected'":""}>등록일</option>
								<option value="subject"
									${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content"
									${condition=="content"?"selected='selected'":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="keyword" value="${keyword}"
								class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light"
								onclick="searchList()">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-success"
						onclick="location.href='${pageContext.request.contextPath}/board/write';">글올리기</button>
				</div>
			</div>

		</div>
	</div>
</div>