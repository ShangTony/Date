<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible"content="IE=9; IE=8; IE=7; IE=EDGE" />
		<title>用户列表页面</title>
		<link href="<%=basePath%>resources/css/all.css" rel="stylesheet" type="text/css" />
		<script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
		<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>

	</head>


<script>
	function deleteBatch(){
		$("#mainForm").attr("action","./deleteBatchDate");
		$("#mainForm").submit();
	}
</script>
	<body style="background: #e1e9eb;">
		<form action="./showDateList" id="mainForm" method="get">
			<div class="right">
				<div class="current">可选菜单:  <a href="./showAdmin" style="color: #A254E2;
                  padding: 10px 20px;
                  border-style: none solid none none;
                  font-size: 15px;">
					用户管理</a>
						<a href="./showDateList" style="color: #65B56A;
                  padding: 10px 20px;
                  font-size: 15px;">约会信息管理</a>
					<a href="./quit" style="color: #A254E2;
                  padding: 10px 20px;
                  border-style: none none none solid;
                  font-size: 15px;">
						退出</a>

				</div>
				<div class="rightCont">
					<p class="g_title fix">约会列表 &nbsp;&nbsp;&nbsp;&nbsp;<a class="btn03" href="javascript:deleteBatch()">批 量 删 除</a></p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">约会名称：</td>
								<td>
									<input name="name" type="text" class="allInput" value="${name}"/>
								</td>
								<td width="90" align="right">约会地点：</td>
								<td>
									<input name="place" type="text" class="allInput" value="${place}"/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th><input type="checkbox" id="all" onclick="#"/></th>
								    <th>约会ID</th>
								    <th>约会名字</th>
									<th>约会是否被授权</th>
								    <th>约会时间</th>
									<th>约会地点</th>
									<th>约会描述</th>
									<th>约会发起者ID</th>
								    <th>操作</th>
								</tr>
								<c:forEach items="${dateList}" var="date" varStatus="status">
								<tr <c:if test="${status.index%2!=0}">style='background-color:#ECF6EE;'</c:if>>
									<td><input type="checkbox" name="id" value="${date.id}" /></td>
									<td>${date.id}</td>
									<td>${date.name}</td>
									<td>${date.isValid}</td>
									<td>${date.place}</td>
									<td>${date.time}</td>
									<td>${date.description}</td>
									<td>${date.authorId}</td>
									<td>
										<a href="./deleteOneDate?id=${date.id}">删除</a>
										<a href="./makeValid?id=${date.id}">授权</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>

						<%--<div class='page fix'>
							共 <b></b> 条
							<a href='###' class='first'>首页</a>
							<a href='###' class='pre'>上一页</a>
							当前第<span>1/1</span>页
							<a href='###' class='next'>下一页</a>
							<a href='###' class='last'>末页</a>
							跳至&nbsp;<input type='text' value='1' class='allInput w28' />&nbsp;页&nbsp;
							<a href='###' class='go'>GO</a>
						</div>--%>

					</div>
				</div>
			</div>
	    </form>
	</body>
</html>