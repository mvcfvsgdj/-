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
<title>Insert title here</title>
</head>
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
   padding: 20px;
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
   height: 746px;
   margin: 20px auto;
   box-shadow: 0px 0px 5px #ccc;
   width: 650px;
   padding: 20px;
   background-color: #fff;
   border-radius: 8px;
}

#saveForm input {
   margin: 9px 0px 15px;
   padding: 10px;
   margin-bottom: 15px;
   border: 1px solid #ddd;
   border-radius: 4px;
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

#saveForm label, #saveForm input {
   display: block;
   text-align: left;
}

#board_Text {
   height: 200px;
   padding: 10px;
   font-size: 22px;
   margin-bottom: 15px;
   border: 1px solid #ddd;
   border-radius: 4px;
   line-height: 30px;
}

select {
   padding: 10px; /* Adjust the padding as needed */
   font-size: 16px; /* Adjust the font size as needed */
   margin: auto; /* 가운데 정렬을 위한 스타일 추가 */
   justify-content: center;
   display: block; /* 추가 */
   text-align: center;
   border: 1px solid #ddd;
   color: #5a5a5a;
}

#board_cate {
   width: 15%;
}

.detail-container {
   display: flex;
}

.cate-container {
   display: flex;
   width: 218px;
}

.cate-container select {
   width: 50%;
}

#detail {
   margin: 18px 14px 18px 0px;
}

#board_Title, #board_Text {
   width: 96%;
}

#board_Price {
   width: 25%%;
   margin-right: 40px;
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

textarea {
   resize: none;
}

/*글자수 제한*/
#charCount {
   margin-left: 574px;
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
      <form id="saveForm" action="${path}/products/add" method="post"
         enctype="multipart/form-data">
         <div style="text-align: center;">
            <h2>게시글 작성</h2>
         </div>
         <div style="display: flex; margin: 26px 0px 25px 0px;">

            <label for="board_cate">분류:</label> <select id="board_cate"
               name="board_cate" style="margin: -11px 22px 0px;"
               onchange="checkboardCate()">
               <option value="판매">판매</option>
               <option value="나눔">나눔</option>
            </select>
         </div>
         <div></div>
         <label for="board_Title">제목:</label> <input type="text"
            id="board_Title" name="board_Title" required> <br>

         <div class="detail-container">
            <label id="detail">가격:</label> <input type="number" id="board_Price"
               name="board_Price" step="1000" min="1000" max="999990000" required
               style="margin-right: 102px;"> <br> <label id="detail">카테고리:</label>

            <script>
               // 상품 게시 카테고리 구분 (  나눔 OR 판매  )
               function checkboardCate() {

                  var boardCate = document.getElementById("board_cate");
                  var boardPrice = document.getElementById("board_Price");

                  if (boardCate.value === "나눔") {

                     boardPrice.value = 0;
                     boardPrice.readOnly = true;
                  } else {
                     boardPrice.value = "";
                     boardPrice.readOnly = false;
                  }
               }
            </script>


            <div class="cate-container">

               <select id="loc_code" name="loc_code" style="margin-right: 5px;">
                  <option value="서울시">서울</option>
                  <option value="제주도">제주도</option>
                  <option value="경기도">경기도</option>
                  <option value="충청도">충청도</option>
                  <option value="경상도">경상도</option>
                  <option value="전라도">전라도</option>
                  <option value="강원도">강원도</option>
               </select> <select id="detail_loc" name="detail_loc"
                  style="margin-left: 5px;">
                  <!-- 중분류 옵션은 JavaScript에서 처리 -->
               </select>
            </div>
         </div>


         <label for="board_Text">내용:</label>
         <textarea id="board_Text" name="board_Text" oninput="checkLength()"
            required style="font-size: 18px;"></textarea>
         <span id="charCount">0 / 100</span>

         <script>
            // board_text의 길이제한 두는 함수 
            function checkLength() {
               var maxLength = 100;
               var textArea = document.getElementById("board_Text");
               var charCount = document.getElementById("charCount");

               var usedChars = textArea.value.length;
               var remainingChars = maxLength - usedChars;

               if (remainingChars < 0) {
                  // 만약 100자를 초과하면 더 이상 입력을 허용하지 않음
                  textArea.value = textArea.value.substring(0, maxLength);
                  usedChars = maxLength; // 사용된 글자 수를 최대값으로 설정
               }

               charCount.textContent = usedChars + " / 100";
            }
         </script>

         <br> <label for="board_Img">이미지:</label> <input type="file"
            id="board_Img" name="file" required><br> <input
            type="hidden" name="user_code" id="user_code"
            value="<%=firstSelectedUser.getUser_code()%>" required> <input
            type="hidden" name="user_nickname" id="user_nickname"
            value="<%=firstSelectedUser.getUser_nickname()%>" required>
         <button type="submit">게시글작성</button>
      </form>

      <button id="myBtn" title="Go to top">Top</button>
   </div>

   <script>
    var categoryData = ${item}; 
    
    console.log(categoryData);

    // 초기에 서울에 해당하는 중분류 추가
    categoryData['서울시'].forEach(function (item) {
        $("#detail_loc").append('<option value="' + item.detail_loc + '">' + item.detail_loc + '</option>');
    });
    

    $("#loc_code").on("change", function () {
        let key = this.value;
        // 선택된 대분류에 따라 중분류 변경
        $("#detail_loc").empty(); // 기존 중분류 옵션 제거
        categoryData[key].forEach(function (item) {
            $("#detail_loc").append('<option value="' + item.detail_loc + '">' + item.detail_loc + '</option>');
        });
    });

    
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