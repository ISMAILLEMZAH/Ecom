<%-- 
    Document   : shop
    Created on : Dec 5, 2022, 10:42:26 AM
    Author     : 5inko
--%>

<%@page import="entities.LigneCommande"%>
<%@page import="entities.Commande"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Produit"%>
<%@page import="service.ProduitService"%>
<%@page import="entities.Categorie"%>
<%@page import="service.CategorieService"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Meta Tags -->
        <meta charset="UTF-8">
        <meta name="author" content="Kamran Mubarik">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Title -->
        <title>E-Commerce Online Shop</title>
        <!-- Style Sheet -->
        <link rel="stylesheet" type="text/css" href="Template/css/style_2.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!-- Javascript -->	
        <script type="text/javascript" src="Template/js/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    </head>
    <body>

        <header>
            <div class="container">
                <div class="brand">
                    <div class="logo">
                        <a href="index.html">
                            <img src="Template/img/icons/online_shopping.png">
                            <div class="logo-text">
                                <p class="big-logo">Ecommerce</p>
                                <p class="small-logo">online shop</p>
                            </div>
                        </a>
                    </div> <!-- logo -->
                    <div class="shop-icon">
                        <div class="dropdown">
                            <img src="Template/img/icons/account.png">
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a href="./Logout">Logout</a></li>
                                    <li><a href="login.html">Login</a></li>

                                </ul>
                            </div>
                        </div>


                        <%             Commande commande = null;
                            if (request.getSession().getAttribute("cart") != null) {

                                commande = (Commande) request.getSession().getAttribute("cart");

                        %>
                        <div class="dropdown"> 
                            <a href="cart.jsp"> <img src="Template/img/icons/shopping_cart.png"> </a>
                            <a href="cart.jsp" style="color:red;font-size:25px; "><%=commande.getLigneCommandes().size()%></a>


                            <div class="dropdown-menu cart-item">
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Produit</th>
                                            <th class="center">Prix</th>
                                            <th class="center">Quantité</th>
                                            <th class="center">Prix Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (LigneCommande lc : commande.getLigneCommandes()) {


                                        %>
                                        <tr>

                                            <td><img src="<%=lc.getProduit().getImage()%>"></th>
                                            <td><%=lc.getProduit().getNom()%></th>
                                            <td class="center"><%=lc.getProduit().getPrix()%> Dhs</th>
                                            <td class="center"><%=lc.getQuantité()%></th>
                                            <td class="center"><%=lc.getProduit().getPrix() * lc.getQuantité()%> Dhs</th>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div><%   }%>
                    </div> <!-- shop icons -->
                </div> <!-- brand -->

                <div class="menu-bar">
                    <div class="menu">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="shop.jsp">Shop</a></li>
                            <li><a href="about.html">About</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                    <div class="search-bar">
                        <form>
                            <div class="form-group">
                                <input type="text" class="form-control" name="search" placeholder="Search">
                                <img src="Template/img/icons/search.png">
                            </div>
                        </form>
                    </div>
                </div> <!-- menu -->
            </div> <!-- container -->
        </header> <!-- header -->

        <div class="container">
            <main>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li> / </li>
                        <li>Shop</li>
                    </ul>
                </div> <!-- End of Breadcrumb-->

                <div class="new-product-section shop">
                    <div class="sidebar">
                        <div class="sidebar-widget">
                            <h3>Category</h3>
                            <ul>
                                <%

                                    CategorieService es = new CategorieService();
                                    for (Categorie e : es.findAll()) {
                                %>
                                <li><a href="FiltreCateg?id=<%=e.getId()%>"><%= e.getNom()%></a></li>
                                    <%}%>

                            </ul>

                        </div>

                    </div>
                    <div class="product-content">
                        <%
                            if (request.getSession().getAttribute("categorie") != null) {
                                Categorie cat = (Categorie) request.getSession().getAttribute("categorie");
                                ProduitService ps = new ProduitService();
                                for (Produit e : ps.findAll()) {
                                    if (e.getCategorie().getId()==cat.getId()) {
                        %>
                        <div class="product">
                            <a href="product.html">
                                <img src="<%= e.getImage()%>" alt="Image of the product" width="80" height="80">
                            </a>
                            <div class="product-detail">

                                <h3><%= e.getCategorie().getNom()%></h3>
                                <h2><%= e.getNom()%></h2>


                                <a href="AjouterAuPanier?id=<%=e.getId()%>&quantite=1">Ajouter au panier</a>
                                <p><%= e.getPrix()%> Dhs</p>

                            </div>						
                        </div>

                        <%}
                            }
                        } else {
                            ProduitService ps = new ProduitService();
                            for (Produit e : ps.findAll()) {


                        %>
                        <div class="product">
                            <a href="product.html">
                                <img src="<%= e.getImage()%>" alt="Image of the product" width="80" height="80">
                            </a>
                            <div class="product-detail">

                                <h3><%= e.getCategorie().getNom()%></h3>
                                <h2><%= e.getNom()%></h2>


                                <a href="AjouterAuPanier?id=<%=e.getId()%>&quantite=1">Ajouter au panier</a>
                                <p><%= e.getPrix()%> Dhs</p>

                            </div>						
                        </div>

                        <%}
                            }%>

                    </div>				
                </div> <!-- New Product Section -->
                <div class="load-more">
                    <a href="#">UP</a>
                </div>		
            </main> <!-- Main Area -->
        </div>

        <footer>
            <div class="container">
                <div class="footer-widget">
                    <div class="widget">
                        <div class="widget-heading">
                            <h3>Important Link</h3>
                        </div>
                        <div class="widget-content">
                            <ul>
                                <li><a href="about.html">About</a></li>
                                <li><a href="contact.html">Contact</a></li>
                                <li><a href="refund.html">Refund Policy</a></li>
                                <li><a href="terms.html">Terms & Conditions</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-heading">
                            <h3>Information</h3>
                        </div>
                        <div class="widget-content">
                            <ul>
                                <li><a href="account.html">My Account</a></li>
                                <li><a href="orders.html">My Orders</a></li>
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-heading">
                            <h3>Follow us</h3>
                        </div>
                        <div class="widget-content">
                            <div class="follow">
                                <ul>
                                    <li><a href="#"><img src="Template/img/icons/facebook.png"></a></li>
                                    <li><a href="#"><img src="Template/img/icons/twitter.png"></a></li>
                                    <li><a href="#"><img src="Template/img/icons/instagram.png"></a></li>
                                </ul>
                            </div>						
                        </div>
                        <div class="widget-heading">
                            <h3>Subscribe for Newsletter</h3>
                        </div>
                        <div class="widget-content">
                            <div class="subscribe">
                                <form>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="subscribe" placeholder="Email">
                                        <img src="Template/img/icons/paper_plane.png">
                                    </div>
                                </form>
                            </div>						
                        </div>
                    </div>
                </div> <!-- Footer Widget -->
                <div class="footer-bar">
                    <div class="copyright-text">
                        <p>Copyright 2021 - All Rights Reserved</p>
                    </div>
                    <div class="payment-mode">
                        <img src="Template/img/icons/paper_money.png">
                        <img src="Template/img/icons/visa.png">
                        <img src="Template/img/icons/mastercard.png">
                    </div>
                </div> <!-- Footer Bar -->
            </div>
        </footer> <!-- Footer Area -->

    </body>

</html>