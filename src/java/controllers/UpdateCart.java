/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Commande;
import entities.LigneCommande;
import entities.Produit;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ProduitService;

/**
 *
 * @author 5inko
 */
@WebServlet(name = "UpdateCart", urlPatterns = {"/UpdateCart"})
public class UpdateCart extends HttpServlet {

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
        processRequest(request, response);
        try {

            int[] id = new int[20];
            int[] quantite = new int[20];

            Commande commande = (Commande) request.getSession().getAttribute("cart");

            int i = 0;
            for (String idS : request.getParameterValues("id")) {
                id[i] = (Integer.parseInt(idS));
                i++;
            }
            i = 0;
            for (String qS : request.getParameterValues("quantite")) {
                quantite[i] = (Integer.parseInt(qS));
                i++;
            }
            for (int j = 0; j < i; j++) {
                Produit produit = (new ProduitService()).findById(id[j]);
                LigneCommande ligneCommande;
                boolean exist = false;
                if (commande.getLigneCommandes() != null) {
                    for (LigneCommande lc : commande.getLigneCommandes()) {
                        exist = exist || lc.getProduit().getId() == id[j];
                        if (exist) {
                            lc.setQuantité(quantite[j] + lc.getQuantité());
                            break;
                        }
                    }
                    if (!exist) {
                        ligneCommande = new LigneCommande(quantite[i] * produit.getPrix(), quantite[i], produit, commande);
                        commande.getLigneCommandes().add(ligneCommande);
                    }
                }

            }

            request.getSession().setAttribute("cart", commande);

        } catch (NumberFormatException e) {

        }

        response.sendRedirect("cart.jsp");

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
