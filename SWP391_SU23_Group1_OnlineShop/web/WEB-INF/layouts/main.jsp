<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.ProductDAO" id="productDAO" />


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

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Include jQuery Validation 1.19.3 -->
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

        <style>
            .hidden-text-1 {
                overflow: hidden;
                text-overflow: ellipsis;
                line-height: 25px;
                -webkit-line-clamp: 1;
                height: 25px;
                display: -webkit-box;
                -webkit-box-orient: vertical;
            }
            .error {
                color: red;
                margin-top: 5px;
            }

            .invalid-input {
                border: 1px solid red;
            }
        </style>

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
                        <div class="col text-right float-right">
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
                                        <a href="${pageContext.request.contextPath}/login/userProfile.do">Hello, ${account.fullName}</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cart/myorder.do">My Order</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cart/detail.do">My Cart</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login/changepass.do">Change Pass</a>
                                    </li>
                                    <c:if test="${account.role.id != 2}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/dashboard/dashboard.ad">Dashboard</a>
                                        </li>
                                    </c:if>
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
                                                    <c:set var="product" value="${productDAO.getProductTopXSoldByCategoryID(item.id)}"/>
                                                    <li class="grid__item lvl-1 col-md-3 col-lg-3">
                                                        <a href="#" class="site-nav lvl-1">${item.name}</a>
                                                        <ul class="subLinks">
                                                            <c:forEach items="${product}" var="p">
                                                                <li class="lvl-2">
                                                                    <a href="${pageContext.request.contextPath}/shop/detail.do?id=${p.id}" class="site-nav lvl-2 hidden-text-1">${p.name}</a>
                                                                </li>
                                                            </c:forEach>
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

            <div id="toast"></div>
            <span id="message" hidden>${toast__message}</span>

            <!--Body Content-->
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />

            <!--End Body Content-->

            <!--Footer-->
            <footer id="footer">
                <div class="site-footer">
                    <div class="container">
                        <!--Footer Links-->
                        <div class="footer-top">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4 footer-links">
                                    <h4 class="h4">Information</h4>
                                    <ul>
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Careers</a></li>
                                        <li><a href="#">Privacy policy</a></li>
                                        <li><a href="#">Terms &amp; condition</a></li>
                                        <li><a href="#">My Account</a></li>
                                    </ul>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4 footer-links">
                                    <h4 class="h4">Customer Services</h4>
                                    <ul>
                                        <li><a href="#">Request Personal Data</a></li>
                                        <li><a href="#">FAQ's</a></li>
                                        <li><a href="#">Contact Us</a></li>
                                        <li><a href="#">Orders and Returns</a></li>
                                        <li><a href="#">Support Center</a></li>
                                    </ul>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4 contact-box">
                                    <h4 class="h4">Contact Us</h4>
                                    <ul class="addressFooter">
                                        <li><i class="icon anm anm-map-marker-al"></i>
                                            <p>No 1, Thach Hoa Commune, Thach That District, Hanoi Province</p>
                                        </li>
                                        <li class="phone"><i class="icon anm anm-phone-s"></i>
                                            <p>+84 987654321</p>
                                        </li>
                                        <li class="email"><i class="icon anm anm-envelope-l"></i>
                                            <p>monsa.admin@gmail.com</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--End Footer Links-->
                    </div>
                </div>
            </footer>
            <!--End Footer-->
            <!--Scoll Top-->
            <span id="site-scroll"><i class="icon anm anm-angle-up-r"></i></span>
            <!--End Scoll Top-->

            <!-- Including JQuery -->
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
