<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Music" class="com.bar.db.Music" />
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    String uname = (String) session.getAttribute("uname");
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
        out.println("<title>���½�����Ƽ�����_MiniBarCMS</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("���½�����Ƽ�����");
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
    }
    
    else{
            request.setCharacterEncoding("gb2312");
            String sUserName = (String) session.getAttribute("uname");
            long lUserID = (Long) session.getAttribute("userid");

            String sMusicname = request.getParameter("musicname");

            if(sMusicname != null)
            {
                //��ȡ��������
                String sMusicurl = request.getParameter("musicurl");
                //��������

                Music.setMusicname(sMusicname);
                Music.setMusicurl(sMusicurl);
                Music.setUserid(lUserID);
                Music.add();
            }	
        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>�����Ƽ�_<%=Sitename%></title>
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
                <h2><i class="fa fa-music"></i>�Ƽ�����</h2>
                <div class="music">
                    <div class="music_list">
                        
                            <%
                                //��ȡ��ǰ������������Ϣ
                                ResultSet rs = Music.show_music();
                                //ѭ����ʾ��ǰ������������Ϣ
                                while(rs.next())
                                {
                                    String sMusicurl = rs.getString("musicurl");
                                    sMusicurl = sMusicurl.replaceAll("\r\n","<br>");
                                    lUserID = rs.getLong("userid"); 
                                    User.setUserid(lUserID);
                                    User.init();
                            %>
                        <div class="box">
                            <div class="title">
                                <span class="gname">������<%=rs.getString("musicname")%></span>
                                <span class="muser">�Ƽ��ߣ�<%=User.getUname()%></span>
                                <span class="download"><a href="<%=sMusicurl%>" title="����" target="_blank"><i class="fa fa-cloud-download"></i></a></span>
                                <div class="clear"></div>
                            </div>
                                <audio controls="controls">
                                    <source src="<%=sMusicurl%>" type="audio/mpeg">
                                    ����������֧�ִ˲������������������
                                </audio>
                        </div>
                          <%}%>
                    
                    </div>
                    
                    <div class="music_form">
                        <form name="music_form" method="post" action="music.jsp" target="_self">
                            ÿ��ֻ������һ�����ֵ�ַ<br><br>
                            �������֣�<br><input type="text" name="musicname">
                            ������ַ��(��ַ������http://��ʼ)<br><input type="text" name="musicurl" value="http://">
                            <input type="submit" name="submit_music" value="��������">
                            <div id="music_error"></div>
                        </form>
                    </div>

                </div>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <div id="footer">
<footer>
    <ul class="help">
        <li><a href="<%=basePath%>help/MiniBar_help.pdf" target="_blank"><i class="fa fa-question-circle"></i>ʹ�ð���</a></li>
        <li><a href="tencent://Message/?Uin=574201314&websiteName=www.oicqzone.com&Menu=yes"><i class="fa fa-qq"></i>��ϵ������</a></li>
        <li><a href="#"><i class="fa fa-bug"></i>BUG�ύ</a></li>
        <li><a href="#"><i class="fa fa-share-alt"></i>�������ĵ�</a></li>
        <li><a href="#"><i class="fa fa-link"></i>�鿴�����߶�̬</a></li>
        <li><a href="#"><i class="fa fa-cc-visa"></i>�������ļ�Դ��</a></li>
    </ul>
    <div class="copy">CopyRight &copy <mark>MiniBarCMS</mark> System. Power By Java MVC Model. Project create by <mark>Mr.tao</mark>.</div>
</footer>
</div>
<script src="<%=basePath%>js/jQuery1.12.4.js"></script>
<script src="<%=basePath%>js/jquery.cookie.js"></script>
<script src="<%=basePath%>js/mbase64.js"></script>
<script src="<%=basePath%>js/glide.min.js"></script>
<script src="<%=basePath%>js/bar.js" charset="utf-8"></script>

        <script src="<%=basePath%>js/jquery.pin.js"></script>
        <script>
            $(function(){
                $('input[name=submit_music]').click(function () {
                var musicname = $('input[name=musicname]').val();
                var musicurl = $('input[name=musicurl]').val();
                if(musicname=='' || musicurl=='' || musicurl.length < 15){
                $('#music_error').html('������Ҫ�Ƽ��ĸ������ֺ͸�����ַ');
                return false;
                }
            });
            $(".music_form").pin();
            });
        </script>
    </body>
</html>
<%}%>