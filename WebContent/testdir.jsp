<%@page contentType="text/html" pageEncoding="GB2312"%>
<jsp:useBean scope="page" id="DB" class="com.bar.db.ExecuteDB" />
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>JSP Page</title>
    </head>
    <body>
<%
 String path1 = Thread.currentThread().getContextClassLoader().getResource("").toString();
 path1=path1.replace('/', '\\'); // ��/����\  
 path1=path1.replace("file:", ""); //ȥ��file:  
 path1=path1.replace("classes\\", ""); //ȥ��class\  
 path1=path1.substring(1); //ȥ����һ��\,�� \D:\JavaWeb...  
 out.println("Thread:"+path1);
%>
    </body>
    
</html>
