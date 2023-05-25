<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Post"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Blog</title>
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
    </head>
    <body>
        <jsp:include page="components/header.jsp" />
        <div class="container mx-auto p-12">
            <h1 class="text-3xl font-bold mb-4">Blog</h1>

            <div class="grid grid-cols-1 gap-4">
                <%
                        ArrayList<Post> listPosts = (ArrayList<Post>)request.getAttribute("listPosts");
                        for (int i = 0; i < listPosts.size(); i++) {
                          Post item=  listPosts.get(i);
                          int postId =  item.getId();
                          String postThumbnailUrl =  item.getThumbnailUrl();
                          String postTitle =  item.getTitle();
                          String shortDescription =  item.getShortDescription();
                          Date postCreatedAt =  item.getCreatedAt();
 
                %>
                <div class="bg-white rounded shadow flex">
                    <div class="w-1/3">
                        <img class="w-full h-64 object-cover object-center" src="<%= postThumbnailUrl %>" alt="Post Thumbnail">
                    </div>

                    <div class="w-2/3 p-6 flex flex-col justify-between">
                        <div>
                            <h2 class="text-2xl font-bold mb-2 text-red-500"><%=postTitle %></h2>
                            <p class="text-gray-500 mb-4"><%= shortDescription %></p>
                        </div>
                        <div>
                            <a href="?id=<%= postId %>" class="text-blue-500 hover:text-purple-700">Xem chi tiết</a>
                            <p class="text-gray-700 mb-1">Tác giả - <%= "Author" %></p>
                            <i class="text-gray-700 mb-4"><%= postCreatedAt %></i>
                        </div>


                    </div>
                </div>
                <% } %>
            </div>
        </div>


    </body>
</html>
