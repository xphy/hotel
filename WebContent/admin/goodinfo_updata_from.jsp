<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		.input1{width:200px; height:20px;}
		.input2{ width:80px; height:20px; color:#FFF; background-color:#333; border:1px #CCC dashed;}
		</style>
        <jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.all.min.js"> </script>
    <!--�����ֶ��������ԣ�������ie����ʱ��Ϊ��������ʧ�ܵ��±༭������ʧ��-->
    <!--������ص������ļ��Ḳ������������Ŀ����ӵ��������ͣ���������������Ŀ�����õ���Ӣ�ģ�������ص����ģ�������������-->
        <script type="text/javascript" charset="gbk" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
	</head>

<%
	//��ȡ��Ʒ��������
	String sGoodinfoid = request.getParameter("Goodinfoid");
	long lGoodinfoid = Long.parseLong(sGoodinfoid);
	
	
	
	//��ȡ��Ʒ��Ϣ
	Goodinfo.setGoodinfoid(lGoodinfoid);
	Goodinfo.init();
	ResultSet rs = Goodinfo.show_goodinfo();
%>
	<body bgcolor="#F4FFFE">
	<div align="center">
	  <form name="form1" method="post" action="./goodinfo_updata_save.jsp?Goodinfoid=<%=lGoodinfoid%>" target="_self" enctype="multipart/form-data">
        <input type="hidden" name="Goodinfoid" value="<%=lGoodinfoid%>">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
			<td height="33" colspan="3" align="center"><h1 style="color: #66F; font-size:12px">����µľ�ˮ�ײ�<br>��׼ȷ��дһ����Ϣ����ȷ����������ύ��ť���б���</h1></td>
		  </tr>
			<tr>
			<td width="25%" height="33" align="right">�ײ����ƣ�</td>
			<td width="41%" height="33" align="left">&nbsp;<input name="Goodinfoname" type="text" class="input1" size="30" value="<%=Goodinfo.getGoodinfoname()%>"></td>
			<td width="34%" rowspan="6" align="left"><img src="../pic/<%=Goodinfo.getPicurl()%>" border="0" width="300px" height="200px"></td>
			</tr>
			<tr>
			<td width="25%" height="32" align="right">ơ�Ƴ��ң�</td>
			<td width="41%" height="32" align="left">&nbsp;<input name="Company" type="text" class="input1" size="30" value="<%=Goodinfo.getCompany()%>"></td>
			</tr>
			<tr>
			<td width="25%" height="38" align="right">ơ�Ʋ��أ�</td>
			<td width="41%" height="38" align="left">&nbsp;<input name="Addr" type="text" class="input1" size="30" value="<%=Goodinfo.getAddr()%>"></td>
			</tr>
			<tr>
			  <td height="36" align="right">ơ��������</td>
			  <td width="41%" height="36" align="left">&nbsp;<input name="Num" type="text" class="input1" size="30" value="<%=Integer.toString(Goodinfo.getNum())%>">
			    /��</td>
		  </tr>
			<tr>
			<td width="25%" height="38" align="right">ơ�Ƽ۸�</td>
			<td width="41%" height="38" align="left">&nbsp;<input name="Price" type="text" class="input1" size="10" value="<%=String.valueOf(Goodinfo.getPrice())%>">��RMB��</td>
			</tr>
			<tr>
			  <td height="37" align="right">�ϴ�ͼƬ��</td>
			  <td width="41%" height="37" align="left">&nbsp;<input name="Picurl" type="file" size="50" value=""><input name="Picurl1" type="hidden" size="50" value="<%=Goodinfo.getPicurl()%>"></td>
		  </tr>
			<tr>
			<td width="25%" height="127" align="right">��Ʒ��飺</td>
			<td height="127" colspan="2" align="left">&nbsp;
                            <textarea name="Intro" id="editor" style="height:300px;width:800px; float: left;">
                                <%=Goodinfo.getIntro()%>
                            </textarea></td>
			</tr>
		</table>
		<p>
		<input name="sub" type="submit" class="input2" value="�ύ">&nbsp;&nbsp;
		<input name="res" type="reset" class="input2" value="����">&nbsp;&nbsp;
		<input type="button" name="btn" value="����" onClick="javascript:window.history.go(-1)" class="input2"></p>
	  </form>
	</div>
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
	</body>
</html>
