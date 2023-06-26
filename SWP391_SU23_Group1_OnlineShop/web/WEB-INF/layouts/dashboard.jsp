

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>Mon'sa - Dashboard Page</title>
        <!-- General CSS Files -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/css/app.min.css">

        <!-- Toast CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/izitoast/css/iziToast.min.css">
        <!-- Toast CSS -->

        <!-- List, Add CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/summernote/summernote-bs4.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/datatables/datatables.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/jquery-selectric/selectric.css">
        <!-- List, Add CSS -->

        <!-- Slider CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/owlcarousel2/dist/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/owlcarousel2/dist/assets/owl.theme.default.min.css">
        <!-- Slider CSS -->

        <!-- Template CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/css/components.css">
        <!-- Custom style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/css/custom.css">
        <link rel='shortcut icon' type='image/x-icon' href='${pageContext.request.contextPath}/assets/images/logo/logo.png' />
    </head>

    <body>
        <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <div class="navbar-bg"></div>
                <nav class="navbar navbar-expand-lg main-navbar sticky">
                    <div class="form-inline mr-auto">
                        <ul class="navbar-nav mr-3">
                            <li>
                                <a href="#!" data-toggle="sidebar" class="nav-link nav-link-lg collapse-btn">
                                    <i data-feather="align-justify"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="nav-link nav-link-lg fullscreen-btn">
                                    <i data-feather="maximize"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <ul class="navbar-nav navbar-right">
                        <li class="dropdown dropdown-list-toggle">
                            <a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg">
                                <i data-feather="bell" class="bell"></i>
                            </a>
                            <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
                                <div class="dropdown-header">
                                    Notifications
                                    <div class="float-right">
                                        <a href="#">Mark All As Read</a>
                                    </div>
                                </div>
                                <div class="dropdown-list-content dropdown-list-icons">
                                    <a href="#" class="dropdown-item dropdown-item-unread">
                                        <span class="dropdown-item-icon bg-primary text-white">
                                            <i class="fas fa-code"></i>
                                        </span>
                                        <span class="dropdown-item-desc">
                                            Template update is available now!
                                            <span class="time">2 Min Ago</span>
                                        </span>
                                    </a>
                                    <a href="#" class="dropdown-item">
                                        <span class="dropdown-item-icon bg-info text-white">
                                            <i class="far fa-user"></i>
                                        </span>
                                        <span class="dropdown-item-desc">
                                            <b>You</b> and <b>Dedik Sugiharto</b> are now friends 
                                            <span class="time">10 Hours Ago</span>
                                        </span>
                                    </a>  
                                </div>
                                <div class="dropdown-footer text-center">
                                    <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown">
                            <a href="#!" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                <img alt="image" src="${pageContext.request.contextPath}/dashboard/assets/img/user.png" class="user-img-radious-style">
                                <span class="d-sm-none d-lg-inline-block"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right pullDown">
                                <div class="dropdown-title">Hello, ${account.role.name}</div>
                                <a href="#!" class="dropdown-item has-icon">
                                    <i class="far fa-user"></i> Profile
                                </a>
                                <a href="#!" class="dropdown-item has-icon">
                                    <i class="fas fa-bolt"></i> Activities
                                </a> <a href="#" class="dropdown-item has-icon"> <i class="fas fa-cog"></i>
                                    Settings
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="${pageContext.request.contextPath}/dashboard/login/logout.ad" class="dropdown-item has-icon text-danger">
                                    <i class="fas fa-sign-out-alt"></i>Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <div class="main-sidebar sidebar-style-2">
                    <aside id="sidebar-wrapper">
                        <div class="sidebar-brand">
                            <a href="${pageContext.request.contextPath}/">
                                <img alt="image" src="${pageContext.request.contextPath}/assets/images/logo/logo.png" class="header-logo" />
                                <span class="logo-name">Mon'sa</span>
                            </a>
                        </div>
                        <ul class="sidebar-menu">
                            <li class="menu-header">Main</li>
                            <li class="dropdown ${action == 'dashboard' ? 'active' : ''}">
                                <a href="${pageContext.request.contextPath}/dashboard/dashboard.ad" class="nav-link">
                                    <i data-feather="monitor"></i><span>Dashboard</span>
                                </a>
                            </li>
                            <c:if test="${account.role.id == 1 || account.role.id == 3 || account.role.id == 4}">
                                <c:if test="${account.role.id == 1}">
                                    <li class="${controller == '/dashboard/statistic' ? 'active' : ''}">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard/statistic/listing.ad"><i data-feather="bar-chart"></i><span>Statistic</span></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/role' ? 'toggled' : ''}"><i data-feather="command"></i><span>Role</span></a>
                                        <ul class="dropdown-menu" style='${controller == '/dashboard/role' ? 'display: block' : ''}'>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/role/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/role/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <li class="menu-header">Product Managements</li>
                                    <c:if test="${account.role.id == 1}">
                                    <li class="dropdown">
                                        <a href="#!" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/product' ? 'toggled' : ''}"><i data-feather="copy"></i><span>Products</span></a>
                                        <ul class="dropdown-menu" style='${controller == '/dashboard/product' ? 'display: block' : ''}'>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/product/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/product/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown ">
                                        <a href="#!" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/category' ? 'toggled' : ''}"><i data-feather="package"></i><span>Categories</span></a>
                                        <ul class="dropdown-menu" style='${controller == '/dashboard/category' ? 'display: block' : ''}'>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/category/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/category/add.ad">Add New</a></li>  
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#!" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/color' ? 'toggled' : ''}"><i data-feather="filter"></i><span>Colors</span></a>
                                        <ul class="dropdown-menu" style='${controller == '/dashboard/color' ? 'display: block' : ''}'>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/color/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/color/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/size' ? 'toggled' : ''}"><i data-feather="tag"></i><span>Sizes</span></a>
                                        <ul class="dropdown-menu" style='${controller == '/dashboard/size' ? 'display: block' : ''}'>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/size/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/size/listing.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                </c:if>

                                <c:if test="${account.role.id == 1 || account.role.id == 4}">
                                    <li class="${controller == '/dashboard/order' ? 'active' : ''}">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard/order/listing.ad"><i data-feather="shopping-cart"></i><span>Orders</span></a>
                                    </li>
                                </c:if> 


                                <li class="menu-header">Community</li>
                                    <c:if test="${account.role.id == 1}">
                                    <li class="dropdown">
                                        <a href="#~" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/user' ? 'toggled' : ''}">
                                            <i data-feather="users"></i>
                                            <span>Users</span>
                                        </a>
                                        <ul class="dropdown-menu" style="${controller == '/dashboard/user' ? 'display: block' : ''}">
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/user/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/user/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${account.role.id == 1 || account.role.id == 3}">
                                    <li class="dropdown">
                                        <a href="#" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/blog' ? 'toggled' : ''}">
                                            <i data-feather="feather"></i>
                                            <span>Blogs</span>
                                        </a>
                                        <ul class="dropdown-menu" style="${controller == '/dashboard/blog' ? 'display: block' : ''}">
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/blog/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/blog/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <li class="menu-header">Media</li>
                                    <c:if test="${account.role.id == 1 || account.role.id == 3}">
                                    <li class="dropdown">
                                        <a href="#" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/slider' ? 'toggled' : ''}"><i data-feather="shopping-bag"></i><span>Sliders</span></a>
                                        <ul class="dropdown-menu" style="${controller == '/dashboard/slider' ? 'display: block' : ''}">
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/slider/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/slider/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                            </c:if>
                        </ul>
                    </aside>
                </div>
                <!-- Main Content -->
                <jsp:include page="/WEB-INF/dashboard/${controller}/${action}.jsp" />
                <!-- Main Content -->


                <footer class="main-footer">
                    <div class="footer-left">
                        <a href="templateshub.net">Mon's Shop</a></a>
                    </div>
                    <div class="footer-right">
                    </div>
                </footer>
            </div>
        </div>

        <div class="settingSidebar">
            <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
            </a>
            <div class="settingSidebar-body ps-container ps-theme-default">
                <div class=" fade show active">
                    <div class="setting-panel-header">Setting Panel
                    </div>
                    <div class="p-15 border-bottom">
                        <h6 class="font-medium m-b-10">Select Layout</h6>
                        <div class="selectgroup layout-color w-50">
                            <label class="selectgroup-item">
                                <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked>
                                <span class="selectgroup-button">Light</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout">
                                <span class="selectgroup-button">Dark</span>
                            </label>
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <h6 class="font-medium m-b-10">Sidebar Color</h6>
                        <div class="selectgroup selectgroup-pills sidebar-color">
                            <label class="selectgroup-item">
                                <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar">
                                <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                      data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked>
                                <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                      data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                            </label>
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <h6 class="font-medium m-b-10">Color Theme</h6>
                        <div class="theme-setting-options">
                            <ul class="choose-theme list-unstyled mb-0">
                                <li title="white" class="active">
                                    <div class="white"></div>
                                </li>
                                <li title="cyan">
                                    <div class="cyan"></div>
                                </li>
                                <li title="black">
                                    <div class="black"></div>
                                </li>
                                <li title="purple">
                                    <div class="purple"></div>
                                </li>
                                <li title="orange">
                                    <div class="orange"></div>
                                </li>
                                <li title="green">
                                    <div class="green"></div>
                                </li>
                                <li title="red">
                                    <div class="red"></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <div class="theme-setting-options">
                            <label class="m-b-0">
                                <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                       id="mini_sidebar_setting">
                                <span class="custom-switch-indicator"></span>
                                <span class="control-label p-l-10">Mini Sidebar</span>
                            </label>
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <div class="theme-setting-options">
                            <label class="m-b-0">
                                <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                       id="sticky_header_setting">
                                <span class="custom-switch-indicator"></span>
                                <span class="control-label p-l-10">Sticky Header</span>
                            </label>
                        </div>
                    </div>
                    <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                        <a href="#!" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                            <i class="fas fa-undo"></i> Restore Default
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <span style='display: none' id='dashboar_toast_type'>${toast__type}</span>
            <span style='display: none'>${dashboard_toast_title}</span>
            <span style='display: none'>${dashboard_toast__message}</span>
        </div>

        <!-- General JS Scripts -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/app.min.js"></script>
        <!-- JS Libraies -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/apexcharts/apexcharts.min.js"></script>

        <!-- List -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/datatables/datatables.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/jquery-ui/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/page/datatables.js"></script>
        <!-- List -->

        <!-- Add -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/summernote/summernote-bs4.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/jquery-selectric/jquery.selectric.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/upload-preview/assets/js/jquery.uploadPreview.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/page/create-post.js"></script>
        <!-- Add -->

        <!-- Toast -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/izitoast/js/iziToast.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/page/toastr.js"></script>
        <script>
            $(document).ready(function () {
                var type = document.getElementById('dashboar_toast_type').innerHTML;
                if (type !== '') {
                    switch (type) {
                        case 'error':
                            iziToast.error({
                                title: `${dashboard_toast_title}`,
                                message: `${dashboard_toast__message}`,
                                position: 'topRight'
                            });
                            break;
                        case 'success':
                            iziToast.success({
                                title: `${dashboard_toast_title}`,
                                message: `${dashboard_toast__message}`,
                                position: 'topRight'
                            });
                            break;
                        case 'warning':
                            iziToast.warning({
                                title: `${dashboard_toast_title}`,
                                message: `${dashboard_toast__message}`,
                                position: 'topRight'
                            });
                            break;
                        case 'info':
                            iziToast.info({
                                title: `${dashboard_toast_title}`,
                                message: `${dashboard_toast__message}`,
                                position: 'topRight'
                            });
                            break;
                    }
                }
            });
        </script>

        <%
                session.removeAttribute("dashboard_toast_title");
                session.removeAttribute("dashboard_toast__message");
                session.removeAttribute("toast__type");
        %>
        <!-- Toast -->

        <!-- Alert -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/sweetalert/sweetalert.min.js"></script>
        <!-- Alert -->

        <!-- Slider -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/owlcarousel2/dist/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/page/owl-carousel.js"></script>

        <!-- Slider -->





        <!-- Page Specific JS File -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/page/index.js"></script>


        <!-- Template JS File -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/scripts.js"></script>
        <!-- Custom JS File -->
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/custom.js"></script>
    </body>


    <!-- index.html  21 Nov 2019 03:47:04 GMT -->
</html>
