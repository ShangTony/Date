<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 16/5/15
  Time: 00:18
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
</head>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
<script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/css/waterfull.css" />
<script type="text/javascript" src="<%=basePath%>resources/js/waterfull.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.masonry.min.js"></script>

<style type="text/css">
  /* Custom Styles */
  ul.nav-tabs{
    width: 200px;
    margin-top: 220px;
    border-radius: 4px;
    border: 1px solid #ddd;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
  }
  ul.nav-tabs li{
    margin: 0;
    border-top: 1px solid #ddd;
  }
  ul.nav-tabs li:first-child{
    border-top: none;
  }
  ul.nav-tabs li a{
    margin: 0;
    padding: 8px 16px;
    border-radius: 0;
  }
  ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
    color: #fff;
    background: #a1d243;
    border: 1px solid #a1d243;
  }
  ul.nav-tabs li:first-child a{
    border-radius: 4px 4px 0 0;
  }
  ul.nav-tabs li:last-child a{
    border-radius: 0 0 4px 4px;
  }
  ul.nav-tabs.affix{
    top: 20px; /* Set the top position of pinned element */
  }

  #check{
    border-radius: 15px 50px;
    padding: 20px;
    width: 400px;
    height:500px;
    margin-top: 120px;
    margin-left: 90px;
    border-style: hidden;
  }
  .panel{
    padding: 20px;
    width: 400px;
    height:500px;
    margin-top: 120px;
    margin-left: 90px;
  rgba(120, 242, 112, 0.45);
    border-radius: 15px 60px;
  }

  ul.nav-tabs {
    width: 150px;
  }
  .list-group-item{
    background-color: rgba(252, 251, 199, 0.2);
  }

  .input-group .form-control{
    background-color: transparent;
    border: 0px;
  }
</style>

<script type="text/javascript">
  $(document).ready(function(){
    $("#myNav").affix({
      offset: {
        top: 125
      }
    });
  });
</script>

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


<div class="container">
  <div class="row">
    <div class="col-xs-3" id="myScrollspy">
      <ul class="nav nav-tabs nav-stacked" id="myNav">
        <li><a href="./showCategory?category=户外运动">户外运动</a></li>
        <li><a href="./showCategory?category=演唱会">演唱会</a></li>
        <li><a href="./showCategory?category=展览" >展览</a></li>
        <li><a href="./showCategory?category=自习">自习</a></li>
        <li><a href="./showCategory?category=逛街">逛街</a></li>
      </ul>
    </div>
    <div class="col-xs-9">
      <div id="zhuti" style="margin-top: 100px;margin-left: 100px;position: absolute;">
        <c:forEach items="${datingList}" var="dating" varStatus="status">
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
  </div>
</div>
</div>





</body>
</html>
