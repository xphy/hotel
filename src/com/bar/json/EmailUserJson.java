package com.bar.json;

import com.bar.db.ExecuteDB;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author  Mr.Tao
 * @date    2016-7-30 13:40:08
 * @version V2.0
 * @desc  
 */

public class EmailUserJson extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
	private static final long serialVersionUID = 1L;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/json;charset=GB2312");
        try (PrintWriter out = response.getWriter()) {
        
            String callback = request.getParameter("callback");
            if(callback!=null){
                ExecuteDB DB = new ExecuteDB();
                String sql = "select * from users";  

                ResultSet rs = DB.exeQuery(sql);  

                JsonObject object = new JsonObject();  
                JsonArray array = new JsonArray();  

                while (rs.next()) {
                    JsonObject ob = new JsonObject();  
                    ob.addProperty("name", rs.getString("uname"));
                    array.add(ob);
                }
                object.add("Email_name", array);  
                out.print(callback+"("+object.toString()+")");//ʹ��jsonp���з���json����
            }else{
                out.print("����Ȩ�鿴��ҳ");
            }
        
        }catch(Exception ex){
            System.out.println(ex.toString());
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
