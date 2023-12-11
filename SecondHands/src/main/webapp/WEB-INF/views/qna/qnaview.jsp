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

textarea {
    resize: none;
}

   
</style>
<style>
    .qnaview{
        margin:0 auto;
        margin-top: 20px;
        margin-bottom: 20px;
        border-radius:26px;
        width:1008px;
    }
    .qnaview input[type=button]{
   background-color: #ff6f0f;
      color: #fff;
    border-radius: 4px;
    border: none;
    cursor: pointer;
   }
   .qnaview input[type=button]:hover{
      background-color: #d55500;
   }
    .qna{
        margin:0 auto;
        width:1008px;
    }
    table{
        border-collapse: collapse;
        width: 100%;
    }
    .qna div{
        min-height: 70px;
        padding: 30px 20px 10px 20px;
    }
    .title{
       border-bottom: 1px solid #0000002e;
       font-size: 38px;
       font-weight: 600;
       padding-botton:20px;
       position:relative;
    }
    .qna-datetime{
       font-size:15px;
       font-weight:500;
       color:#0000006b;
       position:absolute;
       left: 24px;
       bottom: 2px;
    }
    .contents{
       
    }


    .submit{
        height: 42px;
        position: relative;
        border-bottom: 2px solid #0000002e;
    }
    .comment-title{
       padding:10px;
       font-size:25px;
       font-weight:700;
    }
    .cometnull{
       height:20px;
       font-size:20px;
       font-weight:500;
    }
    
    .back{
        position: absolute;
        top: 10px;
        left: 10px;
        background-color: #ff6f0f;
         color: #fff;
          border-radius: 4px;
          border: none;
       cursor: pointer;
    }
    .update{
        position: absolute;
        top: 10px;
        right: 80px;
        background-color: #ff6f0f;
         color: #fff;
       border-radius: 4px;
       border: none;
       cursor: pointer;
       
    }
    .delete{
 
         position: absolute;
        top: 10px;
        right: 10px;
        background-color: #ff6f0f;
         color: #fff;
       border-radius: 4px;
       border: none;
       cursor: pointer;
    }
   .back:hover{
   background-color: #d55500;
   }
   .update:hover{
   background-color: #d55500;
   }
   .delete:hover{
   background-color: #d55500;
   }
   .comment{
        background-color: #fffcebd4;
   }
    .comment-textbox{
        padding: 20px 10px 10px 10px;
        height: 86px;
        position:relative;
    }
    .comment-text{
       width: 961px;
       height: 36px;
       padding:9px;
    }
    .comment-btn{
       position:relative;
       display:block;
       height:30px;
    }
   .comment-btn input{
      position:absolute;
      right: 7px;
      bottom: 8px;
   }
    .cometbox {
       min-height:75px;
       padding: 5px 20px 5px 10px;
       position:relative;
        border-radius: 7px;
   }
   .cometwriter{
      font-size:15px;
      height:30px;
   }
   .comment{
      min-height:28px;
   }
   .date{
      font-size:14px;
      color:#0000004f;
      font-weight:600;
      height:20px;
      border-bottom: 2px solid #0000002e;
   }
   .cometupbtn{
      position:absolute;
      right:64px;
      top:7px;
   }
   .cometdelbtn{
      position:absolute;
      right:20px;
      top:7px;
   }
   .cometup_text{
      width: 961px;
       height: 36px;
       padding:9px;
   }
   .cometupregbtn{
      position:relative;
       display:block;
       height:30px;
       border-bottom: 2px solid #0000002e
   }
   .cometupregbtn input{
      position:absolute;
      right: -3px;
      bottom: 8px;
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
</script>
<script>


function del(n){ // 버튼 클릭 시 게시글 삭제
   let result = confirm("글을 삭제하시겠습니까?");
   if(result == true){
     
      return true;
   }else{
      return false;
   }
   

};

function idcheck(){// session에 저장된 id가 같거나 'admin'일 경우 수정,삭제 버튼 보이기
   if ('${id}' == '${userImp.q_id}') {
       document.getElementById('delete').style.display = 'block';
       document.getElementById('update').style.display = 'block';
   } else {
       document.getElementById('delete').style.display = 'none';
       document.getElementById('update').style.display = 'none';
   }
   
   if ('${id}' == 'admin') {
       document.getElementById('update').style.display = 'none';
       document.getElementById('delete').style.display = 'block';
	} 
}

</script>
<script >

$(document).ready(function(){
   let cometnull = '${cometnull}'; // 댓글리스트가 null인 경우 't' null이 아닌경우 'f' 
   listnull(cometnull);
   
});

function listnull(c){ // 댓글리스트가 null일 경우
   if(c == 't'){
   $('#commentlistbox').append('<p id = "cometnull" '+
         'style="size:40px; text-align: center; height:25px; font-size:20px; padding: 35px 0px 20px 0px; margin:0;">댓글이 없습니다</p>');
   } else {
      let id = '${id}';
      listview(id);
   }
   
} 


function listview(id){ // 댓글리스트 불러오기
   let cometlist = ${cometlist}
   cometlist.forEach(function(list){
      if (id == list.q_id || id == 'admin'){ //session에 저장된 id 값이 같거나 'admin'일때 
         $('#commentlistbox').append(' <div id = "cometbox" class = "cometbox">'+
                     '<div id= "cometwriter" class = "cometwriter">'+ list.q_writer + '</div>' +
                     '<div id= "comment" class="comment">'+ list.q_comment + '</div>' +
                     '<div class="date">'+list.q_date +" " +list.q_time+'</div>'+
                     '<input type="hidden" id="cometup_key" value="'+list.q_code_co+'">'+
                     '<input type="hidden" id="id_key" value="'+list.q_id+'">'+
                     '<input type="button" id="cometupbtn" class="cometupbtn" value="수정" onclick="upbtn(this)">' +
                     '<input type="button" id="cometdelbtn" class="cometdelbtn" value="삭제" onclick="cometdel(this)">' +
                     '<div id = "cometupbox" class = "cometupbox" style="display: none">'+
                     '<textarea  id="cometup_text" class="cometup_text"  placeholder="수정할 댓글을 입력하세요. 150자이내" required></textarea>'+
                     '<div class="cometupregbtn"> <input type="button" id="cometupregbtn"  value="수정하기"  onclick="upregbtn(this)"> </div> </div> </div>');
      }else if(id != list.q_id){  // session에 저장된 id 값이 댓글에 저장된 id와 다른 경우 수정,삭제 버튼 X
         $('#commentlistbox').append(' <div id = "cometbox" class="cometbox">'+
               ' <div id= "cometwriter" class = "cometwriter">'+ list.q_writer + '</div>' +
               '<div id= "comment" class="comment">'+ list.q_comment + '</div>' +
               '<div class="date">'+list.q_date+  " " +list.q_time+'</div>'+
               '<input type="hidden" id="cometup_key" value="'+list.q_code_co+'">'+
               '<input type="hidden" id="id_key" value="'+list.q_id+'"> </div>');
      }
   });
}




function reg(){ // 댓글 등록
   let code = '${userImp.q_code}';
   let writer = '${writer}';
   let id = '${id}';
   let comment = $('#q_comment').val();
   if(comment != ""){ // 댓글내용이 없을때
      if(id == 'admin'){ // 로그인 아이디가 관리자 아이디일 경우 닉네임을 무조건 관리자로
         writer = '관리자';
      }
      let data = {
         q_code: code,
         q_id: id,
         q_comment: comment,
         q_writer: writer
      };
         $.ajax({
         url: "${path}/qna/cometreg",
         type: "post",
         data:  data,
         success: function(c){
            let q_code_co = c.q_code_co;
            let q_date = c.q_date;
            let q_time = c.q_time;
            if($('#cometnull').text()){
               $('#cometnull').remove();
            }
            $('#commentlistbox').append('<div id = "cometbox" class="cometbox">'+
                  ' <div id= "cometwriter" class="cometwriter">'+ writer + '</div>' +
                  '<div id= "comment" class="comment">'+ comment + '</div>' +
                  '<div class="date">' +q_date + " " + q_time+'</div>'+
                  '<input type="hidden" id="cometup_key" value="'+q_code_co+'">'+
                  '<input type="hidden" id="id_key" value="'+id+'">'+
                  '<input type="button" id="cometupbtn" class="cometupbtn" value="수정" onclick="upbtn(this)" >' +
                  '<input type="button" id="cometdelbtn" class="cometdelbtn" value="삭제" onclick="cometdel(this)">' +
                  '<div id = "cometupbox" class="cometupbox" style="display: none">'+
                  '<textarea  id="cometup_text" class="cometup_text"  placeholder="수정할 댓글을 입력하세요. 150자이내" required></textarea>'+
                  '<div class="cometupregbtn"> <input type="button" id="cometupregbtn"  value="수정하기"  onclick="upregbtn(this)"> </div> </div> </div>');
            $('#q_comment').val("");
         },
         error: function(e){
            alert("등록실패");
         }
      });
   }else{
      alert("댓글을 입력하세요");
      event.stopPropagation();
   }
   
};

function upbtn(c) {   // 댓글 수정버튼 토글
    let cometbox = $(c).closest('#cometbox');
    cometbox.find('#cometupbox').toggle();


};

function upregbtn(c){ // 댓글 수정
   let cometbox = $(c).closest('#cometbox');
   let code = cometbox.find('#cometup_key').val();
   let comment = cometbox.find('#cometup_text').val();
   
   if(comment == ""){ // 댓글내용이 없을때
      alert("수정할 댓글을 입력하세요");
      event.stopPropagation();
   }else{ // 댓글내용이 있을때
   let data ={
         q_code_co : code,
         q_comment : comment
   };
   $.ajax({
      url: "${path}/qna/cometup",
      type: "post",
      data: data,
      success: function(s){
         cometbox.find('#comment').text(comment);
          cometbox.find('#cometup_text').val("");
          cometbox.find('#cometupbox').css('display', 'none');
      },
      error: function(e){
         alert("수정실패");
      }
   });
   }
};

function cometdel(c){ // 댓글 삭제
   let cometbox = $(c).closest('#cometbox');
   let q_code_co = cometbox.find('#cometup_key').val();
   let f = confirm("댓글을 삭제하시겠습니까?");
   if(f){
      
      let data={
            q_code_co : q_code_co
      };
      $.ajax({
         url: "${path}/qna/cometdel",
         type: "post",
         data: data,
         success:function(s){
            cometbox.remove();
         },
         error:function(e){
            alert("삭제실패");
         }
      });
   }
};



</script>
</head>


<body onload = "idcheck()">
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
            <li><img
               src="<%=firstSelectedUser.getUser_image()%>"
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
   

        <div class="qnaview">
           <div class ="qna">
              <div class="title">
                  <span>${userImp.q_title }</span>
                  <span class="qna-datetime">작성자: ${userImp.q_writer} | ${userImp.q_date} ${userImp.q_time}</span>
              </div>              
              <div class="contents">
                  <span>${userImp.q_contents}
                  </span>
              </div>
           </div>
           
           
           <div class="submit">
               <form action="${path}/qna" method="get">
                   <input type="submit" value="목록으로" class="back">
               </form>
               <form action="${path}/qna/qup" method="get">
                   <input type="hidden" value="${userImp.q_code}"  name = "code">
                   <input type="submit" id ="update" class="update" value="수정하기"/>
               </form>
               <form action="${path}/qna/qdel" method="post" >
                   <input type="hidden" value="${userImp.q_code}" name="code">
                   <input type="submit" onclick="return del(this.form)" class="delete" id = "delete" value="삭제하기"/>
               </form>
           </div>
           <div class="comment-title">
              <span >댓글</span>
           </div>
           
           <div class="comment">
               <div>
                   <div id="commentlistbox" class="commentlistbox">
                   </div>
               </div>
               <div id = "comment_text" class="comment-textbox">
                  <textarea class="comment-text" name="q_comment" id="q_comment"  placeholder="댓글을 입력하세요. 150자이내" required></textarea>
                  <div class="comment-btn">
                      <input type="button"  id = "commentbtn"  value="등록" onclick="reg()">
                  </div>
               </div>
           </div>
    </div>




   <%
   }
   %>

</body>
</html>