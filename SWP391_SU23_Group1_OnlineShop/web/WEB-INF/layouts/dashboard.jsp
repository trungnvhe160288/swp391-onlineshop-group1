

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

        <!-- Product -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/assets/bundles/dropzonejs/dropzone.css">

        <!-- Product -->

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
                                    <li class="dropdown">
                                        <a href="#" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/role' ? 'toggled' : ''}"><i data-feather="command"></i><span>Role</span></a>
                                        <ul class="dropdown-menu" style='${controller == '/dashboard/role' ? 'display: block' : ''}'>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/role/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/role/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${account.role.id == 1}">
                                <li class="menu-header">Product Managements</li>
                                </c:if>
                                    <c:if test="${account.role.id == 1}">
                                    <li class="dropdown">
                                        <a href="#!" class="menu-toggle nav-link has-dropdown ${controller == '/dashboard/product' ? 'toggled' : ''}"><i data-feather="copy"></i><span>Products</span></a>
                                        <ul class="dropdown-menu" style='${controller == '/dashboard/product' ? 'display: block' : ''}'>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/product/listing.ad">Listing</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/product/add.ad">Add New</a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/image/listing.ad">Listing Images </a></li>
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/image/add.ad">Add New Image</a></li>
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
                                            <li><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/size/add.ad">Add New</a></li>
                                        </ul>
                                    </li>
                                </c:if>

                                <c:if test="${account.role.id == 4}">
                                    <li class="${controller == '/dashboard/order' ? 'active' : ''}">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard/order/listing.ad"><i data-feather="shopping-cart"></i><span>Orders</span></a>
                                    </li>
                                </c:if> 

                                <c:if test="${account.role.id == 1 || account.role.id == 3}">
                                <li class="menu-header">Community</li>
                                </c:if>
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
                                <c:if test="${account.role.id == 3}">
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
                                <c:if test="${account.role.id == 3}">
                                    <li class="menu-header">Media</li>
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
        <!--<script src="${pageContext.request.contextPath}/dashboard/assets/bundles/jquery-selectric/jquery.selectric.min.js"></script>-->
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/upload-preview/assets/js/jquery.uploadPreview.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
        <script src="${pageContext.request.contextPath}/dashboard/assets/js/page/create-post.js"></script>

        <script>
            jQuery(document).ready(function () {
                // click on next button
                jQuery('.form-wizard-next-btn').click(function () {
                    var parentFieldset = jQuery(this).parents('.wizard-fieldset');
                    var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
                    var next = jQuery(this);
                    var nextWizardStep = true;
                    parentFieldset.find('.wizard-required').each(function () {
                        var thisValue = jQuery(this).val();

                        var price = jQuery('#price').val();
                        var percent = jQuery('#percent_discount').val();
                        var quantity = jQuery('#quantity').val();

                        if (!Number(price)) {
                            jQuery('#price').siblings(".wizard-form-error").slideDown();
                            nextWizardStep = false;
                        } else {
                            jQuery('#price').siblings(".wizard-form-error").slideUp();
                        }

                        if (!Number(percent)) {
                            jQuery('#percent_discount').siblings(".wizard-form-error").slideDown();
                            nextWizardStep = false;
                        } else {
                            jQuery('#percent_discount').siblings(".wizard-form-error").slideUp();
                        }

                        if (!Number(quantity)) {
                            jQuery('#quantity').siblings(".wizard-form-error").slideDown();
                            nextWizardStep = false;
                        } else {
                            jQuery('#quantity').siblings(".wizard-form-error").slideUp();
                        }

                        if (thisValue === "") {
                            jQuery(this).siblings(".wizard-form-error").slideDown();
                            nextWizardStep = false;
                        } else {
                            jQuery(this).siblings(".wizard-form-error").slideUp();
                        }
                    });
                    if (nextWizardStep) {
                        next.parents('.wizard-fieldset').removeClass("d-block", "400");
                        currentActiveStep.removeClass('active').addClass('activated').next().addClass('active', "400");
                        next.parents('.wizard-fieldset').next('.wizard-fieldset').addClass("d-block", "400");
                        jQuery(document).find('.wizard-fieldset').each(function () {
                            if (jQuery(this).hasClass('show')) {
                                var formAtrr = jQuery(this).attr('data-tab-content');
                                jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function () {
                                    if (jQuery(this).attr('data-attr') == formAtrr) {
                                        jQuery(this).addClass('active');
                                        var innerWidth = jQuery(this).innerWidth();
                                        var position = jQuery(this).position();
                                        jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
                                    } else {
                                        jQuery(this).removeClass('active');
                                    }
                                });
                            }
                        });
                    }
                });
                //click on previous button
                jQuery('.form-wizard-previous-btn').click(function () {
                    var counter = parseInt(jQuery(".wizard-counter").text());
                    ;
                    var prev = jQuery(this);
                    var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
                    prev.parents('.wizard-fieldset').removeClass("d-block", "400");
                    prev.parents('.wizard-fieldset').prev('.wizard-fieldset').addClass("d-block", "400");
                    currentActiveStep.removeClass('active').prev().removeClass('activated').addClass('active', "400");
                    jQuery(document).find('.wizard-fieldset').each(function () {
                        if (jQuery(this).hasClass('show')) {
                            var formAtrr = jQuery(this).attr('data-tab-content');
                            jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function () {
                                if (jQuery(this).attr('data-attr') == formAtrr) {
                                    jQuery(this).addClass('active');
                                    var innerWidth = jQuery(this).innerWidth();
                                    var position = jQuery(this).position();
                                    jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
                                } else {
                                    jQuery(this).removeClass('active');
                                }
                            });
                        }
                    });
                });
                //click on form submit button
                jQuery(document).on("click", ".form-wizard .form-wizard-submit", function () {
                    var parentFieldset = jQuery(this).parents('.wizard-fieldset');
                    var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
                    parentFieldset.find('.wizard-required').each(function () {
                        var thisValue = jQuery(this).val();
                        if (thisValue == "") {
                            jQuery(this).siblings(".wizard-form-error").slideDown();
                        } else {
                            jQuery(this).siblings(".wizard-form-error").slideUp();
                        }
                    });
                });
                // focus on input field check empty or not
                jQuery(".form-control").on('focus', function () {
                    var tmpThis = jQuery(this).val();
                    if (tmpThis === '') {
                        jQuery(this).parent().addClass("focus-input");
                    } else if (tmpThis !== '') {
                        jQuery(this).parent().addClass("focus-input");
                    }
                }).on('blur', function () {
                    var tmpThis = jQuery(this).val();
                    if (tmpThis === '') {
                        jQuery(this).parent().removeClass("focus-input");
                        jQuery(this).siblings('.wizard-form-error').slideDown("3000");
                    } else if (tmpThis !== '') {
                        jQuery(this).parent().addClass("focus-input");
                        jQuery(this).siblings('.wizard-form-error').slideUp("3000");
                    }
                });
            });

        </script>
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

</html>
