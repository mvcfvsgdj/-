<%@ page contentType="text/html; charset=UTF-8"
   trimDirectiveWhitespaces="true"%>

   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
      <%@ page import="java.util.*" %>
      <c:set var="path" value="${pageContext.request.contextPath}" />
      
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

window.onload = function() {
    var messageArea = document.getElementById('chatArea'); // 채팅창 영역 선택
    var messageText = "  ------------------------------------ 입장버튼을 누르면 채팅에 접속됩니다!! ------------------------------------"; // 출력할 메시지
    
    var messageElement = document.createElement('div'); // 새로운 <div> 엘리먼트 생성
    messageElement.textContent = messageText; // 메시지 설정
    messageElement.style.textAlign = "center"; // 가운데 정렬


    // 채팅창의 맨 위에 메시지를 추가
    var connectionMessage = document.getElementById('connectionMessage');
    connectionMessage.appendChild(messageElement);
};

    var wsocket;

    // WebSocket으로 서버에 연결
       function connect() {
        $('#connectBtn').hide();
        $('#exitBtn').show();
        $('#chatArea').show();
        $('#message').focus();

        wsocket = new WebSocket("ws://localhost:8090${path}/chat-sh");
        //wsocket = new WebSocket("ws://43.201.65.22:8080${path}/chat-sh");
        wsocket.onopen = onOpen;
        wsocket.onmessage = onMessage;
        wsocket.onclose = onClose;
        
    }

    // WebSocket 연결을 닫음
       function disconnect() {
           wsocket.close();
           window.location.href = "homePage";
       }

    // 연결이 열릴 때 호출될 함수
    function onOpen(evt) {
    var messageArea = document.getElementById('chatArea'); // 채팅 창 영역 선택
    var messageText = "  --------------------------------------------- 연결되었습니다 ---------------------------------------------"; // 출력할 메시지
    
    var messageElement = document.createElement('div'); // 새로운 <div> 엘리먼트 생성
    messageElement.textContent = messageText; // 메시지 설정
    messageElement.style.textAlign = "center"; // 가운데 정렬

    
    // 채팅 창 영역에 메시지를 맨 위에 추가
    var connectionMessage = document.getElementById('connectionMessage');
    connectionMessage.appendChild(messageElement);
}

    // 메시지를 받았을 때 호출될 함수
 function onMessage(evt) {
    // 받은 이벤트 로그
    console.log(evt);
    
    var data = evt.data;
    // 받은 데이터가 'msg:'로 시작하는지 확인
    if (data.substring(0, 4) == "msg:") {
        // 'msg:' 이후의 데이터를 ':'를 기준으로 분리하여 배열에 저장
        var messageParts = data.substring(4).split(":");
        var sender = messageParts[0]; // 메시지 보낸 사람
        var messageContent = messageParts[1]; // 메시지 내용
        
        // chatCode가 일치할때만 보내고 받은 메시지 보임
        if (sender == $("#chatCode").val()) {
            appendRecvMessage(messageContent, sender); // 받은 메시지를 출력
        }
    }
}

    // 연결이 닫혔을 때 호출될 함수
    function onClose(evt) {
        alert("연결을 끊었습니다");
    }

 // 메시지 전송
    function send() {
        var nickname = $("#nickname").val();
        var msg = $("#message").val();
        var targetNickname = $("#targetNickname").val(); // 상대방의 이름
        var chatCode = $("#chatCode").val()

        // '입장' 버튼을 누르지 않았을 때 안내 메시지 출력
        // '입장' 버튼을 눌렀는지 안눌렀는지 확인
        if ($('#connectBtn').is(':visible')) {
            var entryMessage = "  ------------------------------------- 입장버튼을 누르고 채팅을 시작하세요 --------------------------------------"; // 안내 메시지                              
            appendEntryMessage(entryMessage); // 채팅창에 안내 메시지 추가            
            return; // 메시지 전송을 중단
        }
      
        
        
        if (msg) {
            // WebSocket을 통해 서버에 메시지 전송
            wsocket.send("msg:" + chatCode + ":" + msg);            
            // 메시지를 전송한 후에는 입력란 비우기
            $("#message").val("");           
            // 자신이 보낸 메시지를 채팅창에 추가하여 표시
             appendSendMessage(chatCode, msg);
        }
    }

    // '입장' 버튼을 누르지 않았을 때 채팅창에 안내 메시지 추가
function appendEntryMessage(entryMessage) {
    var chatMessageArea = document.getElementById('chatMessageArea');
    // 'chatMessageArea' 요소의 내부 HTML에서 'entryMessage' 문자열을 찾음
    //  indexOf() 메서드는 검색된 문자열이 없을 경우 -1을 반환
    // 'entryMessage' 문자열이 'chatMessageArea'에 존재하지 않을 때 아래 코드를 실행
    if (chatMessageArea.innerHTML.indexOf(entryMessage) == -1) {
        // 새 <div> 엘리먼트를 생성하고 'entryMessage'를 텍스트 내용으로 설정
        var entryElement = document.createElement('div');
        entryElement.textContent = entryMessage;
        // 새로운 엘리먼트의 텍스트를 가운데 정렬
        entryElement.style.textAlign = "center";
        // 'entryElement'를 'chatMessageArea'의 첫 번째 자식 요소로 추가하여 채팅창의 맨 위에 표시
        chatMessageArea.insertBefore(entryElement, chatMessageArea.firstChild);
    }
}   
    
    $(document).ready( function(){    
        // 엔터 키로 메시지 전송
        $('#message').keypress(function(event){
            var keycode =  event.keyCode  ;                  
            if(keycode == '13'){               
                send(); 
            }         
            event.stopPropagation();  // 상위로 이벤트 전파 막음
        });

        // 버튼 클릭으로 메시지 전송 및 연결/연결 해제
        $('#sendBtn').click(function() { send(); });
        $('#enterBtn').click(function() { connect(); });
        $('#exitBtn').click(function() { disconnect(); });
    });

 // 상대방의 메시지를 대화창에 출력
    function appendRecvMessage(msg, sender) {
        if (sender) {
            $("#chatMessageArea").append("<div class='recv'>" +"<div class='recvNickname'>"+ $('#targetNickname').val()+"님 " +"</div>"+ "</div>");           
            $("#chatMessageArea").append("<div class='recv'>" +"<div class='recvBox'>"+ msg +"</div>"+ "</div>");
            

        } 
        scrollTop();
    }

    // 자신의 메시지를 대화창에 출력
    function appendSendMessage(sender, msg) {
        if (sender ) {
            $("#chatMessageArea").append("<div class='send'>" +"<div class='sendBox'>"+ msg +"</div>"+"</div>");

        }
        scrollTop();
    }

    // 대화창 스크롤을 아래로 이동
    // 'chatArea'의 스크롤 위치를 설정하여 현재 스크롤 위치를 대화창의 최하단으로 이동합니다.
   // 'scrollTop'은 엘리먼트의 위쪽 끝에서 스크롤된 거리를 나타내며,
   // 'scrollHeight'는 엘리먼트의 전체 높이를 나타냅니다.
   // 대화창이 스크롤 가능한 경우, 'scrollTop'을 'scrollHeight'로 설정함으로써 최하단으로 스크롤이 이동됩니다.
function scrollTop() {
    var chatArea = document.getElementById('chatArea');
    chatArea.scrollTop = chatArea.scrollHeight;
}

    

</script>
<style>

body {
   background-color: #474747;
   padding-top: 30px;
font-family: 'Dongle', sans-serif;   
font-size: 25px;
}

#chatArea {
   width: 800px;
   height: 646px;
   overflow-y: auto;
       border-bottom: 2px solid black;
   margin: 0 auto;
   position: absolute;
   top: 106px;
   background-color: white;
}

.send {
   text-align: right;
   padding: 10px;
   word-break: break-all;
   color: white;
}

.recv {
   text-align: left;
   padding: 5px;
   word-break: break-all;
}

.recvNickname {
   word-break: break-all;
   margin-left: 25px;
   color: black;
}

.sendBox {
   word-break: break-all;
   width: 300px;
   margin-left: 450px;
   background-color: #ff6f0f;
   padding: 10px;
   border-radius: 10px;
}

.recvBox {
   color:white;
   word-break: break-all;
   width: 300px;
   margin-left: 20px;
   background-color: #ff6f0f;
   padding: 10px;
   border-radius: 10px;
}

.chatMessageBox {
   margin-top: 20px;
   margin: 0 auto;
   width: 800px;
   position: absolute;
   bottom: -31px;
}

.chatArea_header {
   height: 100px;
   padding: 30px;
}

.board_Img {
   width: 80px;
   height: 80px;
   margin-top: 10px;
   margin-left: 20px;
   border-radius: 50%;
   border: 1px solid white;
}

.chatArea_header_info {
   position: absolute;
   left: 0px;
   width: 800px;
   top: 0px;
   color: white;
   display: flex;
   border-bottom: 2px solid black;
   height: 99px;
}

.chattingMainBox {
   position: relative;
   width: 800px;
   margin: 0 auto;
   height: 850px;
   border-radius: 50px;
   background-color: white; /* Try changing this */
    box-shadow: 0 0 10px rgba(0, 0, 0, 1.1);
   
}

.board_Details {
   margin-top: 4px;
   margin-left: 15px;
   padding: 10px;
   color: black;
}

.target_heat {
    color: orange;
    font-weight: bolder;
    margin-left: 315px;
    font-size: 40px;
}


#message {
   width: 600px;
   height: 30px;
   margin-left: 30px;
   font-size: 20px;
   border-radius: 8px;
}

.chatMessageBoxButton {
   margin-left: 20px;
   width: 50px;
   height: 30px;
}

.chatMessageBox {
   height: 100px;
}

#myBtn:hover {
   background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
   color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}

.chatting_table {
   width: 1000px;
}

.chatMessageBoxButton {
   background-color: #ff6f0f;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   transition: background-color 0.3s, color 0.3s;
}

.chatMessageBoxButton:hover {
   background-color: #d55500;
}

/* 빨간색 안내 메시지에 대한 스타일 지정 */
</style>

</head>
<body>

       

<c:set var="nickNameCheck" value="${user.user_nickname eq nickName}" />
<c:set var="TargetNickNameCheck" value="${user.user_nickname eq targetNickName}" />

<c:set var="my_heatCheck" value="${user.user_heat eq my_heat}" />
<c:set var="target_heatCheck" value="${user.user_heat eq target_heat}" />

<!-- 
    'nickNameCheck'와 'TargetNickNameCheck' 변수에는 각각 'true' 또는 'false'가 저장됩니다.
    해당 변수들을 사용하여 'nickname'과 'targetNickname' input 요소의 값을 설정합니다.
    'nickNameCheck'가 'true'일 경우 'nickName'이 'nickname' input에 설정되며,
    그렇지 않은 경우 'targetNickName'이 'nickname' input에 설정됩니다.
    'TargetNickNameCheck'가 'true'일 경우 'nickName'이 'targetNickname' input에 설정되며,
    그렇지 않은 경우 'targetNickName'이 'targetNickname' input에 설정됩니다.
-->

<input type="hidden" id="nickname" value="${nickNameCheck ? nickName : targetNickName}">
<input type="hidden" id="targetNickname" value="${TargetNickNameCheck ? nickName : targetNickName}">

<input type="hidden" id=my_heat value="${my_heatCheck ? my_heat : target_heat}">
<input type="hidden" id="target_heat" value="${target_heatCheck ? my_heat : target_heat}">
<input type="hidden" id="chatCode" value="${chatCode}">




<div class="chattingMainBox">
<div class=" chatArea_header_info">
<img class="board_Img" src= "<c:url value=" images/${board_Img}"/>">
    <div class="board_Details">
        <div class="board_Title">상품명: ${board_Title}</div>
<div class="board_Price" id="board_Price_check"> 
  <% if ("0".equals(request.getAttribute("board_Price"))) { %>
    나눔🧡
  <% } else { %>
    가격:<%= request.getAttribute("board_Price") %>원
  <% } %>
</div>
    </div>
   
   
   </div>
   
<div id="chatArea">
            <div class="target_heat">${TargetNickNameCheck ? nickName : targetNickName}님 : ${target_heatCheck ? my_heat : target_heat}℃</div>

    <!-- 채팅창의 맨 위에 메시지가 표시될 위치입니다 -->
    <div id="connectionMessage" style="margin-bottom: 10px;"></div>

    <!-- 실제 채팅 메시지가 표시될 위치입니다 -->
    <div id="chatMessageArea"></div>
</div>

<div class="chatMessageBox">
    <input type="text" id="message">
<input class="chatMessageBoxButton" type="button" id="sendBtn" value="전송" onclick="send()">
<input class="chatMessageBoxButton" type="button" id="connectBtn" value="입장" onclick="connect()">
<input class="chatMessageBoxButton" type="button" id="exitBtn" value="나가기" onclick="disconnect()" style="display: none">
</div>
</div>



</body>
</html>