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

.qna {
   margin: 0 auto;
   align-items: center;
   justify-content: center;
   text-align: center;
   background-color: #fffae0;
}

.main-title {
   font-size: 50px;
   display: inline-block;
   margin-top: 60px;
}

.qna-list {
   margin: 0 auto;
   padding-top: 28px;
   width: 1008px;
   height: 985px;
   position: relative;
}

.qna-tb {
   margin: 0 auto;
   border-collapse: collapse;
   width: 1008px;
}

.qna-tb thead, tbody {
   border: 0;
}

thead {
   background-color: #ff6f0f;
   color: #fff;
}

tbody {
   background-color: white;
}

.qna-tb thead tr, tbody tr {
   border-top: 1px solid #0000006b;
   border-bottom: 1px solid #0000006b;
   height: 68px;
}

.qna-tb thead td, tbody td {
   margin: 10px 0px 5px 0px;
}

.title {
   width: 80%;
   text-align: center;
   position: relative;
}

.date {
   text-align: center;
   position: relative;
}

.writer span {
border-left: 1px solid #0000006b;
    display: inline-block;
    height: 45px;
    position: absolute;
    right: 199px;
    top: 38px;
}



.date span {
   border-left: 1px solid #0000006b;
   display: inline-block;
   height: 45px;
   position: absolute;
   left: 2px;
   bottom: 13px;
}

.title-btn {
   font-size: 17px;
   margin: 0;
   height: 68px;
   background-color: white;
   width: 100%;
   padding-left: 30px;
   text-align: left;
   border: 0;
   margin: 0;
}

.reg {
   position: absolute;
   right: 5px;
   bottom: 159px;
}

.page-btn {
   text-align: center;
   position: absolute;
   bottom: 107px;
   left: 50%;
   transform: translate(-50%, -50%);
   width: 900px;
}

.page-btn input {
   background-color: #ff6f0f;
   color: #fff;
   border-radius: 4px;
   border: none;
   height: 20px;
   width: 28px;
}

.page-btn a {
   display: inline-block;
   width: 30px;
   color: black;
   text-decoration: none;
   font-size: 18px;
}

.reg-btn {
   width: 100px;
   height: 30px;
   font-size: 18px;
   background-color: #ff6f0f;
   color: #fff;
   border: none;
   border-radius: 4px;
   transition: background-color 0.3s, color 0.3s;
}

input[type=button], input[type=submit] {
   cursor: pointer;
}

.secret {
   background-color: #80808070;
   font-size: 10px;
   position: absolute;
   left: 6px;
   top: 30px;
   border-radius: 5px;
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
        
//이전 페이지로 이동하는 함수
function prevPage(){
   if(${handler.currentPage} > ${handler.grpSize}){
      window.location.href='${path}/qna?p=${handler.grpStartPage-1 }';
   }else if(${handler.currentPage} <= ${handler.grpSize}){
      alert("첫 페이지입니다.");
      window.location.href='${path}/qna?p=${handler.grpStartPage }';
   }
}
//다음 페이지로 이동하는 함수
function nextPage(){
   if(${handler.grpEndPage} < ${handler.totalPage}){
      window.location.href='${path}/qna?p=${handler.grpEndPage+1 }';
   }else if(${handler.grpEndPage} == ${handler.totalPage}){
      alert("마지막 페이지입니다.");
   }
}
//로그인 체크 함수
function logincheck(){
   let useriderr = "${useriderr}";
   if(useriderr != ""){
      alert("로그인이 필요한 서비스입니다.");
      let result = confirm("로그인 페이지로 이동하시겠습니까?");
      if(result){
         window.location.href='${path}/login';
         return false;
      }
   }else{
      return true;
   }
}
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
            <li><img src="<%=firstSelectedUser.getUser_image()%>"
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
   <!-- 문의 게시판 -->
   <div class="qna">
      <span class="main-title"> 문의사항</span>
      <div class="qna-list">
         <table class="qna-tb">
            <thead>
               <tr>
                  <td class="title">제목</td>
                  <td class="writer"><span></span>작성자</td>
                  <td class="date"><span></span>작성일</td>
                  
               </tr>
            </thead>
            <tbody>
               <c:forEach var="list" items="${list}">
                  <c:choose>
                     <c:when test="${list.q_check eq 'f' && userid eq 'admin' }">
                        <tr>
                           <td class="title">
                              <form action="${path}/qna" method="POST">
                                 <input type="hidden" value="${list.q_code}" name="code" /> <input
                                    type="submit" value="${list.q_title}" id="title"
                                    class="title-btn" onclick="return logincheck()" /> <span
                                    class="secret">비밀</span>
                              </form>
                           </td>
                           <td class="date"><span></span>${list.q_writer}</td>
                           <td class="date"><span></span>${list.q_date}</td>
                        </tr>
                     </c:when>
                     <c:when
                        test="${list.q_check eq 'f' && userid eq list.q_id}">
                        <tr>
                           <td class="title">
                              <form action="${path}/qna" method="POST">
                                 <input type="hidden" value="${list.q_code}" name="code" /> <input
                                    type="submit" value="${list.q_title}" id="title"
                                    class="title-btn" onclick="return logincheck()" /><span
                                    class="secret">비밀</span>
                              </form>
                           </td>
                           <td class="date"><span></span>${list.q_writer}</td>
                           <td class="date"><span></span>${list.q_date}</td>
                        </tr>
                     </c:when>
                     <c:when
                        test="${list.q_check eq 't' || userid eq list.q_id || userid eq 'admin'}">
                        <tr>
                           <td class="title">
                              <form action="${path}/qna" method="POST">
                                 <input type="hidden" value="${list.q_code}" name="code" /> <input
                                    type="submit" value="${list.q_title}" id="title"
                                    class="title-btn" onclick="return logincheck()" />
                              </form>
                           </td>
                           <td class="date"><span></span>${list.q_writer}</td>
                           <td class="date"><span></span>${list.q_date}</td>
                        </tr>
                     </c:when>
                     <c:when test="${list.q_check eq 'f' }">

                        <tr>
                           <td class="title"><input type="hidden"
                              value="${list.q_code}" name="code" /> <input type="submit"
                              value="비밀글 입니다." id="title" class="title-btn"
                              onclick="return logincheck()" /> <span class="secret">비밀</span>
                           </td>
                           <td class="date"><span></span>${list.q_writer}</td>
                           <td class="date"><span></span>${list.q_date}</td>
                        </tr>
                     </c:when>
                  </c:choose>
               </c:forEach>
            </tbody>
         </table>
         <div class="reg">
            <input type="button" class="reg-btn" value="등록"
               onclick="window.location.href='${path}/qna/reg'">
         </div>
         <div class="page-btn">
            <c:set var="index" value="${handler.grpStartPage }" />
            <input type="button" value="<<" onclick="
               window.location.href='${path}/qna?p=1'"> <input
               type="button" value="<" onclick="prevPage()">

            <c:forEach begin="${handler.grpStartPage }"
               end="${handler.grpEndPage }" var="i">
               <a href="${path}/qna?p=${i}">[${i}]</a>
            </c:forEach>
            <input type="button" value=">" onclick="nextPage()"> <input
               type="button" value=">>"
               onclick="window.location.href='${path}/qna?p=${handler.totalPage}'">
         </div>
      </div>
   </div>




   <%
   }
   %>
</body>
</html>