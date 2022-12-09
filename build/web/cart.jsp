<%-- 
    Document   : cart.jsp
    Created on : Dec 5, 2022, 9:14:05 AM
    Author     : 5inko
--%>

<%@page import="entities.LigneCommande"%>
<%@page import="entities.Commande"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <!-- Javascript -->	
        <script type="text/javascript" src="Template/js/jquery.min.js"></script>
        <script>
            $(document).ready(function () {

                $('.prev').on("click", function () {

                    var prev = $(this).closest('.qty').find("input").val();

                    if (prev == 1) {
                        $(this).closest('.qty').find("input").val('1');
                    } else {
                        var prevVal = prev - 1;
                        $(this).closest('.qty').find("input").val(prevVal);
                    }
                });
                $('.next').on("click", function () {

                    var next = $(this).closest('.qty').find("input").val();

                    if (next == 10) {
                        $(this).closest('.qty').find("input").val('10');
                    } else {
                        var nextVal = ++next;
                        $(this).closest('.qty').find("input").val(nextVal);
                    }
                });
            });
        </script>
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

                                </ul>
                            </div>
                        </div>

                        <%             Commande commande = null;
                            if ((Commande) request.getSession().getAttribute("cart") != null) {

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
                                 if(commande.getLigneCommandes()!=null)  {for (LigneCommande lc : commande.getLigneCommandes()) {


                                        %>
                                        <tr>

                                            <td><img src="<%=lc.getProduit().getImage()%>"></th>
                                            <td><%=lc.getProduit().getNom()%></th>
                                            <td class="center"><%=lc.getProduit().getPrix()%> Dhs</th>
                                            <td class="center"><%=lc.getQuantité()%></th>
                                            <td class="center"><%=lc.getProduit().getPrix() * lc.getQuantité()%> Dhs</th>
                                        </tr>
                                        <% }}%>
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
                        <li><a href="shop.jsp">Shop</a></li>
                        <li> / </li>
                        <li>Panier</li>
                    </ul>
                </div> <!-- End of Breadcrumb-->

                <h2>Panier</h2>
                <div class="cart-page" style="max-height: 3000vh">
                    <div class="cart-items">					
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="3">Mes Articles</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                if(commande.getLigneCommandes()!=null)  {  for (LigneCommande lc : commande.getLigneCommandes()) {


                                %>

                                <tr>
                                    <td style="width: 20%;"><img src=<%=lc.getProduit().getImage()%>></td>
                                    <td style="width: 60%;">
                                        <h2><%=lc.getProduit().getNom()%></h2>
                                        <p><%=lc.getProduit().getDescription()%></p>
                                        <br>
                                        <h3><%=lc.getProduit().getPrix()%> Dhs</h3>
                                        <br>
                                        <a href="SupprimerDuPanier?id=<%=lc.getProduit().getId()%>">x</a> Remove
                                    </td>
                                    <td class="qty" style="width: 15%;">
                                        <form method="GET" action="UpdateCart">
                                            <div class="prev">-</div>
                                            <div class="next">+</div>
                                            <input type="number" name="quantite" class="cartNumber" value="1" min="1" max="10">
                                            <input hidden name="id" value="<%=lc.getProduit().getId()%>">

                                            </td>

                                            </tr>

                                            <% }  }%>
                                            <tr><td> <button type="submit" style="background-color:#F0E68C;border: none;margin-left:400%;width:110px;hight:30px; ">Modifier le panier</button>
                                        </form></td></tr>
                            </tbody>	
                        </table>

                    </div>
                    <div class="cart-summary">
                        <div class="checkout-total">
                            <h3>Résumé du panier</h3>
                            <ul>
                                <%
                                    int nbr = 0, sum = 0, prixTotal = 0;
                  if(commande.getLigneCommandes()!=null)  { 
                                        for (LigneCommande lc : commande.getLigneCommandes()) {
                                        sum += lc.getQuantité();
                                        nbr++;
                                        prixTotal += lc.getPrixVente() * lc.getQuantité();
                                    }}
                                %>
                                <li>Nombre de produits X <%=nbr%></li>
                                <li>Nombre d'items X <%=sum%></li>
                                <hr>
                                <li>Total <span style="float: right;"><%=prixTotal%> Dhs</span></li>
                                <li><a href="checkout.html">Go to Checkout</a></li>
                            </ul>

                        </div>
                    </div>
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