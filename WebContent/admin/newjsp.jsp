<%-- 
    Document   : newjsp
    Created on : 2016-9-3, 13:11:14
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        try
		{
                    
			// �½�һ��SmartUpload����
			SmartUpload su = new SmartUpload();
			// �ϴ���ʼ��
			su.initialize(pageContext);
			//�趨�ϴ�����
			//����ÿ���ϴ��ļ�����󳤶ȡ�
			su.setMaxFileSize(1000000*8);
			//�趨�����ϴ����ļ���ͨ����չ�����ƣ�
			su.setAllowedFilesList("jpg,gif,bmp,JPG,GIF,BMP,png,PNG");
			// �ϴ��ļ�
			su.upload();
                        
                        String sGoodinfoname=su.getRequest().getParameter("Goodinfoname");
			String sAddr=su.getRequest().getParameter("Addr");
			String sIntro=su.getRequest().getParameter("Intro");
			String sCompany=su.getRequest().getParameter("Company");
			String sPrice=su.getRequest().getParameter("Price");
			String sNum=su.getRequest().getParameter("Num");
			int Num = Integer.parseInt(sNum);
			float fPrice = Float.parseFloat(sPrice);
                        
                        
                        out.println(sGoodinfoname+"<br>"+sAddr+"<br>"+sIntro+"<br>"+sCompany+"<br>"+fPrice+"<br>"+Num);
                }
        catch(Exception e)
		{
                    out.println(e);
			out.println("<p><font color=red>���ϴ����ļ���ʽ���ԣ������ϴ��ļ�̫��</font></p>");
			out.println("<input type=button name=btn3 value=���� onClick='window.history.go(-1)'>");
			return;
		}
        
        %>
    </body>
</html>
