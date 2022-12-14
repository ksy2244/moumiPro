<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p class="text-end p-1 pb-0 fw-bold">나의 이용 내역 </p>
<c:choose>	
	<c:when test="${current.size() > 0}">   
	<table class="table mypayment-table">
		<thead class="fw-bold">
			<tr>
				<th>NO</th>
				<th>이용권</th>
				<th colspan="4">이용 가능 서비스</th>
				<th>사용 기간 안내</th>
			</tr>
		</thead>

		<tbody class="text-center">
			<c:forEach var="dto" items="${current}" varStatus="status">
					<tr class="paymentCurrent-table-tr">
						<td colspan="1">${dto.paymentNum}</td>		
						<td colspan="1">${dto.subject}</td>		
						<td colspan="4">${dto.content}</td>		
						<td colspan="1">${dto.payDate}&nbsp;~&nbsp;${dto.endDate}</td>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
	<c:otherwise>
		구매하신 이용권이 없습니다.
	</c:otherwise>
</c:choose>

<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>





<!-- 엔드 날짜가 오늘보다 적은거 가져오기 -->