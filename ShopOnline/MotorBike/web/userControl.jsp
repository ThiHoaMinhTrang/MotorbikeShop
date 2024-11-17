<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.product.ProductDAO"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

   <head>
        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="Site keywords here">
        <meta name="description" content="">
        <meta name='copyright' content=''>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title -->
        <title>MotoBike</title>

        <!-- Favicon -->
        <link rel="icon" href="img/logo2.png">

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
            rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/nice-select.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- icofont CSS -->
        <link rel="stylesheet" href="css/icofont.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="css/slicknav.min.css">
        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="css/owl-carousel.css">
        <!-- Datepicker CSS -->
        <link rel="stylesheet" href="css/datepicker.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.min.css">
        <!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">

        <!-- Medipro CSS -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

    </head>

    <body>
        <!-- header: thanh header -->
        <div class="preloader">
            <div class="loader">
                <div class="loader-outter"></div>
                <div class="loader-inner"></div>
                <div class="indicator">
                    <svg width="16px" height="12px">
                    <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                    <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                    </svg>
                </div>
            </div>
        </div>
        <header class="header">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-5 col-12">
                            <!-- Contact -->
                            <ul class="top-link">
                                <li><a href="#">About</a></li>
                                <li><a href="#">Product</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                            <!-- End Contact -->
                        </div>
                        <div class="col-lg-6 col-md-7 col-12">
                            <!-- Top Contact -->
                            <ul class="top-contact">
                                <li><i class="fa fa-phone"></i>+84976537439</li>
                                <li><i class="fa fa-envelope"></i><a
                                        href="mailto:support@yourmail.com">trangthmse183464@fpt.edu.vn</a></li>
                            </ul>
                            <!-- End Top Contact -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-12">
                                <!-- Start Logo -->
                                <div class="logo">
                                    <a href="index.jsp"><img src="img/logo.jpg" alt="#"></a>
                                </div>
                                <!-- End Logo -->
                                <!-- Mobile Nav -->
                                <div class="mobile-nav"></div>
                                <!-- End Mobile Nav -->
                            </div>
                            <div class="col-lg-7 col-md-9 col-12">
                                <!-- Main Menu -->
                                <div class="main-menu">
                                    <nav class="navigation">
                                        <ul class="nav menu">
                                            <li><a href="index.jsp">Home </a></li>
                                            <li><a href="#">Model <i class="icofont-rounded-down"></i></a>
                                                <ul class="dropdown">
                                                    <li><a href="shopping.jsp">Honda</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">News </a></li>
                                            <li><a href="contact.jsp">Contact Us</a></li>
                                            <li><a href="login.jsp">Log In </a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <!--/ End Main Menu -->
                            </div>
                            <div class="col-lg-2 col-12">
                                <div class="get-quote">
                                    <a href="shopping.jsp" class="btn">All MotorBike</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Header Inner -->
        </header>
        <!-- end header -->
       
        
        <!--controller-->
        <div class="brand">           
            <div class="brand-bg">
                <div class="container">
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || loginUser.getRole().equals("AD")) {
                response.sendRedirect("userControl.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form action="MainController" class="centered form-container">
            <input type="text" name="search" value="<%= search%>" placeholder="Search user" class="input-text"/>
            <button type="submit" name="action" value="Search" class="search-button">
                <img src="images/search_icon.png" alt="Search Icon" />
            </button>
        </form>
        <br>
        <%
            List<UserDTO> listUser = (List) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <div class="table-container centered">
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Password</th>
                        <th>Full Name</th>
                        <th>Role</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO user : listUser) {
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td>
                            <input type="text" name="userID" value="<%= user.getUserId()%>" readonly="" class="input-text readonly"/>
                        </td>
                        <td>
                            <input type="text" name="password" value="<%= user.getPassword()%>" required="" oninput="validateInput(event)" class="input-text"/>
                        </td>
                        <td>
                            <input type="text" name="fullName" value="<%= user.getFullName()%>" required="" class="input-text"/>
                        </td>
                        <td>
                            <input type="text" name="roleID" value="<%= user.getRole()%>" required="" oninput="validateInput012(event)" class="input-text"/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Update" class="expand"/>
                            <input type="hidden" name="search" value="<%= search%>"/>
                        </td>
                        <td>
                            <form action="MainController" method="GET">
                                <input type="hidden" name="userID" value="<%= user.getUserId()%>"/>
                                <input type="hidden" name="search" value="<%= search%>"/>
                                <input type="submit" name="action" value="Delete" class="expand delete-button"/>
                            </form>
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>
        <br>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <h1 class="centered error-message">
            <%= error%>
        </h1>
        <%
                }
            }
        %>
                    </div>
            
            </div>
        </div>
        <!-- footer -->
        <footer>
            <div id="contact" class="footer">
                <div class="container">
                    <div class="row pdn-top-30">
                        <div class="col-md-12 ">
                            <div class="footer-box">
                                <div class="headinga">
                                    <h3>Contact us</h3>
                                    <span>Hopepeak HighSchool, Tokyo ,Japan, ASIA</span>
                                    <p>(+84) 8522369417
                                        <br>thinhvpqse183444@fpt.edu.vn</p>
                                </div>
                                <ul class="location_icon">
                                    <li> <a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                    <li> <a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li> <a href="#"><i class="fa fa-instagram"></i></a></li>

                                </ul>
                                <div class="menu-bottom">
                                    <ul class="link">
                                        <li> <a href="#">Home</a></li>
                                            <%
                                                if (loginUser.getRole().equals("AD")) {
                                            %>
                                        <li> <a href="#">User</a></li>
                                            <%
                                                }
                                            %>
                                        <li> <a href="#">Product </a></li>
                                        <li> <a href="#">Invoice</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end footer -->
        <!-- Javascript files-->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <script src="js/plugin.js"></script>
        <!-- sidebar -->
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/custom.js"></script>
        <!-- javascript -->
        <script src="js/owl.carousel.js"></script>
        <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".fancybox").fancybox({
                    openEffect: "none",
                    closeEffect: "none"
                });

                $(".zoom").hover(function () {

                    $(this).addClass('transition');
                }, function () {

                    $(this).removeClass('transition');
                });
            });
        </script>
    </body>

</html>