<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.product.domain.ProductDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!--${path} -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.main-top {
   background: #fffae0;
   border-bottom: 1px solid #ddd;
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 20px; /* 추가된 부분 */
   height: 826px;
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

.title {
   font-weight: bold;
}

.product-image {
   display: flex;
   justify-content: center;
   align-items: center;
   border-radius: 8px;
   margin: 15px;
}

.product-image img {
   border-radius: 8px;
   border: 1px solid #dbcfcf;
   width: 400px;
   height: 400px;
}

.product-container {
   margin-left: 50px;
   margin-right: 50px;
}

.product-details {
   width: 600px;
   height: 350px;
   border-bottom: 1px solid #dbcfcf;
   margin: 10px;
   text-align: left; /* 내용을 왼쪽 정렬로 변경 */
   padding: 10px; /* 내용 주변에 여백 추가 */
}

.product-details div {
       margin: 5px 5px 5px 0px;

}


.product-label {
   display: flex;
   text-align: center;
   align-items: center;
}

.product-label-main{
  display: flex;
}
 .product-label-cate{
 width: 20%;
 }
.product-label-title{
 width:60%;
}
.click_title{
 width:19%;
}

#saveForm {
   display: flex;
   height: 500px;
   border-radius: 8px;
   box-shadow: 0px 0px 5px #ccc;
   background-color: #fff;
}



.modify_product {
   display: flex;
   align-items: center;
   margin-top: 20px;
   justify-content: center;
}

.modify_product form {
   margin: 10px;
   padding: 0px;
   display: flex;
}

.modify_product button {
   margin-left: 10px;
}

.buy_product {
   margin-top: -15px;
   align-items: center;
   display: flex;
   justify-content: center;
}

.buy_product form {
   display: flex;
   margin: 10px;
   padding: 0px;
}

.buy_product button {
   margin-left: 20px;
}

.chat_likes {
   display: flex;
   justify-content: center;
   align-items: center;
   text-align: center;
}

.chat_likes form {
   display: flex;
   flex-direction: unset;
   align-items: center;
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

.like1 button {
   width: 50px;
   hetght: 50px;
   background: none;
   border: none;
}

.like1 button:hover {
   background: none;
}

#likeImg {
   width: 40px;
   height: 40px;
}

footer {
   background-color: #333;
   padding: 10px;
   color: white;
   text-align: center;
   bottom: 0;
}
footer a{

   text-decoration: none; /* 텍스트 데코레이션 제거 */
   color: inherit; /* 링크의 색상을 부모 요소로부터 상속 */
}

footer a:hover {
   text-decoration: none; /* 호버 시 텍스트 데코레이션 제거 유지 */
   color: inherit; /* 호버 시 색상을 부모 요소로부터 상속 */
}

/*게이지영역 */
.gauge {
   background-color: #ff6f0f; /* 주황색 배경으로 설정 */
   height: 20px;
   width: 0; /* 초기 너비는 0으로 설정 */
   margin: 0; transition : width 1s; /* 너비 변경 시 부드러운 효과를 위한 transition */
   border-radius: 5px;
   transition: width 1s; /* 모서리를 둥글게 설정 */
}
/* 게이지 차는영영 */
.gg {
   height: 20px;
   width: 80%; /* 초기 너비는 0으로 설정 */
   background-color: #d1d0cf;
   border-radius: 5px; /* 모서리를 둥글게 설정 */
}

.product-label .click_title {
   margin-left: 200px;
}
</style>
</head>
<body>

   <script>
   let loading = false; // 추가 데이터 로딩 중 여부
   let onClick = ${onClick};
   console.log("jsp확인 = " + onClick);
   //좋아요
   function like(boardId, userId) {
       if (!loading) {
           loading = true;
           $.ajax({
               url: "${path}/products/like", // 서버측 엔드포인트 설정
               type: "POST",              
               data: {boardId:boardId,
                     userId:userId
                  },
               success: function (data) {
                   $("#likes").empty();
                   $("#likes").append("관심 : " + data.likenum + " 개");
                    liketoggle();
                   loading = false;
               },
               error: function (error) {
                   console.log("Error:", error);
                   loading = false;
               }
           });
         
      }
   }
   function liketoggle(){
      if(onClick == false){
         $("#like").empty();
         //빈하트
         $("#like").append(`<img id="likeImg" src="${path}/resources/product/heart.png">`);
      }else if(onClick == true){
         $("#like").empty();
         //꽉찬 하트
         $("#like").append(`<img id="likeImg" src="${path}/resources/product/hfull.png">`);
      }
      
   }
   
   $(document).ready(function(){
      liketoggle();
       $("#like").click(function(){
          console.log("토글 " + onClick);
          like(${product.board_Id},"${user.user_id}");
          onClick = !onClick;
       });
       
   });
</script>
   <script>
   //맨위로 올리기
   $(document).ready(function() {
      $("html, body").animate({
         scrollTop : 0
      }, 400);
      // 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
      $("#myBtn").click(function() {
         $("html, body").animate({
            scrollTop : 0
         }, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
      });
   });

   $(document).ready(function() {
      // 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
      $(".menu-icon").click(function() {
         $(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
      });
   });
   
   
   //동네 인증 script
   
   
</script>

   <script>
  $(document).ready(function() {
    // 평점 가져오기 (예시로 75로 설정)
    var userHeat = ${user_heat};

    // 게이지 업데이트 함수
    function updateGauge(heat) {
      var percentage = (heat / 100) * 100; // 0부터 100까지의 범위
      $("#gauge").css("width", percentage + "%");

      // 색상 계산 및 적용
      var color = calculateColor(heat);
      $("#gauge").css({
          "background-color": color,
          "margin": "0" // margin 0 추가
      });
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
   LoginDTO user = (LoginDTO) session.getAttribute("user");
 List<ProductDTO> products = (List<ProductDTO>) session.getAttribute("products");
   LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
   List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
   if (user != null && selectedUser != null) {
      LoginDTO firstSelectedUser = selectedUser; // Assuming you want the first user in the list
      ProductDTO product = products.get(0);
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







   <!-- 로그인한 유저 코드와 게시글 작성한 유저 코드가 일치할시 수정/삭제버튼이 나옴 -->
   <c:set var="owner" value="${product.user_code  == selectedUser.user_code}"></c:set>
   <c:set var="nanoom" value="${product.board_Price  == 0}"></c:set>

   <div class="main-top">
      <div id="saveForm">
         <form action="${path}/products" method="get"
            enctype="multipart/form-data"></form>
         <!-- 로그인한 유저 코드와 게시글 유저코드를 불러옴 -->
         <input type="hidden" name="user_code1" id="user_code1"
            value="<%=firstSelectedUser.getUser_code()%>" required> <input
            type="hidden" name="user_code3" id="user_code3"
            value="${product.user_code}" required>
         <div class="product-image">
            <img src="<c:url value='/images/${product.board_Img}' />"
               alt="Product Image"
               style="border-radius: 8px; border: 1px solid #dbcfcf; width: 400px; height: 400px;">
         </div>

         <div class="product-container">
            <div class="product-details">

               <div class="product-label-main">
                  <div class="product-label-cate">
                     <span class="title"> [${product.board_cate}]</span>
                  </div>
                  <div class="product-label-title">
                     <span class="title"> ${product.board_Title} </span>
                  </div>
                  <div class="click_title">
                     <span class="title">조회수: ${product.board_Click}</span>
                  </div>
               </div>

               <div style="border-bottom: 1px solid #dbcfcf;"></div>

               <div class="product-label">
                  <div>
                     <span class="title">작성자: ${product.user_nickname }</span>


                  </div>


               </div>
               <div>
                  <span class="title"> ${product.board_Date}</span>
               </div>

               <div></div>
               <div><span class="title">${user_heat}℃</span></div>
               <div class="gg">
                  <div id="gauge" class="gauge"></div>
               </div>



               <div class="product-label">
                  <div>
                     <span class="title"> ${product.loc_code}</span>
                  </div>
                  /
                  <div>
                     <span class="title"> ${product.detail_loc}</span>
                  </div>
               </div>

               <div style="border-bottom: 1px solid #dbcfcf;"></div>

               <div style="margin-top: 20px;line-height: 1.5;word-break: break-all;">

                  ${product.board_Text}</div>

            </div>







            <c:if test="${not empty isCodeValid and isCodeValid eq false}">
               <p
                  style="font-size: 13px; margin: 0px 0px 0px 220px; font-weight: bold; color: red;">이미
                  신청한 채팅입니다.</p>
            </c:if>

            <c:if test="${selectedUser.user_code ne product.user_code && product.board_Price != 0}">
               <div class="buy_product">
                  <form action="${path}/order">
                     <input type="hidden" name="boardId" value="${product.board_Id}">
                     <input type="hidden" name="sell_code"
                        value="${product.user_code}" required>
                     <div>
                        <span class="title">가격: <span style="color: #ff6f0f;">${product.board_Price}</span>
                           원
                        </span>
                     </div>
                     <button type="submit">상품 구매</button>
                  </form>


                  <div class="chat_likes">
                     <form action="${path}/checkCode" method="post">
                        <input type="hidden" name="buy_code"
                           value="${selectedUser.user_code}" required><br>
                        <input type="hidden" name="sell_code"
                           value="${product.user_code}" required><br> <input
                           type="hidden" name="board_id" value="${product.board_Id}"
                           required><br>
                       <input type="hidden" name="board_Title" value="${product.board_Title}" required><br> 
                           <input type="hidden" name="sell_nickname" value="${product.user_nickname}" required><br>
                           <input type="hidden" name="buy_nickname" value="${selectedUser.user_nickname}" required><br>
                           <input type="hidden" name="board_Price" value="${product.board_Price}" required><br>
                            <input type="hidden" name="board_Img" value="${product.board_Img}" required><br>
                           
                        <button type="submit">채팅신청하기</button>

                     </form>
                     <form action="${path}/scrollHome">
         <button type="submit">리스트로 돌아가기</button>
      </form>
                     <div class="like1">
                        <button id="like">관심 버튼</button>
       
                     </div>
         
                  </div>
               </div>
            </c:if>
            
            <!--  나눔항목 일 경우 -->
            

            <c:if test="${selectedUser.user_code ne product.user_code && product.board_Price == 0}">
               <div class="buy_product">



                  <div class="chat_likes">
                     <form action="${path}/checkCode" method="post">
                        <input type="hidden" name="buy_code"
                           value="${selectedUser.user_code}" required><br>
                        <input type="hidden" name="sell_code"
                           value="${product.user_code}" required><br> <input
                           type="hidden" name="board_id" value="${product.board_Id}"
                           required><br>
                       <input type="hidden" name="board_Title" value="${product.board_Title}" required><br> 
 							<input type="hidden" name="sell_nickname" value="${product.user_nickname}" required><br>
                           <input type="hidden" name="buy_nickname" value="${selectedUser.user_nickname}" required><br>                           <input type="hidden" name="board_Price" value="${product.board_Price}" required><br>
                            <input type="hidden" name="board_Img" value="${product.board_Img}" required><br>
                           
                        <button type="submit">채팅신청하기</button>

                     </form>
                     <form action="${path}/scrollHome">
         <button type="submit">리스트로 돌아가기</button>
      </form>
                     <div class="like1">
                        <button id="like">관심 버튼</button>
       
                     </div>
         
                  </div>
               </div>
            </c:if>

            <!-- 관심 버튼 추가 -->


            <div class="modify_product">
            
         
             <c:if test="${owner}">
                  <!-- 수정부분 -->

                  <form action="${path}/products/update" method="get">
                     <div>
                        <span class="title">가격: <span style="color: #ff6f0f;">${product.board_Price}</span>
                           원
                        </span>
                     </div>
                     <input type="hidden" name="user_code1" id="user_code1"
                        value="<%=firstSelectedUser.getUser_code()%>" required> <input
                        type="hidden" name="user_code3" id="user_code3"
                        value="<%=product.getUser_code()%>" required> <input
                        type="hidden" name="boardId" value="${product.board_Id}">
                     <button type="submit">수정</button>
                  </form>
                  <!-- 삭제부분 -->
                  <form action="${path}/products/delete" method="post" onsubmit="return confirm('게시글을 삭제하시겠습니까?');">
                     <input type="hidden" name="user_code1" id="user_code1"
                        value="<%=firstSelectedUser.getUser_code()%>" required> <input
                        type="hidden" name="user_code3" id="user_code3"
                        value="<%=product.getUser_code()%>" required> <input
                        type="hidden" name="boardId" value="${product.board_Id}">
                     <button type="submit">삭제</button>
                  </form>
                  <form action="${path}/products/updateDate" method="post"
                     id="updateDateForm">
                     <input type="hidden" name="boardId" value="${product.board_Id}">
                     <button type="submit">끌어올리기</button>
                  </form>
                  
                  
           <form action="${path}/scrollHome">
         <button type="submit">리스트로 돌아가기</button>
      </form>
      
                  <div class="like1">
                     <button id="like">관심 버튼</button>
                  </div>
          
               </c:if>


            </div>
         </div>
       <c:if test="${'admin' == user.user_id}">
   <form action="${path}/products/delete" method="post" onsubmit="return confirm('게시글을 삭제하시겠습니까?');"
   style="margin-top: 460px;">
      <input type="hidden" name="user_code1" id="user_code1" value="<%=firstSelectedUser.getUser_code()%>" required>
      <input type="hidden" name="user_code3" id="user_code3" value="<%=product.getUser_code()%>" required>
      <input type="hidden" name="boardId" value="${product.board_Id}">
      <button type="submit">삭제</button>
   </form>
</c:if>
 
      </div>
      <button id="myBtn" title="Go to top">Top</button>
   </div>
   <%
   }
   // products나 selectedUserList가 비어있을 때 예외 처리
   %>



   <footer>
      &copy; 2023 에이콘아카데미 최종프로젝트 <br>
      <p><a href="https://github.com/dhdl2389">조장: 김재열</a> |
      <a href="https://github.com/mvcfvsgdj">조원: 김민규 </a> |
      <a href="https://github.com/kevinbj0">조원: 김병진 </a> |
      <a href="https://github.com/LeeJungHoon1">조원: 이정훈 </a> |
      <a href="https://github.com/lepio1999">조원: 허재혁 </a></p>
   </footer>

</body>
</html>