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
    <!--End Page Title-->

    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 mb-4">
                <!--            <div class="avatar-container ">
                                <form method="POST" action="upload-avatar" enctype="multipart/form-data"  id="avatar-form" class="w-full px-6">
                
                                    <div class="flex justify-center items-center flex-1 flex-col">
                                        <h1 class="m-2 text-3xl font-semibold text-center">Profile</h1>
                                        <img class="avatar" id="avatar-preview" src="<%=userProfile.getAvatar() != null ? userProfile.getAvatar() : "assets/images/defaultAvatar.jpg"%>" alt="Avatar">
                                        <h2 class="m-2 text-3xl font-semibold text-center"><%= userProfile.getFullname() != null ? userProfile.getFullname() : ""%></h2>
                                        <div class="mt-4">
                                            <label for="avatar-input" class="cursor-pointer inline-flex items-center px-4 py-2 bg-gray-600 hover:bg-gray-700 text-white font-semibold rounded">
                                                <span>Upload new avatar</span>
                                                <input type="file" name="image" id="avatar-input" accept="image/*" class="hidden" type="submit">
                                            </label>
                                        </div>
                
                
                
                                    </div>
                
                                </form>
                            </div>-->

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

                <!--        <script>
                            var avatarPreview = document.getElementById('avatar-preview');
                            var avatarInput = document.getElementById('avatar-input');
                            var avatarForm = document.getElementById('avatar-form');
                
                            // Add an event listener to the input file element
                            avatarInput.addEventListener('change', function (event) {
                                // Get the selected file from the input element
                                var selectedFile = event.target.files[0];
                
                                // Create a FileReader object to read the file
                                var reader = new FileReader();
                
                                // Set the callback function when the file is loaded
                                reader.onload = function () {
                                    // Update the image preview source with the loaded file data
                                    avatarPreview.src = reader.result;
                
                                    // Submit the form
                                    avatarForm.submit();
                                };
                
                                // Read the file as a data URL
                                reader.readAsDataURL(selectedFile);
                            });
                        </script>-->
            </div>
        </div>
    </div>
</div>