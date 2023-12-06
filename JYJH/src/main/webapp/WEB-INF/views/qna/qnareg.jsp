<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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

.menu-icon:hover {
	color: black;
}

.menu-container {
	display: none;
	position: fixed;
	top: 100px;
	left: 0;
	width: 20%;
	height: 100%;
	background-color: #f9f9f9;
	z-index: 999;
	background-color: #f9f9f9;
}

.menu-container ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	text-align: center;
}

.menu-container li {
	padding: 15px;
	border-bottom: 1px solid #ddd;
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
	color: #ff6f0f;
}

.menu-container h2:hover {
	color: #ff6f0f;
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



textarea {
	resize: none;
}
</style>
<style>
.reg {
	min-height: 700px;
	margin: 0 auto;
	margin-top: 115px;
	margin-bottom: 20px;
	border-radius: 26px;
	width: 1008px;
}

.reg input[type=button], input[type=submit] {
	background-color: #ff6f0f;
	color: #fff;
	border-radius: 4px;
	border: none;
	cursor: pointer;
}

.reg input[type=button], input[type=submit]:hover {
	background-color: #d55500;
}

.reg-box {
	width: 1008px;
	border-top: 1px solid #00000075;
	border-left: 1px solid #00000075;
	border-right: 1px solid #00000075;
	min-height: 500px;
	margin: 0 auto;
	width: 1008px;
}

.reg-tb {
	border-collapse: collapse;
	width: 100%;
}

.reg-tb tr {
	min-height: 70px;
	border-bottom: 1px solid #00000075;
}

.title, .contents {
	width: 10%;
	text-align: center;
	font-size: 20px;
	background-color: #ff6f0f;
}

.title-text, .contents-text {
	border-left: 1px solid #00000075;
	background-color: #fffcebd4;
}

.title-text {
	padding: 10px;
}

.title-textbox {
	font-size: 20px;
	width: 898px;
	padding: 0px 10px 0px 10px;
}

.contents {
	min-height: 100px;
}

.contents-text {
	padding: 10px;
}

.contents-textbox {
	font-size: 20px;
	padding: 10px;
	width: 900px;
	resize: vertical;
	min-height: 400px;
}

.checklist-title {
	font-size: 20px;
}

.checklist {
	background-color: #fffcebd4;
	position: relative;
	height: 40px;
	border-bottom: none;
	padding-left: 10px;
}

.checklist select {
	width: 140px;
	font-size: 20px;
}

.submit-btn {
	height: 28px;
	position: absolute;
	right: 10px;
	bottom: 7px;
}

.back-btnbox {
	position: relative;
	height: 60px;
}

.back {
	font-size: 18px;
	position: absolute;
	bottom: 21px;
	height: 34px;
	width: 92px;
}
</style>
<script>
	$(document).ready(
			function() {
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
	LoginDTO user = (LoginDTO) session.getAttribute("user");
	LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
	List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
	if (user != null && selectedUser != null) {
		LoginDTO firstSelectedUser = selectedUser;
	%>
	<header>
		<div class="header-logo">
			<div class="menu-icon">&#9776;</div>
			<form action="${path}/homePage">
				<button type="submit">Second Hands</button>
			</form>
		</div>

		<div class="menu-container">
			<ul>
				<%
				if ("admin".equals(selectedUser.getUser_id())) {
				%>
				<li>
					<form action="${path}/admin" method="post">
						<button type="submit">관리자 페이지</button>
					</form>
				</li>
				<%
				}
				%>
				<li><img
					src="<%=firstSelectedUser.getUser_image()%>"
					style="border-radius: 50%; width: 100px; height: 100px;">
					<h2>
						<%
						if (user != null && selectedUser != null) {
						%>
						Welcome,
						<%=firstSelectedUser.getUser_nickname()%>님
					</h2></li>
				<li>
					<form action="${path}/myPage" method="post">
						<input type="hidden" name="user_code"
							value="<%=firstSelectedUser.getUser_code()%>">
						<button type="submit">마이페이지</button>
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
					<form action="${path}/products/add">
						<button type="submit">게시글작성</button>
					</form>
				</li>
				<li>
					<form action="${path}/sellProducts">
						<button type="submit">판매내역</button>
					</form>
				</li>
				<li>
					<form action="${path}/showOrder">
						<button type="submit">주문내역</button>
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
		<div class="header-btn">
			<form action="${path}/scrollHome">
				<button type="submit">중고거래</button>
			</form>
			<form action="${path}/localproductList" method="post">
				<input type="hidden" name="newLocation" value="${detail_loc}" />
				<button type="submit">동네거래</button>
			</form>
		</div>
		<%
		if (user != null && selectedUser != null) {
		%>
		<div class="header-btn2">
			<form action="${path}/logout" method="post">
				<button type="submit">로그아웃</button>
			</form>
		</div>
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

	<div class="reg">
		<div class="reg-box">
			<form action="${path}/qna/reg" method="post">
				<input type="hidden" name="id" value="${id }"> <input
					type="hidden" name="writer" value="${writer }">
				<table class="reg-tb">
					<tr>
						<td class="title"><label>제목</label></td>
						<td class="title-text"><input type="text" name="title"
							id="title" class="title-textbox" placeholder="제목을 입력하세요" required />
						</td>
					</tr>
					<tr>
						<td class="contents"><label>내용</label></td>
						<td class="contents-text"><textarea name="contents"
								id="contents" class="contents-textbox" placeholder="내용을 입력하세요"
								required></textarea></td>
					</tr>
					<tr>
						<td colspan="2" class="checklist"><span
							class="checklist-title">공개설정</span> <select name="check"
							id="check" required>
								<option value="">선택하세요</option>
								<option value="t">공개</option>
								<option value="f">비공개</option>
						</select> <input type="submit" class="submit-btn" value="등록"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="back-btnbox">
			<form action="${path}/qna" method="get">
				<button class="back">목록으로</button>
			</form>
		</div>
	</div>





	<%
	}
	%>

</body>
</html>