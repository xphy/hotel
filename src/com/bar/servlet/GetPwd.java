package com.bar.servlet;

import com.bar.db.User;
import com.bar.db.Systems;
import com.bar.mail.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("static-access")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=GB2312");
        PrintWriter out = response.getWriter();
        User User = new User();
        Systems Sys = new Systems();
        request.setCharacterEncoding("gb2312");
        //��ȡ�û���
        String sUserName = request.getParameter("UserName");
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        User.setUname(sUserName);
        //�����û�����ȡ�û���Ϣ
        
        if(!User.post_email())
        {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
            out.println("<!--[if lt IE 9]>");
            out.println("<script src=\""+basePath+"js/html5.js\"></script>");
            out.println("<script src=\""+basePath+"js/respond.js\"></script>");
            out.println("<![endif]-->");
            out.println("<title>�û���"+sUserName+"�����ڣ�_MiniBarCMS</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("�û���"+sUserName+"�����ڣ�");
            out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">����</a><a href=\""+basePath+"\">��ҳ</a><a href=\""+basePath+"news.jsp\">��Ѷ</a></div>");
            out.println("</div>");
            out.println("<div id=\"tips_bg\"></div>");
            out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
            out.println("<script>");
            out.println("$(function () {");
            out.println("$('#tips_error').css({");
            out.println("top:'50%',");
            out.println("left:'50%',");
            out.println("margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'");
            out.println("});");
            out.println("$('#tips_bg').css({");
            out.println("width:$(window).width(),");
            out.println("height:$(document).height()");
            out.println("});");
            out.println("});");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
        }
    else
        {
            try
            {
                
                //�������Ҫ�������ʼ�
                MailSenderInfo mailInfo = new MailSenderInfo();
                mailInfo.setMailServerHost("smtp.163.com");
                mailInfo.setMailServerPort("25");
                mailInfo.setValidate(true);
                mailInfo.setUserName("javaminibar@163.com");
                mailInfo.setPassword("T808090");
                mailInfo.setFromAddress("javaminibar@163.com");
                mailInfo.setToAddress(User.getEmail());
                mailInfo.setSubject("����"+Sys.getSitename()+"�е�����");
                mailInfo.setContent("<p><i>����"+Sys.getSitename()+"�е��û����ǣ�"+User.getUname()+"</i></p><p><i>����"+Sys.getSitename()+"�е�������:<strong>"+User.getSpwd()+"</strong></i></p><p style=\"color:red\">���ڼ�ס���������ɾ�����ż����Է����˿����������롣</p><p>------------------------------------------------</p><p>���ʼ�Ϊϵͳ�Զ����ͣ�����ظ�</p><p style=\"float:right\">"+Sys.getSitename()+"�ͷ�����</p>");
                //�������Ҫ�������ʼ�     
                SimpleMailSender sms = new SimpleMailSender();
                //sms.sendTextMail(mailInfo);//���������ʽ
                sms.sendHtmlMail(mailInfo); //����html��ʽ
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
                out.println("<!--[if lt IE 9]>");
                out.println("<script src=\""+basePath+"js/html5.js\"></script>");
                out.println("<script src=\""+basePath+"js/respond.js\"></script>");
                out.println("<![endif]-->");
                out.println("<title>���뷢�ͳɹ�_MiniBarCMS</title>");  
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_suc\">");
                out.println("<i class=\"fa fa-check-circle fa-3x\"></i><br>");
                out.println("���������Ѿ����͵� <i style=\"color:red;background:#F1F1F1; padding:0 2px; margin:0 10px;\">"+User.getEmail()+"</i>��ע�����");
                out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">����</a><a href=\""+basePath+"\">��ҳ</a><a href=\""+basePath+"news.jsp\">��Ѷ</a></div>");
                out.println("</div>");
                out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
                out.println("<script>");
                out.println("$(function () {");
                out.println("$('#tips_suc').css({");
                out.println("top:'50%',");
                out.println("left:'50%',");
                out.println("margin:'-'+($('#tips_suc').height()/2+'px 0 0 -'+$('#tips_suc').width()/2)+'px'");
                out.println("});");
                out.println("$('#tips_bg').css({");
                out.println("width:$(window).width(),");
                out.println("height:$(document).height()");
                out.println("});");
                out.println("});");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
            catch(Exception e)
            {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
                out.println("<!--[if lt IE 9]>");
                out.println("<script src=\""+basePath+"js/html5.js\"></script>");
                out.println("<script src=\""+basePath+"js/respond.js\"></script>");
                out.println("<![endif]-->");
                out.println("<title>���뷢��ʧ��_MiniBarCMS</title>");  
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_error\">");
                out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                out.println("���뷢��ʧ�ܣ�����ϵ��վ����Ա");
                out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">����</a><a href=\""+basePath+"\">��ҳ</a><a href=\""+basePath+"news.jsp\">��Ѷ</a></div>");
                out.println("</div>");
                out.println("<div id=\"tips_bg\"></div>");
                out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
                out.println("<script>");
                out.println("$(function () {");
                out.println("$('#tips_error').css({");
                out.println("top:'50%',");
                out.println("left:'50%',");
                out.println("margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'");
                out.println("});");
                out.println("$('#tips_bg').css({");
                out.println("width:$(window).width(),");
                out.println("height:$(document).height()");
                out.println("});");
                out.println("});");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
