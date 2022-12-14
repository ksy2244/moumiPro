<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush mt-2" id="accordionFlush">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="accordion-item" style="border: none;">
				<h2 class="accordion-header mb-1 border" id="flush-heading-${status.index}">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}">
						${dto.subject} <br>
						${dto.regDate}
					</button>
				</h2>
				<div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush">
					<div class="accordion-body" style="background: #ECF4EB; border-radius: 15px;">
						<div class="notice_file" style="text-align: right;">
							파일 : <a href="${pageContext.request.contextPath}/notice/download?fileNum=${dto.noticeFileNum}">${dto.imageFilename}</a>
							(<fmt:formatNumber value="${dto.fileSize/1024}" pattern="0.00" />kb)
						</div>
						
						<div class="row p-2">
							${dto.content} 
						</div>
					</div>
				</div>
			</div>		
		</c:forEach>
	</div>
</c:if>
<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>

<div class="row py-3">
	<div class="col">
		<button type="button" class="btn btn-success" onclick="reloadFaq();">새로고침</button>
	</div>
	<div class="col-6 text-center">
		<form class="row" name="searchForm" method="post">
			<div class="col-auto p-1">
				<select name="condition" id="condition" class="form-select">
					<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
					<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
					<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
				</select>
			</div>
			<div class="col-auto p-1">
				<input type="text" name="keyword" id="keyword" value="${keyword}" class="form-control">
			</div>
			<div class="col-auto p-1">
				<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
			</div>
		</form>
	</div>
</div>
