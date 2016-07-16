<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 16/5/7
  Time: 21:55
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
<link rel="stylesheet"
      href="<%=request.getContextPath()%>/resources/css/showDate.css"
      type="text/css" />
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/ButtonStyle.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/style.css">
<script src="<%=basePath%>resources/js/jquery-2.1.3.min.js"></script>
<script src="<%=basePath%>resources/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function(){
        var joinValid=${JoinValid};
        console.log(joinValid);
        if(joinValid==1){
        $("#JoinDate").html('<a href="<%=request.getContextPath()%>/quitDate">退出约会</a>');
        }else if(joinValid==2){
            $("#JoinDate").html('<a href="#">我名下的约会</a>');
        }
    });
</script>

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

    .btn {
        border-bottom: none !important;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-bottom: 20px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        -ms-border-radius: 5px;
        -o-border-radius: 5px;
        border-radius: 5px;
        padding-left: 13px;
        padding-right: 13px;
        margin-right: 10px;
    }

    .btn-group-lg>.btn, .btn-lg {
        padding: 7px 16px;
        font-size: 15px;
        line-height: 1.3333333;
        border-radius: 6px;
    }

</style>

<style>
    body{
        font-size:75%;
        background:#abc;
    }
    ol,ul{
        list-style:none;
    }
    *{
        margin:0;
        padding:0;
    }
    /*--------------------------------------------------------------------
        Comments Section
      --------------------------------------------------------------------*/
    div#comments{
        width:50em;
        clear:both;
        margin:2em;
        background:#EDEDED;
        border:1px solid #ddd;
        padding:1em;
    }

    /*--------------------------------------------------------------------
        Comment Trees Layout
      --------------------------------------------------------------------*/

    ul#comment_tree{
        margin:2.5em 0 1.5em 0;
    }
    ul#comment_tree li{
        margin-bottom:3em;    /*设成和ul.replies的话会比较难识别，亲和力？*/
    }
    /*--------------------------------------------------------------------
        Member Picture Layout
      --------------------------------------------------------------------*/
    ul#comment_tree div.member{
        width:85px;
        max-width:85px;
        float:left;
        background:#EDEDED;
        display:block;
        padding-right:35px;    /*为箭头图片留空*/
        z-index:1000;
    }

    ul#comment_tree div.member img.user_photo{
        display:block;
    }

    /*--------------------------------------------------------------------
        Comments Box Layout
      --------------------------------------------------------------------*/
    ul#comment_tree div.comment{
        width:448px; /*或者auto?*/
        background:#fff;
        float:left;
        position:relative;
        padding:1.0em 15px;

        border: 1px solid #ddd;
    }

    ul#comment_tree h6.comment_date{
        position:absolute;
        left:-32px;
        line-height:32px;
        height:32px;
        color:#ccc;
        padding-left:4em;
        font-size:smaller;
        font-weight:normal;
    }

    /*--------------------------------------------------------------------
        Comments Content Copy Layout
      --------------------------------------------------------------------*/
    div.comment div.comment_content {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 0.9em;
        margin-top: 40px;
        z-index:999;
    }
    /*--------------------------------------------------------------------
        Reply Comment Layout
      --------------------------------------------------------------------*/
    ul#comment_tree  li  ul.replies{
        border-left:1px solid #ddd;
        margin-left:120px;
        padding-top:1em;
    }

    ul#comment_tree  li  ul.replies * ul.replies{ /*:KLUDGE: "*"指的是将所有ul.replies下的ul.replies,
这种方法替代了子选择器方法，从而可令IE6以下版本也可支持*/
        margin-left:24px;
        border-left:1px solid #ddd;
        padding-top:1em;
    }

    ul#comment_tree li.reply{
        padding-left:24px;
    }

    ul#comment_tree li.reply div.comment_wrapper{ /*comment外套，下一级是.member和.comment*/
        position:relative;
    }

    ul#comment_tree li.reply div.member{ /*继承了第一个.member中的z-index，其作用是把用户头像置于
comment上方*/
        position:absolute;
        left:1.25em;
        width:45px;
        top:1.25em;
        padding-right:0;
    }

    ul#comment_tree li.reply div.member img.user_photo{
        width:45px;
        height:45px;
    }

    ul#comment_tree li ul.replies h6.comment_date{
        background:none;
        left:70px;
        top:32px;
        padding-left:0;
    }
    ul#comment_tree li ul.replies li div.comment{
        width:auto;
        max-width:445px;
        float:none;
        padding-top:4em;
    }
    /*--------------------------------------------------------------------
        Clean Floating Tag
      --------------------------------------------------------------------*/
    .clearfix:after{
        content:".";
        clear:both;
        height:0;
        display:block;
        visibility:hidden;
    }

    .clearfix{
        display:inline-block;    /*fix IE-Mac*/
    }

    /* Hides from IE-Mac\*/
    * html .clearfix{ height:1%;} /*fix IE6*/
    .clearfix{ display:block;}    /*reset display on IE*/
    /*End hides from IE-Mac */
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
<div id="main">
  <div class="newcontainer" id="course_intro">
    <div class="course-title" style="margin-top: 40px;font-size: 18px;color: #030303">${dating.name}</div>
    <div class="course_info">
      <div class="course-embed l">
        <div id="js-course-img" class="img-wrap">
          <img width="600" height="340" alt=""
               src="<%=request.getContextPath()%>/${dating.photoPath}"
               class="course_video" />
        </div>
        <div id="js-video-wrap" class="video" style="display: none">
          <div class="video_box" id="js-video"></div>
        </div>
      </div>
      <div class="course_state">
        <ul>
          <li><span>参与人数</span> <em>${dating.num}</em></li>
          <li class="course_hour"><span>约会时间</span> <em
                  class="ft-adjust"><span style="font-size: 14px">${dating.time}</span>秒</em></li>
          <li><span>约会地点</span> <em style="font-size: 12px">${dating.place }</em></li>
        </ul>
      </div>
                      <div class="course_intro">
                          <div class="concerned_course add_concerned_course">
                              <p style="color: whitesmoke">作者信息</p>
                              <p style="color: white;font-size: 20px;position: absolute;margin: 30px 0 30px 15px">
                                 ${author.showName} <br>${author.sex}</p>
                              <a data-id="202"
                                  class="btn-add-follow js-btn-follow"> <i></i>
                                  <a href="./ShowAuthorDate?AuthorId=${author.id}">
                                  <em class="concerned-icon"><img class="img-circle" width="65" height="65"  src="<%=request.getContextPath()%>/${author.imgPath}"   alt="#"/></em>
                                  </a>
                                  </a>
                          </div>
                          <div class="curse_btn" id="JoinDate">
                              <a href="<%=request.getContextPath()%>/joinDate">参与约会</a>
                          </div>
                      </div>

    </div>
    <div class="course_list">
      <div class="outline">
        <h3 class="chapter_introduces">约会介绍</h3>
        <div class="course_shortdecription">${dating.description}</div>

          <form action="./insertMessage" method="get">
             <div class="col-md-12">
                 <div class="form-group">
                     <label for="content" class="sr-only">content</label>
                     <textarea placeholder="说点什么吧。。" name="content" id="content" class="form-control input-lg" rows="3"></textarea>
                 </div>
             </div>
             <div class="col-md-12">
                 <div class="form-group">
                     <input type="submit" class="btn btn-primary btn-lg" value="点我提交" id="send">
                 </div>
             </div>
         </form>


          <!-- comments----------------------------------->
          <div id="comments" class="clearfix">
              <!-- comment tree-->
              <ul id="comment_tree" >
                  <c:forEach items="${messageList}" var="message" varStatus="status">
                  <%--<c:forEach items="${messageUser}" var="user" varStatus="loop">--%>
                  <li>
                      <!-- comment_wrapper-->
                      <div class="comment_wrapper clearfix"  >
                          <div class="member">
                              <h5 class="display_name" style="font-size: 13px;line-height: 40px;padding-left: 10px;margin-bottom: 3px">${messageUser[status.count-1].showName}</h5>
                              <img class="img-circle" width="55" height="55"  src="<%=request.getContextPath()%>/${messageUser[status.count-1].imgPath}"   alt="#"/>
                          </div>

                              <div class="comment">
                                  <h6 class="comment_date" style="color: lightseagreen">${message.messageTime}</h6>
                                  <!-- comment_content-->
                                  <div class="comment_content">
                                      <p style="color: #080808">${message.content}</p>
                                  </div><!-- /comment_content-->
                              </div>
                          </div>
                      </li>
                      </c:forEach>
              </ul> <!-- /comments tree-->
          </div>
          <!-- /comments-->
          </div>


    </div>
  </div>

</div>
</body>
</html>
