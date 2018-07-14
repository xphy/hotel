<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
    //获得当前页面路径目录
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
        out.println("<title>请登陆后，才可以查看套餐以及使用预定/付款功能_MiniBarCMS</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("请登陆后，才可以查看套餐以及使用预定/付款功能");
        out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">返回</a><a href=\""+basePath+"\">首页</a><a href=\""+basePath+"news.jsp\">资讯</a></div>");
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
	//获取跳转到的目的页面
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
	//获取要显示的数据集合
	Vector vData=pages.getPage(showPage);
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>预定/付款_<%=Sitename%></title>
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
            <div class="news_pic"></div>
        </div>
        <div class="container">
            <div class="list left">
                <h2><i class="fa fa-paypal"></i>套餐预定/付款</h2>
                <div class="pay">
        <%
	for(int i=0;i<vData.size();i++)
	{ 
		//显示数据
		String[] sData=(String[])vData.get(i);
		long lGoodinfoid = Long.parseLong(sData[0]);
		Goodinfo.setGoodinfoid(lGoodinfoid);
		Goodinfo.init();
		float sPrice = Goodinfo.getPrice();
		
        %>
                    <div class="pay_info left">
                        <div class="photo left"><img src="<%=basePath%>pic/<%=Goodinfo.getPicurl()%>"><div class="price">￥<%=sData[6]%></div><div class="brand"><%=sData[2]%></div></div>
                        <div  class="payment left">
                            <div class="pay_go">
                            <%
                                if(lUserID!= 0 & fMoney >= sPrice){

                            out.print("<a class=\"Pay_for\" href=\""+basePath+"payfor.jsp?Goodinfoid="+ sData[0] +"&userid="+lUserID+"\">我要订购</a>");

                                }
                                else{
                            out.print("余额不足");
                                }
                            %>
                            </div>
                        <ul>
                            <li style="width: 70%" class="left"><strong><%=sData[1]%></strong></li>
                            <li style="width: 70%"  class="left">啤酒数量：<%=sData[5]%>打</li>
                            <li><%=sData[4]%></li>
                            </ul>
                            
                        </div>
                    </div>
              <% } %>
              <div class="clear"></div>
              <div class="page">
                <div class="page_info">第<%=showPage%>页/共<%=pages.getPageCount()%>页</div>
                    <a href="<%=basePath%>news.jsp?showPage=1">首页</a>
                    <%
			//判断"上一页"链接是否要显示
			if(showPage > 1){				
                    %>
                    <a href="<%=basePath%>news.jsp?showPage=<%=showPage-1%>">上一页</a>
                    <%
			}
			else
                            out.println("<a href=\"#\">上一页</a>");
			//判断"下一页"链接是否要显示
			if(showPage < pages.getPageCount())
			{				
                    %>
                    <a href="<%=basePath%>news.jsp?showPage=<%=showPage+1%>">下一页</a>
                    <%
			}
			else
                            out.println("<a href=\"#\">下一页</a>");
                    %> 
                    <a href="<%=basePath%>news.jsp?showPage=<%=pages.getPageCount()%>">尾页</a>
                    <div class="page_info">
                        <form action="<%=basePath%>news.jsp" method="post" class="page_form" target="_self">
                            <label>
                                <select name="showPage">跳转到
                <%
                    for(int x=1;x<=pages.getPageCount();x++){
		%>
                    <option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
		<%
                    }
		%>
                                </select>页
                            </label>
                                    <input type="submit" name="go" value="提交">
                        </form>
                    </div>
                </div>
                </div>
        </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <!--弹出窗口显示$load方法--> 
        <div class="payfor">
            <div class="top_title">确认购买信息<div class="close_pay"><a href="#"><i class="fa fa-close"></i></a></div></div>
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
