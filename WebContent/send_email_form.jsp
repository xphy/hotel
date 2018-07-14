<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="MyEmail" class="com.bar.db.Email" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
	String uname = (String) session.getAttribute("uname");
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        //��ȡ��ǰ�û����û���
	String sUserName = (String) session.getAttribute("uname");
        if(sUserName==null || sUserName.length() <= 0){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
            out.println("<!--[if lt IE 9]>");
            out.println("<script src=\""+basePath+"js/html5.js\"></script>");
            out.println("<script src=\""+basePath+"js/respond.js\"></script>");
            out.println("<![endif]-->");
            out.println("<title>���½���ٷ���վ���ʼ�_MiniBarCMS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("���½���ٷ���վ���ʼ�");
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
	String sSubject = "";
	String sContent = "";
	String sReceiver = "";
	//�����Ҫ�ظ����ʼ��������ţ�������ת��Ϊ������	
	String sEmailID = request.getParameter("EmailID");
	long lEmailID = Long.parseLong(sEmailID);

	//�ж��Ƿ��ǻظ��ʼ�������ǵĻ����ȡ�ʼ���Ϣ
	if(lEmailID != 0)
	{
		MyEmail.setEmailid(lEmailID);
		MyEmail.init();
		sSubject = "�ظ���"+MyEmail.getSubject();		
		sReceiver = MyEmail.getSender();
		sContent = MyEmail.getContent();
		if(sContent.length()>100)
		{
			sContent = sContent.substring(1,100);
			sContent = sContent + "������������";
		}
		sContent = "�� �� "+sReceiver+" ���������ᵽ: ��\r\n" + sContent;
		sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	}
	//��ȡ��Ҫ���ŵ����µ������ţ�������ת��Ϊ������
	String sArticleID = request.getParameter("ArticleID");
	long lArticleID = Long.parseLong(sArticleID);

	//�ж��Ƿ��ǻ������£�����ǵĻ����ȡ������Ϣ
	if(lArticleID != 0)
	{
		Article.setArticleid(lArticleID);
		Article.init();		
		sSubject = "�ظ���"+Article.getTitle();		
		User.setUserid(Article.getUserid());
		User.init();
		sReceiver = User.getUname();
		sContent = Article.getContent();				
		if(sContent.length()>100)
		{
			sContent = sContent.substring(1,100);
			sContent = sContent + "������������";
		}
		sContent = "�� �� "+sReceiver+" ���������ᵽ: ��\r\n" + sContent;
		sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>վ���ʼ�����_<%=Sitename%></title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5.js"></script>
          <script src="js/respond.js"></script>
        <![endif]-->
        <script type="text/javascript" charset="gbk" src="ueditor/ueditor.configmini.js"></script>
        <script type="text/javascript" charset="gbk" src="ueditor/ueditor.all.min.js"></script>
        <script type="text/javascript" charset="gbk" src="ueditor/lang/zh-cn/zh-cn.js"></script>
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
                <h2><i class="fa fa-send-o"></i>վ���ʼ�����</h2>
                <div class="myemail">
                    <form name="form_send" method="post" action="<%=basePath%>EmailSave.Tao" target="_self" class="send_form">
                        <label>�����ˣ�</label><%=sUserName%><br>
                        <label>���⣺</label> <input style="width: 400px" type="text" name="Subject" value="<%=sSubject%>">
                        <label>�����ˣ�</label><input type="text" id="Receiver" name="Receiver" value="<%=sReceiver%>">
                        <textarea name="Content" style="height: 400px;" id="editor"><%=sContent%></textarea>
                        <input type="submit" value="����" name="submit_email"><div id="email_error"></div>
                    </form>
                </div>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
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

        <script src="js/jquery-ui.js"></script>
<script>
$(function () {
    $("#Receiver").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<%=basePath%>Email.Json",
                dataType: "jsonp",
                success: function(data) {
                    response($.map(data.Email_name, function(item) {
                        return {
                            label: item.name,
                            value: item.name
                        }
                    }));
                }
            });
        },
        minLength: 2
    });
    $('input[name=submit_email]').click(function () {
        var Subject = $('input[name=Subject]').val();
        var Receiver=$('input[name=Receiver]').val();
        var Content = $('textarea[name=Content]').val();
        if(Subject=='' || Content=='' || Content.length < 15){
        $('#email_error').html('����ȷ��д�ʼ����⡢�ռ����Լ��ʼ�����');
        return false;
        }
    });
});

    var ue = UE.getEditor('editor');
</script>
    </body>
</html>
<%}%>