<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 16/5/15
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>个人主页</title>
</head>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/app.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
<script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/css/waterfull.css" />
<script type="text/javascript" src="<%=basePath%>resources/js/waterfull.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.masonry.min.js"></script>
<body>


<div class="navbar-wrapper">
  <div class="container">
    <nav class="navbar navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp"><h3>走起来</h3></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="./show.action">公共</a></li>
            <li class="active"><a href="CreateDate.jsp">发起约会</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                搜索
                <b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li class="time"><a href="search.jsp">时间搜索</a> </li>
                <li class="place"><a href="search2.jsp">地点搜索</a> </li>
                <li class="keywords"><a href="search3.jsp">关键字搜索</a> </li>
              </ul>
            </li>
            <li class="my"><a href="My.jsp">我</a></li>
            <li><a href="./quit">退出</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
  </div>
</div>

<div class="container"style="margin-top: 100px">

  <div class="blog-header">
    <h1 class="blog-title">${Author.showName}的主页</h1>
    <p class="lead blog-description">可以查看${Author.showName}之前发起的约会</p>
  </div>

  <div class="row">
    <div class="col-sm-8 blog-main">
      <div class="col-xs-9">
        <div id="zhuti" style="margin-top: 100px;margin-left: 100px;position: absolute;">
          <c:forEach items="${dateList}" var="dating" varStatus="status">
            <div class="box" style="margin-right: 50px;">
              <div class="content">
                <a href="./show?id=${dating.id}">
                  <img  src="<%=basePath%>${dating.photoPath}">
                </a>
              </div>
              <a href="./show?id=${dating.id}">
                <p style="font-size: 18px;color: #ad6704">名称:${dating.name}</p></a>
              <p style="font-size: 12px;color: #51a351">时间:${dating.time}</p>
              <p style="font-size: 12px;color: #51a351">地点:${dating.place}</p>
            </div>
          </c:forEach>
        </div>
      </div>
    </div><!-- /.blog-main -->

    <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
      <div class="sidebar-module sidebar-module-inset">
        <h4>About</h4>
        <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
      </div>
    </div><!-- /.blog-sidebar -->
  </div><!-- /.row -->
</div><!-- /.container -->

<footer class="blog-footer">
  <p>Blog template built for <a href="http://getbootstrap.com">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
  <p>
    <a href="#">Back to top</a>
  </p>
</footer>


</body>
</html>
