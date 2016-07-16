<%--
  Created by IntelliJ IDEA.
  User: Tony
  约会
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title></title>
  </head>
  <body><link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=basePath%>resources/css/app.css">
  <link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
  <script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
  <script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
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
            <a class="navbar-brand" href="#">走起来</a>
          </div>
          <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="landing.jsp">登录</a></li>
             <%-- <li><a href="landing.jsp">注册</a></li>--%>
            </ul>
          </div><!-- /.nav-collapse -->
        </div><!-- /.container -->
      </nav><!-- /.navbar -->
    </div>
  </div>
  <div class="onepage">
    <div class="onepage-bg" id="onepagebg">
      <div class="container">
        <div class="row">
          <div class="title-text">
            <div class="col-md-12 headfontsize">
              <h1 class="headh1content">
                去哪儿<br/>
                你从此不再孤单
              </h1>
              <p class="btn-app-store">
                <a class="button button-rounded button-plain button-small-caps button-border" href="#">立即登录，约起来</a>
              </p>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
  </body>
</html>
