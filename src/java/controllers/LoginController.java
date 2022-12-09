/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Client;
import entities.Commande;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.LoginService;
import service.UserService;


/**
 *
 * @author user
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
 

   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
       
        
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
         response.setContentType("text/html;charset=UTF-8");
          
        PrintWriter out = response.getWriter();
        String email =request.getParameter("username");
        String password =request.getParameter("password");
        UserService cs = new UserService();
        
           // AdminService ad = new AdminService();
             //ad.create(new Admin("123@123","adminadmin","admin"));
             	 LoginService loginService = new LoginService();

         HttpSession session=request.getSession();
          if("123@123".equals(email) && "adminadmin".equals(password) )
          {
         
           session.setAttribute("email", email);
           session.setAttribute("password",password) ;
           response.sendRedirect("produit.jsp");
          }
          else{
          
             try {
                 if(loginService.authenticateUser(email, password))
                     
                     
                 {
                 Client user = cs.findClientByEmail(email);
                 session.setAttribute("email", email);
                 session.setAttribute("password",password) ;
                 session.setAttribute("cart", new Commande(user));
                 response.sendRedirect("shop.jsp");

                 }else  response.sendRedirect("login.html");

             } catch (NoSuchAlgorithmException ex) {
                 Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
             }
         
    }
         
   }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
