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
        height: 300px;
        background-color: white;
        border-radius: 5px;
        padding: 25px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }
</style>

<div id="page-content">

    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 mb-4">
                <div id="white-frame">
                    <!--Page Title-->
                    <div class="page section-header text-center">
                        <div class="page-title">
                            <div class="wrapper">
                                <h1 class="page-width">Forgot Password</h1>
                            </div>
                        </div>
                    </div>
                    <!--End Page Title-->
                    <h2>Drop Us A Line</h2>
                    <p>Input your email here and wait for the confirmation email</p>
                    <div class="formFeilds contact-form form-vertical">
                        <form action="${pageContext.request.contextPath}/login/forgot.do" method="post" id="contact_form" class="contact-form">
                            <div class="row" style="margin-top: 30px">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <input type="email" id="ContactFormEmail" name="email" placeholder="Email" value="" required="">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                        <input type="submit" class="btn" value="Send Message">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>