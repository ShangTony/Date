<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 16/5/1
  Time: 12:58
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
<link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/style.css">
<script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap-datetimepicker.css">
<script src="<%=basePath%>/resources/css/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>/resources/css/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=basePath%>/resources/js/ajaxfileupload.js"></script>

<style>
  .file {
    position: absolute;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
  }
  .file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
  }
  .file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
  }

</style>


<script>
  $(document).ready(function(){
    $(".file").on("change","input[type='file']",function(){
      console.log("upload");
      var filePath=$(this).val();
      console.log(filePath);
      if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
        $(".fileerrorTip").html("").hide();
        var arr=filePath.split('/');
        var fileName=arr[arr.length-1];
        console.log(fileName);
        $(".showFileName").html(fileName);
      }else{
        $(".showFileName").html("");
        $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").css({"color":"red"}).show();
        $("#upload").attr("disabled","disabled");
        console.log($("#upload").attr("disabled"));
        return false
      }
    })
  });

  $(document).ready(function() {
    var now = new Date();
    var now_ = now.toLocaleDateString().replace(/\//gm,'-');
    $("#time").val(now_);
    var removeDisable = function(){
      if ($("#name").val() && $("#time").val() && $("#place").val() && $("#description").val() && $('input[name="category"]:checked').val()){
        $("#submit").removeAttr("disabled");
      }else{
        $("#submit").attr("disabled","disabled");
      }
    }
    $(document).on('keyup','#name, #time, #place, #description', function(){
      removeDisable();
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

<div id="fh5co-main">
  <div class="container">
    <div class="row">

      <div class="fh5co-spacer fh5co-spacer-sm"></div>
      <div class="col-md-8">
        <form action="./createDating" method="post" accept-charset="utf-8" enctype="multipart/form-data">
          <div class="col-md-12">
            <div class="form-group">
              <img  id="userImg" width="300" height="200" alt="您的约会配图"
                    <%--src="<%=request.getContextPath()%>/${user.imgPath}"--%>
                    class="course_video" />
              <a class="file">
                <input type="file" name="file" id="imgToUpload"/>点击这里选择约会配图
              </a>
            </div><%--
              <button type="button" class="button button-rounded button-primary button-tiny test" id="upload" style="position: absolute;top: 80px"/>点击上传</button>
--%>
              </br>
              （图片必须是jpg或png格式）
              <p class="showFileName"></p>
              <p class="fileerrorTip"></p>

          </div>
          <div class="col-md-12">
            <div class="form-group">
              <label for="name" class="sr-only">约会名称</label>
              <input placeholder="约会名称" name="name" id="name" type="text" class="form-control input-lg">
            </div>
          </div>
          <div class="col-md-12">
            <div class="form-group controls input-append date form_date" data-link-field="dtp_input2">
              <label for="time" class="sr-only">约会时间</label>
              <input placeholder="约会时间" name="time" id="time" type="text" class="form-control input-lg" value="" readonly>
              <span class="add-on"><i class="icon-remove"></i></span>
              <span class="add-on"><i class="icon-th"></i></span>
            </div>
          </div>

          <div class="col-md-12">
            <div class="form-group">
              <label for="place" class="sr-only">约会地点</label>
              <input placeholder="约会地点" name="place" id="place" type="text" class="form-control input-lg">
            </div>
          </div>

          <div class="col-md-12">
            <div class="form-group">
              <label for="category" class="sr-only">约会类型</label>
              <label class="checkbox-inline" style="color: #387038">
                <input type="radio" checked name="category" id="category1"
                       value="户外运动" >户外运动（不宅家都算）
              </label>
              <label class="checkbox-inline" style="color: #387038">
                <input type="radio" name="category" id="category2"
                       value="演唱会" > 演唱会
              </label>
              <label class="checkbox-inline" style="color: #387038">
                <input type="radio" name="category" id="category3"
                       value="展览" > 展览
              </label>
              <label class="checkbox-inline" style="color: #387038">
                <input type="radio" name="category" id="category4"
                       value="自习" > 自习
              </label>
              <label class="checkbox-inline" style="color: #387038">
                <input type="radio" name="category" id="category5"
                       value="逛街" > 逛街
              </label>
            </div>
          </div>

          <div class="col-md-12">
            <div class="form-group">
              <label for="description" class="sr-only">descripiton</label>
              <textarea placeholder="约会描述" name="description" id="description" class="form-control input-lg" rows="3"></textarea>
            </div>
          </div>
          <div class="col-md-12">
            <div class="form-group">
              <input type="submit" id="submit" class="btn btn-primary btn-lg" disabled value="Send">
            </div>
          </div>
        </form>

      </div>
      <div class="col-md-4">
        <h3>帮助</h3>
        <p>填写相关的约会信息，让我们帮您把约会进行到底！</p>
        <p id="can" style="color: firebrick">一定要把相关信息填写完整，否则无法提交！</p>
      </div>

      <div class="fh5co-spacer fh5co-spacer-md"></div>

    </div>
  </div>


</div>

</body>
<script>
  $(document).ready(function(){
    $('.form_date').datetimepicker({
      language:  'zh-CN',
      weekStart: 1,
      todayBtn:  1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      minView: 2,
      forceParse: 0,
      format:'yyyy-mm-dd'
    });
  });
</script>
</html>
