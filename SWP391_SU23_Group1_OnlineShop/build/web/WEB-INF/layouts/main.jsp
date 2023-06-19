<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>


<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shop &ndash; Mon'sa</title>
        <meta name="description" content="description">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/logo.png" />

        <!-- Font-awesome 6.4 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <!-- Font-awesome 6.4 -->

        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.css">

        <!-- Bootstap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">

    </head>

    <body class="template-product template-product-right-thumb belle">
        <div class="pageWrapper">
            <!--Search Form Drawer-->
            <div class="search">
                <div class="search__form">
                    <form class="search-bar__form" action="${pageContext.request.contextPath}/shop/list.do" method="POST">
                        <button class="go-btn search__button" type="submit"><i class="icon anm anm-search-l"></i></button>
                        <input class="search__input" type="search" name="search" value="" placeholder="Search entire store..."
                               aria-label="Search" autocomplete="off">
                    </form>
                    <button type="button" class="search-trigger close-btn"><i class="icon anm anm-times-l"></i></button>
                </div>
            </div>

            <!--End Search Form Drawer-->
            <!--Top Header-->
            <div class="top-header">
                <div class="container-fluid">
                    <div class="row d-flex justify-content-end">
                        <div class="col-2 col-sm-4 col-md-3 col-lg-4 text-right float-right">
                            <span class="user-menu d-block d-lg-none">
                                <i class="anm anm-user-al" aria-hidden="true"></i>
                            </span>
                            <ul class="customer-links list-inline">
                                <c:if test="${account == null}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login/login.do">Login</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login/register.do">Create Account</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login/forgot.do">Forgot Password</a>
                                    </li>
                                </c:if>

                                <c:if test="${account != null}">
                                    <li>
                                        <a href="#!">Hello, ${account.fullName}</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cart/myorder.do">My Order</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cart/detail.do">My Cart</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login/logout.do">Logout</a>
                                    </li>
                                </c:if>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Top Header-->
            <!--Header-->

            <div class="header-wrap animated d-flex">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <!--Desktop Logo-->
                        <div class="logo col-md-2 col-lg-2 d-none d-lg-block">
                            <a href="${pageContext.request.contextPath}">
                                <img style="height: 3.5rem" src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="Logo"
                                     title="Mon'sa Shop" />
                            </a>
                        </div>
                        <!--End Desktop Logo-->
                        <div class="col-2 col-sm-3 col-md-3 col-lg-8">
                            <div class="d-block d-lg-none">
                                <button type="button"
                                        class="btn--link site-header__menu js-mobile-nav-toggle mobile-nav--open">
                                    <i class="icon anm anm-times-l"></i>
                                    <i class="anm anm-bars-r"></i>
                                </button>
                            </div>
                            <!--Desktop Menu-->
                            <nav class="grid__item" id="AccessibleNav"><!-- for mobile -->
                                <ul id="siteNav" class="site-nav medium center hidearrow">
                                    <li class="lvl1  ">
                                        <a href="${pageContext.request.contextPath}"><b>Home</b></a>

                                    </li>
                                    <li class="lvl1 parent megamenu">
                                        <a href="${pageContext.request.contextPath}/shop/list.do">Shop 
                                            <i class="anm anm-angle-down-l"></i>
                                        </a>
                                        <div class="megamenu style4">
                                            <ul class="grid grid--uniform mmWrapper">
                                                <c:forEach items="${category}" var="item">
                                                    <li class="grid__item lvl-1 col-md-3 col-lg-3">
                                                        <a href="#" class="site-nav lvl-1">${item.name}</a>
                                                        <ul class="subLinks">
                                                            <li class="lvl-2">
                                                                <a href="#!" class="site-nav lvl-2">Left Sidebar</a>
                                                            </li>
                                                            <li class="lvl-2">
                                                                <a href="#!" class="site-nav lvl-2">Right Sidebar</a>
                                                            </li>
                                                            <li class="lvl-2">
                                                                <a href="#!" class="site-nav lvl-2">Fullwidth</a>
                                                            </li>
                                                            <li class="lvl-2">
                                                                <a href="#!" class="site-nav lvl-2">3 items per row</a>
                                                            </li>
                                                            <li class="lvl-2">
                                                                <a href="#!" class="site-nav lvl-2">4 items per row</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </c:forEach>

                                                <li class="grid__item lvl-1 col-md-6 col-lg-6">
                                                    <a href="#">
                                                        <img src="${pageContext.request.contextPath}/assets/images/megamenu-bg1.jpg" alt=""/>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="lvl1"><a href="${pageContext.request.contextPath}/blog/list.do">Blogs</a></li>
                                </ul>
                            </nav>
                            <!--End Desktop Menu-->
                        </div>
                        <div class="col-6 col-sm-6 col-md-6 col-lg-2 d-block d-lg-none mobile-logo">
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/">
                                    <img src="${pageContext.request.contextPath}/assets/images/logo.svg" alt="Mon'sa" title="Mon'sa" />
                                </a>
                            </div>
                        </div>
                        <div class="col-4 col-sm-3 col-md-3 col-lg-2">
                            <div class="site-cart">
                                <a href="#" class="site-header__cart" title="Cart">
                                    <i class="icon anm anm-bag-l"></i>
                                    <span id="CartCount" class="site-header__cart-count" data-cart-render="item_count">${size}</span>
                                </a>
                                <div id="header-cart" class="block block-cart">
                                    <ul class="mini-products-list">
                                        <c:forEach items="${cart.items}" var="item">
                                            <li class="item">
                                                <a class="product-image" href="#">
                                                    <img src="${pageContext.request.contextPath}/${item.product.thumbnail_url}"
                                                         alt="${item.product.name}" title="" />
                                                </a>
                                                <div class="product-details">
                                                    <a href="${pageContext.request.contextPath}/cart/process.do?id=${item.product.id}&action=remove" class="remove">
                                                        <i class="anm anm-times-l" aria-hidden="true"></i>
                                                    </a>
                                                    <a class="pName" href="#">${item.product.name}</a>
                                                    <div class="priceRow">
                                                        <div class="product-price">
                                                            <span class="money">${common.getPriceFormat(item.product.lastPrice)}</span>
                                                        </div> <span class="prodMulti">X</span>
                                                        <div class="qtyField"><span>${item.quantity}</span></div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <div class="total">
                                        <c:if test="${cart.items.isEmpty()}">
                                            <div class="total-in d-flex justify-content-center" style='border: unset'>
                                                <label class="text-center">You Don't Have Any Product In Cart</label>
                                            </div>
                                        </c:if>
                                        <c:if test="${!cart.items.isEmpty()}">
                                            <div class="total-in">
                                                <label>Total:</label>
                                                <span class="product-price">
                                                    <span class="money">${common.getPriceFormat(cart.totalMoney)}</span>
                                                </span>
                                            </div>
                                            <div class="buttonSet text-center">
                                                <a id="inlinecheckout-cart"
                                                   href="${pageContext.request.contextPath}/cart/detail.do"
                                                   class="btn btn-secondary btn--small">view Cart
                                                </a>
                                                <a href="${pageContext.request.contextPath}/cart/checkout.do"
                                                   class="btn btn-secondary btn--small">Checkout
                                                </a>
                                            </div>
                                        </c:if>


                                    </div>

                                </div>
                            </div>
                            <div class="site-header__search">
                                <button type="button" class="search-trigger"><i class="icon anm anm-search-l"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Header-->
            <!--Mobile Menu-->
            <div class="mobile-nav-wrapper" role="navigation">
                <div class="closemobileMenu"><i class="icon anm anm-times-l pull-right"></i> Close Menu</div>
                <ul id="MobileNav" class="mobile-nav">
                    <li class="lvl1 parent megamenu"><a href="index.html">Home <i class="anm anm-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Home Group 1<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="index.html" class="site-nav">Home 1 - Classic</a></li>
                                    <li><a href="home2-default.html" class="site-nav">Home 2 - Default</a></li>
                                    <li><a href="home15-funiture.html" class="site-nav">Home 15 - Furniture </a></li>
                                    <li><a href="home3-boxed.html" class="site-nav">Home 3 - Boxed</a></li>
                                    <li><a href="home4-fullwidth.html" class="site-nav">Home 4 - Fullwidth</a></li>
                                    <li><a href="home5-cosmetic.html" class="site-nav">Home 5 - Cosmetic</a></li>
                                    <li><a href="home6-modern.html" class="site-nav">Home 6 - Modern</a></li>
                                    <li><a href="home7-shoes.html" class="site-nav last">Home 7 - Shoes</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Home Group 2<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="home8-jewellery.html" class="site-nav">Home 8 - Jewellery</a></li>
                                    <li><a href="home9-parallax.html" class="site-nav">Home 9 - Parallax</a></li>
                                    <li><a href="home10-minimal.html" class="site-nav">Home 10 - Minimal</a></li>
                                    <li><a href="home11-grid.html" class="site-nav">Home 11 - Grid</a></li>
                                    <li><a href="home12-category.html" class="site-nav">Home 12 - Category</a></li>
                                    <li><a href="home13-auto-parts.html" class="site-nav">Home 13 - Auto Parts</a></li>
                                    <li><a href="home14-bags.html" class="site-nav last">Home 14 - Bags</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">New Sections<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="home11-grid.html" class="site-nav">Image Gallery</a></li>
                                    <li><a href="home5-cosmetic.html" class="site-nav">Featured Product</a></li>
                                    <li><a href="home7-shoes.html" class="site-nav">Columns with Items</a></li>
                                    <li><a href="home6-modern.html" class="site-nav">Text columns with images</a></li>
                                    <li><a href="home2-default.html" class="site-nav">Products Carousel</a></li>
                                    <li><a href="home9-parallax.html" class="site-nav last">Parallax Banner</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">New Features<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="home13-auto-parts.html" class="site-nav">Top Information Bar </a></li>
                                    <li><a href="#" class="site-nav">Age Varification </a></li>
                                    <li><a href="#" class="site-nav">Footer Blocks</a></li>
                                    <li><a href="#" class="site-nav">2 New Megamenu style</a></li>
                                    <li><a href="#" class="site-nav">Show Total Savings </a></li>
                                    <li><a href="#" class="site-nav">New Custom Icons</a></li>
                                    <li><a href="#" class="site-nav last">Auto Currency</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="#">Shop <i class="anm anm-plus-l"></i></a>
                        <ul>
                            <li><a href="#" class="site-nav">Shop Pages<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="shop-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                                    <li><a href="shop-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                                    <li><a href="shop-fullwidth.html" class="site-nav">Fullwidth</a></li>
                                    <li><a href="shop-grid-3.html" class="site-nav">3 items per row</a></li>
                                    <li><a href="shop-grid-4.html" class="site-nav">4 items per row</a></li>
                                    <li><a href="shop-grid-5.html" class="site-nav">5 items per row</a></li>
                                    <li><a href="shop-grid-6.html" class="site-nav">6 items per row</a></li>
                                    <li><a href="shop-grid-7.html" class="site-nav">7 items per row</a></li>
                                    <li><a href="shop-listview.html" class="site-nav last">Product Listview</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Shop Features<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="shop-left-sidebar.html" class="site-nav">Product Countdown </a></li>
                                    <li><a href="shop-right-sidebar.html" class="site-nav">Infinite Scrolling</a></li>

                                    <li><a href="shop-grid-3.html" class="site-nav">Pagination - Classic</a></li>
                                    <li><a href="shop-grid-6.html" class="site-nav">Pagination - Load More</a></li>
                                    <li><a href="product-labels.html" class="site-nav">Dynamic Product Labels</a></li>
                                    <li><a href="product-swatches-style.html" class="site-nav">Product Swatches </a></li>
                                    <li><a href="product-hover-info.html" class="site-nav">Product Hover Info</a></li>
                                    <li><a href="shop-grid-3.html" class="site-nav">Product Reviews</a></li>
                                    <li><a href="shop-left-sidebar.html" class="site-nav last">Discount Label </a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="product-layout-1.html">Product <i
                                class="anm anm-plus-l"></i></a>
                        <ul>
                            <li><a href="product-layout-1.html" class="site-nav">Product Page<i
                                        class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="product-layout-1.html" class="site-nav">Product Layout 1</a></li>
                                    <li><a href="product-layout-2.html" class="site-nav">Product Layout 2</a></li>
                                    <li><a href="product-layout-3.html" class="site-nav">Product Layout 3</a></li>
                                    <li><a href="product-with-left-thumbs.html" class="site-nav">Product With Left
                                            Thumbs</a></li>
                                    <li><a href="product-with-right-thumbs.html" class="site-nav">Product With Right
                                            Thumbs</a></li>
                                    <li><a href="product-with-bottom-thumbs.html" class="site-nav last">Product With Bottom
                                            Thumbs</a></li>
                                </ul>
                            </li>
                            <li><a href="short-description.html" class="site-nav">Product Features<i
                                        class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="short-description.html" class="site-nav">Short Description</a></li>
                                    <li><a href="product-countdown.html" class="site-nav">Product Countdown</a></li>
                                    <li><a href="product-video.html" class="site-nav">Product Video</a></li>
                                    <li><a href="product-quantity-message.html" class="site-nav">Product Quantity
                                            Message</a></li>
                                    <li><a href="product-visitor-sold-count.html" class="site-nav">Product Visitor/Sold
                                            Count </a></li>
                                    <li><a href="product-zoom-lightbox.html" class="site-nav last">Product Zoom/Lightbox
                                        </a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Product Features<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="product-with-variant-image.html" class="site-nav">Product with Variant
                                            Image</a></li>
                                    <li><a href="product-with-color-swatch.html" class="site-nav">Product with Color
                                            Swatch</a></li>
                                    <li><a href="product-with-image-swatch.html" class="site-nav">Product with Image
                                            Swatch</a></li>
                                    <li><a href="product-with-dropdown.html" class="site-nav">Product with Dropdown</a></li>
                                    <li><a href="product-with-rounded-square.html" class="site-nav">Product with Rounded
                                            Square</a></li>
                                    <li><a href="swatches-style.html" class="site-nav last">Product Swatches All Style</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#" class="site-nav">Product Features<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="product-accordion.html" class="site-nav">Product Accordion</a></li>
                                    <li><a href="product-pre-orders.html" class="site-nav">Product Pre-orders </a></li>
                                    <li><a href="product-labels-detail.html" class="site-nav">Product Labels</a></li>
                                    <li><a href="product-discount.html" class="site-nav">Product Discount In %</a></li>
                                    <li><a href="product-shipping-message.html" class="site-nav">Product Shipping
                                            Message</a></li>
                                    <li><a href="product-shipping-message.html" class="site-nav last">Size Guide </a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="about-us.html">Pages <i class="anm anm-plus-l"></i></a>
                        <ul>
                            <li><a href="cart.html" class="site-nav">Cart Page</a></li>
                            <li><a href="checkout.html" class="site-nav">Checkout</a></li>
                            <li><a href="about-us.html" class="site-nav">About Us<span class="lbl nm_label1">New</span></a>
                            </li>
                            <li><a href="contact-us.html" class="site-nav">Contact Us</a></li>
                            <li><a href="faqs.html" class="site-nav">FAQs</a></li>
                            <li><a href="lookbook1.html" class="site-nav">Lookbook<i class="anm anm-plus-l"></i></a>
                                <ul>
                                    <li><a href="lookbook1.html" class="site-nav">Style 1</a></li>
                                    <li><a href="lookbook2.html" class="site-nav last">Style 2</a></li>
                                </ul>
                            </li>
                            <li><a href="404.html" class="site-nav">404</a></li>
                            <li><a href="coming-soon.html" class="site-nav">Coming soon<span
                                        class="lbl nm_label1">New</span></a></li>
                        </ul>
                    </li>
                    <li class="lvl1 parent megamenu"><a href="blog-left-sidebar.html">Blog <i
                                class="anm anm-plus-l"></i></a>
                        <ul>
                            <li><a href="blog-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                            <li><a href="blog-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                            <li><a href="blog-fullwidth.html" class="site-nav">Fullwidth</a></li>
                            <li><a href="blog-grid-view.html" class="site-nav">Gridview</a></li>
                            <li><a href="blog-article.html" class="site-nav">Article</a></li>
                        </ul>
                    </li>
                    <li class="lvl1"><a href="#"><b>Buy Now!</b></a>
                    </li>
                </ul>
            </div>
            <!--End Mobile Menu-->
            <div id="toast"></div>
            <span id="message" hidden>${toast__message}</span>

            <!--Body Content-->
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
            <!--End Body Content-->

            <!--Footer-->
            <footer id="footer">
                <div class="newsletter-section">
                    <div class="container">
                        <div class="row">
                            <div
                                class="col-12 col-sm-12 col-md-12 col-lg-7 w-100 d-flex justify-content-start align-items-center">
                                <div class="display-table">
                                    <div class="display-table-cell footer-newsletter">
                                        <div class="section-header text-center">
                                            <label class="h2"><span>sign up for </span>newsletter</label>
                                        </div>
                                        <form action="#" method="post">
                                            <div class="input-group">
                                                <input type="email" class="input-group__field newsletter__input"
                                                       name="EMAIL" value="" placeholder="Email address" required="">
                                                <span class="input-group__btn">
                                                    <button type="submit" class="btn newsletter__submit" name="commit"
                                                            id="Subscribe"><span
                                                            class="newsletter__submit-text--large">Subscribe</span></button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12 col-lg-5 d-flex justify-content-end align-items-center">
                                <div class="footer-social">
                                    <ul class="list--inline site-footer__social-icons social-icons">
                                        <li><a class="social-icons__link" href="#" target="_blank"
                                               title="Belle Multipurpose Bootstrap 4 Template on Facebook"><i
                                                    class="icon icon-facebook"></i></a></li>
                                        <li><a class="social-icons__link" href="#" target="_blank"
                                               title="Belle Multipurpose Bootstrap 4 Template on Twitter"><i
                                                    class="icon icon-twitter"></i> <span
                                                    class="icon__fallback-text">Twitter</span></a></li>
                                        <li><a class="social-icons__link" href="#" target="_blank"
                                               title="Belle Multipurpose Bootstrap 4 Template on Pinterest"><i
                                                    class="icon icon-pinterest"></i> <span
                                                    class="icon__fallback-text">Pinterest</span></a></li>
                                        <li><a class="social-icons__link" href="#" target="_blank"
                                               title="Belle Multipurpose Bootstrap 4 Template on Instagram"><i
                                                    class="icon icon-instagram"></i> <span
                                                    class="icon__fallback-text">Instagram</span></a></li>
                                        <li><a class="social-icons__link" href="#" target="_blank"
                                               title="Belle Multipurpose Bootstrap 4 Template on Tumblr"><i
                                                    class="icon icon-tumblr-alt"></i> <span
                                                    class="icon__fallback-text">Tumblr</span></a></li>
                                        <li><a class="social-icons__link" href="#" target="_blank"
                                               title="Belle Multipurpose Bootstrap 4 Template on YouTube"><i
                                                    class="icon icon-youtube"></i> <span
                                                    class="icon__fallback-text">YouTube</span></a></li>
                                        <li><a class="social-icons__link" href="#" target="_blank"
                                               title="Belle Multipurpose Bootstrap 4 Template on Vimeo"><i
                                                    class="icon icon-vimeo-alt"></i> <span
                                                    class="icon__fallback-text">Vimeo</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="site-footer">
                    <div class="container">
                        <!--Footer Links-->
                        <div class="footer-top">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 footer-links">
                                    <h4 class="h4">Quick Shop</h4>
                                    <ul>
                                        <li><a href="#">Women</a></li>
                                        <li><a href="#">Men</a></li>
                                        <li><a href="#">Kids</a></li>
                                        <li><a href="#">Sportswear</a></li>
                                        <li><a href="#">Sale</a></li>
                                    </ul>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 footer-links">
                                    <h4 class="h4">Informations</h4>
                                    <ul>
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Careers</a></li>
                                        <li><a href="#">Privacy policy</a></li>
                                        <li><a href="#">Terms &amp; condition</a></li>
                                        <li><a href="#">My Account</a></li>
                                    </ul>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 footer-links">
                                    <h4 class="h4">Customer Services</h4>
                                    <ul>
                                        <li><a href="#">Request Personal Data</a></li>
                                        <li><a href="#">FAQ's</a></li>
                                        <li><a href="#">Contact Us</a></li>
                                        <li><a href="#">Orders and Returns</a></li>
                                        <li><a href="#">Support Center</a></li>
                                    </ul>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3 contact-box">
                                    <h4 class="h4">Contact Us</h4>
                                    <ul class="addressFooter">
                                        <li><i class="icon anm anm-map-marker-al"></i>
                                            <p>Đất Thổ Cư Hòa Lạc, Km29, ĐCT08, Thạch Hoà, Thạch Thất, Hà Nội</p>
                                        </li>
                                        <li class="phone"><i class="icon anm anm-phone-s"></i>
                                            <p>0838456798</p>
                                        </li>
                                        <li class="email"><i class="icon anm anm-envelope-l"></i>
                                            <p>email@yousite.com</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--End Footer Links-->
                        <hr>
                        <div class="footer-bottom">
                            <div class="row d-flex justify-content-end">
                                <!--Footer Copyright-->

                                <!--Footer Payment Icon-->
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6 order-0 order-md-1 order-lg-1 order-sm-0 payment-icons text-right text-md-center">
                                    <ul class="payment-icons list--inline">
                                        <li><i class="icon fa fa-cc-visa" aria-hidden="true"></i></li>
                                        <li><i class="icon fa fa-cc-mastercard" aria-hidden="true"></i></li>
                                        <li><i class="icon fa fa-cc-discover" aria-hidden="true"></i></li>
                                        <li><i class="icon fa fa-cc-paypal" aria-hidden="true"></i></li>
                                        <li><i class="icon fa fa-cc-amex" aria-hidden="true"></i></li>
                                        <li><i class="icon fa fa-credit-card" aria-hidden="true"></i></li>
                                    </ul>
                                </div>
                                <!--End Footer Payment Icon-->
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!--End Footer-->
            <!--Scoll Top-->
            <span id="site-scroll"><i class="icon anm anm-angle-up-r"></i></span>
            <!--End Scoll Top-->

            <!-- Including Jquery -->
            <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-3.3.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.cookie.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.6.0.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/vendor/wow.min.js"></script>
            <!-- Including Javascript -->
            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/lazysizes.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
            <script ype="text/javascript">
                $(function () {
                    var $pswp = $('.pswp')[0],
                            image = [],
                            getItems = function () {
                                var items = [];
                                $('.lightboximages a').each(function () {
                                    var $href = $(this).attr('href'),
                                            $size = $(this).data('size').split('x'),
                                            item = {
                                                src: $href,
                                                w: $size[0],
                                                h: $size[1]
                                            }
                                    items.push(item);
                                });
                                return items;
                            }
                    var items = getItems();

                    $.each(items, function (index, value) {
                        image[index] = new Image();
                        image[index].src = value['src'];
                    });
                    $('.prlightbox').on('click', function (event) {
                        event.preventDefault();

                        var $index = $(".active-thumb").parent().attr('data-slick-index');
                        $index++;
                        $index = $index - 1;

                        var options = {
                            index: $index,
                            bgOpacity: 0.9,
                            showHideOpacity: true
                        }
                        var lightBox = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
                        lightBox.init();
                    });
                });
            </script>
            <script type="text/javascript">
                $(document).ready(function () {
                    const message = document.getElementById('message');


                    if (message.innerHTML !== '') {

                        const main = document.getElementById("toast");
                        const duration = 3000;
                        if (main) {
                            const toast = document.createElement("div");

                            // Auto remove toast
                            const autoRemoveId = setTimeout(function () {
                                main.removeChild(toast);
                            }, duration + 1000);

                            // Remove toast when clicked
                            toast.onclick = function (e) {
                                if (e.target.closest(".toast__close")) {
                                    main.removeChild(toast);
                                    clearTimeout(autoRemoveId);
                                }
                            };
                            const delay = (duration / 1000).toFixed(2);

                            toast.classList.add("toast", `toast--${toast__type}`);
                            toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${deplay}s forwards`;

                            toast.innerHTML = `
                    <div class="toast__icon">
                        <i class="${toast__icons}"></i>
                    </div>
                    <div class="toast__body">
                        <p class="toast__msg">${toast__message}</p>
                    </div>
                    <div class="toast__close">
                        <i class="fas fa-times"></i>
                    </div>`;
                            main.appendChild(toast);
                        }

                    }

                });

            </script>

            <%
                session.removeAttribute("toast__message");
                session.removeAttribute("toast__icons");
                session.removeAttribute("toast__type");
            %>

            <script>
                $(function () {
                    function price_slider() {
                        $("#slider-range").slider({
                            range: true,
                            min: 0,
                            max: ${maxPrice != null ? maxPrice : 1000},
                            values: [${minPriceSelected != null ? minPriceSelected : 0}, ${maxPriceSelected != null ? maxPriceSelected : maxPrice}],
                            slide: function (event, ui) {
                                $("#amount").val("$" + ui.values[0] + "-$" + ui.values[1]);
                            }
                        });
                        $("#amount").val("$" + $("#slider-range").slider("values", 0) +
                                " - $" + $("#slider-range").slider("values", 1));
                    }
                    price_slider();
                })();

            </script>
        </div>
    </body>


</html>
