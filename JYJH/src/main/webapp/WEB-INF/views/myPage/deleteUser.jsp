<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
   <%@ page import="com.sh.product.domain.ProductDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제 페이지</title>
</head>
<body>


<h3>삭제 페이지</h3>

<%
List<ProductDTO> products = (List<ProductDTO>) session.getAttribute("products");
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    LoginDTO selectedUserList = (LoginDTO) session.getAttribute("selectedUser");
    if (user != null && selectedUserList != null) {
        LoginDTO selectedUser = selectedUserList; 
%>

    <form action="${path}/delete" method="post">
        <input type="text" name="user_code" value="<%= selectedUser.getUser_code() %>">
        <input type="text" name="user_id" value="<%= selectedUser.getUser_id() %>">

        <p>아래 사용자를 삭제하시겠습니까?</p>
        <p>User ID: <%= selectedUser.getUser_id() %></p>
        <p>Password: <%= selectedUser.getUser_pw() %></p>

        <button type="submit">삭제</button>
    </form>

<%
    }
%>

<form action="${path}/myPage">
    <button type="submit">이전으로</button>
</form>

</body>
</html>