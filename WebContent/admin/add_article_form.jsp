<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<style type="text/css">
		.font{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		.input1{ width:80px; height:20px; border: 1px #999 dashed; background-color:#666; color:#FFF}
		.input2{width:300px; height:20px; border: 1px  #F60 dashed}
		</style>
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.all.min.js"> </script>
    <!--�����ֶ��������ԣ�������ie����ʱ��Ϊ��������ʧ�ܵ��±༭������ʧ��-->
    <!--������ص������ļ��Ḳ������������Ŀ����ӵ��������ͣ���������������Ŀ�����õ���Ӣ�ģ�������ص����ģ�������������-->
        <script type="text/javascript" charset="gbk" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
	<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
	<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
	<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
	<%
		//��ȡ��ǰ�����û���Ϣ�����ж����Ƿ��ǵ�¼�û�
		String sUname = (String)session.getAttribute("uname");
		//��ȡ��ǰ��¼�û���������
		long lUserid = (Long)session.getAttribute("userid");
		//��ȡ��ǰ�������������ţ���תΪ������
		String sTypeid = request.getParameter("typeid");
		long lTypeid = Long.parseLong(sTypeid);
		Type.setTypeid(lTypeid);
		Type.init();
		//�ж��Ƿ��ǻظ����£�����ǻظ����£����ȡ��Ҫ�ظ����µı���Ͳ������� 
		String sArticleID = request.getParameter("ArticleID");	
		long lArticleID = Long.parseLong(sArticleID);
		
		String sTitle = "";
		String sContent = "";
		if(lArticleID != 0)
		{		
			Article.setArticleid(lArticleID);
			Article.init();
			sTitle="�ظ���"+Article.getTitle();	
			
			User.setUserid(Article.getUserid());
			User.init();				
			sContent=Article.getContent();
			if(sContent.length()>100)
			{
				sContent = sContent.substring(1,100);
				sContent = sContent + "������������";
			}
			sContent = "�� �� "+User.getUname()+" ���������ᵽ: ��\r\n" + sContent;
			sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	
			
		}	
	%>

	</head>
	<body>
	<div align="center">
	<br>
	<form name="form1" method="post" action="add_article_save.jsp" target="_self" >
	<input type="hidden" name="Typeid" value="<%=lTypeid%>">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#E1E1E1">
	<tr>
		<td width="30%"height="25" align="left"><span class="font">&nbsp;���±��⣺<input name="Title" type="text" class="input2" value="<%=sTitle%>" size="40">
		</span></td>
		<td width="20%" align="left"><span class="font">�������ߣ�<font color="#0000FF"><%=sUname%></font></span></td>
		<td width="20%" align="left"><span class="font">�������ͣ�<font color="#0000FF"><%=Type.getTypename()%></font></span></td>
	</tr>
	<tr>
		<td width="100%" colspan="3" align="center" valign="top">
		
                <span class="font">
                    <textarea name="content" id="editor" style="height:300px;width:800px; float: left;"></textarea>
        </span></td>
	</tr>
	</table>
	<p>
	<input type="submit" value="����" name="sub" class="input1">&nbsp;&nbsp;
	<input type="reset" value="���" name="res" class="input1">
	</p>
	</form>
	</div>
	</body>
    <script type="text/javascript">
    //ʵ�����༭��
    //����ʹ�ù�������getEditor���������ñ༭��ʵ���������ĳ���հ������øñ༭����ֱ�ӵ���UE.getEditor('editor')�����õ���ص�ʵ��
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('����html����', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("ʹ��editor.getContent()�������Ի�ñ༭��������");
        arr.push("����Ϊ��");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("ʹ��editor.getPlainTxt()�������Ի�ñ༭���Ĵ���ʽ�Ĵ��ı�����");
        arr.push("����Ϊ��");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("ʹ��editor.setContent('��ӭʹ��ueditor')�����������ñ༭��������");
        UE.getEditor('editor').setContent('��ӭʹ��ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //��������ťʱ�༭�����Ѿ�ʧȥ�˽��㣬���ֱ����getText������õ����ݣ�����Ҫ��ѡ������Ȼ��ȡ������
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("ʹ��editor.getContentTxt()�������Ի�ñ༭���Ĵ��ı�����");
        arr.push("�༭���Ĵ��ı�����Ϊ��");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("ʹ��editor.hasContents()�����жϱ༭�����Ƿ�������");
        arr.push("�жϽ��Ϊ��");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("����ղݸ���")
    }
</script>

</html>
