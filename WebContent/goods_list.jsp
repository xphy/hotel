<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<%
	String uname = (String) session.getAttribute("uname");
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        if(uname==null || uname.length() <= 0){
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
        out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
        out.println("<!--[if lt IE 9]>");
        out.println("<script src=\""+basePath+"js/html5.js\"></script>");
        out.println("<script src=\""+basePath+"js/respond.js\"></script>");
        out.println("<![endif]-->");
        out.println("<title>��½��ʱ�������µ�½_"+Description+"</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("��½��ʱ�������µ�½������");
        out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">����</a><a href=\""+basePath+"\">��ҳ</a><a href=\""+basePath+"news.jsp\">��Ѷ</a></div>");
        out.println("</div>");
        out.println("<div id=\"tips_bg\"></div>");
        out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
        out.println("<script>");
        out.println("$(function () {");
        out.println("$('#tips_error').css({");
        out.println("top:'50%',");
        out.println("left:'50%',");
        out.println("margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'");
        out.println("});");
        out.println("$('#tips_bg').css({");
        out.println("width:$(window).width(),");
        out.println("height:$(document).height()");
        out.println("});");
        out.println("});");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
    }else{
        //��ȡ��ǰ�����û����û���
        String sUserName = (String) session.getAttribute("uname");	
        //��ȡ��ǰ�����û���������
        long lUserID = (Long) session.getAttribute("userid");	
        Goods.setUserid(lUserID);
        //��ȡ��ǰ�����û����ﳵ�е�������Ϣ
        ResultSet rs = Goods.show_my_goods();
%>
<!DOCTYPE html>
    <html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>Ԥ��/����_<%=Sitename%></title>
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
            <div class="news_pic"></div>
    </div>
    <div class="container">
        <div class="list left">
            <h2><i class="fa fa-paypal"></i><strong><%=sUserName%></strong>�Ĺ�����ʷ��¼</h2>
            <div class="pay">
                <table class="goods_list" cellspacing="0">
                    <thead>
                    <tr>
                        <th>�ײ�</th>
                        <th>����</th>
                        <th>����</th>
                        <th>�۸�</th>
                        <th>��������</th>
                        <th>����ʱ��</th>
                        <th>�����¼</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                        float total = 0; //������Ʒ���ܼ�
                        //ѭ����ʾ���й�����Ϣ
                        while(rs.next())
                        {
                                long lGoodsID = rs.getLong("goodsid");
                                Goodinfo.setGoodinfoid(rs.getLong("goodinfoid"));
                                Goodinfo.init();
                                int iBuyNumber = rs.getInt("buynumber");
                                //������Ʒ�ܼ�
                                total = iBuyNumber * Goodinfo.getPrice() + total;
                                float all = iBuyNumber * Goodinfo.getPrice();
                                String time=rs.getString(6);
                        %>
                        
                        <tr>
                            <td><a href="pay.jsp" target="_self"><%=Goodinfo.getGoodinfoname()%></a></td>
                            <td><%=Goodinfo.getCompany()%></td>
                            <td><%=Goodinfo.getAddr()%></td>
                            <td><%=all%></td>
                            <td><%=iBuyNumber%></td>
                            <td><%=time%></td>
                            <td><input type="button" name="btn" value="���" onClick='javascript:window.location="<%=basePath%>DelGoods.Tao?Goodsid=<%=lGoodsID%>"'></td>
                        </tr>
                        
                        <%}%>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="7">�ܼ����ѣ���<%=total%></td>
                            </tr>
                        </tfoot>
                </table>
            </div>
        </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
    </div>
	<%rs.close();%>
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
<%}%>