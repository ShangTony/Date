<%--
  Created by IntelliJ IDEA.
  User: Tony
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title></title>
</head>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/MainI.css">
<script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap-datetimepicker.css">
<script src="<%=basePath%>/resources/css/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>/resources/css/bootstrap-datetimepicker.zh-CN.js"></script>


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

<div class="main">
<div class="top">
  <div class="container">
    <div class="row">
      <div class="col-md-5">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">约会选择</h3>
          </div>
          <div class="panel-body">
            <div class="list-group">
              <div class="body1">
                <a href="./showCategory?category=户外运动"><h4>户外运动（不宅家都算）</h4></a>
              </div>
              <div class="body2">
                <a href="./showCategory?category=演唱会"><h4>演唱会</h4></a>
              </div>
              <div class="body1">
                <a href="./showCategory?category=展览"><h4>展览</h4></a>
              </div>
              <div class="body2">
                <a href="./showCategory?category=自习"><h4>自习</h4></a>
              </div>
              <div class="body1">
                <a href="./showCategory?category=逛街"><h4>逛街</h4></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img class="first-slide" src="<%=basePath%>resources/img/2.jpg" alt="First slide">
          </div>
          <div class="item">
            <img class="second-slide" src="<%=basePath%>resources/img/3.jpg" alt="Second slide">
          </div>
          <div class="item">
            <img class="third-slide" src="<%=basePath%>resources/img/4.jpg" alt="Third slide">
          </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div><!-- /.carousel -->

    </div>
  </div>
</div>

<div class="favorite">
  <div class="container">
    <div class="headcontent">
  <h2>
    人气最高的出游项目
  </h2>
    </div>
    <c:forEach items="${dateList}" var="date" varStatus="status">
   <c:if test="${status.index%4 ==0}">
    <%
     out.write("<div class=\"row\">");
    %>
   </c:if>
      <div class="col-sm-6 col-md-3">
       <div class="thumbnail">
         <a href="./show?id=${date.id}">
          <img style="height: 180px;width: 335px;"src="<%=basePath%>${date.photoPath}"
               alt="通用的占位符缩略图">
            </a>
        </div>
        <div class="caption">
          <a href="./show?id=${date.id}">
            <h3>${date.name}</h3>
          </a>
          <p>${date.description}</p>
        </div>
      </div>
      <c:if test="${(status.index+1)%4 ==0}">
        <%
          out.write("</div>");
        %>
      </c:if>
      <%-- </c:if>
        <c:if test="${status.index gt 2}">
          <c:set var="flag" value="false"/>
        </c:if>--%>
    </c:forEach>



    <%--<div class="row">
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/14.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>古城穷游</h3>
          <p>想召集小伙伴一起玩耍</p>
        </div>
      </div>
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/13.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>广富林遗址</h3>
          <p>想在快节奏中寻找宁静</p>
        </div>
      </div>
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/11.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>静安公园音乐会</h3>
          <p>找会音乐的小伙伴即兴弹唱</p>
        </div>
      </div>
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/12.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>欢乐谷</h3>
          <p>万圣节想找伙伴去欢乐谷闯鬼屋</p>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/15.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>田子坊</h3>
          <p>去游玩，想认识能一同玩耍的朋友</p>
        </div>
      </div>
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/16.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>华政一日游</h3>
          <p>想在快节奏中寻找宁静</p>
        </div>
      </div>
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/17.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>东华自习</h3>
          <p>想找一同学习的人</p>
        </div>
      </div>
      <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
          <img src="<%=basePath%>resources/img/18.jpg"
               alt="通用的占位符缩略图">
        </div>
        <div class="caption">
          <h3>东华图书馆</h3>
          <p>想找个能一起吃饭聊天的好伙伴</p>
        </div>
      </div>
    </div>--%>
    </div>
</div>

</div>
</div>
</body>
</html>
