<!DOCTYPE html>
<html lang="en">


    <!-- auth-login.html  21 Nov 2019 03:49:32 GMT -->
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
            <section class="section">
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h4>Login</h4>
                                </div>
                                <div class="card-body">
                                    <form method="POST" action="${pageContext.request.contextPath}/dashboard/login/login.ad" class="needs-validation" novalidate="">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input id="email" type="email" class="form-control" name="email" tabindex="1" required autofocus>
                                            <div class="invalid-feedback">
                                                Please fill in your email
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="d-block">
                                                <label for="password" class="control-label">Password</label>
                                                <div class="float-right">
                                                    <a href="auth-forgot-password.html" class="text-small">
                                                        Forgot Password?
                                                    </a>
                                                </div>
                                            </div>
                                            <input id="password" type="password" class="form-control" name="password" tabindex="2" required>
                                            <div class="invalid-feedback">
                                                please fill in your password
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                                                Login
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </div>

        <div>
            <span style='display: none' id='dashboar_toast_type'>${toast__type}</span>
            <span style='display: none'>${dashboard_toast_title}</span>
            <span style='display: none'>${dashboard_toast__message}</span>
        </div>
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


</html>