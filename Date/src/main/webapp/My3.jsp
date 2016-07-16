<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
    <script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
    <script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
</head>
<style>
.tp{
    padding: 20px;
    margin-top: 120px;
    margin-left: 15px;
}
</style>
<body>
   <div class="container">
       <div class="tp">
       <div class="col-md-3">
   <div class="panel panel-success">
       <div class="panel-heading">
           增加您的行程安排
       </div>
       <ul class="list-group">
           <li class="list-group-item">
               <div class="input-group">
                   <input type="text" class="form-control" placeholder="计划名称" aria-describedby="basic-addon1">
               </div>
           </li>
           <li class="list-group-item">
               <div class="input-group">
                   <input type="text" class="form-control" placeholder="计划时间" aria-describedby="basic-addon1">
               </div>
           </li>
           <li class="list-group-item">
               <div class="input-group">
                   <input type="text" class="form-control" placeholder="计划描述" aria-describedby="basic-addon1">
               </div>
           </li>
       </ul>
   </div>
   </div>
   </div>
   </div>
</body>
</html>