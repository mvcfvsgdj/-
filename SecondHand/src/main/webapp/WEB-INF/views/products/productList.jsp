<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="java.util.*"%>
<c:set  var="path"   value="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>

<body>
    <h2>Product List</h2>
   <%
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
   if (user != null && selectedUser != null) {
      LoginDTO firstSelectedUser = selectedUser; // Assuming you want the first user in the list
   %>
    <h2>Welcome, <%= firstSelectedUser.getUser_nickname() %></h2>
<%
    }
%>
    <form action="${path}/products" method ="post">
    <table border="1">
        <thead>
            <tr>
            	<th>분류</th>
                <th>제목</th>
                <th>시간</th>
                <th>작성자</th>
                <th>지역</th>
                <th>가격</th>
                <th>조회수</th>

                <th>사진</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                	<td>[${product.board_cate}]</td>
                    <td><a href="${path}/products/detail?boardId=${product.board_Id}">${product.board_Title}</a></td>
                    <td>${product.board_Date}</td>
                    <td>${product.user_nickname}</td>
                    <td>${product.loc_code}/${product.detail_loc}</td>
                    <td>${product.board_Price}</td>
                    <td>${product.board_Click }</td>

                    <td><img src="<c:url value="/images/${product.board_Img}" />" alt="Product Image" style="max-width: 500px; max-height: 500px;"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <br>

   
    </form>
    <form action="${path}/products/add">
      <button type="submit">게시글작성</button>
   </form>
       <form action="${path}/myPage">
      <button type="submit">마이페이지이동</button>
   </form>

   <form action="${path}/products">
      <button type="submit">상품</button>
   </form>

   <form action="${path}/login">
      <button type="submit">가입 및 로그인</button>
   </form>
   
<form action="${path}/logout" method="post">
    <button type="submit">로그아웃</button>
</form>
</body>
</html>