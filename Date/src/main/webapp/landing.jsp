<%--
  Created by IntelliJ IDEA.
  User: Tony
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
  <script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
  <script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
</head>
<link href="<%=basePath%>resources/css/bootstrap.min.css" rel="stylesheet"/>
<style>
  .form-signin {
    max-width: 300px;
    padding: 19px 45px 29px;
    margin: 0 auto 20px;
    background-color: rgba(255,255,255,0.9);
    border: 1px solid #e5e5e5;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
    box-shadow: 0 1px 2px rgba(0,0,0,.05);
  }

  body {
    padding-top: 100px;
    padding-bottom: 40px;
    background: url("resources/img/start.jpg")no-repeat center center fixed
  }
  .top{
    width:100%;
    height:50px;
  }
  .checkSuccess{
    border-color:#2b542c;
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #67b168;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
  }


  .checkFail{
    border-color: #843534;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #ce8483;
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #ce8483;
  }

  .top-content{
    width:75%;
    height:50px;
    margin:0px auto;
  }
  h1{
    font-family: "Abel",Arial,sans-serif;
    font-weight: 400;
    font-size:40px;
  }

  .panel{
    background-color: rgba(255,255,255,0.9);
  }

  .form-signin .form-signin-heading,
  .form-signin .checkbox {
    margin-bottom: 10px;
  }

  .form-signin input[type="text"],
  .form-signin input[type="password"] {
    font-size: 16px;
    height: auto;
    margin-bottom: 15px;
    padding: 7px 9px;
  }



</style>

<script>
  $(document).ready(function(){
    $("#cancle").click(function(){
      $("#showLogin").slideToggle("hide");
      $(".div2").slideToggle("show");
    });
    $("#apply").click(function(){
      $("#showLogin").slideToggle("show");
      $(".div2").slideToggle("hide");
    });
    $("#name,#password").on("focus",function(){
      $("#searchResult").hide();
    });
  });

  $(document).ready(function(){
    $("#Login").click(function(){
      var user_name=$("#name").val();
      var user_pwd=$("#password").val();
      $.ajax({
        type:"POST",
        url:"./Login.action",
        data:{ name:user_name,password:user_pwd },
        dataType:"text",
        success:function(data){

          if(data=="false"){
            console.log(data);
            $("#searchResult").text("您的账号或密码不正确！").css({"color":"red"}).show();
          }
          else if(data=="success"){
            location.href="./show.action";
          }
        },
        error:function(jqXHR){
           console.log("发生错误:"+jqXHR.status);
        }
      });
    });
  });

  $(document).ready(function(){
    $("#commit").click(function(){
      var apply_name=$("#applyName").val();
      var apply_pwd=$("#applyPassword").val();
      var apply_showName=$("#applyShowName").val();
      $.ajax({
        type:"POST",
        url:"./Apply.action",
        data:{ name:apply_name,password:apply_pwd,showName:apply_showName },
        dataType:"text",
        success:function(data){
           if(data=="success"){
             $("#searchShowName").text("注册成功!").css({"color":"green"}).show();
          }
        },
        error:function(jqXHR){
          console.log("发生错误:"+jqXHR.status);
        }
      });
    });
  });

  $(document).ready(function(){
    $("#applyName").blur(function(){
      $.ajax({
        type:"POST",
        url:"./Apply.action",
        data:{ name:$("#applyName").val() },
        dataType:"text",
        success:function(data){
          if(data=="false"){
            console.log(data);
            $("#applyName").addClass("checkFail");
            $("#searchName").text("该用户名已存在!").css({"color":"red"}).show();
          }
          else if(data=="Short"){
            $("#applyName").addClass("checkFail");
            $("#searchName").text("用户名不小于4位！").css({"color":"red"}).show();
          }
          else if(data=="success"){
            $("#searchName").text("可以使用！").css({"color":"green"}).show();
            $("#applyName").addClass("checkSuccess");
          }
        },
        error:function(jqXHR){
          console.log("发生错误:"+jqXHR.status);
        }
      });
    });
  });

  $(document).ready(function(){
    $("#applyPassword").blur(function(){
      $.ajax({
        type:"POST",
        url:"./Apply.action",
        data:{ password:$("#applyPassword").val() },
        dataType:"text",
        success:function(data){
         if(data=="Short"){
           $("#applyPassword").addClass("checkFail");
            $("#searchPassword").text("密码不能小于6位！").css({"color":"red"}).show();
          }
          else if(data=="success"){
            $("#searchPassword").text("可以使用！").css({"color":"green"}).show();
           $("#applyPassword").addClass("checkSuccess");
          }
        },
        error:function(jqXHR){
          console.log("发生错误:"+jqXHR.status);
        }
      });
    });
  });

  $(document).ready(function(){
    $("#applyShowName").blur(function(){
      $.ajax({
        type:"POST",
        url:"./Apply.action",
        data:{showName:$("#applyShowName").val()},
        dataType:"text",
        success:function(data){
          if(data=="Short"){
            $("#applyShowName").addClass("checkFail");
            $("#searchShowName").text("昵称不能为空！").css({"color":"red"}).show();
          }
          else if(data=="false"){
            console.log(data);
            $("#applyShowName").addClass("checkFail");
            $("#searchShowName").text("该昵称已存在!").css({"color":"red"}).show();
          }
          else if(data=="success"){
            $("#searchShowName").text("可以使用！").css({"color":"green"}).show();
            $("#applyShowName").addClass("checkSuccess");
          }
        },
        error:function(jqXHR){
          console.log("发生错误:"+jqXHR.status);
        }
      });
    });
  });

</script>
<div class="top">
  <div class="top-content">
    <nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">走起来</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="landing.jsp">登录</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
  </div>
</div>
<div class="container">
  <form id="LoginForm">
  <div class="form-signin">
    <h1 class="form-signin-heading">踏上欢途</h1>
    <div id="showLogin">
      <p>
        <input type="text" id="name" class="input-block-level" placeholder="账号">  <!--name="name" -->
        </br>
        <input type="password" id="password" class="input-block-level" placeholder="密码">
        </br>
      <p id="searchResult"></p>
      <%--<label class="checkbox">
        <input type="checkbox" value="remember-me"> 记住密码
      </label>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
      <button type="button" class="btn-default btn-large btn-primary" id="Login" >登录</button>  <%--/type="submit"/--%>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button" class="btn-success btn-large btn-primary" id="apply">申请</button>
      </p>
    </div>

    <div class="div2" style="display: none">
      <input type="text" id="applyName" class="input-block-level" placeholder="账号">
      <p id="searchName"></p>
      </br>
      <input type="password" id="applyPassword" class="input-block-level" placeholder="密码">
      <p id="searchPassword"></p>
      </br>
      <%--<input type="password" id="confirmPassword" class="input-block-level" placeholder="确认密码">
      </br>--%>
      <input type="text" id="applyShowName" class="input-block-level" placeholder="昵称">
      <p id="searchShowName"></p>
      <button id="cancle" class="btn-success" type="button">取消</button>
      <button id="commit" class="btn-success" type="button">提交</button>
    </div>

    </div>
    </form>
  </div>
</div>

</body>
</html>
