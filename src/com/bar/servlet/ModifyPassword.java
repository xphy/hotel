package com.bar.servlet;

import com.bar.db.User;
import com.bar.safe.MD5;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ModifyPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=GB2312");
        PrintWriter out = response.getWriter();
        
        MD5 oMD5 = new MD5();
        User User=new User(); //����UserΪUser
	HttpSession session = request.getSession();
        
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        
        //��ȡsession�б����UserName
	String sUserName = (String) session.getAttribute("uname");
	User.setUname(sUserName);
	//��ȡsession�б����UserID
	long lUserID = (Long) session.getAttribute("userid");	
	User.setUserid(lUserID);
	
	//��ȡ����д�ľ�����
	String sOldUserPassword = oMD5.getMD5ofStr(request.getParameter("OldUserPassword"));

	User.setPwd(sOldUserPassword);
	//�ж��û���д�ľ������Ƿ���ȷ
	if(User.valid())
	{
            //�޸��û�����
            String sPwd = request.getParameter("pwd");
            String sUserPassword = oMD5.getMD5ofStr(sPwd);

	    User.setSpwd(sPwd);
                
            User.setPwd(sUserPassword);
		
            if(User.modify_UserPassword()){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
                out.println("<!--[if lt IE 9]>");
                out.println("<script src=\""+basePath+"js/html5.js\"></script>");
                out.println("<script src=\""+basePath+"js/respond.js\"></script>");
                out.println("<![endif]-->");
                out.println("<title>�޸ĳɹ�_MiniBarCMS</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_suc\">");
                out.println("<i class=\"fa fa-check-circle fa-3x\"></i><br>");
                out.println("�޸��û�����ɹ�");
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
		else
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
                    out.println("<title>�޸��û�����ʧ�ܣ����Ժ�����_MiniBarCMS</title>");  
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div id=\"tips_error\">");
                    out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                    out.println("�޸��û�����ʧ�ܣ����Ժ�����");
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
	else
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
            out.println("<title>������ľ��������_MiniBarCMS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("������ľ��������<br>");
            out.println("<a href=\""+basePath+"get_password_form.jsp\" target=\"_blank\">�һ�����</a>");
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
