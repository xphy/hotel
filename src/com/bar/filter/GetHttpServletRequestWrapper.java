package com.bar.filter;

/**
 *
 * @author Mr.Tao
 * @date 2016-9-2 12:17:54
 * @version V2.0
 * @desc ���ַ�����ת���Ĺ�����ӵ�getParameter()������
 */
import java.io.UnsupportedEncodingException;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletRequestWrapper;  
  
public class GetHttpServletRequestWrapper extends HttpServletRequestWrapper {  
  
    private String charset = "GB2312";  
  
    public GetHttpServletRequestWrapper(HttpServletRequest request) {  
        super(request);  
    }  
  
    /** 
     * ��ñ�װ�ζ�������úͲ��õ��ַ����� 
     * @param request 
     * @param charset 
     */  
    public GetHttpServletRequestWrapper(HttpServletRequest request,String charset) {  
        super(request);  
        this.charset = charset;  
    }  
  
    /** 
     * ʵ���Ͼ��ǵ��ñ���װ����������getParameter������ò�����Ȼ���ٽ��б���ת�� 
     * @param name
     * @return name
     */  
    @Override
    public String getParameter(String name) {  
        String value = super.getParameter(name);  
        value = value == null ? null : convert(value);  
        return value;  
    }  
  
    public String convert(String target) {  
        System.out.println("����ת��֮ǰ��" + target);
        try {  
            return new String(target.trim().getBytes("ISO-8859-1"), charset);  
        } catch (UnsupportedEncodingException e) {
            return target;
        }
    }
}
