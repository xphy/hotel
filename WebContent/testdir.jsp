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
 path1=path1.replace('/', '\\'); // 将/换成\  
 path1=path1.replace("file:", ""); //去掉file:  
 path1=path1.replace("classes\\", ""); //去掉class\  
 path1=path1.substring(1); //去掉第一个\,如 \D:\JavaWeb...  
 out.println("Thread:"+path1);
%>
    </body>
    
</html>
