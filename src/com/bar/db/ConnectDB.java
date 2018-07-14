/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.sql.*;

public class ConnectDB
{
	//���ݿ��û���
	String userName="";
	//���ݿ�����
	String userPassword="";
	//���ݿ��URL�������������ݿ���ʹ�õı����ʽ
	String url="";
	//����һ�����Ӷ���
	Connection dbConn;
	//������Ϣ��
	String errMes;


	//�������ݿ�
   	public Connection getConn()
   	{
            Properties props = new Properties();
            FileInputStream fis;
            String dir = Thread.currentThread().getContextClassLoader().getResource("").toString();//���classesĿ¼ file:/C:/Users/Administrator/Documents/NetBeansProjects/bar/build/web/WEB-INF/classes/
            /*Windows��ʹ�õĻ��WEB-INFĿ¼*/
            dir=dir.replace('/', '\\');//windows�½�Ŀ¼�е�"/"�޸�Ϊ"\\"
            dir=dir.replace("file:", ""); //ȥ��file:
            dir = dir.replace("classes\\", ""); //windows��ȥ��class\\����Ϊ��һ���滻���Ѿ���"/"�滻Ϊ"\\"�����������Ҫдclass\\��
            dir = dir.substring(1); //ȥ����һ��\��windows��
            dir+="DB.properties";
            
   
	   	try
	   	{
                    
                    fis = new FileInputStream(dir);
			props.load(fis);
                        url = props.getProperty("Mysql_url")+"?useUnicode=true&characterEncoding=GB2312";
                        userName = props.getProperty("Mysql_root");
                        userPassword = props.getProperty("Mysql_password");
			//�������õ����
			Class.forName("com.mysql.jdbc.Driver");
			//������ݿ�����Ӷ���
			dbConn= DriverManager.getConnection(url,userName,userPassword);
	   	}
	   	catch(IOException | ClassNotFoundException | SQLException e)
	   	{
	   		dbConn = null;
	   		errMes=e.toString();
	   	}
	   	return dbConn;
   }

   //��ȡ������Ϣ
   public String getErrMes()
   {
   		return errMes;
   }
}
