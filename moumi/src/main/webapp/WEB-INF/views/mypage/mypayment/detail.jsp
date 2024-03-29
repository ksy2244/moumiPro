<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

.mypayment-table {
	width: 772px;
}

.fw-bold {
	color: #198754;
	font-weight: bold;
}

thead {
	border-top: 1px solid green;
	text-align: center;
	color: green;
}

tbody {
	border-bottom: 1px solid green;
}

th, td {
	margin: 35px 25px;
}

</style>



<c:choose>
	<c:when test="${detail.size() > 0 }">

		<table class="mypayment-table">
			<thead class="fw-bold">
				<tr>
					<th>결제번호</th>
					<th>이용권</th>
					<th colspan="2">결제일</th>
					<th colspan="3">사용 기간 안내</th>
				</tr>
			</thead>

			<tbody class="text-center">
				<c:forEach var="dto" items="${detail}" varStatus="status">
					<tr class="paymentDetail-table-tr">
						<td colspan="1">${dto.paymentNum}</td>
						<td colspan="1">${dto.subject}</td>
						<td colspan="4"><span style="color: #DC3545;">${dto.payDate}</span></td>
						<td colspan="1">${dto.payDate}&nbsp;<br>~&nbsp;${dto.endDate}</td>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
	<c:otherwise>구매하신 이용권이 없습니다.</c:otherwise>
</c:choose>

<p class="text-end p-2 fw-bold">전체 
	<span style="color: green" >${dataCount}</span>건
</p>
<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>





