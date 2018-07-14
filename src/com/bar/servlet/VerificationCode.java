package com.bar.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.awt.*;
import java.awt.image.*;
import javax.imageio.*;


@WebServlet(name="VerificationCode", urlPatterns={"/Code.do"})
public class VerificationCode extends HttpServlet {
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
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("image/jpeg");    
        response.setHeader("Pragma", "No-cache");    
        response.setHeader("Cache-Control", "no-cache");    
        response.setDateHeader("Expires", 0);    
        HttpSession session = request.getSession();    
        // ���ڴ��д���ͼ��    
        int width = 75, height = 25;    
        BufferedImage image = new BufferedImage(width, height,    
                BufferedImage.TYPE_INT_RGB);    
        // ��ȡͼ��������    
        Graphics g = image.getGraphics();    
        // ���������    
        Random random = new Random();    
        // �趨����ɫ    
        g.setColor(getRandColor(200, 250));    
        g.fillRect(0, 0, width, height);    
        // �趨����    
        g.setFont(new Font("Times New Roman", Font.PLAIN, 24));    
        // ���߿�    
        g.setColor(getRandColor(160, 200));    
        g.drawRect(0, 0, width - 1, height - 1);    
        // �������155�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽    
        g.setColor(getRandColor(160, 200));    
        for (int i = 0; i < 155; i++) {    
            int x = random.nextInt(width);    
            int y = random.nextInt(height);    
            int xl = random.nextInt(12);    
            int yl = random.nextInt(12);    
            g.drawLine(x, y, x + xl, y + yl);    
        }    
        // ȡ�����������֤��(4λ����)    
        String sRand = "";    
        for (int i = 0; i < 4; i++) {    
            String rand = String.valueOf(random.nextInt(10));    
            sRand += rand;    
            // ����֤����ʾ��ͼ����    
            g.setColor(new Color(20 + random.nextInt(110), 20 + random    
                    .nextInt(110), 20 + random.nextInt(110)));    
            // ���ú�����������ɫ��ͬ����������Ϊ����̫�ӽ�������ֻ��ֱ������    
            g.drawString(rand, 13 * i + 14, 20);    
        }    
    
        // ����֤�����SESSION    
        session.setAttribute("Rand", sRand);    
    
        // ͼ����Ч    
        g.dispose();    
        // ���ͼ��ҳ��    
        ImageIO.write(image, "JPEG", response.getOutputStream());
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
        Color getRandColor(int fc, int bc) {// ������Χ��������ɫ    
        Random random = new Random();    
        if (fc > 255)    
            fc = 255;    
        if (bc > 255)    
            bc = 255;    
        int r = fc + random.nextInt(bc - fc);    
        int g = fc + random.nextInt(bc - fc);    
        int b = fc + random.nextInt(bc - fc);    
        return new Color(r, g, b);    
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
