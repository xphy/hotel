package com.bar.servlet;

import com.bar.db.Goods;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeletGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=GB2312");
        PrintWriter out = response.getWriter();
        
        Goods Goods = new Goods();
        HttpSession session = request.getSession();
        //��ȡ��Ҫɾ���Ĺ�����Ϣ������
        String sGoodsID = request.getParameter("Goodsid");
        long lGoodsID = Long.parseLong(sGoodsID);

        long lUserID = (Long) session.getAttribute("userid");
        Goods.setGoodsid(lGoodsID);
        Goods.setUserid(lUserID);
        if(Goods.valid())
        {
                //ɾ�����ﳵ��Ϣ
                if(Goods.delete())
                {
                        response.sendRedirect("goods_list.jsp");
                }
                else
                {
                        out.println("<p><font color=red>����ʧ�ܣ�������</font></p>");
                        out.println("<input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
                }
        }
        else
        {
                out.println("<p><font color=red>����Ȩ���в�������</font></p>");
                out.println("<input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
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
