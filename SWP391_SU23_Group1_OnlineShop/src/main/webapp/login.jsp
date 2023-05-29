<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <title>Login</title>
    </head>
    <body>
        <jsp:include page="components/header.jsp" />

        <div class="min-h-screen flex items-center justify-center text-gray-700 py-12 px-4 sm:px-6 lg:px-8">
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
                <form class="mt-8 space-y-6" action="login" method="POST">
                    <input type="hidden" name="remember" value="true">

                    <div>
                        <label for="username" class="sr-only">Username</label>
                        <input id="username" name="username" type="username" autocomplete="username" required
                               class="appearance-none rounded-none relative block w-full px-3  h-11 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                               placeholder="Username">
                    </div>
                    <div class="mt-6">
                        <label for="password" class="sr-only">Password</label>
                        <input id="password" name="password" type="password" autocomplete="current-password" required
                               class="appearance-none rounded-none relative block w-full px-3 h-11 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                               placeholder="Password">
                    </div>


                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <input id="remember-me" name="remember-me" type="checkbox"
                                   class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded">
                            <label for="remember-me" class="ml-2 block text-sm text-gray-900">
                                Remember me
                            </label>
                        </div>


                    </div>

                    <div>
                        <button type="submit"
                                class="group relative w-full flex justify-center py-2  h-11 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-black hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            <span class="absolute left-0 inset-y-0 flex items-center pl-3">

                                <path fill-rule="evenodd"
                                      d="M10 12a2 2 0 100-4 2 2 0 000 4zm0 1a3 3 0 100-6 3 3 0 000 6z"
                                      clip-rule="evenodd" />
                                <path
                                    d="M2 5a2 2 0 012-2h12a2 2 0 012 2v10a2 2 0 01-2 2H4a2 2 0 01-2-2V5zm2-2h12v10H4V3zm7 7h1V8H9v2h1v1H9v2h2v-2h1v-1h-1V8z" />
                                </svg>
                            </span>
                            Login
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
