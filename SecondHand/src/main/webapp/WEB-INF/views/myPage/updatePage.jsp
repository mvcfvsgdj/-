<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style>
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

.main-top {
	background: #fffae0;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px; /* 추가된 부분 */
}

.main-top div {
	
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
	padding: 15px 20px;
	margin: 10px;
	background-color: #ff6f0f;
	color: white;
	font-size: 18px;
	border-radius: 10px;
	text-decoration: none;
	font-weight: bold;
	transition: background-color 0.3s, color 0.3s;
	margin: 5px 20px -1px 10px;
}

.main-top div a:hover {
	background-color: #d55500;
	color: white;
}

.main-top-form {
	max-width: 100%; /* 수정 */
	margin: 0 auto; /* 추가 */
	height: 800px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.main-top-form label, .main-top-form input {
	display: block;
	margin-bottom: 15px;
}

.main-top-form input[type="checkbox"], .main-top-form button {
	display: inline-block;
	margin-top: 10px;
}

#saveForm {
	box-shadow: 0px 0px 5px #ccc;
	margin: 20px auto;
	/* HEIGHT: 297PX; */
	width: 650px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#saveForm input {
	width: 96%;
	margin: 9px 0px 15px;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.password-input-container {
	display: flex;
	position: relative;
	align-items: center;
}

#showPasswordCheckbox {
	position: absolute;
	top: 32%;
	right: -41%;
	transform: translateY(-50%);
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

#not-modify {
	color: #9f9f9f;
}

#saveForm label, #saveForm input {
	display: block;
	text-align: left; /* 왼쪽 정렬을 위한 수정 */
	outline: none;
}

#saveForm input[type="checkbox"], #saveForm button {
	display: inline-block;
}

#user_id, #user_pw, #user_pw_confirm, #address, #phone_num, #member_post,
	#member_addr, #detailed_address, #user_birth, #user_nickname {
	width: 100%; /* 입력란의 너비를 100%로 설정 */
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

#address {
	width: calc(100% - 120px); /* 주소 입력란의 너비를 조절하세요. */
}

#verification_code {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1.5px solid #ddd;
	border-radius: 4px;
	color: #333; /* 글자 색상을 추가 */
}

#verification-result {
	margin-top: 10px;
	color: red;
}

#userIdMessage, #passwordValidityMessage, #passwordMatchResult,
	#verification-result, #verification_code {
	font-size: 12px;
	font-weight: bold;
	text-align: center; /* 텍스트를 중앙으로 정렬 */
	margin-top: 10px; /* 위 여백 조절 */
}

#user_pw, #user_pw_confirm, #passwordValidityMessage,
	#passwordMatchResult {
	width: 100%;
}

#member_post {
	width: 400px;
}

#member_addr {
	width: 400px;
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

.button-container {
	display: flex; /* 부모 요소를 플렉스 컨테이너로 만듦 */
	justify-content: space-between; /* 자식 요소 사이의 공간을 최대화하여 우측 정렬 */
	align-items: center; /* 세로 정렬을 가운데로 설정 */
	flex-direction: column;
}

/* 삭제 버튼에 대한 스타일 */
.deleteUBtn {
	background-color: #ff6f0f; /* 적절한 배경색을 지정 */
	color: white; /* 텍스트 색상을 흰색으로 지정 */
	padding: 5px 10px; /* 적절한 여백 설정 */
	border: none; /* 테두리 제거 */
	cursor: pointer; /* 커서 모양을 손가락으로 변경하여 클릭 가능한 상태로 표시 */
}

#deleteForm {
	margin-top: -70px;
	margin-left: 596px;
	margin-bottom: 88px;
}

footer {
	background-color: #333;
	padding: 10px;
	color: white;
	text-align: center;
	bottom: 0;
}

footer a {
	text-decoration: none; /* 텍스트 데코레이션 제거 */
	color: inherit; /* 링크의 색상을 부모 요소로부터 상속 */
}

footer a:hover {
	text-decoration: none; /* 호버 시 텍스트 데코레이션 제거 유지 */
	color: inherit; /* 호버 시 색상을 부모 요소로부터 상속 */
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
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<script>
    $(document).ready(function() {
        //맨위로 올리기
        $("html, body").animate({
            scrollTop : 0
        }, 400);

        // 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
        $("#myBtn").click(function() {
            $("html, body").animate({
                scrollTop : 0
            }, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
        });
        // 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
        $(".menu-icon").click(function(e) {
            e.stopPropagation(); // 햄버거 아이콘을 클릭한 경우, document.body의 클릭 이벤트 전파 방지
            $(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
        });

        // 문서 클릭 이벤트: 메뉴 영역이나 아이콘 외부를 클릭하면 메뉴 숨김
        $(document.body).click(function(e) {
            if (!$(e.target).closest('.menu-container').length && !$(e.target).hasClass('menu-icon')) {
                $(".menu-container").slideUp();
            }
        });
    });
  
</script>


	<%
LoginDTO user = (LoginDTO) session.getAttribute("user");
LoginDTO selectedUserList = (LoginDTO) session.getAttribute("selectedUser");
List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가

    if (user != null && selectedUserList != null) {
        LoginDTO selectedUser = selectedUserList; // Assuming you want the first user in the list
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
				<% if ("admin".equals(selectedUser.getUser_id())) {
%>

				<li>
					<form action="${path}/admin" method="post">
						<button type="submit">관리자 페이지</button>
					</form>
				</li>
				<%
         }
         %>
				<li><img src="${selectedUser.user_image} style="border-radius: 50%; width: 100px; height: 100px;">
					<h2>
						<%
		                  if (user != null && selectedUserList != null) {
		                %>
						<form action="${path}/myPage" method="post">
							<input type="hidden" name="user_code" value="${selectedUser.user_code}">
							<button type="submit">
								Welcome, ${selectedUser.user_nickname}님
							</button>
						</form>
					</h2>
				</li>
				<li>

					<form action="${path}/myPage" method="post">
						<input type="hidden" name="user_code"
							value="<%=selectedUser.getUser_code()%>">
						<button type="submit">마이페이지</button>
					</form>

				</li>
				<li>
					<form action="${path}/chattingList" method="post">
						<input type="hidden" name="buy_code" placeholder="채팅 코드 입력"
							value="<%=selectedUser.getUser_code()%>">
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

		<form action="${path}/scrollHome">
			<button type="submit">중고거래</button>
		</form>
		<form action="${path}/localproductList" method="post">
			<input type="hidden" name="newLocation" value="${detail_loc}" />
			<button type="submit">동네거래</button>
		</form>
		<%
      if (user != null && selectedUserList != null) {
      %>
		<form action="${path}/logout" method="post">
			<button type="submit">로그아웃</button>
		</form>
		<%
      } else {
      %>
		<form action="${path}/login">
			<button type="submit">가입 및 로그인</button>
		</form>
		<%
      }
      %>
	</header>

	<div class="main-top">
		<div class="button-container">
			<form id="saveForm" action="${path}/update" method="post">
				<div style="text-align: center;">
					<!-- Add this div for centering -->
					<h2>
						"
						<%= selectedUser.getUser_nickname() %>
						" 님의 정보수정
					</h2>
				</div>
				<input type="hidden" name="user_code" id="user_code"
					value="<%= selectedUser.getUser_code() %>" required> <input
					type="hidden" name="user_kakao" id="user_kakao"
					value="<%= selectedUser.getUser_kakao() %>" required> <label
					for="user_id">아이디</label> <input id="not-modify" type="text"
					name="user_id" id="user_id"
					value="<%= selectedUser.getUser_id() %>"
					placeholder="<%= selectedUser.getUser_id() %> ( 아이디는 수정할 수 없습니다. )"
					readonly required> <label for="user_password">비밀번호</label>
				<input type="text" name="user_pw" id="user_pw"
					value="<%= selectedUser.getUser_pw() %>" required> <label
					for="user_nickname">닉네임</label> <input type="text"
					name="user_nickname" id="user_nickname"
					value="<%= selectedUser.getUser_nickname() %>" required> <label
					for="address">이메일</label> <input type="text" name="address"
					id="address" value="<%= selectedUser.getAddress() %>" required>
				<label for="user_birth">생년월일</label> <input id="not-modify"
					type="text" name="user_birth" id="user_birth"
					value="<%= selectedUser.getUser_birth() %>"
					placeholder="<%= selectedUser.getUser_birth() %> ( 생년월일은 수정할 수 없습니다. )"
					readonly> <label for="phone_num">휴대폰 번호</label> <input
					type="text" name="phone_num" id="phone_num"
					value="<%= selectedUser.getPhone_num() %>" required>
				<!-- 주소 -->
				<label for="member_post">우편번호</label> <input type="text"
					name="member_post" id="member_post"
					value="<%= selectedUser.getMember_post() %>" readonly required>

				<label for="member_addr">주소</label> <input type="text"
					name="member_addr" id="member_addr"
					value="<%= selectedUser.getMember_addr() %>" readonly required>

				<button type="button" onclick="findAddr()">주소찾기</button>

				<!-- 주소 -->
				<label for="detailed_address">상세주소</label> <input type="text"
					name="detailed_address" id="detailed_address"
					value="<%= selectedUser.getDetailed_address() %>" required>




				<input type="hidden" name="user_image" id="user_image"
					value="<%= selectedUser.getUser_image() %>" required> <input
					type="hidden" name="user_heat" id="user_heat"
					value="<%= selectedUser.getUser_heat() %>" readonly required>

				<button type="submit">정보수정</button>

			</form>
			<form id="deleteForm" action="${path}/delete" method="post"
				onsubmit="return confirm(' 회원탈퇴를 하시겠습니까?(탈퇴시 모든 게시글은 삭제됩니다)');">
				<input type="hidden" name="user_code"
					value="<%= selectedUser.getUser_code() %>"> <input
					type="hidden" name="user_id"
					value="<%= selectedUser.getUser_id() %>">
				<button class="deleteUBtn" type="submit">회원탈퇴</button>
			</form>





		</div>
		<button id="myBtn" title="Go to top">Top</button>
	</div>


	<%
   }
   %>



	<footer>
		&copy; 2023 에이콘아카데미 최종프로젝트 <br>
		<p>
			<a href="https://github.com/dhdl2389">조장: 김재열</a> | <a
				href="https://github.com/mvcfvsgdj">조원: 김민규 </a> | <a
				href="https://github.com/kevinbj0">조원: 김병진 </a> | <a
				href="https://github.com/LeeJungHoon1">조원: 이정훈 </a> | <a
				href="https://github.com/lepio1999">조원: 허재혁 </a>
		</p>
	</footer>


</body>
</html>