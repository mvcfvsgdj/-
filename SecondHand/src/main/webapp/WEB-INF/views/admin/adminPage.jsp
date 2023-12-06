<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.product.domain.ProductDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>Admin Page</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c56a5ac8208747818bdaee7eb60e05ea&libraries=services"></script>


<style>

/* 23.11.10 수정완료 */
body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
}

header {
	margin: 0 auto;
	background-color: #ff6f0f;
	padding: 10px;
	position: sticky;
	top: 0;
	color: white;
	z-index: 1000;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	height: 100px;
	box-sizing: border-box;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

header h2 {
	margin: 0;
	font-size: 24px;
}

.menu-icon {
	justify-content: center;
	align-items: center;
	display: flex;
	order: -1;
	font-size: 24px;
	cursor: pointer;
	margin-right: 20px; /* 햄버거 아이콘과 Second Hands 텍스트 사이의 간격 조절 */
}

/* 버튼 스타일 */
header button {
	margin: 5px 5px; /* 간격을 줄이기 위해 margin 수정 */
	padding: 10px;
	background-color: #ff6f0f;
	font-weight: bold;
	color: white;
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	cursor: pointer;
	/* border-radius: 5px; 모서리 둥글게 */
	transition: background-color 0.3s, color 0.3s;
}

header button:hover {
	background-color: #ff6f0f;
	color: black;
}

header.menu-open {
	flex-direction: column;
	align-items: flex-start;
}

header.menu-open form {
	display: block;
}

header.menu-open h2 {
	margin-top: 10px;
}

.header-logo {
	display: flex;
}

.header-logo h2 {
	font-size: 32px;
}

.header-btn {
	display: flex;
	margin: 0px 0px 0px 0px;
}

header.menu-open {
	flex-direction: column;
	align-items: flex-start;
}

header.menu-open form {
	display: block;
}

header.menu-open h2 {
	margin-top: 10px;
}

/* 햄버거 아이콘을 화면 왼쪽에 고정 */
.menu-icon {
	order: -1;
}

/* 햄버거 아이콘 스타일 */
.menu-icon:hover {
	color: black; /* 마우스를 올렸을 때의 색상 변경 */
}

.menu-container {
	display: none;
	position: fixed;
	top: 100px; /* 헤더 높이에 따라 조정하세요 */
	left: 0;
	width: 20%;
	height: 100%;
	background-color: #f9f9f9;
	z-index: 999;
}

.menu-container ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	text-align: center;
}

.menu-container li {
	padding: 15px;
	border-bottom: 1px solid #ddd; /* 메뉴 항목 간에 경계선 추가 */
}

.menu-container h2 {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	font-size: 18px;
	transition: color 0.3s;
}

.menu-container button {
	color: black;
	background-color: #f9f9f9;
	font-weight: bold;
}

.menu-container Button:hover {
	background-color: #f9f9f9;
	color: #ff6f0f; /* 호버 시 색상 변경 */
}

.menu-container h2:hover {
	color: #ff6f0f; /* 호버 시 색상 변경 */
}

.main-top {
	background: #fffae0;
	height: 2000px;
	/*border: 1px solid black;*/
	display: flex; /* 자식 요소를 가로로 정렬 */
	justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
}

.main-top div {
	width: 50%;
	padding: 20px;
	text-align: center; /* 가운데 정렬 추가 */
}

.main-top div h1 {
	font-weight: bold;
	font-size: 52px;
}

.main-top div p {
	font-size: 22px;
	color: grey;
}

.main-top div a {
	display: inline-block;
	width: 180px;
	height: 25px;
	padding: 15px 20px; /* 텍스트 주변의 여백을 늘림 */
	margin: 10px; /* 각 링크 간의 간격을 늘림 */
	background-color: #ff6f0f; /* 주황색 배경 */
	color: white; /* 흰 글씨 */
	font-size: 18px;
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	text-decoration: none;
	font-weight: bold; /* 텍스트를 두껍게 설정 */
	transition: background-color 0.3s, color 0.3s;
}

.main-top table {
	width: 78%;
	margin: 70px auto;
	margin: 0 auto;
	word-break: break-all;
	border-collapse: collapse;
	background-color: white; /* Set background color to white */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	/* Add a subtle shadow effect */
}

.main-top th, .main-top td {
	width: 150px;
	border: 1px solid #ddd; /* Light gray border color */
	padding: 12px;
	text-align: center;
}

.main-top th {
	background-color: #f2f2f2;
	/* Light gray background color for header cells */
}

.main-top td {
	background-color: #fdfdfd;
	/* Slightly off-white background color for data cells */
}

header.menu-open {
	flex-direction: column;
	align-items: flex-start;
}

header.menu-open form {
	display: block;
}

header.menu-open h2 {
	margin-top: 10px;
}

/* 햄버거 아이콘을 화면 왼쪽에 고정 */
.menu-icon {
	order: -1;
}

.main-top div a:hover {
	background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
	color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}

button {
	padding: 5px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

button:hover {
	background-color: #d55500;
}

button[type="submit"][form="saveForm"] {
	display: block;
	margin: 20px auto; /* 중앙 정렬 및 아래쪽 여백 조절 */
	padding: 10px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

button[type="submit"][form="saveForm"]:hover {
	background-color: #d55500;
}

#sort {
	color: #cfcfcf;
	width: 749px;
	display: block;
	font-size: 18px;
	align-items: center;
	margin: 0px auto;
	font-weight: bold;
}

#sort button {
	margin: 0px 6px 0px 6px;
	padding: 4px;
	font-weight: bold;
	font-size: 18px;
	background-color: white;
	color: black;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

#sort button:hover {
	color: #ff6f0f;;
}

#saveForm form button {
	width: 85px;
}

#saveForm {
	margin: 20px auto;
	box-shadow: 0px 0px 5px #ccc;
	width: 1400px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

#myBtn {
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	border: none;
	outline: none;
	background-color: #ff6f0f;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 10px;
}

#myBtn:hover {
	background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
	color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}
</style>

<script>
	$(document).ready(
			function() {
				//맨위로 올리기
				$("html, body").animate({
					scrollTop : 0
				}, 400);

				// 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
				$("#myBtn").click(function() {
					$("html, body").animate({
						scrollTop : 0
					}, 400); //속도를 여기서는 400ms로 설정
				});

				// 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
				$(".menu-icon").click(function(e) {
					e.stopPropagation(); // 햄버거 아이콘을 클릭한 경우, document.body의 클릭 이벤트 전파 방지
					$(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
				});

				// 문서 클릭 이벤트: 메뉴 영역이나 아이콘 외부를 클릭하면 메뉴 숨김
				$(document.body).click(
						function(e) {
							if (!$(e.target).closest('.menu-container').length
									&& !$(e.target).hasClass('menu-icon')) {
								$(".menu-container").slideUp();
							}
						});
			});
</script>

</head>
<body>

	<%
	List<LoginDTO> userList = (List<LoginDTO>) request.getAttribute("userList");
	List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products"); // 변경된 부분
	%>
	<%
	LoginDTO user = (LoginDTO) session.getAttribute("user");
	LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
	List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
	%>



	<header>
		<form action="${path}/homePage">
			<button type="submit">Second Hands</button>
		</form>
		<div class="menu-icon">&#9776;</div>
		<!-- 햄버거 아이콘 추가 -->
		<div class="menu-container">
			<ul>

				<%
				if (user != null && selectedUser != null) {
					LoginDTO firstSelectedUser = selectedUser;
					if ("admin".equals(firstSelectedUser.getUser_id())) {
				%>

				<%

				%>
				<li>
					<form action="${path}/admin" method="post">
						<button type="submit">관리자 페이지</button>
					</form>
				</li>
				<%
				}
				%>
				<li><img src="${selectedUser.user_image}"
					style="border-radius: 50%; width: 100px; height: 100px;">
					<h2>
						<form action="${path}/myPage" method="post">
							<input type="hidden" name="user_code"
								value="${selectedUser.user_code}">
							<button type="submit">Welcome,
								${selectedUser.user_nickname}님</button>
						</form>
					</h2></li>
				<li>
					<form action="${path}/myPage" method="post">
						<input type="hidden" name="user_code"
							value="<%=firstSelectedUser.getUser_code()%>">
						<button type="submit">마이페이지</button>
					</form>
				</li>
				<li>
					<form action="${path}/sellProducts">
						<button type="submit">판매내역</button>
					</form>
				</li>
				<li>
					<form action="${path}/showOrder">
						<button type="submit">구매내역</button>
					</form>
				</li>
				<li>
					<form action="${path}/chattingList" method="post">
						<input type="hidden" name="buy_code" placeholder="채팅 코드 입력"
							value="<%=firstSelectedUser.getUser_code()%>">
						<button type="submit">채팅 ${fn:length(chatList)} 개</button>


					</form>
				</li>
				<li>
					<form action="${path}/qna">
						<button type="submit">문의하기</button>
					</form>
				</li>
				<li>
					<form action="${path}/logout" method="post">
						<button type="submit">로그아웃</button>
					</form>
				</li>
				<%
				} else {
				%>
				<li><h2>로그인이 필요한 서비스입니다.</h2></li>
				<li>
					<form action="${path}/login">
						<button type="submit">가입 및 로그인</button>
					</form>
				</li>
				<%
				}
				%>
			</ul>
		</div>

		<form action="${path}/scrollHome">
			<button type="submit">중고거래</button>
		</form>


		<%
		if (user != null && selectedUser != null) {
		%>
		<form action="${path}/localproductList" method="post">
			<input type="hidden" name="newLocation" value="${detail_loc}" />
			<button id="localTransactionButton" type="submit">동네거래</button>
		</form>
		<script>
		// 동네인증 연부 확인 로직
			document.getElementById("localTransactionButton").addEventListener(
					"click",
					function(e) {
						var newLocationValue = document
								.getElementsByName("newLocation")[0].value;
						if (newLocationValue.trim() === "") {
							e.preventDefault(); // 폼 전송을 막음
							alert("동네인증을 먼저 진행해주세요.");
							
						}
					});
		</script>
		<%
		} else {
		%>
		<button id="loginAlertButton" type="button">동네거래</button>
		<script>
			document.getElementById("loginAlertButton").addEventListener(
					"click", function() {
						alert("로그인이 필요한 서비스 입니다.");
						window.location.href = "${path}/login";
					});
		</script>
		<%
		}
		%>



		<%
		if (user != null && selectedUser != null) {
		%>
		<!-- 동네 인증 -->




		<%
		} else {
		%>
		<button id="find-me1">동네인증</button>
		<script>
			document.getElementById("find-me1").addEventListener("click",
					function() {
						alert("로그인이 필요한 서비스 입니다.");
						window.location.href = "${path}/login";
					});
		</script>
		<%
		}
		%>



		<%
		if (user != null && selectedUser != null) {
			LoginDTO firstSelectedUser = selectedUser;
		%>
		<form action="${path}/logout" method="post">
			<button type="submit">로그아웃</button>
		</form>
		<%
		} else {
		%>
		<form action="${path}/login">
			<button type="submit">로그인</button>
		</form>
		<%
		}
		%>
	</header>


	<div class="main-top">
		<div id=saveForm>
			<div id="sort">
				<button id="userTableButton">가입한 회원 보기</button>
				|
				<button id="productTableButton">전체 상품 목록 보기</button>
			</div>

			<table border="1" id="userTable">

				<tr>
					<th>회원코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>우편번호</th>
					<th>상세주소</th>
					<th>생년월일</th>

					<th>온도</th>
					<th>관리</th>
				</tr>

				<c:forEach var="user" items="${userList}">
				<!-- 회원 정보 확인 -->
					<tr>
						<td>${user.user_code}</td>
						<td>${user.user_id}</td>
						<td>${user.user_nickname}</td>

						<td>${user.address}</td>
						<td>${user.phone_num}</td>
						<td>${user.member_addr}</td>
						<td>${user.member_post}</td>
						<td>${user.detailed_address}</td>
						<td>${user.user_birth}</td>

						<td>${user.user_heat}</td>
						<td>
							<!-- 관리자인 경우 "관리자" 텍스트를 표시, 아닌 경우 삭제 버튼 표시 --> <c:choose>
								<c:when test="${'admin' eq user.user_id}">
									<span style="font-weight: bold;">관리자 계정</span>
								</c:when>
								<c:otherwise>
									<form method="post" action="${path}/admindelete"
										onsubmit="return confirm('${user.user_nickname}' + ' 님을 회원탈퇴시킵니다.');">
										<input type="hidden" name="user_id" value="${user.user_id}">
										<input type="hidden" name="user_code"
											value="${user.user_code}">
										<button type="submit">회원 탈퇴</button>
									</form>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>



			<table border="1" id="productTable">
				<thead>
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>시간</th>
						<th>작성자</th>
						<th>지역</th>
						<th>가격</th>
						<th>조회수</th>
						<th>관리</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="products" items="${products}">
						<tr>
							<td>[${products.board_cate}]</td>
							<td>${products.board_Title}</td>
							<td>${products.board_Date}</td>
							<td>${products.user_nickname}</td>
							<td>${products.loc_code}/${products.detail_loc}</td>
							<td>${products.board_Price}</td>
							<td>${products.board_Click }</td>
							<td>
								<form action="${path}/products/adminBoardDelete" method="post"
									onsubmit="return confirm(' 게시글 중 '+' ${products.board_Title}' + '을(를) 삭제합니다 .');">
									<input type="hidden" name="boardId"
										value="${products.board_Id}">
									<button type="submit">게시글 삭제</button>
								</form>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<button id="myBtn" title="Go to top">Top</button>

	<script>
		// 페이지 로드 시 실행되는 함수
		$(document).ready(function() {
			// 초기에는 두 번째 표를 숨김
			$("#productTable").hide();

			// 첫 번째 버튼 클릭 시 첫 번째 표 보이고 두 번째 표 숨김
			$("#userTableButton").click(function() {
				$("#userTable").show();
				$("#productTable").hide();
			});

			// 두 번째 버튼 클릭 시 두 번째 표 보이고 첫 번째 표 숨김
			$("#productTableButton").click(function() {
				$("#userTable").hide();
				$("#productTable").show();
			});
		});
	</script>

</body>
</html>