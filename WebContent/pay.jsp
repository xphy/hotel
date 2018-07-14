<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
    //��õ�ǰҳ��·��Ŀ¼
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
        out.println("<title>���½�󣬲ſ��Բ鿴�ײ��Լ�ʹ��Ԥ��/�����_MiniBarCMS</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("���½�󣬲ſ��Բ鿴�ײ��Լ�ʹ��Ԥ��/�����");
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
        String sUserName = (String) session.getAttribute("uname");
	long lUserID = (Long) session.getAttribute("userid");	
	User.setUserid(lUserID);	
    User.init();
	float fMoney = User.getMoney();
	
	
	
	ResultSet rs = Goodinfo.show_goodinfo();
	pages.initialize(rs,5);
	String strPage=null;
	int showPage = 1;
	//��ȡ��ת����Ŀ��ҳ��
	strPage=request.getParameter("showPage");
	
	if (strPage==null)
	{
		showPage=1;
	}
	else
	{
		try
		{
			showPage=Integer.parseInt(strPage);
		}
		catch(NumberFormatException e)
		{
			showPage = 1;
		}
		if(showPage<1) 
		{
			showPage=1;
		}
		if(showPage>pages.getPageCount()) 
		{
			showPage=pages.getPageCount();
		}
	}
	//��ȡҪ��ʾ�����ݼ���
	Vector vData=pages.getPage(showPage);
    
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
                <h2><i class="fa fa-paypal"></i>�ײ�Ԥ��/����</h2>
                <div class="pay">
        <%
	for(int i=0;i<vData.size();i++)
	{ 
		//��ʾ����
		String[] sData=(String[])vData.get(i);
		long lGoodinfoid = Long.parseLong(sData[0]);
		Goodinfo.setGoodinfoid(lGoodinfoid);
		Goodinfo.init();
		float sPrice = Goodinfo.getPrice();
		
        %>
                    <div class="pay_info left">
                        <div class="photo left"><img src="<%=basePath%>pic/<%=Goodinfo.getPicurl()%>"><div class="price">��<%=sData[6]%></div><div class="brand"><%=sData[2]%></div></div>
                        <div  class="payment left">
                            <div class="pay_go">
                            <%
                                if(lUserID!= 0 & fMoney >= sPrice){

                            out.print("<a class=\"Pay_for\" href=\""+basePath+"payfor.jsp?Goodinfoid="+ sData[0] +"&userid="+lUserID+"\">��Ҫ����</a>");

                                }
                                else{
                            out.print("����");
                                }
                            %>
                            </div>
                        <ul>
                            <li style="width: 70%" class="left"><strong><%=sData[1]%></strong></li>
                            <li style="width: 70%"  class="left">ơ��������<%=sData[5]%>��</li>
                            <li><%=sData[4]%></li>
                            </ul>
                            
                        </div>
                    </div>
              <% } %>
              <div class="clear"></div>
              <div class="page">
                <div class="page_info">��<%=showPage%>ҳ/��<%=pages.getPageCount()%>ҳ</div>
                    <a href="<%=basePath%>news.jsp?showPage=1">��ҳ</a>
                    <%
			//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
			if(showPage > 1){				
                    %>
                    <a href="<%=basePath%>news.jsp?showPage=<%=showPage-1%>">��һҳ</a>
                    <%
			}
			else
                            out.println("<a href=\"#\">��һҳ</a>");
			//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
			if(showPage < pages.getPageCount())
			{				
                    %>
                    <a href="<%=basePath%>news.jsp?showPage=<%=showPage+1%>">��һҳ</a>
                    <%
			}
			else
                            out.println("<a href=\"#\">��һҳ</a>");
                    %> 
                    <a href="<%=basePath%>news.jsp?showPage=<%=pages.getPageCount()%>">βҳ</a>
                    <div class="page_info">
                        <form action="<%=basePath%>news.jsp" method="post" class="page_form" target="_self">
                            <label>
                                <select name="showPage">��ת��
                <%
                    for(int x=1;x<=pages.getPageCount();x++){
		%>
                    <option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
		<%
                    }
		%>
                                </select>ҳ
                            </label>
                                    <input type="submit" name="go" value="�ύ">
                        </form>
                    </div>
                </div>
                </div>
        </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <!--����������ʾ$load����--> 
        <div class="payfor">
            <div class="top_title">ȷ�Ϲ�����Ϣ<div class="close_pay"><a href="#"><i class="fa fa-close"></i></a></div></div>
            <div class="payfor_x"></div>
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
    $(document).ready(function(){
      $('.Pay_for').click(function(){
          var url= $(this).attr('href');
          //alert(url);
          $('.payfor').css({
                top:'50%',
                left:'50%',
                margin:'-'+($('.payfor').height()/2 +'px 0 0 -'+$('.payfor').width()/2)+'px',
                zIndex:999
            }).slideDown(300);
            $('#login_bg').css({
                display:'block',
                width:$(window).width(),
                height:$(document).height(),
                zIndex:998
            }).slideDown(300);
            $('.payfor_x').load(url).css('display','block').slideDown(3000);
            return false;

        });
        $('.payfor .top_title .close_pay a').click(function () {
            $('.payfor').hide(200);
            $('#login_bg').hide();
      });
});
</script>
    </body>
</html>
<% } %>
