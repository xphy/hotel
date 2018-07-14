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
        <title>�һ�����/��������_<%=Sitename%></title>
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
        <div class="focus">
                <div class="news_pic"></div>
        </div>
        <div class="container">
            <div class="get_pwd left">
                <h2><i class="fa fa-key"></i>�һ�����</h2>
                <form name="form_getpwd" action="<%=basePath%>GetPwd.Tao" method="post" target="_self">
                    ���ڱ�վע����û�����
                    <input name="UserName" type="text" id="UserName">
                    <input name="submit_getpwd" type="submit" value="ȡ������">
                </form>
                <div class="error"></div>
                <div class="some_info" style="line-height: 3;color: #666">
                    <i>*�һ����룬����ȷ�����ڱ�վע����û����������޷��һ����룡</i><br>
                    <i>*���뷢��ʧ�ܣ���Ҫԭ���Ƿ���������ά���У���˲�Ҫ̫�����ģ����ǻᾡ�촦����վ��������������Զ���޹����������Ա��ϵ��</i><br>
                    <i>*���뷢�ͳɹ����뼰ʱ�鿴���ڱ�վע��ʱʹ�õ�ע�������ڵ��ʼ������һ��������뼰ʱɾ���ʼ����Է�����й¶��</i>
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
                //�û���¼ajax��ѯ�û����Ƿ���ڻ���Ϊ��
                $('input[name=UserName]').blur(function(){
                        $.ajax({
                                type:'GET',
                                url:'<%=basePath%>LoginUser.Tao',
                                dataType:'html',
                                data:'username='+encodeURI(encodeURI($(this).val())),
                                beforeSend:function(XMLHttpRequest)
                                {
                                        $('.error').text('���ڲ�ѯ');
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
