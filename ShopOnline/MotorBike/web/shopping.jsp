<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.product.ProductDAO"%>
<%@page import="sample.user.UserDTO"%>
<!doctype html>
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
<%UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <!-- Preloader -->
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
        <!-- End Preloader -->

        <!-- Header Area -->
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
        <!-- End Header Area -->

        <!-- Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="bread-inner">
                    <div class="row">
                        <div class="col-12">
                            <h2>Log In</h2>
                            <ul class="bread-list">
                                <li><a href="index.jsp">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>

                                <li><a href="shopping.jsp"><%= loginUser.getFullName()%></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Contact Us -->
        <%
            String searchCart = request.getParameter("searchCart");
            if (searchCart == null) {
                searchCart = "";
            }

            
            if (loginUser == null) {
        %>
        <ul>
            <li><a href="login.jsp">Login</a></li>
                <%
                } else {
                %>
                <%
                    }
                %>
        </ul>
        <h2>Our Product</h2>
        <div class="brand">
            <div class="container">
            </div>
            <div class="brand-bg">
                <div class="container">
                    <%
                        String message = (String) request.getAttribute("MESSAGE");
                        if (message == null) {
                            message = "";
                        }
                    %>
                    <div class="centered welcome-text">
                        <h1>Search product:</h1>
                    </div>
                    <form action="MainController" method="POST" class="centered form-container"">
                        <input type="text" name="Name"  placeholder="Name" class="input-text"/>
                        <input type="text" name="Brand" placeholder="Brand" class="input-text"/>
                        <button type="submit" name="action" value="Search Name-Brand Price" class="search-button">
                            <img style="width: 20px;height: 20px" src="img/search.png" alt="Search Icon" />
                        </button>
                    </form>
                    <br>

                    <h1 style="text-align: center"><%= message%></h1>
                    <div class="row">
                        <%
                            ProductDAO dao = new ProductDAO();
                            List<ProductDTO> productList = (List) request.getAttribute("Product_List");
                            if (productList == null) {
                                productList = dao.getAllProduct();
                            }
                            for (ProductDTO product : productList) {
                        %>                   
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 margin">
                            <div class="brand_box">
                                <img style="width:25%; height: 25%;" src="img/<%= product.getImage()%>" alt="img" />
                                <span><strong><%= product.getItemName()%></strong></span>
                                <span>Brand: <%= product.getBrand()%></span>
                                <h4><%= product.getPrice()%></h4> 
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="id" value="<%= product.getItemId()%>">
                                    <input type="hidden" name="name" value="<%= product.getItemName()%>"> <br>

                                    <input type="hidden" name="brand" value="<%= product.getBrand()%>">

                                    <input type="hidden" name="price" value="<%= product.getPrice()%>">
                                    <input type="hidden" name="discount" value="<%= product.getDiscount()%>">
                                    <input type="submit" name="action" value="Add to cart">
                                    <input type="submit" name="action" value="Add to Wish List">
                                </form>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>


        <!--/ End Contact Us -->

        <!-- Footer Area -->
        <footer id="footer" class="footer ">
            <!-- Footer Top -->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-footer">
                                <h2>About Us</h2>
                                <p>Accompany you on your journeys<br>A place that offers you safe and great rides</p>
                                <!-- Social -->
                                <ul class="social">
                                    <li><a href="#"><i class="icofont-facebook"></i></a></li>
                                    <li><a href="#"><i class="icofont-google-plus"></i></a></li>
                                    <li><a href="#"><i class="icofont-twitter"></i></a></li>
                                    <li><a href="#"><i class="icofont-vimeo"></i></a></li>
                                    <li><a href="#"><i class="icofont-pinterest"></i></a></li>
                                </ul>
                                <!-- End Social -->
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-6 col-12">
                            <div class="single-footer f-link">
                                <h2>Quick Links</h2>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <ul>
                                            <li><a href="index.html"><i class="fa fa-caret-right"
                                                                        aria-hidden="true"></i>Home</a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>About
                                                    Us</a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-caret-right"
                                                               aria-hidden="true"></i>Services</a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Our
                                                    Cases</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Other
                                                    Links</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-caret-right"
                                                               aria-hidden="true"></i>Consuling</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"
                                                               aria-hidden="true"></i>Finance</a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-caret-right"
                                                               aria-hidden="true"></i>Testimonials</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>FAQ</a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Contact
                                                    Us</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class="single-footer">
                                <h2>Open Hours</h2>
                                <p>Always open to you ! </p>
                                <ul class="time-sidual">
                                    <li class="day"> Monday - Friday <span>8.00-20.00</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Footer Top -->
            <!-- Copyright -->
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-12">
                            <div class="copyright-content">
                                <p>� Copyright 2024</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Copyright -->
        </footer>
        <!--/ End Footer Area -->

        <!-- jquery Min JS -->
        <script src="js/jquery.min.js"></script>
        <!-- jquery Migrate JS -->
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <!-- jquery Ui JS -->
        <script src="js/jquery-ui.min.js"></script>
        <!-- Easing JS -->
        <script src="js/easing.js"></script>
        <!-- Color JS -->
        <script src="js/colors.js"></script>
        <!-- Popper JS -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap Datepicker JS -->
        <script src="js/bootstrap-datepicker.js"></script>
        <!-- Jquery Nav JS -->
        <script src="js/jquery.nav.js"></script>
        <!-- Slicknav JS -->
        <script src="js/slicknav.min.js"></script>
        <!-- ScrollUp JS -->
        <script src="js/jquery.scrollUp.min.js"></script>
        <!-- Niceselect JS -->
        <script src="js/niceselect.js"></script>
        <!-- Tilt Jquery JS -->
        <script src="js/tilt.jquery.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="js/owl-carousel.js"></script>
        <!-- counterup JS -->
        <script src="js/jquery.counterup.min.js"></script>
        <!-- Steller JS -->
        <script src="js/steller.js"></script>
        <!-- Wow JS -->
        <script src="js/wow.min.js"></script>
        <!-- Magnific Popup JS -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <!-- Counter Up CDN JS -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <!-- Google Map API Key JS -->
        <script src="https://maps.google.com/maps/api/js?key=AIzaSyDGqTyqoPIvYxhn_Sa7ZrK5bENUWhpCo0w"></script>
        <!-- Gmaps JS -->
        <script src="js/gmaps.min.js"></script>
        <!-- Map Active JS -->
        <script src="js/map-active.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Main JS -->
        <script src="js/main.js"></script>

    </body>

</html>