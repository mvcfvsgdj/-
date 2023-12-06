<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.sh.kakaologin.domain.KakaoUserDTO"%>
<%@ page import="com.sh.saveUser.domain.UserDTO"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Welcome Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c56a5ac8208747818bdaee7eb60e05ea&libraries=services"></script>


<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
}
/* 헤더 스타일 */
header {
	margin: 0 auto;
	background-color: #ff6f0f; /*  #ff6f0f 메인주황색 색상 ! */
	padding: 10px;
	position: sticky;
	top: 0;
	color: white;
	z-index: 1000;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center; /* 새로 추가된 속성 */
	width: 100%;
	height: 100px;
	box-sizing: border-box;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

h2 {
	margin: 0;
	font-size: 24px; /* 폰트 크기 조정 */
}

.menu-icon {
	order: -1;
	font-size: 24px; /* 폰트 크기 조정 */
	cursor: pointer;
}

/* 버튼 스타일 */
header button {
	margin: 5px;
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
	color: #ff6f0f; /* 호버 시 색상 변경 */
}

.menu-container h2:hover {
	color: #ff6f0f; /* 호버 시 색상 변경 */
}

.main-top {
	background: #fffae0;
	border-bottom: 1px solid #ddd;
	display: flex; /* 자식 요소를 가로로 정렬 */
	justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
	align-items: center; /* 수직 정렬 */
	height: 800px;
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
	margin: 5px 20px -1px 10px;
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

.main-top img {
	max-width: 100%;
	max-height: 100%;
	width: 650px;
	height: 800px;
}

/*         중간          */
.main-middle {
	border-bottom: 1px solid #ddd;
	display: flex; /* 자식 요소를 가로로 정렬 */
	justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
	align-items: center; /* 수직 정렬 */
	height: 800px;
}

.main-middle div {
	width: 50%;
	padding: 20px;
	text-align: start;
}

.main-middle div h1 {
	font-weight: bold;
	font-size: 52px;
}

.main-middle div p {
	font-size: 22px;
	color: grey;
}

.main-middle div a {
	display: inline-block;
	width: 180px;
	height: 25px;
	padding: 15px 20px; /* 텍스트 주변의 여백을 늘림 */
	margin: 10px; /* 각 링크 간의 간격을 늘림 */
	background-color: #ff6f0f; /* #ff6f0f = 주황색 배경 */
	color: white; /* 흰 글씨 */
	font-size: 18px;
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	text-decoration: none;
	font-weight: bold; /* 텍스트를 두껍게 설정 */
	transition: background-color 0.3s, color 0.3s;
}

.main-middle div a:hover {
	background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
	color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}

.main-middle img {
	margin: 100px;
	max-width: 100%;
	max-height: 100%;
	width: 400px;
	height: 500px;
}

.main-middle div form {
	margin-top: 10px; /* 필요한 여백 조정 */
}

.main-middle div form button {
	background-color: #ff6f0f;
	color: white;
	padding: 15px 20px;
	border: none;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

#loginAlertButton1 {
	background-color: #ff6f0f;
	color: white;
	padding: 15px 20px;
	border: none;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

#loginAlertButton1:hover {
	background-color: #d55500;
	color: white;
}

.main-middle div form button:hover {
	background-color: #d55500;
	color: white;
}

.mid-title {
	font-weight: bold;
	color: #ff6f0f; /* 주황색으로 변경 */
}

/* 메인 3 */
.column-wrapper {
	display: flex;
}

.column img {
	margin: 20px;
	width: 156px;
}

.column {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-evenly;
	margin-left: 180px;
}

.main3 {
	border-bottom: 1px solid #ddd;
	color: black;
	height: 500px;
}

.main4 {
	border-bottom: 1px solid #ddd;
	color: red;
	height: 500px;
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

/* 모달 스타일 */
#find-me {
	margin-top: 520px;
	margin-right: 440px;
}

#find-me1 {
	margin-top: 4px;
	margin-right: 440px;
}

.modal {
	display: none; /* 기본적으로 숨겨진 상태로 시작 */
	position: fixed; /* 고정 위치 */
	z-index: 1; /* 모달 위에 다른 요소가 올라오지 않도록 설정 */
	left: 0;
	top: 0;
	width: 100%; /* 너비 100% */
	height: 100%; /* 높이 100% */
	overflow: auto; /* 콘텐츠가 너무 길어질 경우 스크롤 가능하도록 설정 */
	background-color: rgba(0, 0, 0, 0.4); /* 반투명한 검정 배경색 */
}

#status {
	font-size: 30px;
	margin-top: 10px;
	font-weight: 900;
	margin-bottom: 15px;
}

.modal-content {
	border-radius: 12px;
	background-color: #fefefe;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	border: 1px solid #888;
	width: 600px;
	height: 600px;
	text-align: center;
	color: black;
}

#new-location {
	font-weight: bold;
}

.localsubBtn {
	position: fixed;
	bottom: 7px;
	right: 285px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	margin-top: 15px;
}

.localsubBtn:hover {
	background-color: #d55500;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
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
               }, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
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
					<form action="${path}/chattingList" method="post">
						<input type="hidden" name="buy_code" placeholder="채팅 코드 입력"
							value="<%=firstSelectedUser.getUser_code()%>">
						<button type="submit">채팅 ${fn:length(chatList)} 개</button>


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
        document.getElementById("localTransactionButton").addEventListener("click", function(e) {
            var newLocationValue = document.getElementsByName("newLocation")[0].value;
            if (newLocationValue.trim() === "") {
                e.preventDefault(); // 폼 전송을 막음
                alert("동네인증을 먼저 진행해주세요.");
                // 여기에 동네인증 관련 코드 추가
            }
        });
    </script>
		<%
		} else {
		%>
		<button id="loginAlertButton" type="button">동네거래</button>
		<script>
        document.getElementById("loginAlertButton").addEventListener("click", function() {
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
		<form id="location_form" method="post" action="location_form">
			<!-- 모달요소 -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close" onclick="closeModal()">&times;</span>

					<div id="modal-content"></div>
					<input class="localsubBtn" type="submit" value="동네 인증"
						id="submit-btn" disabled />
				</div>
			</div>

			<button id="find-me">동네인증</button>
			<br />
			<p id="status"></p>
			<a id="map-link" target="_blank"></a>
			<div id="map" style="width: 500px; height: 500px; margin-left: 50px"></div>
			<input type="hidden" id="location-input" name="newLocation"
				value="${detail_loc}" />
		</form>
		<%
		} else {
		%>
		<button id="find-me1">동네인증</button>
		<script>
         document.getElementById("find-me1").addEventListener("click", function() {
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

	<!-- Your page content here -->
	<div class="main-top">
		<div>
			<h1>
				당신 근처의<br> 지역 생활 커뮤니티
			</h1>
			<p>
				동네라서 가능한 모든 것<br> 당근에서 가까운 이웃과 함께해요.
			</p>
			<a class="link1" href="https://github.com/mvcfvsgdj/SecondHandPrj">더
				보기</a> <a class="link2"
				href="https://dbdiagram.io/d/653b74c9ffbf5169f092c009">알아보기</a>
			<%
			if (user != null && selectedUser != null) {
				LoginDTO firstSelectedUser = selectedUser;
			%>

			<%
			} else {
			%><p>지금 저희와 함께하세요.</p>
			<form id="saveForm" method="post" action="${path}/saveForm">
				<a class="link2" href="${path}/shSaveUser">회원가입</a>
			</form>

			<%
			}
			%>


		</div>
		<div>
			<img
				src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/rebranded-image-top-e765d561ee9df7f5ab897f622b8b5a35aaa70314f734e097ea70e6c83bdd73f1.webp"
				alt="Image">
		</div>
	</div>

	<div class="main-middle">

		<div>
			<img id="likeImg" src="${path}/resources/product/sample.png">

		</div>

		<div>
			<span class="mid-title">중고거래</span>
			<h1>
				믿을만한<br> 이웃 간 중고거래
			</h1>
			<p>
				동네 주민들과 가깝고 따뜻한 거래를<br> 지금 경험해보세요.
			</p>

			<%
			if (user != null && selectedUser != null) {
			%>
			<form action="${path}/localproductList" method="post">
				<input type="hidden" name="newLocation" value="${detail_loc}" />
				<button id="localTransactionButton1" type="submit">동네거래</button>
			</form>
			<script>
    document.getElementById("localTransactionButton1").addEventListener("click", function(e) {
        var newLocationValue = document.getElementsByName("newLocation")[0].value;
        if (newLocationValue.trim() === "") {
            e.preventDefault(); // 폼 전송을 막음
            alert("동네인증을 먼저 진행해주세요.");
            // 여기에 동네인증 관련 코드 추가
        }
    });
</script>
			<%
			} else {
			%>
			<button id="loginAlertButton1" type="button"
				onclick="redirectToLogin()">동네거래</button>
			<script>
    function redirectToLogin() {
        alert("로그인이 필요한 서비스입니다.");
        window.location.href = "${path}/login";
    }
</script>
			<%
			}
			%>
			<form action="${path}/scrollHome">
				<button type="submit">중고거래</button>
			</form>

		</div>

	</div>



	<button id="myBtn" title="Go to top">Top</button>
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





	<script>
      function success(position) {
    	// 현재 위치의 위도와 경도 추출
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        
   	    // 현재 위치 상태 표시
        const status = document.querySelector("#status");
        // 맵 링크 초기화	
   	    const mapLink = document.querySelector("#map-link");

        status.textContent =
          "동네 인증";

        mapLink.href =
          "";
        mapLink.textContent =
           "";
        // Kakao Maps API를 사용하여 현재 위치를 지도에 표시
        var mapContainer = document.getElementById("map"),
          mapOption = {
            center: new kakao.maps.LatLng(latitude, longitude),
         // 지도 크기 레벨 지정
            level: 3,
          };

        var map = new kakao.maps.Map(mapContainer, mapOption);
		// 카카오 맵 api 마커 부분
        var markerPosition = new kakao.maps.LatLng(latitude, longitude);

        var marker = new kakao.maps.Marker({
          position: markerPosition,
        });

        marker.setMap(map);
        var geocoder = new kakao.maps.services.Geocoder();

        var infowindow = new kakao.maps.InfoWindow({ zindex: 1 });
        // 지도 클릭 시 위치 정보 확인
        kakao.maps.event.addListener(map, "click", function (mouseEvent) {
          searchDetailAddrFromCoords(
            mouseEvent.latLng,
            function (result, status) {
              if (status === kakao.maps.services.Status.OK) {
            	// 클릭한 위치의 주소 정보 가져오기
            	  var detailAddr = !!result[0].road_address
                  ? "<div>도로명주소 : " +
                    result[0].road_address.address_name +
                    "</div>"
                  : "";
                detailAddr +=
                  "<div>지번 주소 : " +
                  result[0].address.address_name +
                  "</div>";
               // 정보를 마커와 인포윈도우를 통해 지도 상에 표시
                var content =
                  '<div class="bAddr">' +
                  '<span class="title">현재 주소정보</span>' +
                  detailAddr +
                  "</div>";

                marker.setPosition(mouseEvent.latLng);
                marker.setMap(map);

                infowindow.setContent(content);
                infowindow.open(map, marker);
              }
            }
          );
        });
		
     // 모달에 위치 정보 표시
        kakao.maps.event.addListener(map, "click", function (mouseEvent) {
             const newLatitude = mouseEvent.latLng.getLat();
             const newLongitude = mouseEvent.latLng.getLng();

             const newLocation = checkLocation(newLatitude, newLongitude);
             // 콘솔에 새로운 위치 정보 로깅	
             console.log("New location:", newLocation);

             const modalContent = document.getElementById("modal-content");
             let newLocationElement = modalContent.querySelector("#new-location");
             if (!newLocationElement) {
            	 // 새로운 위치 정보 엘리먼트 생성
            	 newLocationElement = document.createElement("div");
               newLocationElement.id = "new-location";
               modalContent.appendChild(newLocationElement);
             }

             if (typeof newLocation === "object" && Object.keys(newLocation).length !== 0) {
            	   // 새로운 위치가 확인되면 모달에 표시
            	 const detailLoc = newLocation.detail_loc;
               newLocationElement.textContent =
                 "인증되었습니다. 현재위치:" +
                 newLocation.locCode +
                 " - " +
                 newLocation.detail_loc +
                 ". 클릭한 위치의 위도는 " +
                 newLatitude +
                 "이고, 경도는 " +
                 newLongitude +
                 "입니다.";
            // 새로운 위치 값을 입력란에 할당
               document.getElementById("location-input").value = newLocation.locCode + " - " + newLocation.detail_loc;
             } else {
            	 // 새로운 위치가 확인되지 않으면 콘솔에 로그 출력
               console.log("New location:", newLocation);
               newLocationElement.textContent = newLocation;
               // 새로운 위치 값을 입력란에 할당
               document.getElementById("location-input").value = newLocation;
             }
           });
        // 지도 이동 시 중앙 위치 정보 표시
        kakao.maps.event.addListener(map, "idle", function () {
          searchAddrFromCoords(map.getCenter(), displayCenterInfo);
        });
        // 좌표를 이용하여 주소를 검색하는 함수
        function searchAddrFromCoords(coords, callback) {
          geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
        }
        // 좌표를 이용하여 상세한 주소 정보를 검색하는 함수
        function searchDetailAddrFromCoords(coords, callback) {
          geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }
		
    	 // 검색 결과를 받아와서 처리하는 함수
        function displayCenterInfo(result, status) {
          if (status === kakao.maps.services.Status.OK) {
        	  // 중심 위치 주소를 표시할 요소
            var infoDiv = document.getElementById("centerAddr");

          }
        }
      }
      // 현재 위치 찾기 오류 처리
      function error() {
        const status = document.querySelector("#status");
        status.textContent = "확인되지 않은 위치입니다.";
      }
		
      // Geolocation API를 통해 현재 위치 찾기
      function geoFindMe() {
        const status = document.querySelector("#status");
        const mapLink = document.querySelector("#map-link");

        mapLink.href = "";
        mapLink.textContent = "";

        if (!navigator.geolocation) {
       	// Geolocation API가 지원되지 않는 경우
          status.textContent = "";
        } else {
        // Geolocation API를 통해 현재 위치 찾기
          status.textContent = "";
          navigator.geolocation.getCurrentPosition(success, error);
        }
      }
		
      
   // 두 지점 간의 거리 계산 (Haversine 공식 사용)
      function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
        const R = 6371; // 지구의 반지름 (단위: km
        const dLat = deg2rad(lat2 - lat1);
        const dLon = deg2rad(lon2 - lon1);
        const a =
          Math.sin(dLat / 2) * Math.sin(dLat / 2) +
          Math.cos(deg2rad(lat1)) *
            Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        const d = R * c; // 두 지점 간의 거리 (단위: km)
        return d;
      }
   // 각도를 라디안(호도법)으로 변환
      function deg2rad(deg) {
        return deg * (Math.PI / 180);
      }
   // 현재 위치 주변의 가까운 위치 찾기 및 사용자에게 선택지 제공	
      function checkLocation(latitude, longitude) {
        let minDistance = Infinity;
        let closestLocations = [];
        const locationsWithinRange = [];
        const locations = [
          // 서울시
          {
            locCode: "서울시",
            detail_loc: "강남구",
            latitude: 37.5172,
            longitude: 127.0473,
          },
          {
            locCode: "서울시",
            detail_loc: "강서구",
            latitude: 37.5509,
            longitude: 126.8497,
          },
          {
            locCode: "서울시",
            detail_loc: "강동구",
            latitude: 37.5618,
            longitude: 127.0371,
          },
          {
            locCode: "서울시",
            detail_loc: "강북구",
            latitude: 37.646995,
            longitude: 127.014716,
          },
          {
            locCode: "서울시",
            detail_loc: "관악구",
            latitude: 37.4782,
            longitude: 126.9517,
          },
          {
            locCode: "서울시",
            detail_loc: "광진구",
            latitude: 37.5485,
            longitude: 127.0859,
          },
          {
            locCode: "서울시",
            detail_loc: "구로구",
            latitude: 37.4952,
            longitude: 126.8581,
          },
          {
            locCode: "서울시",
            detail_loc: "금천구",
            latitude: 37.4573,
            longitude: 126.9019,
          },
          {
            locCode: "서울시",
            detail_loc: "노원구",
            latitude: 37.6542,
            longitude: 127.0568,
          },
          {
            locCode: "서울시",
            detail_loc: "도봉구",
            latitude: 37.6688,
            longitude: 127.0471,
          },
          {
            locCode: "서울시",
            detail_loc: "동대문구",
            latitude: 37.5812,
            longitude: 127.0547,
          },
          {
            locCode: "서울시",
            detail_loc: "동작구",
            latitude: 37.4964,
            longitude: 126.9443,
          },
          {
            locCode: "서울시",
            detail_loc: "마포구",
            latitude: 37.5665,
            longitude: 126.9018,
          },
          {
            locCode: "서울시",
            detail_loc: "서대문구",
            latitude: 37.5791,
            longitude: 126.9368,
          },
          {
            locCode: "서울시",
            detail_loc: "서초구",
            latitude: 37.4837,
            longitude: 127.0324,
          },
          {
            locCode: "서울시",
            detail_loc: "성동구",
            latitude: 37.5635,
            longitude: 127.0365,
          },
          {
            locCode: "서울시",
            detail_loc: "성북구",
            latitude: 37.6066,
            longitude: 127.0237,
          },
          {
            locCode: "서울시",
            detail_loc: "송파구",
            latitude: 37.5145,
            longitude: 127.1058,
          },
          {
            locCode: "서울시",
            detail_loc: "양천구",
            latitude: 37.5169,
            longitude: 126.866,
          },
          {
            locCode: "서울시",
            detail_loc: "영등포구",
            latitude: 37.5255,
            longitude: 126.8974,
          },
          {
            locCode: "서울시",
            detail_loc: "용산구",
            latitude: 37.5326,
            longitude: 126.9905,
          },
          {
            locCode: "서울시",
            detail_loc: "은평구",
            latitude: 37.6171,
            longitude: 126.928,
          },
          {
            locCode: "서울시",
            detail_loc: "종로구",
            latitude: 37.5704,
            longitude: 126.9922,
          },
          {
            locCode: "서울시",
            detail_loc: "중구",
            latitude: 37.5642,
            longitude: 126.9975,
          },
          {
            locCode: "서울시",
            detail_loc: "중랑구",
            latitude: 37.6066,
            longitude: 127.0927,
          },

          // 제주도
          {
            locCode: "제주도",
            detail_loc: "제주시",
            latitude: 33.4996,
            longitude: 126.5312,
          },
          {
            locCode: "제주도",
            detail_loc: "서귀포시",
            latitude: 33.2542,
            longitude: 126.5603,
          },

          // 경기도
          {
            locCode: "경기도",
            detail_loc: "수원",
            latitude: 37.2636,
            longitude: 127.0286,
          },
          {
            locCode: "경기도",
            detail_loc: "성남",
            latitude: 37.4386,
            longitude: 127.1378,
          },
          {
            locCode: "경기도",
            detail_loc: "용인",
            latitude: 37.241086,
            longitude: 127.177555,
          },
          {
            locCode: "경기도",
            detail_loc: "부천",
            latitude: 37.5032,
            longitude: 126.7667,
          },
          {
            locCode: "경기도",
            detail_loc: "안산",
            latitude: 37.3217,
            longitude: 126.8309,
          },
          {
            locCode: "경기도",
            detail_loc: "고양",
            latitude: 37.658,
            longitude: 126.8326,
          },
          {
            locCode: "경기도",
            detail_loc: "의정부",
            latitude: 37.7437,
            longitude: 127.0413,
          },
          {
            locCode: "경기도",
            detail_loc: "광명",
            latitude: 37.4794,
            longitude: 126.8646,
          },

          // 충청도
          {
            locCode: "충청도",
            detail_loc: "대전",
            latitude: 36.3504,
            longitude: 127.3845,
          },
          {
            locCode: "충청도",
            detail_loc: "천안",
            latitude: 36.8151,
            longitude: 127.1135,
          },
          {
            locCode: "충청도",
            detail_loc: "아산",
            latitude: 36.7926,
            longitude: 127.0018,
          },
          {
            locCode: "충청도",
            detail_loc: "공주",
            latitude: 36.5633,
            longitude: 127.2564,
          },
          {
            locCode: "충청도",
            detail_loc: "논산",
            latitude: 36.1977,
            longitude: 127.1002,
          },
          {
            locCode: "충청도",
            detail_loc: "보령",
            latitude: 36.3494,
            longitude: 126.6032,
          },
          {
            locCode: "충청도",
            detail_loc: "서산",
            latitude: 36.7763,
            longitude: 126.4509,
          },

          // 경상도
          {
            locCode: "경상도",
            detail_loc: "부산",
            latitude: 35.1796,
            longitude: 129.0756,
          },
          {
            locCode: "경상도",
            detail_loc: "대구",
            latitude: 35.8714,
            longitude: 128.6014,
          },
          {
            locCode: "경상도",
            detail_loc: "울산",
            latitude: 35.5384,
            longitude: 129.3114,
          },
          {
            locCode: "경상도",
            detail_loc: "창원",
            latitude: 35.2322,
            longitude: 128.6811,
          },
          {
            locCode: "경상도",
            detail_loc: "포항",
            latitude: 36.0199,
            longitude: 129.341,
          },
          {
            locCode: "경상도",
            detail_loc: "진주",
            latitude: 35.1795,
            longitude: 128.1076,
          },
          {
            locCode: "경상도",
            detail_loc: "김해",
            latitude: 35.2282,
            longitude: 128.8812,
          },

          // 전라도
          {
            locCode: "전라도",
            detail_loc: "광주",
            latitude: 35.1595,
            longitude: 126.8526,
          },
          {
            locCode: "전라도",
            detail_loc: "전주",
            latitude: 35.8468,
            longitude: 127.1297,
          },
          {
            locCode: "전라도",
            detail_loc: "목포",
            latitude: 34.8124,
            longitude: 126.3922,
          },
          {
            locCode: "전라도",
            detail_loc: "순천",
            latitude: 34.9477,
            longitude: 127.5047,
          },
          {
            locCode: "전라도",
            detail_loc: "여수",
            latitude: 34.7604,
            longitude: 127.6622,
          },
          {
            locCode: "전라도",
            detail_loc: "나주",
            latitude: 35.0128,
            longitude: 126.7193,
          },
          {
            locCode: "전라도",
            detail_loc: "군산",
            latitude: 35.9756,
            longitude: 126.945,
          },

          // 강원도
          {
            locCode: "강원도",
            detail_loc: "춘천",
            latitude: 37.8856,
            longitude: 127.7342,
          },
          {
            locCode: "강원도",
            detail_loc: "원주",
            latitude: 37.3447,
            longitude: 127.9209,
          },
          {
            locCode: "강원도",
            detail_loc: "강릉",
            latitude: 37.7519,
            longitude: 128.876,
          },
          {
            locCode: "강원도",
            detail_loc: "속초",
            latitude: 38.207,
            longitude: 128.591,
          },
          {
            locCode: "강원도",
            detail_loc: "동해",
            latitude: 37.7499,
            longitude: 129.3328,
          },
          {
            locCode: "강원도",
            detail_loc: "태백",
            latitude: 37.1665,
            longitude: 128.9886,
          },
          {
            locCode: "강원도",
            detail_loc: "삼척",
            latitude: 37.4449,
            longitude: 129.165,
          },
        ];

        const desiredRange = 5; // 변경하고자 하는 거리 범위 (단위: km)

        for (let location of locations) {
        	  // 각 위치에 대한 반복문 시작

        	  // 해당 위치의 locCode를 콘솔에 출력
        	  console.log("location" + location.locCode);

        	  // 현재 위치와 대상 위치 간의 거리 계산
        	  const distance = getDistanceFromLatLonInKm(
        	    latitude,
        	    longitude,
        	    location.latitude,
        	    location.longitude
        	  );

        	  // 대상 위치가 사용자가 지정한 범위 이내에 있다면
        	  if (distance <= desiredRange) {
        	    // 해당 위치를 범위 내의 위치 배열에 추가
        	    locationsWithinRange.push(location);
        	  }

        	  // 최소 거리 갱신 처리
        	  if (distance < minDistance) {
        	    // 최소 거리를 처음으로 갱신하는 경우
        	    minDistance = distance;
        	    closestLocations = [location];
        	  } else if (distance === minDistance) {
        	    // 최소 거리와 동일한 거리인 경우, 가장 가까운 위치 배열에 추가
        	    closestLocations.push(location);
        	  }
        	}
        
        
        
        if (locationsWithinRange.length > 0) {
            if (locationsWithinRange.length === 1) {
            	  // 주변에 하나의 위치가 있는 경우
                return locationsWithinRange[0].detail_loc;
            } else {
            	 // 여러 위치가 주변에 있는 경우 사용자에게 선택지 제공
                let userChoice;
                do {
                    userChoice = prompt(
                        "어디에서 거래할까요? (근방 " + desiredRange + "km 지역) \n " +
                        locationsWithinRange.map((loc, index) => (index + 1) + "." + (loc.locCode + "-" + loc.detail_loc)).join('\n')
                    );

                    // 숫자 입력 여부 및 범위 확인
                    if (!/^\d+$/.test(userChoice) || userChoice <= 0 || userChoice > locationsWithinRange.length) {
                        alert("올바른 숫자를 입력해주세요.");
                    }
                } while (!/^\d+$/.test(userChoice) || userChoice <= 0 || userChoice > locationsWithinRange.length);

                userChoice = parseInt(userChoice);

                console.log(locationsWithinRange[userChoice - 1].detail_loc);
                return locationsWithinRange[userChoice - 1].detail_loc;
            }
        }

        return "";
      }

      document.querySelector("#find-me").addEventListener("click", geoFindMe);
     
    </script>

	<script>
      // 모달 열기
      function openModal() {
        document.getElementById("myModal").style.display = "block";
      }

      // 모달 닫기
      function closeModal() {
        document.getElementById("myModal").style.display = "none";
      }

      // "Show my location" 버튼 클릭 시 모달 열기
      document.getElementById("find-me").addEventListener("click", function () {
        const statusContent = document.getElementById("status").outerHTML;
        const mapLinkContent = document.getElementById("map-link").outerHTML;
        const mapContent = document.getElementById("map").outerHTML;

        const content = statusContent + mapLinkContent + mapContent;
        document.getElementById("modal-content").innerHTML = content;
        openModal();
        geoFindMe();
      });
    </script>


	<script>
    const findMeButton = document.getElementById('find-me');
    const submitButton = document.getElementById('submit-btn');
    const locationInput = document.getElementById('location-input');
    const form = document.getElementById('location_form');

    findMeButton.addEventListener('click', getLocation);

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            status.textContent = 'Geolocation is not supported by this browser.';
        }
    }

    function showPosition(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;

        // checkLocation 함수를 통해 detail_loc 값을 가져옴
        const newLocation = checkLocation(latitude, longitude);

        // newLocation이 문자열이 아니라면 객체로 간주하고 detail_loc 값을 가져옴
        const detailLoc = typeof newLocation === 'object' ? newLocation.detail_loc : newLocation;

        // location-input의 값을 detail_loc로 설정
        locationInput.value = detailLoc;

        // 필드가 채워져 있으면 버튼 활성화
        submitButton.disabled = !detailLoc;
        
        // 제출 버튼이 비활성화된 경우 폼 제출 방지
        if (submitButton.disabled) {
            event.preventDefault();
        }
    }

    form.addEventListener('submit', (event) => {
        // 필드를 선택하지 않은 경우 폼 제출 방지
        if (submitButton.disabled) {
           
            event.preventDefault();
        }
    });
</script>




</body>
</html>