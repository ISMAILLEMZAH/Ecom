/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import entities.Client;
import entities.Marque;
import entities.Produit;
import org.hibernate.Hibernate;
import service.CategorieService;
import service.UserService;
import service.MarqueService;
import service.ProduitService;
import util.HibernateUtil;

/**
 *
 * @author a
 */
public class Test {
    public static void main(String[] args) {
        HibernateUtil.getSessionFactory().openSession();
       CategorieService cs = new CategorieService();
       MarqueService ms = new MarqueService();
        ProduitService ps = new  ProduitService();
//     ps.create(new Produit ("gg",ms.findById(1),cs.findById(2),"aa",1200));
//      ps.create(new Produit ("gg",ms.findById(1),cs.findById(2),"aa",1200));
//       cs.create(new Client ("e","g","d","s","a","q"));
      //cs.delete(cs.findById(9));
       for(Marque e : ms.findAll()){
                      
       System.out.println("success");}
    }
}
