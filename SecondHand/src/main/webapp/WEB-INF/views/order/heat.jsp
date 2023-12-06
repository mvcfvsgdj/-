<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.order.domain.OrderDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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




.logoBtn {
   border: none;
   background-color: #ff6f0f;
   color:white;
}

.logoBtn:hover{
    background-color: #ff6f0f;
    color: black;
    transition: color 0.3s ease;
}

.satisfyD {
   text-align: center;
   margin: auto;
   margin-top: 110px;
   font-size: 34px;
   font-weight: bolder;
}

}
#satisfy {
   text-align: center;
   margin-top: 80px;
   width: 1200px;
   border: none;
   text-align: center;
   font-size: 34px;
   font-weight: bolder;
}

.star {
   display: inline-block;
   direction: rtl;
   border: 0;
   align-items: center;
   justify-content: center;
   text-align: center;
   margin: 0 auto;
   display: flex;
   justify-content: center;
   text-align: center;
   margin: 0 auto;
}

.submitBtn {
   align-items: center;
   display: flex;
   justify-content: center;
   margin-top: 60px;
}

.submitB {
   width: 120px;
   height: 40px;
   border-radius: 12px;
   background-color: #ff6f0f;
   font-weight: bold;
   color: white;
   border: none;
   transition: color 0.3s ease;
   
}

.submitB:hover {
   color: black;
}

button.eva {
   font-size: 3em;
   color: transparent;
   text-shadow: 0 0 0 #f0f0f0;
   background: none;
   border: none;
   cursor: pointer;
   font-size: 113px;
}

button.eva:hover, button.eva.selected, button.eva.hovered {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

input[type=radio]:checked ~ button.eva {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#temperatureInput {
   width: 100%;
   height: 30px;
   padding: 5px;
   box-sizing: border-box;
   border: solid 1.5px #D3D3D3;
   border-radius: 5px;
   font-size: 16px;
}

#temperature {
   display: none;
}
.body_info{
height: 100px;
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

      <%
      }
      %>
   </header>
   <div class="body_info"></div>
   <h1 id="temperature">
      온도:
      <script>document.write(parseFloat(${user_heat}).toFixed(1));</script>
   </h1>


   <c:set var="products" value="${sessionScope.products}" />
   <div class="satisfyD">
      <p id="satisfy">"${user_nickname}" 님과의 거래는 어떠셨나요?</p>
   </div>

   <div class="star">
      <button class="eva" value="0.2" onmouseover="hoverbtn(this)"
         onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
      <button class="eva" value="0.1" onmouseover="hoverbtn(this)"
         onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
      <button class="eva" value="0" onmouseover="hoverbtn(this)"
         onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
      <button class="eva" value="-0.1" onmouseover="hoverbtn(this)"
         onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
      <button class="eva" value="-0.2" onmouseover="hoverbtn(this)"
         onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
   </div>
               <c:set value="${sessionScope.orderList}" var="order"/>
   

   <form action="${path}/updateHeat" method="post">
      <input type="hidden" name="user_id" id="user_id" value="" >
      <input type="hidden" id="temperatureInput" name="user_heat" value="">
      <input type="hidden" name="user_code" value="${sell_code}">
      <input type="hidden" name="check_heat" value="T" required>
      <input type="hidden" name="board_id" value="${board_id}" required>

      <div class="submitBtn">
         <button class="submitB" type="submit">평가하기</button>
      </div>
   </form>
     <button id="myBtn" title="Go to top">Top</button>
 


<script>
	// 사용자의 초기온도 정보 서버에서 받아오기
    let user_heat = ${user_heat};
    // 사용자가 클릭한 버튼의 인덱스를 저장하는 변수
    let clickedIndex = -1;
	
    //버튼 클릭시 호출되는 함수
    function evabtn(value, button) {
        // 현재 클릭한 버튼의 인덱스 찾기
        const buttons = document.querySelectorAll('.eva');
        const currentIndex = Array.from(buttons).indexOf(button);

        // 중복 클릭 방지
        if (currentIndex !== clickedIndex) {
            // 모든 버튼에서 selected 클래스 제거
            buttons.forEach(function (btn) {
                btn.classList.remove('selected');
            });

            // 현재 클릭한 버튼과 그 이후 버튼에 selected 클래스 추가
            for (let i = currentIndex; i < buttons.length; i++) {
                buttons[i].classList.add('selected');
            }

            // 사용자의 온도 값 업데이트
            user_heat += parseFloat(value);
            updateTemperature(user_heat);

            // 클릭한 버튼의 인덱스 업데이트
            clickedIndex = currentIndex;
        }
    }
	
    // 버튼에 호버시 호출되는 함수 
    function hoverbtn(button) {
        const index = Array.from(document.querySelectorAll('.eva')).indexOf(button);
        for (let i = index; i < document.querySelectorAll('.eva').length; i++) {
            document.querySelectorAll('.eva')[i].classList.add('hovered');
        }
    }
	
    // 버튼에 호버를 해제할 때 호출 되는 함수 
    function unhoverbtn(button) {
        const index = Array.from(document.querySelectorAll('.eva')).indexOf(button);
        for (let i = index; i < document.querySelectorAll('.eva').length; i++) {
            document.querySelectorAll('.eva')[i].classList.remove('hovered');
        }
    }
	
    // 온도를 업데이트하고 화면에 표시되는 함수
    function updateTemperature(temperature) {
        document.getElementById("temperature").innerHTML = '온도: ' + temperature.toFixed(1);
        document.getElementById("temperatureInput").value = temperature.toFixed(1);
    }

    // 추가된 부분: 제출 버튼 클릭 시 평가 여부 확인
    document.querySelector('.submitB').addEventListener('click', function (event) {
        if (clickedIndex === -1) {
            event.preventDefault(); // 제출 방지
            alert('평가를 완료 해주세요!!');
        }
    });
    
    
</script>


</body>
</html>