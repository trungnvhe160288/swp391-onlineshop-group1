<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <link rel="stylesheet" href="styles/css/userProfiler.css">
        <title>Profile</title>
        <script>
            function validatePassword(event, currentPassword) {

                event.preventDefault(); // Prevent form submission
                var oldPassword = document.getElementById("oldPassword").value;
                var newPassword = document.getElementById("newPassword").value;
                var confirmPassword = document.getElementById("confirmPassword").value;

                if (newPassword !== confirmPassword) {
                    alert("Passwords do not match. Please try again.");
                    return false;
                }
                if (currentPassword != oldPassword) {
                    alert("Current passwords. Please try again.");
                    return false;
                }
                // Passwords match, continue with form submission
                document.getElementById("changePasswordForm").submit();
            }
        </script>

    </head>
    <body>
        <jsp:include page="components/header.jsp" />

        <%
            User userProfile = (User) request.getAttribute("userInfomation");
        %>

        <div class="max-w-7xl mx-auto my-8">
            <div class="avatar-container ">
                <div class="w-full px-6 ">
                    <div class="flex justify-center items-center flex-1 flex-col">
                        <h1 class="m-2 text-3xl font-semibold text-center">Profile</h1>
                        <img class="avatar" src="<%=userProfile.getAvatar() != null ? userProfile.getAvatar() : "assets/images/defaultAvatar.jpg"%>" alt="Avatar">
                        <h2 class="m-2 text-3xl font-semibold  text-center"><%= userProfile.getFullname() != null ? userProfile.getFullname() : ""%></h2>
                        <input class="text-center mt-4 text-white font-bold py-2 px-4 rounded" style="max-width: 12rem;background-color:#6B705C; " type="submit" value="Upload new avatar">
                    </div>

                </div>
                <form class="w-full px-6" method="POST" action="updateProfile">
                    <h1 class="m-2 text-3xl font-semibold text-center">My Profile</h1>
                    <div class="mb-4">
                        <label class="block text-sm font-bold mb-2" for="name">Fullname</label>
                        <input class="border rounded px-3 py-2 w-full" type="text" id="fullname" name="fullname" value="<%= userProfile.getFullname() != null ? userProfile.getFullname() : ""%>">
                    </div>

                    <div class="mb-4">
                        <label class="block text-sm font-bold mb-2" for="email">Phone</label>
                        <input class="border rounded px-3 py-2 w-full" type="text" id="phone" name="phone" value="<%= userProfile.getPhone() != null ? userProfile.getPhone() : ""%>">
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-bold mb-2" for="name">Address</label>
                        <input class="border rounded px-3 py-2 w-full" type="text" id="address" name="address" value="<%= userProfile.getAddress() != null ? userProfile.getAddress() : ""%>">
                    </div>

                    <div class="mb-4">
                        <label class="block text-sm font-bold mb-2" for="email">Email</label>
                        <input class="border rounded px-3 py-2 w-full" type="email" id="email" name="email" value="<%= userProfile.getEmail() != null ? userProfile.getEmail() : ""%>">
                    </div>
                    <div class="flex justify-end">
                        <button class="py-2 px-6 rounded mr-4 border-black border-2" >Edit profile</button>
                    </div>
                </form>
                <form class="w-full px-6" id="changePasswordForm"  method="POST" action="changePassword">
                    <h1 class="m-2 text-3xl font-semibold text-center">Password</h1>
                    <div class="mb-4">
                        <label class="block text-sm font-bold mb-2" for="oldPassword">Current Password</label>
                        <input class="border rounded px-3 py-2 w-full" required type="password" id="oldPassword" name="oldPassword">
                    </div>

                    <div class="mb-4">
                        <label class="block text-sm font-bold mb-2" for="newPassword">New Password</label>
                        <input class="border rounded px-3 py-2 w-full" required type="password" id="newPassword" name="newPassword">
                    </div>

                    <div class="mb-4">
                        <label class="block text-sm font-bold mb-2" for="confirmPassword">Password again</label>
                        <input class="border rounded px-3 py-2 w-full" required type="password" id="confirmPassword" name="confirmPassword">
                    </div>
                    <div  class="flex justify-end">
                        <button class="py-2 px-6 rounded mr-4 border-black border-2"  onclick="validatePassword(event,<%=userProfile.getPassword()%>)" >Save</button>
                    </div>
                </form>
            </div>


        </form>
        <jsp:include page="components/footer.jsp" />


</body>
</html>
