<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper">
                <h1 class="page-width">Verify Email</h1>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 mb-4">
                <form action="${pageContext.request.contextPath}/login/verifyEmail.do" method="POST" id="contact_form" class="contact-form">
                    <div class="row">

                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <input type="email" id="ContactFormEmail" name="email" placeholder="Enter Email Wants Verify !" value="" >
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                <input type="submit" class="btn" value="Get New Code">
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>

</div>