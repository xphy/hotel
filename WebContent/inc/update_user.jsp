<%@page contentType="text/html" pageEncoding="GB2312"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
	//��ȡsession�б����UserName����ֵ
	String suname = (String) session.getAttribute("uname");
	//��ȡsession�б����UserID
	long userid = (Long) session.getAttribute("userid");	
	User.setUserid(userid);	
	//��ʼ���û���Ϣ
	User.init();
	float sMoney = User.getMoney();
	String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<h3>�޸�����</h3>
<div class="pwdm">
    <form name="form_psw" id="PWD" method="post" action="<%=base%>Password" target="_self">
        <label>����������룺</label><input name="OldUserPassword" type="password" size="20"><br>
        <label>�����������룺</label><input name="pwd" type="password" id="pwd" size="20" ><br>
        <label>��ȷ�������룺</label><input name="pwd1" type="password" id="pwd1" size="20" ><br>
        <input type="submit" name="submit_psw" value="�޸�">
        <input type="reset" name="res" value="ȡ��"><br>
        <div id="pwd_error"></div>
    </form>
</div>
<div class="user_info">
    <h3>�޸�������Ϣ</h3>
        <form name="form_user_info" id="Info_u" method="post" action="<%=base%>ModifyUser" >
            <label>���ƣ�</label><%=suname%><br>
            <label>��</label><input name="money" type="text" id="money" value="<%=sMoney%>" size="20">(<a href="https://www.alipay.com" target="_parent">֧����ת��</a>&nbsp;|&nbsp;<a href="https://ibsbjstar.ccb.com.cn/app/V5/CN/STY1/login.jsp" target="_blank">��������</a>)<br>
            <label>������</label><input name="name" type="text" id="name" value="<%=User.getName()%>" size="20"><br>
            <label>�Ա�</label><%=User.getSex()%> <input type="radio" name="sex" value="��" <%if(User.getSex().compareTo("��") == 0)  out.println("checked");%> >�� <input type="radio" name="sex" value="Ů" <%if(User.getSex().compareTo("Ů") == 0)  out.println("checked");%> >Ů <input type="radio" name="sex" value="����" <%if(User.getSex().compareTo("����") == 0)  out.println("checked");%>>����<br>
            <label>���գ�</label><input name="birth" type="text" id="birth" value="<%=User.getBirth()%>" size="20">(���ڸ�ʽ����Ϊ0000-00-00)<br>
            <label>�ʱࣺ</label><input name="post" type="text" id="post" value="<%=User.getPost()%>" size="50"><br>
            <label>סַ��</label>
            <input name="address" type="text" id="address" value="<%=User.getAddress()%>" size="50" maxlength="400"><br>
            <label>Email��</label><input name="email" type="text" size="50" value="<%=User.getEmail()%>"><br>
            <label>�绰��</label><input name="tel" type="text" id="tel" value="<%=User.getTel()%>" size="20"><br>
            <label>��ȫ���⣺</label><input name="safequestion" type="text" id="safequestion" value="<%=User.getSafequestion()%>" size="50"><br>
            <label>��ȫ�𰸣�</label><input name="safeanswer" type="text" id="safeanswer" value="<%=User.getSafeanswer()%>" size="50"><br>

            <input type="submit" name="submit_u_info" value="�޸�">
            <input type="reset" name="res" value="ȡ��">
        </form>
</div>