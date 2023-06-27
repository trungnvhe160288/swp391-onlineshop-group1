<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>

<style>
    #page-content {
        min-height: 70vh;
        position: relative;
    }

    #page-content::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-image: url('../assets/images/background.jpg');
        background-size: cover;
        filter: blur(5px); /* Điều chỉnh mức độ làm mờ ở đây */
    }
    #white-frame {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -60%);
        z-index: 9999;
        width: 600px;
        height: 470px;
        background-color: white;
        border-radius: 5px;
        padding: 25px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }
</style>

<div id="page-content">

    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-6 col-lg-6 main-col offset-md-3">
                <div class="mb-4">
                    <div id="white-frame">
                        <!-- Page Title -->
                        <div class="page section-header text-center">
                            <div class="page-title">
                                <div class="wrapper">
                                    <h1 class="page-width">Create an Account</h1>
                                </div>
                            </div>
                        </div>
                        <!-- End Page Title -->
                        <form action="${pageContext.request.contextPath}/login/register.do" method="POST"
                              class="needs-validation" novalidate>
                            <!-- Form fields -->
                            <div class="form-group">
                                <label for="fullName">FullName</label>
                                <input type="text" class="form-control" id="fullName" placeholder="Enter Your Name"
                                       value="${fullName}" name="fullName" required>
                                <div class="valid-feedback">OK.</div>
                                <div class="invalid-feedback">Something Wrong !</div>
                            </div>
                            <div class="form-group">
                                <label for="uname">Email:</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter Your Username"
                                       value="${email}" name="email" required>
                                <div class="valid-feedback">OK.</div>
                                <div class="invalid-feedback " id="message_invalid_email">Something Wrong !</div>
                            </div>
                            <div class="row">
                                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="">
                                        <label for="password">Password:</label>
                                        <input type="password" class="form-control" id="password"
                                               placeholder="Enter Your Password" value="${password}" name="password"
                                               required>
                                        <div class="valid-feedback">OK.</div>
                                        <div class="invalid-feedback">Something Wrong !</div>
                                    </div>
                                </div>

                                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="">
                                        <label for="confirm_password">Confirm Password:</label>
                                        <input type="password" oninput="checkConfirmPassword()" value="${password}"
                                               class="form-control" id="confirm_password"
                                               placeholder="Enter Your Password Again !" name="confirm_password" required>
                                        <div class="valid-feedback" id="message_valid_cpw">OK.</div>
                                        <div class="invalid-feedback" id="message_invalid_cpw">Something Wrong !</div>
                                    </div>
                                </div>

                                <div class="form-group col-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="">
                                        ${message != null ? message : ''}
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Register</button>
                            </div>
                        </form>

                        <script>
                            // Form validation
                            (function () {
                                'use strict';
                                window.addEventListener('load', function () {
                                    // Get the forms we want to add validation styles to
                                    var forms = document.getElementsByClassName('needs-validation');
                                    // Loop over them and prevent submission
                                    var validation = Array.prototype.filter.call(forms, function (form) {
                                        form.addEventListener('submit', function (event) {
                                            if (form.checkValidity() === false) {
                                                event.preventDefault();
                                                event.stopPropagation();
                                            }
                                            form.classList.add('was-validated');
                                        }, false);
                                    });
                                }, false);
                            })();

                            // Check confirm password
                            function checkConfirmPassword() {
                                const pw = document.getElementById('password');
                                const cpw = document.getElementById('confirm_password');

                                let message = document.getElementById('message_invalid_cpw');
                                let message_valid = document.getElementById('message_valid_cpw');

                                if (cpw.value !== pw.value) {
                                    message.style.display = 'block';
                                    message_valid.style.display = 'none';
                                    message.innerHTML = `Confirm Password must be the same as Password`;
                                } else {
                                    message.style.display = 'none';
                                    message_valid.style.display = 'block';
                                }
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
