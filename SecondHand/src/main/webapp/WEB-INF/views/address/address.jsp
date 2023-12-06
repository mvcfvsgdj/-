<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script>
	// daum 주소 api 호출
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("member_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("member_addr").value = jibunAddr;
				}
			}
		}).open();
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#member_post {
	width: 400px;
}

#member_addr {
	width: 400px;
}
</style>
</head>
<body>

	<p>카카오(다음) 주소찾기</p>
	<div>Address</div>
	<form id="addressForm" method="post" action="/${path}/addressForm">
		<input id="member_post" name="member_post" type="text"
			placeholder="Zip Code" readonly> <input id="member_addr"
			name="member_addr" type="text" placeholder="Address" readonly>
		<br> <input id="detailed_address" name="detailed_address"
			type="text" placeholder="Detailed Address">
		<button type="button" onclick="findAddr()">주소찾기</button>
		<button type="submit">등록</button>
	</form>
</body>
</html>