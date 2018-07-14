<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>找回密码/忘记密码_<%=Sitename%></title>
        <link rel="stylesheet" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5.js"></script>
          <script src="js/respond.js"></script>
        <![endif]-->
    </head>
    <body>
        <div id="header">
    <header>
        <h1>小型酒吧在线管理系统</h1>
        <div class="logo"><a href="<%=basePath%>"><img src="<%=basePath%>images/logo.png" title="小型酒吧在线管理系统"></a></div>
        <ul class="nav block">
            <li><a href="<%=basePath%>">首页</a></li>
        <li><a href="<%=basePath%>news.jsp">资讯</a></li>
        <!--<li><a href="beer.jsp">酒类</a></li>
        <li><a href="photos.jsp">相册</a></li>-->
        <li><a href="<%=basePath%>talk.jsp">留言</a></li>
        <li><a href="<%=basePath%>pay.jsp">预定/付款</a></li>
            <span id="navslip"></span>
        </ul>
        <ul class="login right">
            <li class="login_windows"><a href="#"><i class="fa fa-user"></i>登陆</a></li>
            <li><a href="<%=basePath%>reg.jsp"><i class="fa fa-user-plus"></i>注册</a></li>
        </ul>
    </header>
</div>
<div id="login">
    <div class="close"><a href="#"><i class="fa fa-close"></i></a></div>
    <div class="title">会员登陆</div>
    <form action="<%=basePath%>Login" method="post" name="from1">
        <label><i class="fa fa-user fa-2x"></i></label><input type="text" name="username" id="username" placeholder="用户名">
        <label><i class="fa fa-lock fa-2x"></i></label><input type="password" size="15" name="password" id="password" placeholder="密码">
        <div id="Ajax_Name"></div>
        <label></label><input style="margin: 5px 20px 0 15px;padding: 0; width: auto; height: auto; float: left;display: inline-block;" type="checkbox" name="ck_MNBUser"><div style="float: left;display: inline-block;font-size: 14px; margin-top: 3px; color: #222">7天内自动登陆</div><br><div class="clear"></div>
        <label></label><input type="submit" id="submit" name="submit" value="快速登陆"><a class="more" href="<%=basePath%>reg.jsp">注册</a><a class="more" href="<%=basePath%>get_pwd.jsp">忘记密码</a>
    </form>
</div>
<div id="login_bg"></div>
        <div class="focus">
                <div class="news_pic"></div>
        </div>
        <div class="container">
            <div class="get_pwd left">
                <h2><i class="fa fa-key"></i>找回密码</h2>
                <form name="form_getpwd" action="<%=basePath%>GetPwd.Tao" method="post" target="_self">
                    您在本站注册的用户名：
                    <input name="UserName" type="text" id="UserName">
                    <input name="submit_getpwd" type="submit" value="取回密码">
                </form>
                <div class="error"></div>
                <div class="some_info" style="line-height: 3;color: #666">
                    <i>*找回密码，请正确输入在本站注册的用户名，否则将无法找回密码！</i><br>
                    <i>*密码发送失败，主要原因是服务器正在维护中，因此不要太过担心，我们会尽快处理网站服务器，如果尝试多次无果，请与管理员联系！</i><br>
                    <i>*密码发送成功后，请及时查看你在本站注册时使用的注册邮箱内的邮件，并且获得密码后，请及时删除邮件，以防密码泄露！</i>
                </div>
            </div>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
<div id="footer">
	<footer>
    	<div style="width:100%; height:20px;"></div>     
    	<div class="copy">CopyRight &copy <mark>MiniBarCMS</mark> System. Power By Java MVC Model. Project create by <mark>Mr.tao</mark>.</div>
	</footer>
</div>
<script src="<%=basePath%>js/jQuery1.12.4.js"></script>
<script src="<%=basePath%>js/jquery.cookie.js"></script>
<script src="<%=basePath%>js/mbase64.js"></script>
<script src="<%=basePath%>js/glide.min.js"></script>
<script src="<%=basePath%>js/bar.js" charset="utf-8"></script>

        <script>
            $(function(){
                $('input[name=submit_getpwd]').click(function(){
                    if($('input[name=UserName]').val()==='' || $('input[name=UserName]').val().length<=0){
                        return false;
                    }
                });
                //用户登录ajax查询用户名是否存在或者为空
                $('input[name=UserName]').blur(function(){
                        $.ajax({
                                type:'GET',
                                url:'<%=basePath%>LoginUser.Tao',
                                dataType:'html',
                                data:'username='+encodeURI(encodeURI($(this).val())),
                                beforeSend:function(XMLHttpRequest)
                                {
                                        $('.error').text('正在查询');
                                        //Pause(this,100000);
                                },
                                success:function (response,status,xhr) {
                                        $('.error').html(response);
                                }
                        });
                //alert($(this).val());
                });
            });
            
        
        </script>
    </body>
</html>
