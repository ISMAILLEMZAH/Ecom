<%@page import="entities.Marque"%>
<%@page import="service.MarqueService"%>
<%@page import="entities.Categorie"%>
<%@page import="service.CategorieService"%>
<%@page import="entities.Produit"%>
<%@page import="service.ProduitService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
          response.setHeader("Cache-Control", " no-cache,no-store,must-revalidate");
                            String email = (String)session.getAttribute("email");
		            String password = (String)session.getAttribute("password");
                            if(email == null || password==null){
	
			response.sendRedirect("login.html");
		}	
                        %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Meta Tags -->
        <meta charset="UTF-8">
        <meta name="author" content="Kamran Mubarik">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Title -->
        <title>Create an E-Commerce Website using HTML, CSS and JS</title>
        <!-- Style Sheet -->
        <link rel="stylesheet" type="text/css" href="Template/css/style_1.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="Template/js/jquery.min.js"></script>
        <script src="Template/js/bootstrap/js/custom.js"></script>
        <script>
            $(document).ready(function () {

                $("#nail").click(function () {
                    $(".y").toggle(1000);

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
                    </div> <!-- shop icons -->
                </div> <!-- brand -->
            </div> <!-- container -->
        </header> <!-- header -->

        <main>

            <div class="main-content">
                <div class="sidebar">
                    <h3>Menu</h3>
                    <ul>
                        <li><a href="ajouterProduit.jsp">Ajouter Un Produit</a></li>
                        <li><a class="active" href="produit.jsp">Produits</a></li>
                        <li><a  href="categorie.jsp">Categories</a></li>
                        <li><a href="marque.jsp">Marques</a></li>
                        <li><a href="stock.html">Commandes</a></li>
                        <li><a href="utilisateurs.jsp">Utilisateurs</a></li>
                    </ul>				
                </div>
              

                <div class="content">
                    <h3>All Products</h3>
                    <button id="mybutt" style=' height:40px; margin-top:20px;' >MODIFIER</button>

                    <table style="width:100%">
                        <thead>
                            <tr >
                                <th>Product</th>
                                <th>Nom</th>
                                <th>Categorie</th>
                                <th>Marque</th>
                                <th>Price</th>
                                <th>Description</th>

                                <th>Delete</th>
                            </tr>
                        </thead>






                        <tbody>
                            <tr>


                        <script>
                            $(document).ready(function () {
                                $("#mybutt").click(function () {
                                    $(".hehe").toggle(1000)
                                });
                            });
                        </script>


                        <%
                            ProduitService ps = new ProduitService();
                            for (Produit e : ps.findAll()) {
                        %>
                        <tr>
                            <td>


                                <img src="<%= e.getImage()%>" alt="Image of the product" width="80" height="80">

                            </td>                       
                            <td><%= e.getNom()%></td>
                            <td><%= e.getCategorie().getNom()%></td>
                            <td><%= e.getMarque().getNom()%></td>
                            <td><%= e.getPrix()%></td>
                            <td><%= e.getDescription()%></td>



                            <td><a href="./DeleteProduit?id=<%=e.getId()%> ">Supprimer</a></td>
                        </tr>

                        <tr class="hehe" hidden >


                            <td>
                                <form name="fname" method="post" action="ChooseProductImage?id=<%=e.getId()%>" enctype="multipart/form-data">

                                    <input for="fname" style="width:120px;" for="fname" type="file" name="file" />

                                    <input for="fname" style="margin-top:27px " type="submit" value="Upload" />
                                </form>

                            </td>   
                        <form name='gg'  method="GET" action="UpdateProduct">   
                            <input hidden type="number" name="id" value="<%=e.getId()%>" readonly>
                            <td><input type="text" name="name"></td>
                            <td>
                                <select
                                    class="custom-select tm-select-accounts"
                                    id="category"  name="categorie"                    >		
                                    <option selected disabled>Select categorie</option><%
                                        CategorieService ca = new CategorieService();
                                        for (Categorie c : ca.findAll()) {
                                    %>

                                    <option>  <%= c.getId()%> <%= c.getNom()%></option>


                                    <%}%>

                                </select> </td>
                            <td>
                                <select
                                    class="custom-select tm-select-accounts"
                                    id="marque"  name="marque"   >		
                                    <option selected disabled>Select categorie</option><%
                                        MarqueService va = new MarqueService();
                                        for (Marque c : va.findAll()) {
                                    %>

                                    <option>  <%= c.getId()%> <%= c.getNom()%></option>


                                    <%}%>

                                </select> </td>
                            <td><input type=" number" name="prix"></td>
                            <td><textarea rows="3" name="description" style="height: 38px;"></textarea></td>
                            <td><input for='gg' type="submit" name="change" value="Change "></form></td>


                        </tr>
                        </form>
                </div>
                <%}%>

                </tr>
                </tbody>


                </table>
            </div>
                </div>
            </div>		

        </main> <!-- Main Area -->

        <footer>
            <div class="container">
                <div class="footer-bar">
                    <div class="copyright-text">
                        <p>Copryright 2020 - All Rights Reserved</p>
                    </div>
                </div> <!-- Footer Bar -->
            </div>
        </footer> <!-- Footer Area -->

    </body>

</html>