<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.kakaologin.domain.KakaoUserDTO"%>
<%@ page import="com.sh.saveUser.domain.UserDTO"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 헤더 스타일 */
* {
	margin: 0;
	padding: 0;
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
  justify-content: center; /* 변경된 부분 */
  align-items: center;
  width: 100%;
  height: 100px;
  box-sizing: border-box;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h2 {
	margin: 0;
	text-align: center;
	font-size: 24px; /* 폰트 크기 조정 */
}

.menu-icon {
	order: -1;
	font-size: 24px; /* 폰트 크기 조정 */
	cursor: pointer;
}

/* 버튼 스타일 */
header button {
	margin: 5px;
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
	color: black;
}

.main-top {
	max-width: 800px;
	margin: 0 auto; /* 화면 가운데 정렬 */
	    padding: 100px;

	border-radius: 8px;
	background-color: white; /* 배경색 추가 */
	height: 700px;
	display: flex;
	justify-content: center;
	align- items: center;
}

ul {
	list-style-type: none;
	padding: 0;
}

ul li {
	display: inline-block;
		text-decoration: none;
	margin-right: 10px;
}


.inner-div {
	border: 1px solid #ddd;
	margin-top: 33px
;
	width: 500px;
	height: 600px; padding : 20px;
	border-radius: 8px;
	padding: 20px;
}
.inner-div h2{
color: darkslategrey;
}
.inner-div label {
    margin: 40px 0px 16px 0px;
    display: block;
}

.inner-div input {
	width: 100%;
    height: 50px;
    padding: 8px;
    border: 0 solid black;
    margin-bottom: 16px;
    border-bottom: 1px solid #ddd;
    /* border-radius: 1px; */
    box-sizing: border-box;

}

.loginbtn {
    background-color: #ff6f0f;
    margin: 58px 0px 35px 0px;
    width: 100%;
    padding: 15px;
    font-weight: bold;
    color: white;
    font-size: 18px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    color: white;
}

.loginbtn:hover {
	background-color: #d55500;
	color: white;
}

.kakaobtn {
	/* 여기에 해당 버튼에 대한 스타일을 추가하세요 */
	font-weight: bold;
	background-color: #fee500;
	margin: 20px 0px 30px 0px;
	width: 100%;
	padding: 15px;
	color: black;
	font-size: 18px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}
.hr-sect {
    display: flex;
    flex-basis: 100%;
    align-items: center;
    color: #757575;
    font-size: 12px;
    margin: 0px -13px;
    margin-bottom: 10px;
    }
    
    
       .hr-sect::before,
      .hr-sect::after {
        content: "";
        flex-grow: 1;
        background: #ddd;
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
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
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

	<header>


		<form action="${path}/homePage">
			<button type="submit" >Second Hands</button>
		</form>
		
		


	</header>




	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	

	
      Kakao.init("c56a5ac8208747818bdaee7eb60e05ea"); // 카카오 api javascript key
      console.log(Kakao.isInitialized());
      
      function kakaoLogin() {
        Kakao.Auth.login({
          success: function (response) {
            Kakao.API.request({
              url: "/v2/user/me",
              success: function (response) {
            	// api 내 제공 받는 3개의 값 지정  
                document.getElementById("user_kakao").value = response.id;
                document.getElementById("nickname").value =
                  response.properties.nickname;
                document.getElementById("profile_image").value =
                  response.properties.profile_image;      
                document.getElementById("kakaoForm").submit();
               
               
              },
              fail: function (error) {
                console.log(error);
              },
            });
          },
          fail: function (error) {
            console.log(error);
          },
        });
      }
      
      function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: "/v1/user/unlink",
            success: function (response) {
              logout();
              console.log(response);
            },
            fail: function (error) {
              console.log(error);
            },
          });
          Kakao.Auth.setAccessToken(undefined);
        }
      }
      
      function logout() {
        fetch('/logout', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
        }).then(response => {
          location.reload();
        }).catch(error => console.error('Error:', error));
      }
      
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
  	
  
  
    </script>

	<div class="main-top">
		<div></div>
		<div class="inner-div">
			<h2>LOGIN</h2>

			<form id="kakaoForm" method="post" action="${path}/kakaoForm">
				<input type="hidden" id="user_kakao" name="user_kakao" value="" />
				<input type="hidden" id="nickname" name="nickname" value="" /> <input
					type="hidden" id="profile_image" name="profile_image" value="" />
			</form>


			<form action="${path}/login" method="post">
				<div>
					<label for="user_id"></label> <input type="text" id="user_id"
					placeholder="아이디"	name="user_id">
				</div>
				<div>
					<label for="user_pw"></label> <input type="password"
						placeholder="비밀번호" id="user_pw" name="user_pw">
				</div>
				<c:if test="${ not empty param.error}">
					<p style="color: red;">
						잘못된 아이디/비밀번호입니다.<br>다시 입력해주세요.
					</p>
				</c:if>

				<button class="loginbtn" type="submit">로그인</button>
				     <div class="hr-sect">또는</div>
				     
				<ul>
					<button class="kakaobtn" type="button" onclick="kakaoLogin()">
					카카오 회원가입</button>
					<!-- <li onclick="logout();"><a href="javascript:void(0)"> <span>카카오
							로그아웃</span>
				</a></li> -->

				</ul>

		
			</form>
<form id="saveForm" method="post" action="${path}/saveForm" style="text-align: right;">
    <a href="${path}/shSaveUser" style="text-decoration: none; color: #4d4d4d; font-weight: bold;">회원가입</a>
</form>
			
		</div>
	</div>


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