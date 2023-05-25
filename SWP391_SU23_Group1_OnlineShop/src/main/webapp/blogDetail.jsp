<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Post"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog detail</title>
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
    </head>
    <body>
        <jsp:include page="components/header.jsp" />
        <%
           Post post = (Post)request.getAttribute("post");
        %>
        <div class="container mx-auto py-6">
            <h1 class="text-3xl font-bold mb-4">Blog Detail</h1>

            <div class="bg-white rounded shadow p-6">
                <img class=" h-64 object-cover object-center mb-6" src="<%= post.getThumbnailUrl() %>" alt="Post Thumbnail">
                <h2 class="text-2xl font-bold mb-4"><%= post.getTitle() %></h2>
                <p class="text-gray-500 mb-4"> <%= post.getCreatedAt() %> - <%= "ABC" %></p>
                <p><%= post.getContent() %></p>
            </div>
        </div>
    </body>
</html>
