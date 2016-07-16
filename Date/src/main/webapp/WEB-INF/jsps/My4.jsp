<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 16/5/10
  Time: 11:54
  To change this template use File | Settings | File Templates.
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
<body>
<table class="table table-hover" style="margin-top: 150px">
  <caption style="font-size: 20px">发起约会列表</caption>
  <thead>

  <tr>
    <th>名称</th>
    <th>时间</th>
    <th>授权情况</th>
    <th>地点</th>
    <th>操作</th>

  </tr>
  </thead>
  <tbody>
  <c:forEach items="${dateList}" var="date" varStatus="status">
    <tr>
      <a href="./show?id=${date.id}">
        <td>${date.name}</td>

      </a>
    <td>${date.time}</td>
      <td>${date.isValid}</td>
    <td>${date.place}</td>
      <td><a href="./deleteDate?dateID=${date.id}">删除</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
