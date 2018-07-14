package com.bar.servlet;

import com.bar.db.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ModifyInfoSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        
        request.setCharacterEncoding("gb2312");
        
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        
        User User=new User(); //����UserΪUser
	HttpSession session = request.getSession();
	
	String sUserName = (String)session.getAttribute("uname");
	long userid = (long)session.getAttribute("userid");
	

	//��ȡ�޸ĺ���û���Ϣ
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	String birth = request.getParameter("birth");
	String post = request.getParameter("post");
	String safequestion = request.getParameter("safequestion");
	String safeanswer = request.getParameter("safeanswer");
	String smoney = request.getParameter("money");
	float money =  Float.parseFloat(smoney);
	

	
	//�����û���Ϣ
        User.setUserid(userid);
	User.setName(name);
	User.setSex(sex);
	User.setEmail(email);
	User.setAddress(address);
	User.setTel(tel);
	User.setBirth(birth);
	User.setPost(post);
	User.setSafequestion(safequestion);
	User.setSafeanswer(safeanswer);
	User.setMoney(money);
        
	if(User.modify_info())
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
            out.println("<title>�޸ĳɹ�_MiniBarCMS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_suc\">");
            out.println("<i class=\"fa fa-check-circle fa-3x\"></i><br>");
            out.println("�޸��û���Ϣ�ɹ�");
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
            out.println("<title>�޸��û���Ϣʧ�ܣ����Ժ�����_MiniBarCMS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("�޸��û���Ϣʧ�ܣ����Ժ�����");
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
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}