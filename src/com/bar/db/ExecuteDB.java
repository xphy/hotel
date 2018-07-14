/*
 * @author Mr.tao
 * create 2016.7.4
 */
package com.bar.db;


import java.sql.*;

//�����̳���ConnectDB��
public class ExecuteDB extends ConnectDB
{
	//���ݿ����Ӷ���
	private final Connection DbCon;
	private Statement stmt;
	private ResultSet rs;
        //error ���� ������Ϣ
        private String ErrMes;

	//��ʼ������
	public ExecuteDB()
	{
		DbCon = super.getConn();
		stmt = null;
		rs = null;
		this.ErrMes = super.getErrMes();
	}

	 //ִ��sql ִ����䣬��Ҫ��ִ�в����ɾ����SQL���
	public boolean exeSql(String strSql)
	{
		boolean isSuc = false;
		try
		{
   			stmt=DbCon.createStatement();
			stmt.executeUpdate(strSql);
			stmt.close();
			isSuc = true;
		}
		catch(Exception e)
		{
			this.ErrMes = this.ErrMes + "<br>" +e.toString();
		}
		return isSuc;
	}

	//ִ��sql��ѯ���
    public ResultSet exeQuery(String strSql)
	{
		try
		{
   			stmt=DbCon.createStatement();
			rs =stmt.executeQuery(strSql);
		}
		catch(Exception e)
		{
            this.ErrMes = this.ErrMes + "<br>" +e.toString();
			rs = null;
		}
		return rs;
	}

    //ȡ�ô�����Ϣ
        @Override
    public String getErrMes()
    {
        return ErrMes;
    }

}
