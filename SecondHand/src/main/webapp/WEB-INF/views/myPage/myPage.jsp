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
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
/* 23.11.10 수정완료 */
body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
	background: #fffae0;
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
	/* border: 1px solid black; */
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: -597px;
	margin-top: 310px;
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

/* 햄버거 아이콘을 화면 왼쪽에 고정 */
.menu-icon {
	order: -1;
}

.user-info {
	display: flex;
	justify-content: center;
}

.user-info-detail {
	display: flex;
	width: 864px;
	position: relative;
	/* border-radius: 8px; */
	border-bottom-right-radius: 8px;
	border-bottom-left-radius: 8px;
	padding: 25px;
	background: white;
	background-color: white;
	border-bottom: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

.user-info-detail button {
	padding: 5px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.user-info-detail button:hover {
	background-color: #d55500;
}

.user_image_detail {
	height: 350px;
	text-align: center;
	background: white;
	border-radius: 8px;
	border: 1px solid #bbbbbb;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/*이미지변경 버튼*/
.modifyBtn {
	margin-left: 15px;
	padding: 5px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	margin-top: 11px;
}

.modifyBtn:hover {
	background-color: #d55500;
}

.originBtn {
	margin-left: 15px;
	padding: 5px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.originBtn:hover {
	background-color: #d55500;
}

.user-info-detail form {
	justify-content: center;
	display: table-caption;
}

.gauge-container table {
	margin: 23px 33px 21px 28px;
	border-collapse: collapse;
	width: 563px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.gauge-container th, .main-top td {
	border: 1px solid #ddd; /* Light gray border color */
	padding: 12px;
	text-align: center;
}

.gauge-container th {
	background-color: #f2f2f2;
}

.gauge-container td {
	background-color: #fdfdfd;
	border-bottom: 1px solid #ddd;
}

/* 게이지 스타일링 추가 */
.gauge-container {
	margin-left: 20px;
	text-align: center;
	width: 617px;
	border-radius: 8px;
	border: 1px solid #bbbbbb;
	background: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.gauge {
	background-color: #ff6f0f; /* 주황색 배경으로 설정 */
	height: 20px;
	width: 0; /* 초기 너비는 0으로 설정 */
	transition: width 1s; /* 너비 변경 시 부드러운 효과를 위한 transition */
	border-radius: 5px; /* 모서리를 둥글게 설정 */
}

.gg {
	height: 20px;
	width: 500px; /* 초기 너비는 0으로 설정 */
	background-color: #d1d0cf;
	border-radius: 5px; /* 모서리를 둥글게 설정 */
	margin: 0px 26px 0px 111px;
	/* padding: 0px; */
	height: 20px;
	width: 400px;
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

.hidden {
	display: none;
}

#line-chart-div {
	margin: 0 auto;
	width: 914px;
	border: 1px solid black;
	height: 703px;
	border-bottom: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-top: 0px;
	text-align: center;
	line-height: 500px;
	background-color: white;
}

.toggleBtnWrap {
	height: 100px;
	align-items: center;
	display: flex;
	justify-content: center;
}

.toggleBtnWrap button {
	width: 458px;
	height: 34px;
	margin-bottom: -66px;
	background: white;
	background-color: white;
	border: none;
	border-top-right-radius: 11px;
	border-top-left-radius: 11px;
	font-weight: bolder;
	/* 상단, 좌측, 우측에 얇은 회색 선 추가 */
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
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

<!-- Google Chart API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Google Charts 라이브러리 로드 완료 후 차트 그리기
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
	
    // 차트 그리기 함수
    function drawChart() {
    	// 서버에서 받아온 사용자 평가 데이터
        var heatData = ${updatedUserData};
        
        // 데이터가 0개인 경우
        if (heatData.length === 0) {
            document.getElementById('line_chart').innerHTML = "최근 평가 내용이 없습니다.";
            return;
        }
		// 차트에 사용할 데이터 구성
        var chartData = [['Index', 'User Heat']];

        // 최근 5개 데이터만 선택
        var startIndex = Math.max(heatData.length - 5, 0);
        heatData = heatData.slice(startIndex);

        for (var i = 0; i < heatData.length; i++) {
        	// 각 데이터의 사용자 평가 온도와 인덱스 텍스트 설정
            var userHeat = parseFloat(heatData[i].user_heat);
            var indexText = getOrdinal(i + 1);
            chartData.push([indexText, userHeat]);
        }
		// Google Charts에서 사용할 데이터로 변환
        var data = google.visualization.arrayToDataTable(chartData);
		
		// 차트 옵션 설정
        var options = {
            title: '최근 온도 변화',
            legend: { position: 'none' },
            series: {
                0: {
                    type: 'line',
                    curveType: 'function'
                }
            },
            annotations: {
                textStyle: {
                    fontSize: 12,
                    color: '#000',
                    auraColor: 'none'
                },
                horizontal: [{
                	// 특정 값을 강조하는 가로선 추가
                    value: 36.5,
                    color: '#ff0000',
                    strokeWidth: 2
                }]
            },
            colors: ['#ff6f0f'],
            width: 914, // 차트 너비 설정
            height: 703  // 차트 높이 설정
        };
		
		// LineChart 객체 생성
        var chart = new google.visualization.LineChart(document.getElementById('line_chart'));
		// 차트 그리기
        chart.draw(data, options);
    }
	
    // 인덱스 텍스트를 반환하는 함수
    function getOrdinal(n) {
        var s = ["펑가 1","평가 2", "평가 3", "평가 4", "평가 5"];
        return s[n - 1] || n;
    }
</script>

</head>
<body>


	<%
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   LoginDTO selectedUserList = (LoginDTO) session.getAttribute("selectedUser");
   List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
   %>
	<%
   if (user != null && selectedUserList != null) {
      LoginDTO selectedUser = selectedUserList;
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

				<!-- ${path}/images/${selectedUser.user_image} -->
				<li><img src="${selectedUser.user_image}"
					style="border-radius: 50%; width: 100px; height: 100px;">
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
				<li><form action="${path}/update">
						<button type="submit">회원정보 수정</button>
					</form></li>
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

	<%
   if (user != null && selectedUserList != null) {
   %>


	<div class="toggleBtnWrap">
		<button onclick="toggleDiv('user-info-div')">내 정보</button>
		<button onclick="toggleDiv('line-chart-div')">나의 온도</button>
	</div>
	<div>
		<div id="user-info-div" class="toggle-div">
			<div class="user-info">
				<div class="user-info-detail">

					<div class="user_image_detail">
						<form method="post" action="${path}/updateuserimg"
							enctype="multipart/form-data" style="margin-bottom: 30px;">
							<label for="user_image"><img
								src="${selectedUser.user_image}"
								style="border-radius: 50%; width: 200px; height: 200px; cursor: pointer; padding: 15px;">
							</label><input type="file" id="user_image" name="file"
								style="display: none;"><input type="hidden"
								name="user_id" value="<%=selectedUser.getUser_id()%>" />
							<button class="modifyBtn" type="submit">사진 수정</button>
						</form>

						<form method="post" action="${path}/updateusermainimg">
							<input type="hidden" name="user_id"
								value="<%=selectedUser.getUser_id()%>" /> <input type="hidden"
								name="user_image" value="/resources/user/default.jpg">
							<button class="originBtn" type="submit">기본이미지로 변경</button>
						</form>

						<form action="${path}/update">
							<button type="submit"
								style="position: absolute; top: 400px; left: 85px; padding: 5px;">회원정보
								수정하기</button>
						</form>

					</div>

					<div class="gauge-container">
						<h2><%=selectedUser.getUser_nickname()%>
							님
						</h2>
						<h3>현재 온도</h3>
						<p><%=selectedUser.getUser_heat()%>℃
						</p>
						<div class="gg">
							<div id="gauge" class="gauge"></div>
						</div>
						<table>
							<tr>
								<th>회원번호</th>
								<td><%=selectedUser.getUser_code()%></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><%=selectedUser.getUser_id()%></td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td><%=selectedUser.getPhone_num()%></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><%=selectedUser.getAddress()%></td>
							</tr>
							<tr>
								<th>우편 번호</th>
								<td><%=selectedUser.getMember_post()%></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><%=selectedUser.getMember_addr()%></td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td><%=selectedUser.getDetailed_address()%></td>
							</tr>

							<tr>
								<th>생년월일</th>
								<td><%=selectedUser.getUser_birth()%></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="line-chart-div" class="toggle-div hidden">
			<div id="line_chart" style="width: 900px; height: 500px;"></div>
		</div>

	</div>

	<div class="main-top"></div>
	<!-- 게이지를 나타낼 부분 추가 -->

	<script>
  $(document).ready(function() {
    // 평점 가져오기 (예시로 75로 설정)
    var userHeat = <%=selectedUser.getUser_heat()%>;

    // 게이지 업데이트 함수
    function updateGauge(heat) {
      var percentage = (heat / 100) * 100; // 0부터 100까지의 범위
      $("#gauge").css("width", percentage + "%");

      // 색상 계산 및 적용
      var color = calculateColor(heat);
      $("#gauge").css("background-color", color);
    }

    // 평점에 따른 색상 계산 함수
    function calculateColor(heat) {
      // HSL 모델에서의 색상 계산
      var hue = 120 - (heat / 100) * 120; // 0에서 100을 120에서 0으로 변환
      var saturation = 100; // 포화도는 100%
      var lightness = 50; // 명도는 50%

      // HSL 색상으로 변환
      var color = "hsl(" + hue + ", " + saturation + "%, " + lightness + "%)";

      return color;
    }

    // 페이지 로드 시 게이지 업데이트
    updateGauge(userHeat);
  });
</script>

	<%
   }
   %>
	<%
   }
   %>

	<script>
    function toggleDiv(divId) {
    	// 마이페이지와 최근 온도 평가 부분 TOGGLE SCRIPT
        var div = document.getElementById(divId);
        var otherDivId = (divId === 'user-info-div') ? 'line-chart-div' : 'user-info-div';
        var otherDiv = document.getElementById(otherDivId);

        if (div.style.display === 'none') {
            div.style.display = 'block';
            otherDiv.style.display = 'none';
        } else {
            div.style.display = 'none';
            otherDiv.style.display = 'block';
        }
    }
</script>
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


</body>
</html>