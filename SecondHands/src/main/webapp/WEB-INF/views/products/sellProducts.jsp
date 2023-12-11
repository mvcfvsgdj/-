<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page import="com.sh.login.domain.LoginDTO"%>
          <%@ page import="com.sh.product.domain.ProductDTO"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
          <%@ page import="java.util.*"%>
          <c:set  var="path"   value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Products</title>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
* {
	box-sizing: border-box;
	/*outline: 1px solid gray;*/
}



.sell_Wrap {
    margin-top: 20px; /* 여백 추가: 20px */
    height: 140px;
    width: 650px;
    margin: 0 auto;
    margin-bottom: 20px;
       background-color: #fff;
    display: flex;
  border-radius: 8px;
   border: 1px solid #ddd;
      box-shadow: 0px 0px 5px #ccc;
}

.sell_image_box {
	width: 150px;
	padding: 10px;
}

.sell_image {
	width: 120px;
	height: 120px;
	border-radius: 10px;
	background-color: rgb(245, 239, 239);
	background-size: cover;
}

.sell_content_box {
	width: 100%;
	padding: 15px;
}

.sell_Title_box {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 5px;
}

.sell_address {
	color: gray;
	font-size: 15px;
	margin-bottom: 7px;
}

.sell_price {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 7px;
}

.sell_bottom {
	color: gray;
	position: relative;
}

.sellup_btn {
	height: 40px;
	width: 90px;
	position: absolute;
	right: 0px;
	bottom: 0px;
	border-radius: 5px;
   background-color: #ff6f0f;
      border-radius: 4px;
      cursor: pointer;
	color: white;
	font-weight: bold;
 transition: background-color 0.3s, color 0.3s;
}

.sellup_btn:hover {
   background-color: #d55500;
}

.sell_a {
	text-decoration: none;
	color: black;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
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

.product_wrap {
   margin: 20px auto;
   /*box-shadow: 0px 0px 5px #ccc;
   background-color: #fff;
   border-radius: 8px; */
	width: 1000px;
	height: 2000px;
	margin: 0 auto;
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
  width:150px;
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


#saveForm form button{
	width: 50px;
}

#saveForm {
   width: 1400px;
   padding: 20px;
   margin: 20px auto;
   box-shadow: 0px 0px 5px #ccc;
   background-color: #fff;
   border-radius: 8px;
   display: flex;
   flex-direction: column;
   align-items: center;
}

footer {
   position:fixed;
   width:100%;
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
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
   List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
   if (user != null && selectedUser != null) {
      LoginDTO firstSelectedUser = selectedUser; // Assuming you want the first user in the list
   %>
	<header>
		<div class="header-logo">
			<div class="menu-icon">&#9776;</div>
			<form action="${path}/homePage">
			<button type="submit" >Second Hands</button>
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
   </li>     <%
         }
         %>
				<li>
				   <img src="${selectedUser.user_image}" style="border-radius: 50%; width: 100px; height: 100px;">
						<h2>
						<%
						if (user != null && selectedUser != null) {
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
               <input type="hidden" name="user_code" value="<%=firstSelectedUser.getUser_code()%>">
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



		<div style="width: 650px; margin: 0px auto">
			<h2>나의 판매목록</h2>
		</div>
		
		
		
		<div class="product_wrap">
		</div>
		
		     <button id="myBtn" title="Go to top">Top</button>

</body>
<script>
    let user_code = "${user.user_code}";
    let loading = false; // 추가 데이터 로딩 중 여부
    loadPage();
    
    //끌어올리기
    function upEvent(boardId) {
		if (!loading) {
			loading = true;
			$.ajax({
				url: "${path}/products/upEvent",
				type: "POST",
		        data: {
		        	boardId: boardId
		        },
				success: function(data) {
					console.log("끌올");
					loading = false;
					loadPage();
				},
				error: function(error) {
					console.log("Error:", error);
					loading = false;
				}
			});
		}
	}
    //페이지 로드
    function loadPage() {
		if (!loading) {
			loading = true;
			$.ajax({
				url: "${path}/sellList?user_code="+user_code,
				type: "GET",
				success: function(data) {
					console.log("성공");
					let list = data;
					console.log(list);
					let sql = pageToString(list);
					$(".product_wrap").empty();
					$(".product_wrap").append(sql);
				   	
					loading = false;
				},
				error: function(error) {
					console.log("Error:", error);
					loading = false;
				}
			});
		}
	}
    
    //str문 생성
  	function  pageToString(list){
	   	 let str = "";
	   	 list.forEach(  ( item) => { 
	   			str += `     	 
	    	      <div class="sell_Wrap">
	    	        <div class="sell_image_box">
	    	          <div class="sell_image" style="background-image: url('${path}/images/<%="${item.board_img}" %>')"></div>
	    	        </div>
	    	        <div class="sell_content_box">
	    	          <div class="sell_Title_box">
                   <a class="sell_a" href="${path}/products/detail?boardId=<%="${item.board_id}" %>&user_code=<%="${item.user_code}"%>">
                   <%="${item.board_title}"%> </a></div>
	    	          <div class="sell_address"><%="${item.loc_code}"%>/<%="${item.detail_loc}"%> | <%="${item.board_date}"%></div>
	    	          <div class="sell_price"><%="${item.board_price}"%> 원</div>
	    	          <div class="sell_bottom">
	    	            조회 <%="${item.board_click}"%><button id = '<%="${item.board_id}"%>' class = "sellup_btn" onclick = "upEvent('<%="${item.board_id}"%>')">끌어올리기</button>
	    	          </div>
	    	        </div>
	    	      </div>
	   			`;
		});
       return str;
	}
</script>
	<%
		}
		%>
	
</html>