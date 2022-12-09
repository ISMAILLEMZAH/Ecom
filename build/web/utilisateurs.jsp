
<%@page import="entities.Client"%>
<%@page import="service.UserService"%>
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
                        <li><a  href="produit.jsp">Produits</a></li>
                        <li><a  href="categorie.jsp">Categories</a></li>
                        <li><a href="marque.jsp">Marques</a></li>
                        <li><a href="stock.html">Commandes</a></li>
                        <li><a class="active" href="utilisateurs.jsp">Utilisateurs</a></li>
                    </ul>				
                </div>
              

                <div class="content">
                    <h3>All Products</h3>
                    <button id="mybutt" style=' height:40px; margin-top:20px;' >MODIFIER</button>

                    <table style="width:100%">
                        <thead>
                            <tr >
                                <th>Nom</th>
                                <th>Prenom</th>
                                <th>Adresse</th>
                                <th>Tel</th>                              
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
                            UserService ps = new UserService();
                            for (Client e : ps.findAllClients()) {
                        %>
                        <tr>
                                             
                            <td><%= e.getNom()%></td>
                            <td><%= e.getPrenom()%></td>
                            <td><%= e.getAdresse()%></td>
                            <td><%= e.getTel()%></td>



                            <td><a href="./DeleteUser?id=<%=e.getId()%>">Supprimer</a></td>
                        </tr>

                        <tr class="hehe" hidden >

                        <form name='gg'  method="GET" action="UpdateUser">   
                            <input hidden type="number" name="id" value="<%=e.getId()%>" readonly>
                            <td><input type="text" name="name"></td>                     
                            <td><input type="text" name="prenom"></td>
                            <td><input rows="3" name="adresse"></td>
                            <td><input type=" number" name="tel"></td>
                            <td><input for='gg' type="submit" value="Change "></form></td>


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