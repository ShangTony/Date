<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/MainI.css">
<script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>

<style type="text/css">
    body{background-color: white}
    .bg-div{position:relative;background-image: url("<%=basePath%>/resources/img/search.jpg");width:1500px;height:350px;background-size:1500px 370px;margin: 0 auto;}
    .search-form{float: left; background-color: #fff;padding:5px;}
    .search-text{height:25px;line-height: 25px;float: left;width: 350px;border: 0;outline: none;}
    .search-button{background-image: url("<%=basePath%>/resources/img/search-button.png");width:29px;height:29px;float: left;border: 0}
    .search-box{position:absolute;top:150px;left: 450px; }
    .search-result{padding-top: 250px;}
</style>
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

<div class="input-group">

    <div class="bg-div">
        <h3 style="height:53px;width: 107px; float: left;margin: 100px 0 0 590px;color: white">地点搜索</h3>
        <div class="search-box">
            <form class="search-form"  action="./placeSearch" method="get" accept-charset="utf-8">
                <input type="text" class="search-text" name="place"/>
                <input type="submit" class="search-button" value=""/>
            </form>
        </div>
        <div class="search-result">
            <div class="container-fluid" style="margin-top: 30px;">
                <c:forEach items="${datingList}" var="dating" varStatus="status">
                <div class="row-fluid">
                    <div class="well" style="width: 800px;margin-left: 300px;">
                        <div>
                            <p style="font-size: 18px">
                                <a href="./show?id=${dating.id}">
                                <img src="<%=basePath%>${dating.photoPath}" style="width: 250px; height: 150px; margin-left: 30px">
                                </a>
                                <a href="./show?id=${dating.id}">
                                ${dating.name}
                                    </a>
                            </p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>

        </div>
    </div>

</div>
</body>
</html>