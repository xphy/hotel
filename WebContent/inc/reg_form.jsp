<%-- 
    Document   : reg1
    Created on : 2016-7-7, 16:05:38
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
    request.setCharacterEncoding("gb2312");
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<div id="reg">
    <form action="<%=basePath%>Join.Tao" id="Join">
        <label>�û�����</label><input name="uname" id="uname" type="text" placeholder="����ʹ�ú�������ĸ"><label id="AjaxUname" class="scu"></label><br>
                <label>���룺</label><input name="pwd1" id="pwd1" type="password" placeholder="6-20λ����ĸ���������" minlength="6" required><br>
                <label>ȷ�����룺</label><input name="pwd2" id="pwd2" type="password" required><br>
                <label>��ʵ������</label><input name="name" id="name" class="true_name" type="text" placeholder="��ʵ��Ϣ����͸¶" minlength="2" required><br>
                <div class="sex">
                <label>�Ա�</label><input id="sex" name="sex" type="radio" value="��" checked>��<input id="sex" name="sex" type="radio" value="Ů">Ů<input id="sex" name="sex" type="radio" value="����">����<br>
                </div>
                <label>�������ڣ�</label><input name="birth" id="birth" class="birth_day" type="text" placeholder="1980-07-17" maxlength="10" required><br>
                <label>��ַ��</label><input name="address" id="address" type="text" minlength="10" required><br>
                <label>�ʱࣺ</label><input name="post" id="post" class="post_code" type="text" minlength="6" required><br>
                <label>�ֻ����룺</label><input name="tel" id="tel" type="text" placeholder="����Ϊ11λ�ֻ�����" minlength="11" maxlength="11" required><br>
                <label>Email��</label><input name="email" id="email" type="text" placeholder="Email��ʽΪxxx@xx.com" required><br>
                <label>�ܱ����⣺</label><input name="safequestion" id="safaquestion" type="text" placeholder="�Զ����ܱ�����"><br>
                <label>�ܱ��𰸣�</label><input name="safeanswer" id="safeanswer" type="text"><br>
                <label>��֤�룺</label><input name="Rand" id="Rand" class="val_code" type="text"><img src="<%=basePath%>Code.do" name="Image_code" id="Image_code" onClick="document.getElementById('Image_code').src='<%=basePath%>Code.do?temp='+ (new Date().getTime().toString(36)); return false" alt="���ͼƬˢ����֤��"><label id="AjaxCode" class="scu"></label><br>
                <label></label><input id="reg_submit" type="submit" value="�ύ">
            </form>
        </div>
