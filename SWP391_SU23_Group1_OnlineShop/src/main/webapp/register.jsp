<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Product"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <title>Register</title>
        <script>
            function validatePassword(event) {

                event.preventDefault(); // Prevent form submission
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                console.log(password);
                console.log(confirmPassword);
                if (password !== confirmPassword) {
                    alert("Passwords do not match. Please try again.");
                    return false;
                }

                // Passwords match, continue with form submission
                document.getElementById("registerForm").submit();
            }
        </script>
    </head>
    <body>
        <jsp:include page="components/header.jsp" />




        <div class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
            <div class="max-w-md w-full space-y-8">
                <div>
                    <h2 class="mt-6 text-center text-2xl font-semibold text-gray-800">
                        Please complete the fields below
                    </h2>
                </div>
                <div>
                    <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                    <h1 class="text-center text-red-800"><%=error%></h1>
                    <%
                        }
                    %>

                </div>
                <form id="registerForm" class="mt-8 space-y-6" action="register" method="POST">
                    <input type="hidden" name="remember" value="true">

                    <div>
                        <label for="fullname" class="sr-only">Full name</label>
                        <input id="fullname" name="fullname" type="fullname"  required
                               class="appearance-none rounded-none relative block w-full px-3 py-2  h-11 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                               placeholder="Full name">
                    </div>
                    <div>
                        <label for="username" class="sr-only">Username</label>
                        <input id="username" name="username" type="username" required
                               class="appearance-none rounded-none relative block w-full px-3 py-2 h-11 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                               placeholder="Username">
                    </div>
                    <div>
                        <label for="email" class="sr-only">Email</label>
                        <input id="email" name="text" type="email"  required
                               class="appearance-none rounded-none relative block w-full px-3 py-2 h-11 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                               placeholder="Email">
                    </div>
                    <div>
                        <label for="password" class="sr-only">Password</label>
                        <input id="password" name="password" type="password" required
                               class="appearance-none rounded-none relative block w-full px-3 py-2 h-11 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                               placeholder="Password">
                    </div>
                    <div>
                        <label for="confirmPassword" class="sr-only">Confirm Password</label>
                        <input id="confirmPassword" name="confirmPassword" type="password"  required
                               class="appearance-none rounded-none relative block w-full px-3 py-2 h-11 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                               placeholder="Confirm Password">
                    </div>
                    <div>
                        <button type="submit" onclick="validatePassword(event)"
                                class="group relative w-full flex justify-center py-2  h-11 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-black hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            <span class="absolute left-0 inset-y-0 flex items-center pl-3">

                                <path fill-rule="evenodd"
                                      d="M10 12a2 2 0 100-4 2 2 0 000 4zm0 1a3 3 0 100-6 3 3 0 000 6z"
                                      clip-rule="evenodd" />
                                <path
                                    d="M2 5a2 2 0 012-2h12a2 2 0 012 2v10a2 2 0 01-2 2H4a2 2 0 01-2-2V5zm2-2h12v10H4V3zm7 7h1V8H9v2h1v1H9v2h2v-2h1v-1h-1V8z" />
                                </svg>
                            </span>
                            Register
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
