<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper">
                <h1 class="page-width">Change Your Password</h1>
            </div>
        </div>
    </div>
    <!--End Page Title-->

    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 mb-4">
                <h2>Password Change</h2>
                <p>Please choose a strong password</p>
                <div class="formFeilds contact-form form-vertical">
                    <form action="${pageContext.request.contextPath}/login/changepass.do" method="post" id="contact_form" class="contact-form">
                        <div class="row col-10">
                            <div class="col-12 col-sm-12">
                                <div class="form-group">
                                    <input type="password" id="ContactFormEmail" name="oldpass" placeholder="Old Password" value="" required="">
                                </div>
                            </div>
                            <div class="col-12 col-sm-12">
                                <div class="form-group">
                                    <input type="password" id="ContactFormEmail" name="newpass" placeholder="New Password" value="" required="">
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 ">
                                <div class="form-group">
                                    <input type="password" id="ContactFormEmail" name="confirmpass" placeholder="Comfirm Password" value="" required="">
                                </div>
                            </div>
                            <div class="col-12 col-sm-12">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="submit" class="btn" value="Change">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>