/*
 * @author Mr.tao
 * create 2016.7.4
 */

package com.bar.db;
import java.sql.*;

public class Talk extends ExecuteDB{
        private long talkid;
	private String content;
	private long userid;
	private String strSql;
public Talk()
{
    this.talkid = 0;
    this.content="";
    this.userid = 0;
    this.strSql ="";
}
//���������
	public boolean add()
	{
		this.strSql="insert into talk ";
		this.strSql=this.strSql + "(content,userid)";
		this.strSql=this.strSql + "values('" + this.content + "','" + this.userid + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}
        //ɾ������
        public boolean delete(String stalk)
        {
            this.strSql = "delete from talk where talkid in ( ";
            this.strSql = this.strSql + stalk + ")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }

        //��ȡwordsid��Ӧ��������Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean init()
	{
    	this.strSql="select * from `talk` where talkid=";
        this.strSql=this.strSql + "'" + this.talkid + "'";
		try
		{
   			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
                talkid=rs.getLong("talkid");
                content=rs.getString("content");
                userid=rs.getLong("userid");
                return true;
			}
			else
				return false;
		}
		catch(Exception e)
		{
			return false;
		}
	}
        //������пͻ�������Ϣ
	public ResultSet show_talk()
	{
		this.strSql="select * from `talk` ORDER BY createtime desc";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.strSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}


        public void setTalkid(long talkid)
	{
            this.talkid = talkid;
	}


	public long getTalkid()
	{
		return this.talkid;
	}


 	public void setContent(String content)
	{
		this.content = content;
	}


	public String getContent()
	{
		return this.content;
	}

 	public void setUserid(long userid)
	{
		this.userid = userid;
	}


	public long getuserid()
	{
		return this.userid;
	}

}
