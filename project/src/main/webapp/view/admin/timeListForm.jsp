<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>일별 상영 회차 조회</title>
</head>
<body>
	<div class="w3-content w3-padding-64">
		<div style="display:flex; justify-content: space-between; padding-bottom:15px">
			<b style="font-size:18px">'${m.mtitle}'&emsp;상영 회차 정보</b>
		</div>
		<div class="w3-center" style="border: 1px solid #333; border-radius: 10px; padding: 10px;">
			<table class="w3-table">
				<tr>
					<th>상영 날짜</th>
					<th>1회차</th>
					<th>2회차</th>
					<th>3회차</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<tr>
					<th colspan="6"><hr style="margin:0; border-color:#000"></th>
				</tr>
			<c:forEach var="tl" items="${timelist}">
				<tr>
					<td>${tl.dmd}</td>
					<td>${tl.time1}</td>
					<td>${tl.time2}</td>
					<td>${tl.time3}</td>
					<td width="10%"><a href="timeUpdateForm?msno=${m.msno}&dmd=${tl.dmd}" class="btn btn-outline-dark" id="tup">수정</a></td>
					<td width="10%"><a href="timeDeleteForm?msno=${param.msno}&dmd=${tl.dmd}" class="btn btn-dark" id="tde">삭제</a></td>
				</tr>
				<tr>
					<th colspan="6" style="padding:5px 0px"><hr style="margin:0; border-color:#555"></th>
				</tr>
			</c:forEach>
				<%-- 페이지 처리하기 --%>
				<tr>
					<td colspan="6" class="w3-center">
						<c:if test="${pageNum <= 1}">[이전]</c:if>
						<c:if test="${pageNum > 1}">
							<a href="javascript:listsubmit(${pageNum-1})">[이전]</a>
						</c:if> 
						<c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a == pageNum}">[${a}]</c:if>
							<c:if test="${a != pageNum}">
								<a href="javascript:listsubmit(${a})">[${a}]</a>
							</c:if>
						</c:forEach> 
						<c:if test="${pageNum >= maxpage}">[다음]</c:if>
						<c:if test="${pageNum < maxpage}">
								<a href="javascript:listsubmit(${pageNum+1})">[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>
			<form action="timeListForm" method="post" name="tf">
	         	<input type="hidden" name="pageNum" value="1">
	         	<input type="hidden" name="msno" value="${m.msno}">
     		</form>
		</div>
	</div>
	<script type="text/javascript">
    function listsubmit(page) {
       f = document.tf;  //검색 form 태그
       f.pageNum.value = page;
       f.submit();
    }
</script>  
</body>
</html>