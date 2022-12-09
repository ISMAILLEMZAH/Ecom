<%@page import="entities.Marque"%>
<%@page import="service.MarqueService"%>
<%@page import="entities.Categorie"%>
<%@page import="service.CategorieService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%
          response.setHeader("Cache-Control", " no-cache,no-store,must-revalidate");
                            String email = (String)session.getAttribute("email");
		            String password = (String)session.getAttribute("password");
                            if(email == null || password==null){
	
			response.sendRedirect("login.html");
		}	
                        %>
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
                        <li><a class="active" href="ajouterProduit.jsp">Ajouter Un Produit</a></li>
                        <li><a href="produit.jsp">Produits</a></li>
                        <li><a  href="categorie.jsp">Categories</a></li>
                        <li><a href="marque.jsp">Marques</a></li>
                        <li><a href="stock.html">Commandes</a></li>
                        <li><a href="utilisateurs.jsp">Utilisateurs</a></li>
                    </ul>				
                </div>
                <div class="content-form" style="width: 100%">
                    <h3>AJOUTER UN PRODUIT</h3>

                    <form method="GET" action="AddProduct">
                        <div class="form-group mb-3">
                            <label
                                for="name"
                                >Nom du produit
                            </label>
                            <input
                                id="name"
                                name="name"
                                type="text"
                                class="form-control validate"
                                required
                                />
                        </div>
                        <div class="form-group">
                            <label
                                for="marque"
                                >Marque</label
                            >

                            <select
                                class="custom-select tm-select-accounts"
                                id="category" name="marque"     required
                                >		
                                <option selected disabled>Sélectionner une marque</option><%
                                    MarqueService ms = new MarqueService();
                                    for (Marque e : ms.findAll()) {
                                %>

                                <option> <%= e.getId()%> <%= e.getNom()%></option>


                                <%}%>

                            </select>
                        </div>
                        <div class="form-group ">
                            <label
                                for="category"
                                >Categorie</label
                            >
                            <select
                                class="custom-select tm-select-accounts"
                                id="category"  name="categorie"  required
                                >		
                                <option selected disabled>Sélectionner une categorie</option><%
                                    CategorieService es = new CategorieService();
                                    for (Categorie c : es.findAll()) {
                                %>

                                <option>  <%= c.getId()%> <%= c.getNom()%></option>


                                <%}%>

                            </select>



                        </div>

                        <div class="form-group">
                            <label
                                for="description"
                                >Déscription</label
                            >
                            <textarea
                                class="form-control"
                                rows="3" name="description"
                                required
                                ></textarea>
                        </div>
                        <div class="form-group">
                            <label
                                for="prix"
                                >Prix
                            </label>
                            <input
                                id="prix"
                                name="prix"
                                type="text"
                                class="form-control"
                                required
                                />
                        </div>




                                <input type="submit" value="Ajouter" style="width:90px; align-content: center;">


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