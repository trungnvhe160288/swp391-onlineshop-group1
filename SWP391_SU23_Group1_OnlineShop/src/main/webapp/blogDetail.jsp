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
            Post post = (Post) request.getAttribute("post");
        %>
        <div class="py-8 my-3 w-full text-black text-center font-semibold text-2xl" style="background-color: #a8a8a8"><%= post.getTitle()%></div>
        <div class="flex flex-col text-center  bg-white  p-6 items-center">
            <div><img class=" h-64 object-cover object-center mb-6" src="<%= post.getThumbnailUrl()%>" alt="Post Thumbnail"></div>
            <p class="text-gray-500 mb-4"> <%= post.getCreatedAt()%> - <%= "ABC"%></p>
            <div class="w-2/3 bg-gray-500 text-left p-6" style="background-color: #d9d9d9; height: 400px"><p><%= post.getContent()%></p></div>
        </div>
        <div class="ml-10">
            <div class="font-semibold text-2xl mb-2" style="color: #fcaf17; text-decoration: underline">Viết bình luận</div>
            <div class="flex flex-1 mb-2">
                <div><input  style="border: 1px; border-color: black;background-color: #d9d9d9" class="mr-2 px-2 py-1"  placeholder="Họ tên"/> </div>
                <div><input style="border: 1px; border-color: black;background-color: #d9d9d9" class="mr-2 px-2 py-1"  placeholder="Email"/> </div>
            </div>
            <div class="mb-2"><input style="border: 1px ; border-color: black; width: 300px; height: 200px;background-color: #d9d9d9" placeholder="Nội dung"/> </div>
            <button type="submit" class=" hover:bg-blue-600 text-white py-2 px-4 rounded-md mt-4" style="background-color:  #fcaf17">Gởi bình luận</button>
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
