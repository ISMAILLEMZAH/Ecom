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
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProduitService;

/**
 * @author user
 */
@WebServlet(name = "AjouterAuPanier", urlPatterns = {"/AjouterAuPanier"})
public class AjouterAuPanier extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Commande commande=null;
        try {

            int id = Integer.parseInt(request.getParameter("id")),
                    quantite = Integer.parseInt(request.getParameter("quantite"));
            Produit produit = (new ProduitService()).findById(id);
            commande = (Commande) request.getSession().getAttribute("cart");
            LigneCommande ligneCommande;
            boolean exist = false;
            if(commande!=null&&commande.getLigneCommandes()!=null){
            for (LigneCommande lc : commande.getLigneCommandes()) {
                exist = exist || lc.getProduit().getId() == id;
                if (exist) {
                    lc.setQuantité(quantite + lc.getQuantité());
                    break;
                }
            }
            if (!exist) {
                ligneCommande = new LigneCommande(quantite * produit.getPrix(), quantite, produit, commande);
                commande.getLigneCommandes().add(ligneCommande);
            }
             request.getSession().setAttribute("cart", commande);
       
          response.sendRedirect("cart.jsp");
             }
            else { 
                
                response.sendRedirect("login.html");

             
            request.getSession().setAttribute("cart", commande);
            
            }

        } catch (NumberFormatException e) {

        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
