<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 16/5/14
  Time: 00:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>登陆 LOGIN</title>
  <link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/css/adminLogin.css">
  <script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
  <script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
</head>

<script>
  $(document).ready(function(){
    $("#Login").click(function(){
      var user_name=$("#inputUsername").val();
      var user_pwd=$("#inputPassword").val();
      console.log(user_name);
      console.log(user_pwd);
      $.ajax({
        type:"POST",
        url:"./adminLogin",
        data:{ name:user_name,password:user_pwd },
        dataType:"text",
        success:function(data){
          if(data=="false"){
            console.log(data);
            $("#searchResult").text("您的账号或密码不正确！").css({"color":"red"}).show();
          }
          else if(data=="success"){
            location.href="./showAdmin";
          }
        },
        error:function(jqXHR){
          console.log("发生错误:"+jqXHR.status);
        }
      });
    });
  });
</script>


<body>
<div class="login-wrapper">
  <div class="container">
    <div class="login-title">
      <p style="font-size: 25px;color: white;font-weight:bold;">走起来约会管理员系统</p>
     </div>
    <div class="login-block">
      <div class="form-signin-heading">
        <h2>用户登录</h2>
      </div>
      <form id="form_signin" class="form-signin">
        <div class="input-group">
          <span class="input-group-addon"><span class="input-icon input-icon-username"></span></span>
          <input type="text" id="inputUsername" class="form-control" name="username" placeholder="用户名" autofocus="">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><span class="input-icon input-icon-password"></span></span>
          <input type="password" id="inputPassword" class="form-control" name="password" placeholder="密码">
        </div>
        <p id="searchResult"></p>
        <div class="text-center">
          <button class="btn btn-login" id="Login" type="button">登录</button>
        </div>
      </form>
    </div>
  </div>
  </div>
</body>
</html>
