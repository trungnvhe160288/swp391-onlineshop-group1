<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.util.ArrayList"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Blog</title>
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <script src="script/index.js"></script>
    </head>
    <body>
        <jsp:include page="components/header.jsp" />
        <div class="py-8 my-3 w-full text-black text-center font-semibold text-2xl" style="background-color: #a8a8a8">TIN TỨC THỜI TRANG</div>
        <div class="container mx-auto">
            <div class="sorting-bar">
                <label for="sort-select">Sort By:</label>
                <select id="sort-select" onchange="appendParameter('sort', this.value)">
                    <option value="none">---</option>
                    <option value="created_at~DESC">Sort by Latest Date</option>
                    <option value="created_at~ASC">Sort by Oldest Date</option>
                    <option value="title~ASC">Sort by A-Z</option>
                    <option value="title~DESC">Sort by Z-A</option>
                </select>
            </div>
            <div class="grid grid-cols-1 gap-4">
                <%
                    ArrayList<Post> listPosts = (ArrayList<Post>) request.getAttribute("listPosts");
                    for (int i = 0; i < listPosts.size(); i++) {
                        Post item = listPosts.get(i);
                        int postId = item.getId();
                        String postThumbnailUrl = item.getThumbnailUrl();
                        String postTitle = item.getTitle();
                        String shortDescription = item.getShortDescription();
                        Date postCreatedAt = item.getCreatedAt();

                %>
                <div class="bg-white rounded shadow flex flex-1">
                    <div >
                        <img class="w-full h-64 object-cover object-center" src="<%= postThumbnailUrl%>" alt="Post Thumbnail">
                    </div>
                    <div class="p-6 flex flex-col justify-between ml-8">
                        <div>
                            <h2 style="color: #fd4747" class="text-2xl font-semibold mb-3 text-red-500"><%=postTitle%></h2>
                            <p class="text-gray-500"><%= shortDescription%></p>
                        </div>
                        <div style="font-style: italic;">
                            <a href="?id=<%= postId%>" class="text-blue-500 hover:text-purple-700">Xem chi tiết</a>
                            <p class="text-gray-700 mb-1">Tác giả - <%= "Author"%></p>
                            <i class="text-gray-700 mb-4"><%= postCreatedAt%></i>
                        </div>
                    </div>
                </div>
                <% } %>
                <div class="flex flex-1 ">
                    <div class="flex flex-1 justify-center"> 
                        <%
                            int totalPage = (int) request.getAttribute("totalPage");
                            for (int i = 1; i <= totalPage; i++) {
                        %>
                        <button class="px-4 py-2  m-2" style="background:#FF7315; border-radius:8px" onclick="appendParameter('page',<%=i%>)" class="bg-red-200 p-2 m-2"><%=i%></button>

                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
