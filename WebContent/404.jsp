<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
    //��õ�ǰҳ��·��Ŀ¼
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="GB2312">
    <title>404</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
</head>
<body>
<div id="tips_error">
    <i class="fa fa-bug fa-3x"></i><br>
    404����<br>����ʵ�ҳ�治���ڻ�����Ȩ���ʸ�ҳ��
    <div class="bottom_c"><a href="javascript:window.history.go(-1)">����</a><a href="<%=basePath%>">��ҳ</a><a href="news.jsp">��Ѷ</a></div>
</div>
<div id="tips_bg"></div>
<script src="js/jQuery1.12.4.js"></script>
<script>
    $(function () {
        //tips��ʾ�����
        $('#tips_error').css({
            top:'50%',
            left:'50%',
            margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'
        });
        $('#tips_bg').css({
            width:$(window).width(),
            height:$(document).height()
        });
    });
</script>
</body>
</html>
