package com.bar.filter;
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  

/**
 *
 * @author Administrator
 * @date 2016-8-27 22:11:39
 * @version V2.0
 * @desc Get �������������
 */
public class SetCharacterEncodingFilter implements Filter {
 private String charset = "GB2312";  
    private FilterConfig config;  
      
 @Override
    public void destroy() {  
        System.out.println(config.getFilterName()+"������");  
        charset = null;  
        config = null;  
    }  
  
    
 @Override
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {  
            //����������Ӧ�ַ�����  
            request.setCharacterEncoding(charset);  
            response.setCharacterEncoding(charset);  
            //�����ӵĴ���          
            HttpServletRequest req = (HttpServletRequest)request;  
              
            if(req.getMethod().equalsIgnoreCase("get"))
            {  
                req = new GetHttpServletRequestWrapper(req,charset);
            }  
              
            System.out.println("----����"+config.getFilterName()+"����");
            //���ݸ�Ŀ��servlet��jsp��ʵ����ʱ��װ����������ã�������ԭʼ��HttpServletRequest����  
            chain.doFilter(req, response);
              
            System.out.println("----��Ӧ��"+config.getFilterName()+"����");
      
        }  
  
 @Override
    public void init(FilterConfig config) throws ServletException {
            this.config = config;  
            String charset = config.getServletContext().getInitParameter("charset");    
            if( charset != null && charset.trim().length() != 0)  
            {  
                this.charset = charset;  
            }  
    }  
  
}  