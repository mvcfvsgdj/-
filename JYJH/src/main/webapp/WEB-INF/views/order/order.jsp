<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.sh.saveUser.domain.UserDTO"%>
<%@ page import="com.sh.address.domain.AddressDTO"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.product.domain.ProductDTO"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   margin: 5px 5px;
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

.menu-container button:hover {
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
   padding: 20px;
   height: 800px;
}

.main-top div {
   text-align: center;
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
   max-width: 100%;
   margin: 0 auto;
   height: 800px;
   padding: 20px;
   background-color: #fff;
   border-radius: 8px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#saveForm {
   margin: 20px auto;
   height: 500px;
   box-shadow: 0px 0px 5px #ccc;
   width: 750px;
   padding: 20px;
   background-color: #fff;
   border-radius: 8px;
   display: flex;
   flex-direction: column;
   align-items: center;
}

#saveForm div {
   display: flex;
   justify-content: space-between;
   width: 100%;
   margin-bottom: 15px;
}

#saveForm label {
   margin-right: 10px;
   margin-top: 17px;
   margin-left: 10px;
}

#saveForm input, #saveForm select {
   flex: 1;
   margin: 9px 0px 15px;
   padding: 10px;
   border: 1px solid #ddd;
   border-radius: 4px;
   box-sizing: border-box;
}

#saveForm button {
   width: 100%;
   padding: 10px;
   background-color: #ff6f0f;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   transition: background-color 0.3s, color 0.3s;
}

#saveForm button:hover {
   background-color: #d55500;
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
   background-color: #d55500;
   color: white;
}
</style>

<script>
   function findAddr() {
      new daum.Postcode({
         oncomplete : function(data) {
            console.log(data);
            let roadAddr = data.roadAddress;
            let jibunAddr = data.jibunAddress;
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
<script>
   function validateForm() {
      var nickname = document.getElementById('user_nickname').value;
      var userCode = document.getElementById('user_code').value;
      var userId = document.getElementById('user_id').value;
      var phoneNum = document.getElementById('phone_num').value;
      var memberPost = document.getElementById('member_post').value;
      var memberAddr = document.getElementById('member_addr').value;
      var detailedAddress = document.getElementById('detailed_address').value;

      if (nickname === "" || userCode === "" || userId === ""
            || phoneNum === "" || memberPost === "" || memberAddr === ""
            || detailedAddress === "") {
         alert("모든 값을 입력해주세요!");
         return false;
      }
      return true;
   }
</script>
</head>
<body>
   <c:set var="user" value="${sessionScope.user}" />
   <c:set var="selectedUserList" value="${sessionScope.selectedUser}" />
   <%
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
   List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
   %>

   <%
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

         <form id="saveForm" method="post" action="${path}/kakaoPayGo"
            onsubmit="return validateForm()">
            <div style="text-align: center; justify-content: center;">
               <h2>구 매</h2>
            </div>
            <c:forEach items="${products}" var="singleProduct">
               <input type="hidden" name="board_id"
                  value="${singleProduct.board_Id}" readonly>
               <div style="display: flex">
                  <label for="board_title">상품명</label> <input type="text"
                     name="board_title" value="${singleProduct.board_Title}" readonly>
                  <label for="board_price">가격</label> <input type="text"
                     name="board_price" value="${singleProduct.board_Price}" readonly>

               </div>

               <div>
                  <label for="nickname">판매자</label> <input type="text"
                     id="user_nickname" name="user_nickname"
                     value="${singleProduct.user_nickname}" readonly /> <label
                     for="delivery_req">배송 요청 사항</label> <select id="delivery_req"
                     name="delivery_req">
                     <option value="특별 요청 없음">배송 시 요청사항을 선택해주세요</option>
                     <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                     <option value="부재 시 택배함에 맡겨주세요">부재 시 택배함에 맡겨주세요</option>
                     <option value="문 앞에 놓고 가주세요">문 앞에 놓고 가주세요</option>
                     <option value="배송 전 연락 부탁드립니다">배송 전 연락 부탁드립니다</option>
                     <option value="파손의 위험이 있는 상품입니다">파손의 위험이 있는 상품입니다</option>
                  </select>
               </div>
            </c:forEach>


            <div style="text-align: center; justify-content: center;">
               <h2>배송 주소</h2>
            </div>
            <div class="userAddr">
               <label for="member_addr"></label> <input id="member_post"
                  name="member_post" type="text" placeholder="우편번호" readonly>
               <input id="member_addr" name="member_addr" type="text"
                  placeholder="주소" readonly> <input id="detailed_address"
                  name="detailed_address" type="text" placeholder="상세주소">
            </div>
            <button type="button" onclick="findAddr()"
               style="width: 100px; padding: 8px 12px; margin-left: 648px; margin-bottom: -6px; margin-top: -20px;">주소찾기</button>

            <input type="hidden" id="user_code" name="user_code"
               value="${selectedUser.user_code}" readonly /> <input type="hidden"
               id="user_id" name="user_id" value="${selectedUser.user_id}"
               readonly /> <input type="hidden" id="phone_num" name="phone_num"
               value="${selectedUser.phone_num}" readonly /> <input type="hidden"
               name="sell_code" value="${product.user_code}" required>

            <button type="submit"
               style="margin: 40px; width: 100px; padding: 8px 12px;">
               주문하기</button>

         </form>
         <button id="myBtn" title="Go to top">Top</button>
      </div>


   </c:if>
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


   <c:if test="${empty user}">
      <p>유저 정보가 없습니다.</p>
   </c:if>

</body>
</html>