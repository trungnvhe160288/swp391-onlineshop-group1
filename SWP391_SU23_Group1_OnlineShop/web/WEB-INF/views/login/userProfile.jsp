<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DAL.UserDAO" id="ud"/>



<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper">
                <h1 class="page-width">User Profile</h1>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 mb-4">
                <form action="${pageContext.request.contextPath}/login/userProfile.do" method="POST">
                    <div class="form-group">
                        <label  for="name">Full Name</label>
                        <input  type="text" id="fullname" name="fullname" value="${data.name}">
                    </div>
                    <div class="form-group">
                        <label for="email">Phone</label>
                        <input  type="text" id="phone" name="phone" value="${data.phone}">
                    </div>
                    <div class="form-group">
                        <label for="name">Address</label>
                        <input type="text" id="address" name="address" value="${data.address}">
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${data.email}">
                    </div>
                    <div class="col-12 col-sm-12">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <input type="submit" class="btn" value="Edit Profile">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>