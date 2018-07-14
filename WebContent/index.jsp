<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<%@ include file="systems.jsp" %>
<%
    //��õ�ǰҳ��·��Ŀ¼
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
        <li><a href="<%=basePath%>">��ҳ</a></li>
        <li><a href="<%=basePath%>news.jsp">��Ѷ</a></li>
        <!--<li><a href="beer.jsp">����</a></li>
        <li><a href="photos.jsp">���</a></li>-->
        <li><a href="<%=basePath%>talk.jsp">����</a></li>
        <li><a href="<%=basePath%>pay.jsp">Ԥ��/����</a></li>
        <span id="navslip"></span>
    </ul>
    <ul class="login right">
    <%
      if(uname!=null){
       uname = (String)session.getAttribute("uname");
       out.println("<li><a id=\"user_login\">"
               + uname 
               +"��</a></li>"
                +"<li id=\"user_center\"><a href=\"#\">��������<i class=\"fa fa-sort-down\" style=\"padding: 0 0 0 10px\"></i></a>"
                +"<ul class=\"sub\">"
                +"<li><a href=\""+basePath+"goods_list.jsp\">������ʷ</a></li>"
                +"<li><a href=\""+basePath+"pay.jsp\">Ԥ��/����</a></li>"
                +"<li><a href=\""+basePath+"music.jsp\">�Ƽ�����</a></li>"
                +"<li><a href=\""+basePath+"email.jsp\">վ���ʼ�</a></li>"
                +"<li><a href=\""+basePath+"updata_user.jsp\">������Ϣ</a></li>"
                +"<li><a href=\""+basePath+"LoginOut" +"\">�˳���¼</a></li>"
            +"</ul>"
        +"</li>");
      }
    else {
    %>
    <li class="login_windows"><a href="#"><i class="fa fa-user"></i>��½</a></li>
    <li><a href="<%=basePath%>reg.jsp"><i class="fa fa-user-plus"></i>ע��</a></li>
    <%
    }
    %>
    </ul>
    </header>
</div>
<div id="login">
    <div class="close"><a href="#"><i class="fa fa-close"></i></a></div>
    <div class="title">��Ա��½</div>
    <form action="<%=basePath%>Login" method="post" name="Login_form" id="login_form">
        <label><i class="fa fa-user fa-2x"></i></label><input type="text" name="username" id="username" placeholder="�û���">
        <label><i class="fa fa-lock fa-2x"></i></label><input type="password" size="15" name="password" id="password" placeholder="����">
        <div id="Ajax_Name"></div>
        <label></label><input style="margin: 5px 20px 0 15px;padding: 0; width: auto; height: auto; float: left;display: inline-block;" type="checkbox" name="ck_MNBUser"><div style="float: left;display: inline-block;font-size: 14px; margin-top: 3px; color: #222">7�����Զ���½</div><br><div class="clear"></div>
        <label></label><input type="submit" id="submit" name="Login_submit" value="���ٵ�½" ><a class="more" href="<%=basePath%>reg.jsp">ע��</a><a class="more" href="<%=basePath%>get_pwd.jsp">��������</a>
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
                <figcaption><i class="fa fa-file-photo-o"></i>����5���Σ��ҵĸ���</figcaption>
                <img src="<%=basePath%>images/112.jpg">
            </figure>
     <figure class="left">
     <figcaption><i class="fa fa-file-photo-o"></i>���ڷ��������ѾƵ���</figcaption>
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