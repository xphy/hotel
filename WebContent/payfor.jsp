<%@ page contentType="text/html; charset=gb2312" language="java"%>
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
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
        out.println("<title>����Ȩ���ʴ�ҳ��</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("����Ȩ���ʴ�ҳ�棬���½������");
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
        
        //��ȡ��Ʒ������
        String sGoodinfoid = request.getParameter("Goodinfoid");
        long lGoodinfoid = Long.parseLong(sGoodinfoid);

        //��ȡ��Ʒ��Ϣ
        Goodinfo.setGoodinfoid(lGoodinfoid);	
        Goodinfo.init();

        String strPage = request.getParameter("showPage");
%>
<!DOCTYPE html>
<html>
	<head>
            <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/font-awesome.min.css">
            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
              <script src="js/html5.js"></script>
              <script src="js/respond.js"></script>
            <![endif]-->
            <style>
                .payfor_me{
                    width: 300px;
                    height: 260px;
                    border-radius: 5px;
                    background: #F1F1F1;
                    
                }
                .payfor_me li{
                    width: 100%;
                    padding: 10px 0;
                    border-bottom: 1px #CCC dotted;
                    text-align: center;
                    color:#CC0000;
                }
                .payfor_me li span.left{
                    text-align: right;
                    color: #AAA;
                    width: 50%;
                }
                .payfor_me li span.right{
                    text-align: left;
                    width: 50%;
                    color: #006CDB;
                }
                .payfor_me li input[type="text"]{
                    width: 70px;
                    padding: 10px 5px;
                    border-radius: 5px;
                    border: 1px #CC0000 solid;
                    margin-left: 10px;
                    color: red;
                }
                .payfor_me li input[type="text"]:focus{
                    border: 1px #008200 solid;
                }
                .payfor_me li input[type="submit"]{
                    padding: 10px 5px;
                    background: #CC0000;
                    color: #FFF;
                    border: 0;
                    border-radius: 5px;
                    margin-left: 10px;
                }
</style>
	</head>
	<body>
            <div class="payfor_me">
            <ul>
                <li><span class="left">[�ײ�]��</span><span class="right"><%=Goodinfo.getGoodinfoname()%></span><div class="clear"></div></li>
                <li><span class="left">[����]��</span><span class="right"><%=Goodinfo.getCompany()%></span><div class="clear"></div></li>
                <li><span class="left">[����]��</span><span class="right"><%=Goodinfo.getAddr()%></span><div class="clear"></div></li>
                <li><span class="left">[����]��</span><span class="right"><%=Goodinfo.getNum()%>��</span><div class="clear"></div></li>
                <li><span class="left">[�۸�]��</span><span class="right">��<%=Goodinfo.getPrice()%></span><div class="clear"></div></li>
                <li>
                    <form name="payfor_form" method="post" action="<%=basePath%>Pay.Tao" target="_self">
                        <input type="hidden" name="showPage" value="<%=strPage%>">
                        <input type="hidden" name="Goodinfoid" value="<%=Goodinfo.getGoodinfoid()%>">
                        <input type="hidden" name="Price" value="<%=Goodinfo.getPrice()%>">
                        ȷ�Ϲ�������<input type="text" name="BuyNumber" value="1">
                        <input type="submit" name="sub_payfor" value="�ύ������">
                    </form>
                </li>
            </ul>
        </div>
	</body>
</html>
<%}%>