<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.order.domain.OrderDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <html xmlns:th="http://www.thymeleaf.org">
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Order</title>
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
   /*border: 1px solid black;*/
   display: flex; /* 자식 요소를 가로로 정렬 */
   justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
   flex-wrap: wrap; /* 화면 크기에 따라 줄 바꿈 */
   height: 1000px;
}

.main-top div {
   width: 100%; /* 50%에서 100%로 수정 */
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
   margin: 0 auto;
   border-collapse: collapse;
   background-color: white; /* Set background color to white */
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   /* Add a subtle shadow effect */
}

.main-top th, .main-top td {
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

.main-top img {
   max-width: 100%;
   max-height: 100%;
   width: 650px;
   height: 800px;
}

/*         중간          */
.main-middle {
   border: 1px solid black;
   display: flex; /* 자식 요소를 가로로 정렬 */
   justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
   align-items: center; /* 수직 정렬 */
   height: 800px;
}

.main-middle div {
   width: 100%; /* 50%에서 100%로 수정 */
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

/* 글자 넘어감 방지*/
.elText {
   word-break: break-all;
}

.orderWidth {
   width: 100px;
}

.heatBtn {
   width: 100px;
}

#saveForm {
   margin: 20px auto;
   box-shadow: 0px 0px 5px #ccc;
   width: 100%; /* 1400px에서 100%로 수정 */
   padding: 20px;
   background-color: #fff;
   border-radius: 8px;
   display: flex;
   flex-direction: column;
   align-items: center;
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








   <c:set var="user" value="${sessionScope.user}" />
   <c:set var="selectedUserList" value="${sessionScope.selectedUser}" />

   <%
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
   List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
   if (user != null && selectedUser != null) {
      LoginDTO firstSelectedUser = selectedUser;
   %>
   <c:if test="${not empty user}">
      <c:set var="selectedUser" value="${selectedUser}" />


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
   </li>     <%
         }
         %>
               <li><img src="${selectedUser.user_image}" style="border-radius: 50%; width: 100px; height: 100px;">
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
      <div class="main-top">
         <div id=saveForm>
            <div style="text-align: center; justify-content: center;">
               <h2>주문 목록</h2>
            </div>


            <table style="border: 1px solid black;">
               <thead>
                  <tr>
                     <td class="orderWidth">주문아이디</td>
                     <!-- <td>사용자 코드</td>
               <td>사용자 아이디</td>
               <td>사용자 닉네임</td>
               <td>전화 번호</td>
               <td>게시판 ID</td> -->
                     <td>상품</td>
                     <td>가격</td>
                     <td>배송 주소</td>
                     <td class="orderWidth">우편번호</td>
                     <td>상세 주소</td>
                     <td>배송 요청</td>
                     <td>주문 날짜</td>
                     <td class="heatBtn">평점</td>

                  </tr>
               </thead>
               <tbody>
                  <c:forEach items="${orderList}" var="order">

                     <tr>
                        <!-- <td>${order.order_code}</td>
                  ${order.user_code}</td>
                  <td>${order.user_nickname}</td>
                  <td>${order.user_nickname}</td>
                  <td>${order.phone_num}</td> -->

                        <td>${order.board_id}</td>
                        <td class="elText">${order.board_title}</td>
                        <td>${order.board_price}</td>
                        <td class="elText">${order.member_addr}</td>
                        <td>${order.member_post}</td>
                        <td class="elText">${order.detailed_address}</td>
                        <td>${order.delivery_req}</td>
                        <td>${order.order_date}</td>
                        <td>
                           <form action="${path}/heat" method="post">
                              <input type="hidden" name="sell_code"
                                 value="${order.sell_code}" required> <input
                                 type="hidden" name="board_id" value="${order.board_id}"
                                 required>
                              <button type="submit">평가하기</button>
                           </form>

                        </td>

                     </tr>

                  </c:forEach>
               </tbody>

            </table>

         </div>
      </div>
      <button id="myBtn" title="Go to top">Top</button>
   </c:if>

   <!-- HTML 페이지 일부분 -->
   <script>
      // Java 코드에서 전달된 메시지를 JavaScript로 가져와 Alert로 띄우기
      var message = "${message}"; // Spring MVC의 경우 해당 변수를 가져옵니다.

      // 메시지가 비어있지 않은 경우에만 Alert를 띄웁니다.
      if (message.trim() !== "") {
         alert(message);
      }
   </script>

 


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

   <%
   }
   %>

</body>
</html>