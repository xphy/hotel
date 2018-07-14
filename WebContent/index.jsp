<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<%@ include file="systems.jsp" %>
<%
    //获得当前页面路径目录
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    String uname = (String) session.getAttribute("uname");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title><%=Sitename%></title>
        <link rel="stylesheet" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" href="<%=basePath%>css/glide.core.min.css">
        <link rel="stylesheet" href="<%=basePath%>css/glide.theme.min.css">
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
  
    <div class="logo"><a href="<%=basePath%>"><img src="<%=basePath%>images/logo.png" title=""></a></div>
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
    <%
      if(uname!=null){
       uname = (String)session.getAttribute("uname");
       out.println("<li><a id=\"user_login\">"
               + uname 
               +"，</a></li>"
                +"<li id=\"user_center\"><a href=\"#\">个人中心<i class=\"fa fa-sort-down\" style=\"padding: 0 0 0 10px\"></i></a>"
                +"<ul class=\"sub\">"
                +"<li><a href=\""+basePath+"goods_list.jsp\">购物历史</a></li>"
                +"<li><a href=\""+basePath+"pay.jsp\">预订/付款</a></li>"
                +"<li><a href=\""+basePath+"music.jsp\">推荐音乐</a></li>"
                +"<li><a href=\""+basePath+"email.jsp\">站内邮件</a></li>"
                +"<li><a href=\""+basePath+"updata_user.jsp\">个人信息</a></li>"
                +"<li><a href=\""+basePath+"LoginOut" +"\">退出登录</a></li>"
            +"</ul>"
        +"</li>");
      }
    else {
    %>
    <li class="login_windows"><a href="#"><i class="fa fa-user"></i>登陆</a></li>
    <li><a href="<%=basePath%>reg.jsp"><i class="fa fa-user-plus"></i>注册</a></li>
    <%
    }
    %>
    </ul>
    </header>
</div>
<div id="login">
    <div class="close"><a href="#"><i class="fa fa-close"></i></a></div>
    <div class="title">会员登陆</div>
    <form action="<%=basePath%>Login" method="post" name="Login_form" id="login_form">
        <label><i class="fa fa-user fa-2x"></i></label><input type="text" name="username" id="username" placeholder="用户名">
        <label><i class="fa fa-lock fa-2x"></i></label><input type="password" size="15" name="password" id="password" placeholder="密码">
        <div id="Ajax_Name"></div>
        <label></label><input style="margin: 5px 20px 0 15px;padding: 0; width: auto; height: auto; float: left;display: inline-block;" type="checkbox" name="ck_MNBUser"><div style="float: left;display: inline-block;font-size: 14px; margin-top: 3px; color: #222">7天内自动登陆</div><br><div class="clear"></div>
        <label></label><input type="submit" id="submit" name="Login_submit" value="快速登陆" ><a class="more" href="<%=basePath%>reg.jsp">注册</a><a class="more" href="<%=basePath%>get_pwd.jsp">忘记密码</a>
    </form>
</div>
<div id="login_bg"></div>
  <div class="focus">
  <div class="module module--horizontal">
                <div id="Slideshow" class="glide">

                    <div class="glide__arrows">
                        <button class="glide__arrow prev" data-glide-dir="<">prev</button>
                        <button class="glide__arrow next" data-glide-dir=">">next</button>
                    </div>

                    <div class="glide__wrapper">
                        <ul class="glide__track">
                            <li class="glide__slide">
                                <div class="box"><img src="<%=basePath%>images/2.jpg" style="height: 420px" alt="peer"></div>
                            </li>
                            <li class="glide__slide">
                                <div class="box"><img src="<%=basePath%>images/1.jpg" style="height: 420px" alt="you and me"></div>
                            </li>
                            <li class="glide__slide">
                                <div class="box"><img src="<%=basePath%>images/3.jpg" style="height: 420px" alt="position"></div>
                            </li>
                        </ul>
                    </div>

                    <div class="glide__bullets"></div>

                </div>
            </div>
</div>
<div class="container">
    <jsp:include page="inc/top_news.jsp" flush="true"></jsp:include>
    <jsp:include page="inc/news.jsp" flush="true"></jsp:include>
         
     <figure class="left">
                <figcaption><i class="fa fa-file-photo-o"></i>巴黎5日游，我的感想</figcaption>
                <img src="<%=basePath%>images/112.jpg">
            </figure>
     <figure class="left">
     <figcaption><i class="fa fa-file-photo-o"></i>进口法国红葡萄酒到货</figcaption>
        <img src="<%=basePath%>images/113.jpg">
     </figure>
 </div>
 <div class="clear"></div>
 <div style="width:100%; height:20px;"></div>     
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

    </body>
</html>
