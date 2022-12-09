/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author 5inko
 */
@WebServlet(name = "Upload", urlPatterns = {"/Upload"})
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try  {//create the disk file item factory
          
          DiskFileItemFactory dfi = new DiskFileItemFactory();
          //create the object for servlet file upload
              ServletFileUpload sfu = new ServletFileUpload(dfi);
                //get the file from servlet file upload in muliparts
                  List<FileItem> multiparts = sfu.parseRequest(request);
                  //upload the file
                      for(FileItem item : multiparts){
                          //get the file
                          File f=new File(item.getName());
                    //save location where to uploded file will be saved
                    String name = f.getName();                   
                        item.write( new File("C:/Users/5inko/Documents/f/Ecom-IMK-main/web/Template/img/product/"+name));
                        
              }//for close
              
RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CategMarque.jsp");
requestDispatcher.forward(request, response);
      }//try close
      
      catch(Exception e) {
    e.printStackTrace();
  }//catch close
}//doPost(-,-) close
    }

 