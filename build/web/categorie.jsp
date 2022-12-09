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
        <script>
            $(document).ready(function () {

                $("#nail").click(function () {
                    $(".y").toggle(1000);

                });

            });
        </script>
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
                        <li><a href="ajouterProduit.jsp">Ajouter Un Produit</a></li>
                        <li><a href="produit.jsp">Produits</a></li>
                        <li><a class="active" href="categorie.jsp">Categories</a></li>
                        <li><a href="marque.jsp">Marques</a></li>
                        <li><a href="stock.html">Commandes</a></li>
                        <li><a href="utilisateurs.jsp">Utilisateurs</a></li>
                    </ul>				
                </div>
                <div class="content">
                    <h3>CATÉGORIE</h3>
                    <div class="content-data">
                        <div class="content-form">
                            <form  method="POST" action="AddCategorieController">
                                <h4>AJOUTER UNE CATÉGORIE</h4>
                                <div class="form-inline">
                                    <div class="form-group">
                                        <label>NOM DE CATÉGORIE</label>
                                        <input type="text" name="name">
                                    </div>
                                    <div class="form-group">

                                    </div>
                                </div>										
                                <div class="form-group">
                                    <label></label>
                                    <input type="submit" name="addCategory" value="AJOUTER">
                                </div>
                            </form>
                        </div>
                        
            
                        <div class="content-detail">
                            <h4>LISTE DES CATÉGORIES</h4>
                            <table>
                                
                             <button id="nail" style=' height:40px; margin-top:5px;margin-bottom:10px '>Modifier</button>

                            <table>
                                <thead>
                                    <tr>
                                        <th>Categories</th>

                                        <th>Supprimer</th>
                                    </tr>
                                </thead>


                                <tbody>

                                    <tr>

                                        <%
                                            CategorieService es = new CategorieService();
                                            for (Categorie e : es.findAll()) {
                                        %>
                                    <tr id="x">
                                        <td><%= e.getNom()%></td>


                                        <td><a href="DeleteCategorie?id=<%= e.getId()%>">supprimer</a></td>

                                        </form>

                                    </tr>
                                    <tr class="y" hidden>
                                <form method="GET" action="UpdateCategorie">
                                    <td><input type="text" name="categorie"></td>
                                    <input name="id" value="<%=e.getId()%>" hidden >
                                    <td><button type="submit">send</button></td>
                                </form>
                                </tr>

                                <%}%>


                                </tbody>



                            </table>
                            </table>
                        </div>
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