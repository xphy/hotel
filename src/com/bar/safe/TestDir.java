package com.bar.safe;

//import java.io.File;
import java.io.IOException;

/**
 *
 * @author Mr.Tao
 * @date 2016-8-30 22:33:25
 * @version V2.0
 * @desc THIS IS TEST ! 获得WEB-INF目录测试实例
 */
public class TestDir {
    public static void main(String[] args) throws IOException{
        //File dir = new File("xxx.properties");
        String path1 = Thread.currentThread().getContextClassLoader().getResource("").toString();
        path1=path1.replace('/', '\\'); 
        path1=path1.replace("file:", ""); 
        path1=path1.replace("classes\\", "");  
        path1=path1.substring(1); 
        
        
        System.out.println("Thread:"+path1);
}
}