<%-- 
    Document   : reg_header1
    Created on : 2016-7-7, 18:50:43
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<div id="header">
    <header>
        <h1>С�;ư����߹���ϵͳ</h1>
        <div class="logo"><a href="<%=basePath%>"><img src="<%=basePath%>images/logo.png" title="С�;ư����߹���ϵͳ"></a></div>
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
            <li class="login_windows"><a href="#"><i class="fa fa-user"></i>��½</a></li>
            <li><a href="<%=basePath%>reg.jsp"><i class="fa fa-user-plus"></i>ע��</a></li>
        </ul>
    </header>
</div>
<div id="login">
    <div class="close"><a href="#"><i class="fa fa-close"></i></a></div>
    <div class="title">��Ա��½</div>
    <form action="<%=basePath%>Login" method="post" name="from1">
        <label><i class="fa fa-user fa-2x"></i></label><input type="text" name="username" id="username" placeholder="�û���">
        <label><i class="fa fa-lock fa-2x"></i></label><input type="password" size="15" name="password" id="password" placeholder="����">
        <div id="Ajax_Name"></div>
        <label></label><input style="margin: 5px 20px 0 15px;padding: 0; width: auto; height: auto; float: left;display: inline-block;" type="checkbox" name="ck_MNBUser"><div style="float: left;display: inline-block;font-size: 14px; margin-top: 3px; color: #222">7�����Զ���½</div><br><div class="clear"></div>
        <label></label><input type="submit" id="submit" name="submit" value="���ٵ�½"><a class="more" href="<%=basePath%>reg.jsp">ע��</a><a class="more" href="<%=basePath%>get_pwd.jsp">��������</a>
    </form>
</div>
<div id="login_bg"></div>