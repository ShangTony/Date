<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/test.css">
    <script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
    <script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap-datetimepicker.css">
    <script src="<%=basePath%>/resources/css/bootstrap-datetimepicker.js"></script>
    <script src="<%=basePath%>/resources/css/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="<%=basePath%>/resources/js/ajaxfileupload.js"></script>

</head>
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
    .disabled-input{
        background-color: #FFFEF4;
        border-width: 0;
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

    $(document).ready(function(){
        $("#upload").click(function(){
            $.ajaxFileUpload({
                url:"./doUpload",
                type:'POST',
                secureuri:false,
                fileElementId:'imgToUpload',
                dataType : "json",
                success:function(data){
                    var path = "<%=request.getContextPath()%>/";
                    alert(data.imgPath);
                    $(".course_video").attr("src",path+data.imgPath);
                },
                error:function(data,status,e){
                    console.log("6666");
                    console.log(e);
                    console.log(status);
                }
            });
        });
    });


</script>
<body>
<%--<div class="panel">--%>
<div class="panel panel-primary">
    <div class="panel-heading">
        我的个人资料
    </div>
    <ul class="list-group">
        <li class="list-group-item">
            <img id="userImg"  width="100" height="100" alt="您的头像"
                 src="<%=request.getContextPath()%>/${user.imgPath}"
                 class="course_video" />
            <a class="file">
                <input type="file" name="file" id="imgToUpload"/>点击这里选择头像
            </a>
            <button type="button" class="button button-rounded button-primary button-tiny test" id="upload" style="position: absolute;top: 80px"/>点击上传</button>（图片必须是jpg或png格式）
            <p class="showFileName"></p>
            <p class="fileerrorTip"></p>

        <form action="./modifyUser" method="get" accept-charset="utf-8">
        用户: <input type="text" name="name"  id="name" class="disabled-input" disabled value=${user.name} /></li>
        <li class="list-group-item">昵称: <input type="text" id="showName" name="showName" class="disabled-input" disabled value=${user.showName} /></li>
        <li class="list-group-item">生日:
            <div class="controls input-append date form_date" data-link-field="dtp_input2">
                <input size="16" class="disabled-input" id="birthday" name="birthday" disabled type="text" value=${user.birthday} readonly>
                <span class="add-on"><i class="icon-remove"></i></span>
                <span class="add-on"><i class="icon-th"></i></span>
            </div>
        </li>
        <li class="list-group-item">
            性别：
            <label class="checkbox-inline" id="sex">
                ${user.sex}
        </li>
          <li class="list-group-item">
         <button type="button" id="modify" class="button button-glow button-rounded button-caution button-small" />修改资料</button>
        <button type="submit" class="button button-glow button-rounded button-highlight button-small" />保存修改</button>
        </li>
        </form>
    </ul>
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


    $(document).ready(function(){
        $("#modify").click(function(){
            $("#showName").removeAttr("disabled");
            $("#showName").removeClass("disabled-input");
            $("#name").removeAttr("disabled");
            $("#name").removeClass("disabled-input");
            $("#birthday").removeAttr("disabled");
            $("#birthday").removeClass("disabled-input");
            $("#sex").html(
                    '<input type="radio" name="sex" id="male" value="男" >男 </label>' +
                    '<label class="checkbox-inline">'+
                    '<input type="radio" name="sex" id="female"value="女" > 女 </label>'
            );
        });
    });
</script>
</html>