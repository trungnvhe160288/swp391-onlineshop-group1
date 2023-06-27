<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        height: 400px;
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
                    <form method="POST" action="" id="CustomerLoginForm" accept-charset="UTF-8" class="contact-form">	
                        <div id="white-frame">
                            <!-- Page Title -->
                            <div class="page section-header text-center" style="position: relative;">
                                <div class="page-title" style="text-align:center">
                                    <div class="wrapper">
                                        <h1>Login</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- End Page Title -->
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label for="CustomerEmail">Email</label>
                                        <input type="email" name="email" placeholder="Enter Your Email" id="CustomerEmail" required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label for="CustomerPassword">Password</label>
                                        <input type="password" name="password" placeholder="Enter Your Password" id="CustomerPassword" class="" required>                        	
                                    </div>
                                </div>
                            </div>
                            ${message != null ? message : ''}
                            <div class="row">
                                <div class="text-center col-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="submit" class="btn mb-3" value="Sign In">
                                    <p class="mb-4">
                                        <a href="#" id="RecoverPassword">Forgot your password?</a> &nbsp; | &nbsp;
                                        <a href="${pageContext.request.contextPath}/login/register.do" id="customer_register_link">Create account</a>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
