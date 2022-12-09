<%@page import="entities.Marque"%>
<%@page import="service.MarqueService"%>
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
         <c:if test="${not empty loginError}">
    <script>
    window.addEventListener("load",function(){
         alert("${loginError}");
    }
    </script>
</c:if>
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
                        <li><a  href="categorie.jsp">Categories</a></li>
                        <li><a class="active" href="marque.jsp">Marques</a></li>
                        <li><a href="stock.html">Commandes</a></li>
                        <li><a href="utilisateurs.jsp">Utilisateurs</a></li>
                    </ul>				
                </div>
                <div class="content">
                    <h3>MARQUE</h3>
                    <div class="content-data">
                        <div class="content-form">
                            <form  method="POST" action="AddMarqueController">
                                <h4>AJOUTER UNE MARQUE</h4>
                                <div class="form-inline">
                                    <div class="form-group">
                                        <label>NOM DE MARQUE</label>
                                        <input type="text" name="marque">
                                    </div>
                                    <div class="form-group">

                                    </div>
                                </div>										
                                <div class="form-group">
                                    <label></label>
                                    <input type="submit" name="addMarque" value="AJOUTER">
                                </div>
                            </form>
                        </div>
                        <div class="content-detail">
                            <h4>LISTE DES MARQUES</h4>
                            <table>
                                
                             <button id="nail" style=' height:40px; margin-top:5px;margin-bottom:10px '>Modifier</button>

                            <table>
                                <thead>
                                    <tr>
                                        <th>Marques</th>

                                        <th>Supprimer</th>
                                    </tr>
                                </thead>


                                <tbody>

                                    <tr>

                                        <%
                                            MarqueService es = new MarqueService();
                                            for (Marque e : es.findAll()) {
                                        %>
                                    <tr id="x">
                                        <td><%= e.getNom()%></td>


                                        <td><a href="DeleteMarque?id=<%= e.getId()%>">supprimer</a></td>

                                        </form>

                                    </tr>
                                    <tr class="y" hidden>
                                <form method="GET" action="UpdateMarque">
                                    <td><input type="text" name="marque"></td>
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